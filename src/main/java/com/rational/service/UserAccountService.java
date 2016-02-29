package com.rational.service;

import com.rational.model.UserAccount;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Peter on 2/28/2016.
 */
@Service
public interface UserAccountService {

    UserAccount loadUser(Long userId);
    List<UserAccount> loadAllUsers();
    UserAccount saveUser(UserAccount user);
    void deleteUser(Long userId);
}
