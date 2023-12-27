package tn.essat.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;

import tn.essat.service.IUserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource datasource;
	
	@Autowired
	IUserService service;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		PasswordEncoder crt= cryptageMP();
		
		auth.userDetailsService(service).passwordEncoder(crt);
		
	/*	auth.jdbcAuthentication().dataSource(datasource)
		                         .usersByUsernameQuery("select username as principal, password as credentials, active from user where username=? ")
		                         .authoritiesByUsernameQuery("select username as principal, role as role from user_role where username=?")
		                         .passwordEncoder(crt)
		                         .rolePrefix("Role_");*/
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.formLogin().loginPage("/login").defaultSuccessUrl("/")
		                                    .failureUrl("/login?error=true").permitAll();
		
		http.authorizeRequests().antMatchers("/add**","/delete**/**","/save").hasRole("ADMIN");
		http.authorizeRequests().anyRequest().authenticated();
		
		http.csrf().disable();
		
		
	}
	@Bean
	public PasswordEncoder cryptageMP() {
		return new BCryptPasswordEncoder();
	}

}
