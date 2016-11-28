package fr.jumpt.motoplanete.extractor.factories;

import java.util.ArrayList;

import fr.jumpt.motoplanete.extractor.models.Bike;
import fr.jumpt.motoplanete.extractor.models.Engine;
import fr.jumpt.motoplanete.extractor.models.Frame;
import fr.jumpt.motoplanete.extractor.models.FrontAxle;
import fr.jumpt.motoplanete.extractor.models.RearAxle;
import fr.jumpt.motoplanete.extractor.models.Transmission;

public abstract class BikeFactory {
	
	public static Bike create(){
		
		int id = Bike.ID++;
		
		Bike bike = new Bike();
		bike.setId(id);
		bike.setImagesUrl(new ArrayList<String>());
		
		Engine engine = new Engine();
		engine.setId(id);
		
		bike.setEngine(engine);
		
		Frame frame = new Frame();
		frame.setId(id);		
		bike.setFrame(frame);
		
		FrontAxle frontAxle = new FrontAxle();
		frontAxle.setId(id);		
		bike.setFrontAxle(frontAxle);
		
		RearAxle rearAxle = new RearAxle();
		rearAxle.setId(id);		
		bike.setRearAxle(rearAxle);
		
		Transmission transmission = new Transmission();
		transmission.setId(id);		
		bike.setTransmission(transmission);
		
		return bike;
	}

}
