package com.fh.shop.admin.controller.user;

import com.fh.shop.admin.biz.resource.IResourceService;
import com.fh.shop.admin.biz.user.IUserService;
import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.common.Log;
import com.fh.shop.admin.common.ResponseEnum;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.param.user.UserPasswordParam;
import com.fh.shop.admin.param.user.UserSearchParam;
import com.fh.shop.admin.po.user.User;
import com.fh.shop.admin.util.DateUtil;
import com.fh.shop.admin.util.MailUtil;
import com.fh.shop.admin.util.Md5Util;
import com.fh.shop.admin.util.SystemConst;
import com.fh.shop.admin.vo.resource.ResourceVo;
import com.fh.shop.admin.vo.user.UserVo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.management.MemoryUsage;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource(name="userService")
    private IUserService userService;
    @Resource(name="resourceService")
    private IResourceService resourceService;


    @Autowired
    private HttpServletRequest request;

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @RequestMapping("/login")
    public @ResponseBody ServerResponse login(User user) {
        String userName = user.getUserName();
        String password = user.getPassword();
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            return ServerResponse.error(ResponseEnum.USERNAME_PASSWORD_IS_NULL);
        }
        // 按照用户名查询用户
        User userDB = userService.findUserByUserName(userName);
        if (userDB == null) {
            return ServerResponse.error(ResponseEnum.USERNAME_IS_ERROR);
        }
        // 弹出锁定账号的提示
        if (userDB.getLoginErrorCount() == SystemConst.LOGIN_ERROR_COUNT) {
            Date loginErrorDate = userDB.getLoginErrorDate();
            Date currDate = new Date();
            Date loginErrorDay = DateUtil.str2date(DateUtil.date2str(loginErrorDate, DateUtil.Y_M_D), DateUtil.Y_M_D);
            Date currDay = DateUtil.str2date(DateUtil.date2str(currDate, DateUtil.Y_M_D), DateUtil.Y_M_D);
            if (currDay.after(loginErrorDay)) {
                // 证明是隔天登录，则重置登录错误的次数为0
                userService.resetLoginErrorCount(userDB.getId());
            } else {
                // 如果是在同一天，则
                return ServerResponse.error(ResponseEnum.USER_IS_LOCK);
            }
        }
        // 验证密码
        String salt = userDB.getSalt();
        if (!Md5Util.encodePassword(password, salt).equals(userDB.getPassword())) {
            // 锁定用户的处理
            Date loginErrorDate = userDB.getLoginErrorDate();
            if (loginErrorDate == null) {
                // 则证明这是最开始的第一次密码错误
                Date date = new Date();
                userService.updateLoginErrorInfo(date, userDB.getId());
            } else {
                // 如果在同一天，则更新 登录错误的时间，并且将错误次数+1
                Date date = new Date();
                Date loginErrorDay = DateUtil.str2date(DateUtil.date2str(loginErrorDate, DateUtil.Y_M_D), DateUtil.Y_M_D);
                Date currDay = DateUtil.str2date(DateUtil.date2str(date, DateUtil.Y_M_D), DateUtil.Y_M_D);
                if (currDay.after(loginErrorDay)) {
                    // 如果不在同一天，则更新 登录错误的时间，并且将错误重置1
                    userService.resetLoginErrorInfo(date, userDB.getId());
                    userDB.setLoginErrorCount(1);
                } else {
                    // 如果在同一天，则更新 登录错误的时间，并且将错误次数+1
                    userService.updateLoginErrorInfo(date, userDB.getId());
                    userDB.setLoginErrorCount(userDB.getLoginErrorCount()+1);
                }
                if (userDB.getLoginErrorCount() == SystemConst.LOGIN_ERROR_COUNT) {
                    // 发送邮件
                    MailUtil.sendMail("账户被锁定", "<h1>账号被锁定，如果不是本人操作，赶紧修改密码或联系管理员！！！</h1>", userDB.getEmail());
                }

            }
            return ServerResponse.error(ResponseEnum.PASSWORD_IS_ERROR);
        }
        Date currDate = DateUtil.str2date(DateUtil.date2str(new Date(), DateUtil.Y_M_D), DateUtil.Y_M_D);
        // 记录 登录成功的次数
        if (userDB.getLoginTime() == null) {
            // 代表用户第一次登录，重置为1
            userService.resetLoginCount(userDB.getId());
            userDB.setLoginCount(1);
        } else {
            Date loginDate = DateUtil.str2date(DateUtil.date2str(userDB.getLoginTime(), DateUtil.Y_M_D), DateUtil.Y_M_D);
            if (currDate.after(loginDate)) {
                // 如果当前登录的时间在上次登录时间的之后，重置为1
                userService.resetLoginCount(userDB.getId());
                userDB.setLoginCount(1);
            } else {
                // 如果在同一天，加1
                userService.updateLoginCount(userDB.getId());
                userDB.setLoginCount(userDB.getLoginCount()+1);
            }
        }
        // 成功
        // 重置登录的错误次数为0
        userService.resetLoginErrorCount(userDB.getId());
        // 将当前登录用户的信息存入session中，方便后续使用
        // 1.在后续可以通过session中存储的用户信息来获取用户的真实姓名以及登录次数等等
        // 2.在登录拦截器中通过判断session中是否存在用户信息从而确定该用户是否是合法用户
        request.getSession().setAttribute(SystemConst.CURRENT_USER, userDB);
        // 获取当前用户所对应的菜单列表
        List<com.fh.shop.admin.po.resource.Resource> menuList = resourceService.findMenuListByUserId(userDB.getId());
        // 获取所有的资源列表
        List<com.fh.shop.admin.po.resource.Resource> allResourceList = resourceService.findAllList();
        // 获取当前用户所对应的所有的资源列表
        List<com.fh.shop.admin.po.resource.Resource> userResourceList = resourceService.findResourceListByUserId(userDB.getId());
        // 将当前用户对应的菜单列表存入session中，方便前台展示菜单时候使用
        request.getSession().setAttribute(SystemConst.LGOIN_USER_MENU_LIST, menuList);
        // 将所有的资源权限存入session中，从而在权限拦截中判断访问的url是否属于公共资源
        request.getSession().setAttribute(SystemConst.ALL_RESOURCE_LIST, allResourceList);
        // 将用户对应的所有的资源列表存入session中，方便在权限拦截器中判断用户是否有对应资源的访问权限
        request.getSession().setAttribute(SystemConst.USER_ALL_RESOURCE_LIST, userResourceList);
        // 记录 登录成功的时间
        userService.updateLoginTime(userDB.getId(), new Date());
        return ServerResponse.success();
    }

    @RequestMapping("/toFindPassword")
    public String toFindPassword() {
        return "user/findPassword";
    }

    @RequestMapping("/sendPassword")
    @ResponseBody
    public ServerResponse sendPassword(String mail) {
        return userService.sendPassword(mail);
    }

    @RequestMapping("/logout")
    public String logout() {
        // 1.清除session中的数据 【本质，核心】
          request.getSession().invalidate();
        // 2.跳转到登录页面 [用户体验度]
        return "redirect:/";
    }


    @RequestMapping("/add")
    @Log("添加用户")
    public @ResponseBody ServerResponse add(User user) {
            userService.addUser(user);
            return ServerResponse.success();
    }

    @RequestMapping("/findUser")
    @ResponseBody
    public ServerResponse findUser(Long id) {
            UserVo user = userService.findUser(id);
            return ServerResponse.success(user);
    }

    @RequestMapping("/updateUser")
    public @ResponseBody ServerResponse updateUser(User user) {
            // 核心逻辑代码【核心业务】
            userService.updateUser(user);
            return ServerResponse.success();
    }

    @RequestMapping("/deleteUser")
    @Log("删除用户")
    public @ResponseBody ServerResponse deleteUser(Long id) {
           userService.deleteUser(id);
           return ServerResponse.success();
    }

    @RequestMapping("/index")
    public String toList() {
        return "user/list";
    }

    @RequestMapping("/deleteBatch")
    @ResponseBody
    @Log("批量删除用户")
    public ServerResponse deleteBatch(@RequestParam("userIds[]") List<Integer> ids) {
            userService.deleteBatch(ids);
            return ServerResponse.success();
    }

    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list(UserSearchParam userSearchParam) {
        System.out.println("=========list");
        DataTableResult result = userService.findPageList(userSearchParam);
        return ServerResponse.success(result);
    }

    @RequestMapping("/updateUserStatus")
    @ResponseBody
    @Log("解锁用户")
    public ServerResponse updateUserStatus(Long id) {
        userService.updateUserStatus(id);
        return ServerResponse.success();
    }

    @RequestMapping("/resetUserPassword")
    @ResponseBody
    @Log("重置用户密码")
    public ServerResponse resetUserPassword(Long id) {
        return userService.resetUserPassword(id);
    }

    @RequestMapping("/toUpdatePassword")
    public String toUpdatePassword() {
        return "user/password";
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    @Log("修改密码")
    public ServerResponse updatePassword(UserPasswordParam userPasswordParam) {
        ServerResponse serverResponse = userService.updatePassword(userPasswordParam);
        return serverResponse;
    }

}
