package fr.jumpt.motoplanete.extractor.workers;

import org.apache.commons.lang3.StringUtils;

import fr.jumpt.motoplanete.extractor.dba.SimpleDba;
import fr.jumpt.motoplanete.extractor.models.Bike;
import fr.jumpt.motoplanete.extractor.models.Dictionary;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;

public abstract class DictionaryWorker {

	public static void processFeatures() {
		System.out.println("INSERT DICTIONARY FEATURES");
		try {
			for (Manufacturer manufacturer : ManufacturersWorker.jsonToObject()) {
				for (Bike bike : BikesWorker.jsonToObject(manufacturer)) {

					/**
					 * Engine
					 */
					SimpleDba.insertBikeFeaturesValue("bike_engine", "cooling", bike.getEngine().getCooling());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "act", bike.getEngine().getAct());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "gas_supply", bike.getEngine().getGasSupply());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "type", bike.getEngine().getType());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "engine_intake",
							bike.getEngine().getEngineIntake());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "valve", bike.getEngine().getValve());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "valve_command",
							bike.getEngine().getValveCommand());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "bridable", bike.getEngine().getBridable());
					SimpleDba.insertBikeFeaturesValue("bike_engine", "type", bike.getEngine().getType());
					/**
					 * Frame
					 */
					SimpleDba.insertBikeFeaturesValue("bike_frame", "type", bike.getFrame().getType());
					/**
					 * Front Axle
					 */
					SimpleDba.insertBikeFeaturesValue("bike_front_axle", "fork", bike.getFrontAxle().getFork());
					SimpleDba.insertBikeFeaturesValue("bike_front_axle", "front_wheel",
							bike.getFrontAxle().getFrontWheel());
					SimpleDba.insertBikeFeaturesValue("bike_front_axle", "front_shock",
							bike.getFrontAxle().getFrontShock());
					SimpleDba.insertBikeFeaturesValue("bike_front_axle", "front_brake",
							bike.getFrontAxle().getFrontBrake());
					/**
					 * Rear Axle
					 */
					SimpleDba.insertBikeFeaturesValue("bike_rear_axle", "rear_shock",
							bike.getRearAxle().getRearShock());
					SimpleDba.insertBikeFeaturesValue("bike_rear_axle", "rear_brake",
							bike.getRearAxle().getRearBrake());
					SimpleDba.insertBikeFeaturesValue("bike_rear_axle", "rear_wheel",
							bike.getRearAxle().getRearWheel());
					SimpleDba.insertBikeFeaturesValue("bike_rear_axle", "type", bike.getRearAxle().getType());
					/**
					 * Transmission
					 */
					SimpleDba.insertBikeFeaturesValue("bike_transmission", "gearbox_speeds",
							bike.getTransmission().getGearboxSpeeds());
					SimpleDba.insertBikeFeaturesValue("bike_transmission", "gearbox_type",
							bike.getTransmission().getGeerboxType());
					SimpleDba.insertBikeFeaturesValue("bike_transmission", "secondary_transmission",
							bike.getTransmission().getSecondaryTransmission());
					SimpleDba.insertBikeFeaturesValue("bike_transmission", "type", bike.getTransmission().getType());
					SimpleDba.insertBikeFeaturesValue("bike_transmission", "reverse",
							bike.getTransmission().getReverse());
				}
			}
		} catch (Exception e) {
			System.out.println("Problème lors du traitement des données du dictionnaire");
		}
		System.out.println("END INSERT DICTIONARY FEATURES");
	}
	
	public static void featuresCorrection(){
		System.out.println("CORRECT DICTIONARY FEATURES");
		try{
			for (Dictionary dico : SimpleDba.getAllDictionary()) {
				if(dico.getCorrectValue().isEmpty()){
					dico.setCorrectValue(StringUtils.capitalize(dico.getValue().trim()));
					SimpleDba.updateDictionary(dico);
				}
				
			}
			
		} catch(Exception e){
			System.out.println("Problème lors de la correction des données du dictionnaire");
		}
		System.out.println("END CORRECT DICTIONARY FEATURES");
	}
	
	public static void copyToCorrectedFeaturesTable(){
		System.out.println("COPY CORRECTED DICTIONARY FEATURES");
		try{
			for (Dictionary dico : SimpleDba.getAllDictionary()) {
				SimpleDba.insertBikeFeaturesValueCorrected(dico);		
			}
			
		} catch(Exception e){
			System.out.println("Problème lors du dump des corrections des données du dictionnaire");
		}
		System.out.println("END COPY CORRECTED DICTIONARY FEATURES");
	}
	
	public static void correctAllValues(){
		System.out.println("COPY CORRECT BIKES FEATURES");
		try{
			for (Dictionary dico : SimpleDba.getAllDictionary()) {
				SimpleDba.updateBikesValue(dico);								
			}
			
		} catch(Exception e){
			System.out.println("Problème lors de la correction des données des motos via le dictionnaire");
		}
		System.out.println("COPY END CORRECT BIKES FEATURES");
	}

}
