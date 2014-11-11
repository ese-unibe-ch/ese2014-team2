package test;

import static org.junit.Assert.*;

import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.UserDao;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:springMVC.xml","classpath*:springData.xml", "classpath*:springSecurity.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = true)
public class UserTest {

    @Autowired
    UserDao userDao;

    
    
    @Autowired
    IUserDataService userService;
    

    @BeforeClass
    public static void setup()
    {
	} 
	    
    
    @Before
    public void setUser(){
    	SignupForm form = new SignupForm();
    	form.setEmail("test@email.ch");
    	form.setPassword("test");
  
    	userService.saveFrom(form);
    }
    
    

    
    @Test
    public void testFindUserByEmail() {
    	String EMAIL =  "test@email.ch";
      
        User findUser = userDao.findByEmail(EMAIL);
        assertEquals(findUser.getEmail(), EMAIL);
    }

}
