package org.eseTeam2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import org.eseTeam2.controller.service.IAdDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.HttpRequestHandler;
 

 
@Component("imageServlet")
public class ImageServlet implements HttpRequestHandler {
 
    @Autowired
    private IAdDataService adService;
 
    public void handleRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // get the thumb from the user entity
        byte[] thumb = adService.getAdvertisement((long) 3).getImg_one();
 
        String name = "userAvatar";
        response.setContentType("image/jpeg");
        response.setContentLength(thumb.length);
 
        response.setHeader("Content-Disposition", "inline; filename=\"" + name
                + "\"");
 
        BufferedInputStream input = null;
        BufferedOutputStream output = null;
 
        try {
            input = new BufferedInputStream(new ByteArrayInputStream(thumb));
            output = new BufferedOutputStream(response.getOutputStream());
            byte[] buffer = new byte[8192];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        } catch (IOException e) {
            System.out.println("There are errors in reading/writing image stream "
                    + e.getMessage());
        } finally {
            if (output != null)
                try {
                    output.close();
                } catch (IOException ignore) {
                }
            if (input != null)
                try {
                    input.close();
                } catch (IOException ignore) {
                }
        }
 
    }
}