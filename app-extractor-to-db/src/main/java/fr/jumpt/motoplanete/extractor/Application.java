package fr.jumpt.motoplanete.extractor;

import fr.jumpt.motoplanete.extractor.dba.SimpleDba;
import fr.jumpt.motoplanete.extractor.workers.BikesWorker;
import fr.jumpt.motoplanete.extractor.workers.ManufacturersWorker;

public class Application {

    public static void main(String[] args) throws Exception {    	
        System.out.println("Start App");
        
        
        SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_GENERAL);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_ENGINE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_FRAME);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_FRONT_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_REAR_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_REAR_AXLE);			
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_TRANSMISSION);	
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_CATEGORIES);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_MANUFACTURERS);
		
        BikesWorker.loadBikes(ManufacturersWorker.loadManufacturers());
        System.out.println("End App");
    }

}
