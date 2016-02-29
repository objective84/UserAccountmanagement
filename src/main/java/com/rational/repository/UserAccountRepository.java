package com.rational.repository;

import com.rational.model.UserAccount;
import org.springframework.data.jpa.mapping.JpaPersistentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Peter on 2/28/2016.
 */
@Repository
public interface UserAccountRepository extends JpaRepository<UserAccount, Long> {
}
