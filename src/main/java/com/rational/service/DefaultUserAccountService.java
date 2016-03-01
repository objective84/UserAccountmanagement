package com.rational.service;

import com.rational.model.UserAccount;
import com.rational.repository.UserAccountRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.lang.reflect.InvocationTargetException;

/**
 * Created by Peter on 2/28/2016.
 */
@Service("defaultUserAccountService")
public class DefaultUserAccountService implements UserAccountService{

    private enum SortField{
        firstName, lastName, email;
    }

    @Resource
    private UserAccountRepository userAccountRepository;

    public UserAccount loadUser(Long userId) {
        return userAccountRepository.findOne(userId);
    }

    public List<UserAccount> loadAllUsers() {
        List<UserAccount> users = userAccountRepository.findAll();
        Collections.sort(users);
        return users;
    }

    public UserAccount saveUser(UserAccount user) {
        return userAccountRepository.saveAndFlush(user);
    }

    public void deleteUser(Long userId) {
        userAccountRepository.delete(userId);
    }

    public List<UserAccount> sortBy(String field){
        List<UserAccount> users = userAccountRepository.findAll();
        if(field.equals("LastName")) Collections.sort(users);
        else Collections.sort(users, new UserComparator<UserAccount>(field));
        return users;
    }

    private class UserComparator<UserAccount> implements Comparator<UserAccount>{
        private String sortField;

        public UserComparator(String sortField) {
            this.sortField = sortField;
        }

        public int compare(UserAccount o1, UserAccount o2) {
            try {
                String o1Field = (String)o1.getClass().getMethod("get" + sortField).invoke(o1);
                String o2Field = (String)o2.getClass().getMethod("get" + sortField).invoke(o2);
                return o1Field.compareTo(o2Field);
            } catch (IllegalAccessException e) {
                return 0;
            } catch (InvocationTargetException e) {
                return 0;
            } catch (NoSuchMethodException e) {
                return 0;
            }catch (ClassCastException e){
                return 0;
            }
        }
    }

}
