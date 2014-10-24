package org.eseTeam2.controller.service;

import java.util.ArrayList;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.model.Advertisement;

public interface IFilterLogicService {
	
	public ArrayList<String> getGetters();
	public ArrayList<String> getParamsOfFilterForm(ArrayList<String> getters);
	public Advertisement getAdToCompare ( ArrayList<String> getterMethodNames, ArrayList<String> setterMethodNames, FilterForm filterForm   );
	public ArrayList<Advertisement> getAdsThatMachTheFilter(
			Advertisement adToCompare, ArrayList<String> getters);
}
