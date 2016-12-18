package fr.jumpt.motoplanete.extractor.workers;

import fr.jumpt.motoplanete.extractor.dba.SimpleDba;
import fr.jumpt.motoplanete.extractor.models.Bike;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;

public abstract class BddWorker {

	public static void cleanBdd() {
		System.out.println("CLEAN BDD");
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_GENERAL);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_ENGINE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_FRAME);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_FRONT_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_REAR_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_REAR_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_TRANSMISSION);
		//SimpleDba.deleteAll(SimpleDba.DELETE_ALL_MANUFACTURERS);
		System.out.println("END CLEAN BDD");
	}

	public static void insertManufacturers() {
		System.out.println("INSERT MANUFACTURERS");
		for (Manufacturer manufacturer : ManufacturersWorker.jsonToObject()) {
			SimpleDba.insertManufacturer(manufacturer);
		}
		System.out.println("END INSERT MANUFACTURERS");
	}

	public static void insertBikes() {

		System.out.println("INSERT BIKES");
		for (Manufacturer manufacturer : ManufacturersWorker.jsonToObject()) {
			for (Bike bike : BikesWorker.jsonToObject(manufacturer)) {
				if (!SimpleDba.getBikeExistByNameAndYear(bike.getName(), bike.getYear())) {
					try {
						SimpleDba.insertFrame(bike.getFrame());
						SimpleDba.insertFrontAxle(bike.getFrontAxle());
						SimpleDba.insertRearAxle(bike.getRearAxle());
						SimpleDba.insertTransmission(bike.getTransmission());
						SimpleDba.insertEngine(bike.getEngine());
						SimpleDba.insertBike(bike);

					} catch (Exception e) {
						e.printStackTrace();
					}

				}
			}
		}

		System.out.println("END INSERT BIKES");
	}

}
