package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.User;

@Repository
public interface IUserDao extends JpaRepository<User, Integer> {

	User findByUsername(String username);
	
}
