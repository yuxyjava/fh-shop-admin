package com.fh.shop.admin.biz.user;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.param.user.UserPasswordParam;
import com.fh.shop.admin.param.user.UserSearchParam;
import com.fh.shop.admin.po.user.User;
import com.fh.shop.admin.vo.user.UserVo;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IUserService {

    public void addUser(User user);

    public DataTableResult findPageList(UserSearchParam userSearchParam);

    void deleteUser(Long id);

    UserVo findUser(Long id);

    void updateUser(User user);

    void deleteBatch(List<Integer> ids);

    User findUserByUserName(String userName);

    void updateLoginTime(Long id, Date date);

    void updateLoginCount(Long id);

    void resetLoginCount(Long id);

    void updateLoginErrorInfo(Date date, Long id);

    void resetLoginErrorInfo(Date date, Long id);

    void resetLoginErrorCount(Long id);

    void updateUserStatus(Long id);

    ServerResponse updatePassword(UserPasswordParam userPasswordParam);

    ServerResponse resetUserPassword(Long id);

    ServerResponse sendPassword(String mail);
}
