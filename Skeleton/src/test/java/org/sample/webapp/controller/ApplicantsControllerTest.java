package org.sample.webapp.controller;
import javax.servlet.ServletContext;

import org.eseTeam2.controller.AdController;
import org.eseTeam2.controller.ApplicantsController;
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

public class ApplicantsControllerTest {

    @Mock
    private IAdDataService adService;

    @Mock
    private IUserDataService userService;

    @Mock
    private ServletContext servletContext;

    @Mock
    private IAppointmentService appointmentService;

    @InjectMocks
    private ApplicantsController applicantsController;

    private MockMvc mockMvc;
    
    @Before
    public void setup() {

        // Process mock annotations
        MockitoAnnotations.initMocks(this);

        // Setup Spring test in standalone mode
        this.mockMvc = MockMvcBuilders.standaloneSetup(applicantsController).build();
        
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setSuffix(".jsp");
 
        this.mockMvc = MockMvcBuilders.standaloneSetup(new ApplicantsController())
                                 .setViewResolvers(viewResolver)
                                 .build();
    }
    
    @After
    public void tearDown() {
    	
    	this.applicantsController = null;
    	this.mockMvc = null;
    }

    @Test
    public void testInterestedInAd() throws Exception {

        this.mockMvc.perform(get("/userInterested")
        			.param("adId", "1L")
        			.param("principal", "<error>"))
        			.andExpect(status().isOk())
                	.andExpect(forwardedUrl("interestedInAd.jsp"));
        
    }

    @Test
    public void testDeleteAd() throws Exception {

        this.mockMvc.perform(get("/applicationId"))
        			.andExpect(status().isOk())
                	.andExpect(forwardedUrl("redirect:/showInteressentsOverview.jsp"));
    }
}
