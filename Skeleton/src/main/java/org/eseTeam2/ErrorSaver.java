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

            // creates a new file and looksif afile with that name already exists.if it does then it adds a int number to the filename
            // and checks again.
			File newTextFile = new File(dir.getAbsolutePath()+File.separator+name+".txt");
			int i = 0;
			while (newTextFile.exists()) {
				
				newTextFile = new File( dir.getAbsolutePath()+File.separator+name+i+".txt");
				i++;
			}
			

			FileWriter fw = new FileWriter(newTextFile);
			fw.write(message);
			fw.close();

		} catch (IOException iox) {
			// do stuff with exception
			iox.printStackTrace();
		}
	}

}
