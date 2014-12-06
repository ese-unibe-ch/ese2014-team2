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

/**
 * This is the Picture Manager, it handles picture uploads from the website.
 * 
 * @author Icewater
 *
 */
public class PictureManager {
    
    /**
     * This method takes a list of given pictures in the format of a
     * MultipartFile Array, and stores them on the server under
     * ../img/adPictures/..
     * 
     * @param path
     *            This is the absolute folderpath, where the file folder will be
     * @param filename
     *            This is the temporary filename
     * @param files
     *            This is the list of all the pictures which will be uploapded
     * @return returns A list with all the picture names
     */
    public ArrayList<String> uploadMultipleFile(String path, String filename, MultipartFile[] files) {

	ArrayList<String> names = new ArrayList<String>();

	for (int i = 0; i < files.length; i++) {
	    MultipartFile file = files[i];

	    if (file.getSize() != 0) {
		try {
		    byte[] bytes = file.getBytes();

		    File dir = new File(path);

		    if (!dir.exists())
			dir.mkdirs();

		    String fullFilePath = dir.getAbsolutePath()+ File.separator + filename+ file.getOriginalFilename();
		    String fullFilename = File.separator + filename+ file.getOriginalFilename();

		    BufferedOutputStream outStream = new BufferedOutputStream( new FileOutputStream(new File(fullFilePath)));
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

    /**
     * this is a helper method which loads a picture from a given string path
     * and puts it into a byte array
     * 
     * @param picture
     *            The path of the picture
     * @return returns the byte array which contains the picture
     */
    public byte[] getByteArrayFromPath(String picturePath) {
	File file = new File(picturePath);

	FileInputStream fin = null;

	try {

	    // create FileInputStream object
	    fin = new FileInputStream(file);

	    byte fileContent[] = new byte[(int) file.length()];

	    // Reads up to certain bytes of data from this input stream into an
	    // array of bytes.

	    fin.read(fileContent);

	    // create string from byte array

	    return fileContent;

	}

	catch (FileNotFoundException e) {

	    System.out.println("File not found" + e);

	}

	catch (IOException ioe) {

	    System.out.println("Exception while reading file " + ioe);

	}

	finally {


	    try {

		if (fin != null) {

		    fin.close();

		}

	    } catch (IOException ioe) {

		System.out.println("Error while closing stream: " + ioe);
	    }
	}
	return null;
    }

}
