package test.seleniumTest;

import java.awt.AWTException;
import java.awt.Robot;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

import org.mockito.*;

import javax.persistence.EntityManager;

import junit.framework.TestCase;

import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.service.IMessageService;
import org.eseTeam2.controller.service.MessageService;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.MessageDao;
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


public class SendMessageTest extends TestCase {
	private WebDriver driver;
	private WebElement element;
	private StringBuffer verificationErrors = new StringBuffer();
	
	@Autowired
	MessageDao messageDao;
	

	
	
	
	

	
	
	@Before
	public void setUp() throws Exception {
		
		
		
		System.setProperty("webdriver.chrome.driver","src/main/java/Test/resources/chromedriver.exe");
		driver = new HtmlUnitDriver();

		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		
		driver.get("http://localhost:8080/Skeleton/login");
		assertTrue(driver.getPageSource().contains("Login"));
		driver.findElement(By.id("field-username")).sendKeys("a@a.ch");
		driver.findElement(By.id("field-password")).sendKeys("123");
		driver.findElement(By.id("loginB")).click();
		
		driver.findElement(By.partialLinkText("like to")).click();
		assertTrue(driver.getPageSource().contains("Grundlegende"));
		driver.findElement(By.id("btnC")).click();
		assertTrue(driver.getPageSource().contains("Successful"));
		
	}

	
	@Test
	public void testSendMessage() {
	
		
		driver.get("http://localhost:8080/Skeleton/ads?showFilter=false");
		driver.findElement(By.partialLinkText("0 CHF in")).click();
		assertTrue(driver.getPageSource().contains("Hat es einen"));
		driver.findElement(By.id("messageSend")).click();
		assertTrue(driver.getPageSource().contains("Send a Message to"));
		driver.findElement(By.id("field-Message")).sendKeys("seleniumtestmessage");
		driver.findElement(By.id("send")).click();
		assertTrue(driver.getPageSource().contains("Successful"));
		
		
		
	
		
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
