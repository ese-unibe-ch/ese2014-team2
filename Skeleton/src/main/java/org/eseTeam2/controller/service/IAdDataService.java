package org.eseTeam2.controller.service;

import java.awt.image.BufferedImage;
import java.sql.Blob;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;
import org.springframework.web.multipart.MultipartFile;

public interface IAdDataService {
	
	public Iterable<Advertisement> getAds();
	public Advertisement getAdvertisement(Long id);
	public AdForm saveFrom(AdForm adForm, MultipartFile file, MultipartFile file2, MultipartFile file3, MultipartFile file4);
	public Blob getBlob(MultipartFile file);
	public BufferedImage convertToBufferedImage(byte[] picture);
		
}