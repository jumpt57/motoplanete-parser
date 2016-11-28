package fr.jumpt.motoplanete.extractor.factories;

import fr.jumpt.motoplanete.extractor.dba.SimpleDba;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;

public abstract class ManufacturerFactory {
	
	public static Manufacturer create(){
		Manufacturer man = new Manufacturer();
		man.setId(SimpleDba.getMaxId(SimpleDba.MAX_ID_MANUFACTURER) + 1);
		return man;
	}	

}
