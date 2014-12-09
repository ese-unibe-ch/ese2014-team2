package org.sample.webapp.controller;

import static org.junit.Assert.*;

import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.UserDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/config/springData.xml", "file:src/main/webapp/WEB-INF/config/applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = true)
public class TestTest {
    
    
    @Autowired
    UserDao userDao;
    
    @Test
    public void testTeamReference() {
   
  
    User user = new User(); 
    user.setFirstName("testFirst");
    assertNull(user.getId());
    user = userDao.save(user);
    assertNotNull(user.getId());
    assertTrue(user.getId() > 0);
    assertEquals(user.getFirstName(), "testFirst");
    
    }
    @Test
    public void testFindUserByEmail() {
    String EMAIL = "test@test.test";
    User user = new User();
    user.setEmail(EMAIL);
    user = userDao.save(user); 
    User findUser = userDao.findByEmail(EMAIL);
    assertEquals(findUser.getEmail(), EMAIL);
    }
    }


