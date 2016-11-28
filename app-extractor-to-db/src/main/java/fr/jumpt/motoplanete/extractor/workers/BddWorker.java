package fr.jumpt.motoplanete.extractor.workers;

import fr.jumpt.motoplanete.extractor.dba.SimpleDba;
import fr.jumpt.motoplanete.extractor.models.Bike;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;

public abstract class BddWorker {

	public static void cleanBdd() {
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_GENERAL);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_ENGINE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_FRAME);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_FRONT_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_REAR_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_REAR_AXLE);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_BIKE_TRANSMISSION);
		SimpleDba.deleteAll(SimpleDba.DELETE_ALL_MANUFACTURERS);
	}

	public static void insertManufacturers() {
		for (Manufacturer manufacturer : ManufacturersWorker.jsonToObject()) {
			SimpleDba.insertManufacturer(manufacturer);
		}
	}

	public static void insertBikes() {
		for (Manufacturer manufacturer : ManufacturersWorker.jsonToObject()) {
			for (Bike bike : BikesWorker.jsonToObject(manufacturer)) {
				if (!SimpleDba.getBikeExistByNameAndYear(bike.getName(), bike.getYear())) {
					SimpleDba.insertFrame(bike.getFrame());
					SimpleDba.insertFrontAxle(bike.getFrontAxle());
					SimpleDba.insertRearAxle(bike.getRearAxle());
					SimpleDba.insertTransmission(bike.getTransmission());
					SimpleDba.insertEngine(bike.getEngine());
					SimpleDba.insertBike(bike);
				}
			}
		}

	}

}
