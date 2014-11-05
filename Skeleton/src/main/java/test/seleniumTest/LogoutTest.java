package test.seleniumTest;

import java.awt.AWTException;
import java.awt.Robot;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;








import junit.framework.TestCase;

import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.UserDao;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.springframework.beans.factory.annotation.Autowired;


public class LogoutTest extends TestCase {
	private WebDriver driver;
	private WebElement element;
	private StringBuffer verificationErrors = new StringBuffer();
	

	
	
	@Before
	public void setUp() throws Exception {
		System.setProperty("webdriver.chrome.driver","src/main/java/Test/resources/chromedriver.exe");
		driver = new HtmlUnitDriver();

		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		
		driver.get("http://localhost:8080/Skeleton/login");
		assertTrue(driver.getPageSource().contains("Login"));
		driver.findElement(By.id("field-username")).sendKeys("a@a.ch");
		driver.findElement(By.id("field-password")).sendKeys("123");
		driver.findElement(By.id("loginB")).click();
		
	
		
	}

	
	@Test
	public void testLogout() {
	
		driver.get("http://localhost:8080/Skeleton/logout");
		assertFalse(driver.getPageSource().contains("My Ads"));
	
				
	}
	
	
	
	
	
	@After
	public void tearDown() throws Exception {
		driver.quit();
		String verificationErrorString = verificationErrors.toString();
        if (!"".equals(verificationErrorString)) {
            fail(verificationErrorString);
        }
	}

		

}
