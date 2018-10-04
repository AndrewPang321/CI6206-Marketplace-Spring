package com.ci6206.marketplace.web.Auth.repository;

import com.ci6206.marketplace.web.Auth.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query(value = "SELECT * FROM t_user WHERE t_user.email = :email", nativeQuery = true)
    User findByEmail(@Param("email") String email);

}
