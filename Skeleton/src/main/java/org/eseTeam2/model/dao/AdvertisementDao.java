package org.eseTeam2.model.dao;

import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

public interface AdvertisementDao extends JpaRepository<Advertisement,Long>{
	
	public Iterable<Advertisement> findByCityAndRoomPriceLessThan( String city, int roomPrice);
	public Iterable<Advertisement> findByCityAndWgType(String city, String wgType);
	public Iterable<Advertisement> findByRoomPriceLessThanAndWgType(int roomPrice, String wgType);


	public Iterable<Advertisement> findByCityAndRoomPriceLessThanAndWgType(
			String city, int roomPrice, String wgType);
	public Iterable<Advertisement> findByWgType(String wgType);
	public Iterable<Advertisement> findByRoomPriceLessThan(int roomPrice);
	public Iterable<Advertisement> findByCity(String city);
	public Advertisement findByCreatorAndId(User creator, Long id);
}
