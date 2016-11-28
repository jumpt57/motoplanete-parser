package fr.jumpt.motoplanete.extractor.factories;

import fr.jumpt.motoplanete.extractor.models.Manufacturer;

public abstract class ManufacturerFactory {
	
	public static Manufacturer create(){
		Manufacturer man = new Manufacturer();
		man.setId(Manufacturer.ID++);
		return man;
	}	

}
