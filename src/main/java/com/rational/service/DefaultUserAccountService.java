package com.rational.service;

import com.rational.model.UserAccount;
import com.rational.repository.UserAccountRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Peter on 2/28/2016.
 */
@Service("defaultUserAccountService")
public class DefaultUserAccountService implements UserAccountService{

    @Resource
    private UserAccountRepository userAccountRepository;

    public UserAccount loadUser(Long userId) {
        return userAccountRepository.findOne(userId);
    }

    public List<UserAccount> loadAllUsers() {
        return userAccountRepository.findAll();
    }

    public UserAccount saveUser(UserAccount user) {
        return saveUser(user);
    }

    public void deleteUser(Long userId) {
        userAccountRepository.delete(userId);
    }
}
