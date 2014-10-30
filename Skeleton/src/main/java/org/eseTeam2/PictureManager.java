package org.eseTeam2;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

public class PictureManager {
	

	
	 
	    private static final Logger logger = LoggerFactory
	            .getLogger(PictureManager.class);
	 
	 
	 
	     public ArrayList<String> uploadMultipleFile(String path, String filename, MultipartFile[] files) {
	 
	      
	    	 ArrayList<String> names = new ArrayList<String>();
	        String name = "";
	        
	        for (int i = 0; i < files.length; i++) {
	            MultipartFile file = files[i];
	         	
	            if (file.getSize() != 0) {
	            try {
	                byte[] bytes = file.getBytes();
	 
	                
	                File dir = new File(path);
	                
	                if (!dir.exists())
	                    dir.mkdirs();
	 
	              
	                String fullFilePath = dir.getAbsolutePath()+File.separator+filename+file.getOriginalFilename();
	                String fullFilename = File.separator+filename+file.getOriginalFilename();
	                
	                BufferedOutputStream outStream = new BufferedOutputStream(
							new FileOutputStream(new File(fullFilePath)));
					outStream.write(bytes);
					outStream.close();
	 
	     
	                
	               names.add(fullFilename);
	 
	               
	            } catch (Exception e) {
	                e.getMessage();
	            }
	        }
	        }
	        return names;
	    }
	    
	     
	     public byte[] getByteArrayFromPath(String picture) {
	 		File file = new File(picture);
	 		
	 		        FileInputStream fin = null;
	 		
	 		        try {
	 		
	 		            // create FileInputStream object
	 		
	 		            fin = new FileInputStream(file);
	 		
	 		 
	 		
	 		            byte fileContent[] = new byte[(int)file.length()];
	 		
	 		             
	 		           // Reads up to certain bytes of data from this input stream into an array of bytes.
	 		
	 		            fin.read(fileContent);
	 		
	 		            //create string from byte array
	 		
	 		          return fileContent;
	 		
	 		        }
	 		
	 		        catch (FileNotFoundException e) {
	 		
	 		            System.out.println("File not found" + e);
	 		
	 		        }
	 		
	 		        catch (IOException ioe) {
	 		
	 		            System.out.println("Exception while reading file " + ioe);
	 		
	 		        }
	 		
	 		        finally {
	 		
	 		            // close the streams using close method
	 		
	 		            try {
	 		
	 		                if (fin != null) {
	 	
	 		                    fin.close();
	 	
	 		                }
	 	
	 		            }
	 		         catch (IOException ioe) {
	 		
	 		                System.out.println("Error while closing stream: " + ioe);
	 		            }}
					return null;}
	    
	}

