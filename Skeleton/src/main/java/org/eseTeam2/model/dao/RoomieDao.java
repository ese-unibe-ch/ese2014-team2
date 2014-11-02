package org.eseTeam2.model.dao;

import org.eseTeam2.model.Roomie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

public interface RoomieDao extends JpaRepository<Roomie,Long>{
	
	/*
	public Iterable<Roomie> findByCityAndRoomPriceLessThan( String city, int roomPrice);
	public Iterable<Roomie> findByCityAndWgType(String city, String wgType);
	public Iterable<Roomie> findByRoomPriceLessThanAndWgType(int roomPrice, String wgType);


	public Iterable<Roomie> findByCityAndRoomPriceLessThanAndWgType(
			String city, int roomPrice, String wgType);
	public Iterable<Roomie> findByWgType(String wgType);
	public Iterable<Roomie> findByRoomPriceLessThan(int roomPrice);
	public Iterable<Roomie> findByCity(String city);
	*/
}
