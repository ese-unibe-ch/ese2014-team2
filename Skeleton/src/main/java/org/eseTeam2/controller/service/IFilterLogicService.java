package org.eseTeam2.controller.service;

import java.util.ArrayList;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.CustomFilterAd;

public interface IFilterLogicService {
	
	public ArrayList<String> getGettersOfFilterForm();
	public ArrayList<String> getParamsOfFilterForm(ArrayList<String> getters);
	public Advertisement getAdToCompare ( ArrayList<String> getterMethodNames, ArrayList<String> setterMethodNames, FilterForm filterForm   );
	public ArrayList<Advertisement> getAdsThatMatchTheFilter(
			Advertisement adToCompare, ArrayList<String> getters);
	public ArrayList<Advertisement> getAdsThatMatchTheSmallFilter(String city,
			int roomPrice);
	public CustomFilterAd getFilterAdToCompare(ArrayList<String> getters,
			ArrayList<String> paramNames, FilterForm filterForm);
	public boolean isNewAdMatch(CustomFilterAd exampleAd,
			ArrayList<String> getters, Advertisement ad);
}
