package org.eseTeam2;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;


/**
 * 
 * This class stores the error messages catched into text files on the server.For later debugging.
 * @author Ice
 *
 */
public class ErrorSaver {


	public void saveErrorMessage(Exception e, String name, String absolutePath) {

		try {
			
			  final StringWriter sw = new StringWriter();
			     final PrintWriter pw = new PrintWriter(sw, true);
			     e.printStackTrace(pw);
			  
			     String message = sw.getBuffer().toString();
			
			
			
			File dir = new File(absolutePath);
            
            if (!dir.exists())
                dir.mkdirs();

            
			File newTextFile = new File(dir.getAbsolutePath()+File.separator+name+".txt");

			FileWriter fw = new FileWriter(newTextFile);
			fw.write(message);
			fw.close();

		} catch (IOException iox) {
			// do stuff with exception
			iox.printStackTrace();
		}
	}

}
