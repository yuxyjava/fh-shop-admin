package com.fh.shop.admin.mapper.user;

import com.fh.shop.admin.param.user.UserPasswordParam;
import com.fh.shop.admin.param.user.UserSearchParam;
import com.fh.shop.admin.po.user.User;
import com.fh.shop.admin.po.user.UserRole;
import org.apache.ibatis.annotations.Param;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

public interface IUserMapper {

    public void addUser(User user);

    long findUserTotalCount(UserSearchParam userSearchParam);

    List<User> findUserPageList(UserSearchParam userSearchParam);

    void deleteUser(Long id);

    User findUser(Long id);

    void updateUser(User user);

    void addUserRole(UserRole userRole);

    List<String> findRoleNameList(Long userId);

    List<Integer> findRoleIdList(Long id);

    void deleteUserRole(Long id);

    void deleteBatch(List<Integer> ids);

    void deleteUserRoles(List<Integer> ids);

    User findUserByUserName(String userName);

    void updateLoginTime(@Param("id") Long id, @Param("currDate") Date currentDate);

    void updateLoginCount(Long id);

    void resetLoginCount(Long id);

    void updateLoginErrorInfo(@Param("currDate") Date date, @Param("userId") Long id);

    void resetLoginErrorInfo(@Param("currDate") Date date, @Param("userId") Long id);

    void resetLoginErrorCount(Long id);

    void updateUserStatus(Long id);

    void updatePassword(UserPasswordParam userPasswordParam);

    void resetUserPassword(@Param("id")Long id, @Param("password")String password);

    User findUserByMail(String mail);
}
