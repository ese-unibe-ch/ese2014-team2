package org.sample.webapp.controller;
import org.eseTeam2.controller.IndexController;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.IUserDataService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.util.NestedServletException;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class IndexControllerTest {

    @Mock
    private IUserDataService userService;

    @InjectMocks
    private IndexController indexController;

    private MockMvc mockMvc;
    
    private final String INDEX = "index";

    @Before
    public void setup() {

        // Process mock annotations
        MockitoAnnotations.initMocks(this);

        // Setup Spring test in standalone mode
        this.mockMvc = MockMvcBuilders.standaloneSetup(indexController).build();
        
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setSuffix(".jsp");
 
        this.mockMvc = MockMvcBuilders.standaloneSetup(new IndexController())
                                 .setViewResolvers(viewResolver)
                                 .build();

    }
    
    @After
    public void tearDown() {
    	
    	this.indexController = null;
    	this.mockMvc = null;
    }

    
    @Test
    public void testIndex() throws Exception {

        this.mockMvc.perform(get("/"))
        			.andExpect(status().isOk())
                	.andExpect(forwardedUrl("index.jsp"));

    }

    @Test
    public void testLogin() throws Exception {

        this.mockMvc.perform(get("/login"))
        			.andExpect(status().isOk())
                	.andExpect(forwardedUrl("login.jsp"));

    }

    @Test
    public void testUnderConstruction() throws Exception {

        this.mockMvc.perform(get("/underConstr"))
        			.andExpect(status().isOk())
        			.andExpect(forwardedUrl("underConstruction.jsp"));

    }
    
    @Test
    public void testForbidden() throws Exception {

        this.mockMvc.perform(get("/forbidden"))
        			.andExpect(status().isOk())
        			.andExpect(forwardedUrl("forbidden.jsp"));

    }
    
    @Test
    public void testError404() throws Exception {

        this.mockMvc.perform(get("/404"))
        			.andExpect(status().isOk())
        			.andExpect(forwardedUrl("404.jsp"));

    }

    @Test
    public void testSecurityError() throws Exception {

        this.mockMvc.perform(get("/security-error"));

    }
    

   /* 
    @Test
    public void testCreateSignupFormInvalidUser() throws Exception {

        when(sampleService.saveFrom(any(SignupForm.class)))
                .thenThrow(new InvalidUserException("For Testing"));

        this.mockMvc.perform(post("/create")
                .param("email", "mvcemail@test.com")
                .param("firstName", "mvcfirst")
                .param("lastName", "mvclastname"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl(IndexController.PAGE_INDEX))
                .andExpect(model().attributeExists("page_error"));

    }

    @Test(expected = NestedServletException.class)
    public void testCreateSignupFormRuntimeException() throws Exception {

        when(sampleService.saveFrom(any(SignupForm.class)))
                .thenThrow(new RuntimeException("For Testing"));

        this.mockMvc.perform(post("/create")
                .param("email", "mvcemail@test.com")
                .param("firstName", "mvcfirst")
                .param("lastName", "mvclastname"));
    }

*/
}
