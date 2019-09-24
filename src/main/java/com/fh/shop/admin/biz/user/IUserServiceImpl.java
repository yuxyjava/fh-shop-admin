package com.fh.shop.admin.biz.user;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.common.ResponseEnum;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.user.IUserMapper;
import com.fh.shop.admin.param.user.UserPasswordParam;
import com.fh.shop.admin.param.user.UserSearchParam;
import com.fh.shop.admin.po.user.User;
import com.fh.shop.admin.po.user.UserRole;
import com.fh.shop.admin.util.DateUtil;
import com.fh.shop.admin.util.MailUtil;
import com.fh.shop.admin.util.Md5Util;
import com.fh.shop.admin.util.SystemConst;
import com.fh.shop.admin.vo.user.UserVo;
import com.mysql.fabric.Server;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@Service("userService")
public class IUserServiceImpl implements IUserService {

    @Autowired
    private IUserMapper userMapper;

    @Override
    public void addUser(User user){
        // 生成salt
        String salt = UUID.randomUUID().toString();
        user.setSalt(salt);
        // 将明文加密
        user.setPassword(Md5Util.md5(Md5Util.md5(user.getPassword())+salt));
        // 添加用户信息
        userMapper.addUser(user);
        // 添加用户和角色之间的关联信息
        addUserRole(user);
    }

    @Override
    public DataTableResult findPageList(UserSearchParam userSearchParam) {
        // 构建角色查询条件
        buildRoleList(userSearchParam);
        // 获取总条数
        long totalCount = userMapper.findUserTotalCount(userSearchParam);
        // 获取分页列表
        List<User> userList = userMapper.findUserPageList(userSearchParam);
        // po转vo
        List<UserVo> userVoList = buildUserVoList(userList);
        // 构建datatable的最终结果
        DataTableResult dataTableResult = new DataTableResult(userSearchParam.getDraw(), totalCount, totalCount, userVoList);
        return dataTableResult;
    }

    private List<UserVo> buildUserVoList(List<User> userList) {
        List<UserVo> userVoList = new ArrayList<>();
        // 将po转vo
        for (User userInfo : userList) {
            Long userId = userInfo.getId();
            List<String> roleNames = userMapper.findRoleNameList(userId);
            UserVo userVo = buildUserVo(userInfo);
            if (roleNames != null && roleNames.size() > 0) {
                String roleNameStr = StringUtils.join(roleNames, ",");
                userVo.setRoleNames(roleNameStr);
            }
            userVoList.add(userVo);
        }
        return userVoList;
    }

    private void addUserRole(User user) {
        Long userId = user.getId();
        System.out.println(userId);
        String roleIds = user.getRoleIds();
        if (StringUtils.isNotEmpty(roleIds)) {
            String[] roleIdArr = roleIds.split(",");
            for (String roleId : roleIdArr) {
                UserRole userRole = new UserRole();
                userRole.setUserId(userId);
                userRole.setRoleId(Long.parseLong(roleId));
                userMapper.addUserRole(userRole);
            }
        }
    }



    private void buildRoleList(UserSearchParam userSearchParam) {
        String roleIds = userSearchParam.getRoleIds();
        if (StringUtils.isNotEmpty(roleIds)) {
            String[] roleIdArr = roleIds.split(",");
            List<Integer> roleIdList = new ArrayList<>();
            for (String s : roleIdArr) {
                roleIdList.add(Integer.parseInt(s));
            }
            userSearchParam.setRoleList(roleIdList);
            userSearchParam.setRoleListSize(roleIdList.size());
        }
    }




    private UserVo buildUserVo(User userInfo) {
        UserVo userVo = new UserVo();
        userVo.setId(userInfo.getId());
        userVo.setUserName(userInfo.getUserName());
        userVo.setRealName(userInfo.getRealName());
        userVo.setAge(userInfo.getAge());
        userVo.setEmail(userInfo.getEmail());
        userVo.setPhone(userInfo.getPhone());
        userVo.setSalary(userInfo.getSalary());
        userVo.setSex(userInfo.getSex());
        userVo.setLock(userInfo.getLoginErrorCount()==SystemConst.LOGIN_ERROR_COUNT);
        userVo.setEntryTime(DateUtil.date2str(userInfo.getEntryTime(), DateUtil.Y_M_D));
        return userVo;
    }

    @Override
    public void deleteUser(Long id) {
        // 删除用户表信息
        userMapper.deleteUser(id);
        // 删除用户角色关联表中的信息
        userMapper.deleteUserRole(id);
    }

    @Override
    public UserVo findUser(Long id) {
        User user = userMapper.findUser(id);
        List<Integer> roleIdList = userMapper.findRoleIdList(id);
        UserVo userVo = buildUserVo(user);
        userVo.setPassword(user.getPassword());
        userVo.setRoleIds(roleIdList);
        return userVo;
    }

    @Override
    public void updateUser(User user) {
        // 更新用户信息
        userMapper.updateUser(user);
        // 更新用户对应的角色信息
        // 先删除
        userMapper.deleteUserRole(user.getId());
        // 再添加
        addUserRole(user);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        // 删除了用户表对应的信息
        userMapper.deleteBatch(ids);
        // 删除用户角色关联表对应的信息
        userMapper.deleteUserRoles(ids);
        throw new RuntimeException("*********");
    }

    @Override
    public User findUserByUserName(String userName) {
        User user = userMapper.findUserByUserName(userName);
        return user;
    }

    @Override
    public void updateLoginTime(Long id, Date currentDate) {
        userMapper.updateLoginTime(id, currentDate);
    }

    @Override
    public void updateLoginCount(Long id) {
        userMapper.updateLoginCount(id);
    }

    @Override
    public void resetLoginCount(Long id) {
        userMapper.resetLoginCount(id);
    }

    @Override
    public void updateLoginErrorInfo(Date date, Long id) {
        userMapper.updateLoginErrorInfo(date, id);
    }

    @Override
    public void resetLoginErrorInfo(Date date, Long id) {
        userMapper.resetLoginErrorInfo(date, id);
    }

    @Override
    public void resetLoginErrorCount(Long id) {
        userMapper.resetLoginErrorCount(id);
    }

    @Override
    public void updateUserStatus(Long id) {
        userMapper.updateUserStatus(id);
    }

    @Override
    public ServerResponse updatePassword(UserPasswordParam userPasswordParam) {
        // 输入的新密码，老密码，确认密码不能为空
        if (StringUtils.isEmpty(userPasswordParam.getConfirmPassword())
                || StringUtils.isEmpty(userPasswordParam.getNewPassword())
                || StringUtils.isEmpty(userPasswordParam.getOldPassword())) {
            return ServerResponse.error(ResponseEnum.USER_UPDATE_PASSWORD_INFO_IS_EMPTY);
        }
        // 先验证新密码和确认密码一致
        if (!userPasswordParam.getNewPassword().equals(userPasswordParam.getConfirmPassword())) {
            return ServerResponse.error(ResponseEnum.PASSWORD_IS_DIFFERENT);
        }
        // 验证老密码是正确的
        User user = userMapper.findUser(userPasswordParam.getUserId());
        String dbPassword = user.getPassword();
        String salt = user.getSalt();
        String oldPassword = userPasswordParam.getOldPassword();
        String password = Md5Util.encodePassword(oldPassword, salt);
        if (!password.equals(dbPassword)) {
            return ServerResponse.error(ResponseEnum.OLD_PASSWORD_IS_ERROR);
        }
        // 进行更新
        userPasswordParam.setNewPassword(Md5Util.encodePassword(userPasswordParam.getNewPassword(), salt));
        userMapper.updatePassword(userPasswordParam);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse resetUserPassword(Long id) {
        // 查询用户信息
        User user = userMapper.findUser(id);
        if (user == null) {
            return ServerResponse.error(ResponseEnum.USER_IS_NULL);
        }
        String salt = user.getSalt();
        String password = Md5Util.encodePassword(SystemConst.DEFAULT_PASSWORD, salt);
        userMapper.resetUserPassword(id, password);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse sendPassword(String mail) {
        // 验证是否存在该邮箱
        User user = userMapper.findUserByMail(mail);
        if (user == null) {
            return ServerResponse.error(ResponseEnum.MAIL_IS_NULL);
        }
        String password = RandomStringUtils.randomAlphanumeric(6);
        // 发送邮件
        MailUtil.sendMail("找回密码", "你的新密码为:"+password, mail);
        // 更新数据库
        String passwordDB = Md5Util.encodePassword(password, user.getSalt());
        userMapper.resetUserPassword(user.getId(), passwordDB);
        return ServerResponse.success();
    }


}
