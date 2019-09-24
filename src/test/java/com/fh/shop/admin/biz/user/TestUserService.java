package com.fh.shop.admin.biz.user;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.param.user.UserSearchParam;
import com.fh.shop.admin.po.user.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-common.xml"})
public class TestUserService extends AbstractJUnit4SpringContextTests {

    @Resource(name="userService")
    private IUserService userService;


    @Test
    public void testDeleteUser() {
        userService.deleteUser(22L);
    }

    @Test
    public void testAddUser() {
        User user = new User();
        user.setUserName("kkk");
        user.setPassword("123");
        user.setRoleIds("1,2,3");
        userService.addUser(user);
    }

    @Test
    public void testUpdateUser() {
        User user = new User();
        user.setId(23L);
        user.setUserName("llll");
        user.setRealName("订单");
        user.setRoleIds("4,5");
        userService.updateUser(user);
    }

    @Test
    public void testFindList() {
        UserSearchParam userSearchParam = new UserSearchParam();
        userSearchParam.setStart(0);
        userSearchParam.setLength(10);
        userSearchParam.setDraw(1);
        DataTableResult pageList = userService.findPageList(userSearchParam);
        System.out.println(pageList);
    }
}
