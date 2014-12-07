package org.sample.webapp.controller;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.ApplicantForm;
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.hamcrest.Matchers.any;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/config/springMVC.xml","file:src/main/webapp/WEB-INF/config/springData.xml"})
public class ApplicantsControllerIntegrationTest {

    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }

    @Test
    public void testGetApplicantForm() throws Exception {
/*        this.mockMvc.perform(get("/ads"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("/pages/ads.jsp"))
                .andExpect(model().attribute("filterForm", any(FilterForm.class)));

        this.mockMvc.perform(get("/userInterested"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("/pages/interestedInAd.jsp"))
                .andExpect(model().attribute("applicantForm", any(ApplicantForm.class)));
*/
    }

/*
    @Test
    public void testGetSignupForm() throws Exception {
        this.mockMvc.perform(get("/login"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("/pages/login.jsp"))
                .andExpect(model().attribute("loginForm", any(SignupForm.class)));
    }

    @Test
    public void testGetAdForm() throws Exception {
        this.mockMvc.perform(get("/placead"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("/pages/placead.jsp"))
                .andExpect(model().attribute("adForm", any(AdForm.class)));
    }
*/
}

