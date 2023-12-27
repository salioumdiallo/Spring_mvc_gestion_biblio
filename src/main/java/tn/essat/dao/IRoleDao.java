package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Role;

@Repository
public interface IRoleDao extends JpaRepository<Role, Integer> {

}
