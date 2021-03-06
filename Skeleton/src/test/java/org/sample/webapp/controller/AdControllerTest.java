package org.sample.webapp.controller;
import javax.servlet.ServletContext;

import org.eseTeam2.controller.AdController;
import org.eseTeam2.controller.IndexController;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IAppointmentService;
import org.eseTeam2.controller.service.IUserDataService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.omg.CORBA.Principal;
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

public class AdControllerTest {

    @Mock
    private IAdDataService adService;

    @Mock
    private IUserDataService userService;

    @Mock
    private ServletContext servletContext;

    @Mock
    private IAppointmentService appointmentService;

    @InjectMocks
    private AdController adController;

    private MockMvc mockMvc;
    
    @Before
    public void setup() {

        // Process mock annotations
        MockitoAnnotations.initMocks(this);

        // Setup Spring test in standalone mode
        this.mockMvc = MockMvcBuilders.standaloneSetup(adController).build();
        
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setSuffix(".jsp");
 
        this.mockMvc = MockMvcBuilders.standaloneSetup(new AdController())
                                 .setViewResolvers(viewResolver)
                                 .build();

    }
    
    @After
    public void tearDown() {
    	
    	this.adController = null;
    	this.mockMvc = null;
    }

    
    @Test
    public void testShowAds() throws Exception {

        this.mockMvc.perform(get("/ads"))
        			.andExpect(status().isOk())
                	.andExpect(forwardedUrl("ads.jsp"));
    }


    @Test
    public void testCreateAd() throws Exception {

        this.mockMvc.perform(get("/placead"))
        			.andExpect(status().isOk())
        			.andExpect(forwardedUrl("placead.jsp"));

    }
}
