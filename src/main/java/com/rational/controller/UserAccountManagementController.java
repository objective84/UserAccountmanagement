package com.rational.controller;

import com.rational.model.UserAccount;
import com.rational.service.UserAccountService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by Peter Varner-Howland on 2/25/2016.
 */
@RestController
public class UserAccountManagementController {
    public static final String UAM = "uam";

    @Resource(name = "defaultUserAccountService")
    private UserAccountService userAccountService;

    @RequestMapping("/users")
    public List<UserAccount> getUserList(){
        return userAccountService.loadAllUsers();
    }

    @RequestMapping("/user/{userId}")
    public UserAccount getUser(@PathVariable String userId){
        return userAccountService.loadUser(Long.decode(userId));
    }

    @RequestMapping("/user/save")
    public UserAccount saveUser(@RequestBody UserAccount user){
        return userAccountService.saveUser(user);
    }

    @RequestMapping("/user/delete/{userId}")
    public void deleteUser(@PathVariable String userId){
        userAccountService.deleteUser(Long.decode(userId));
    }

    @RequestMapping("/users/sort-by/{sortField}")
    public List<UserAccount> sortBy(@PathVariable String sortField){
        return userAccountService.sortBy(sortField);
    }
}
