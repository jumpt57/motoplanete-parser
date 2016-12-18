package fr.jumpt.motoplanete.extractor;

import fr.jumpt.motoplanete.extractor.workers.BddWorker;
import fr.jumpt.motoplanete.extractor.workers.DictionaryWorker;

public class Application {

	public static void main(String[] args) throws Exception {
		System.out.println("START APP");

		BddWorker.cleanBdd();

		//ManufacturersWorker.loadManufacturers();

		//BddWorker.insertManufacturers();

		//BikesWorker.loadBikes();

		BddWorker.insertBikes();

		//DictionaryWorker.processFeatures();

		//DictionaryWorker.featuresCorrection();

		// DictionaryWorker.copyToCorrectedFeaturesTable();

		DictionaryWorker.correctAllValues();

		// ImagesWorker.dowload();

		System.out.println("END APP");
	}

}
