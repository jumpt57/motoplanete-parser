package fr.jumpt.motoplanete.extractor;

import fr.jumpt.motoplanete.extractor.workers.DictionaryWorker;

public class Application {

    public static void main(String[] args) throws Exception {    	
        System.out.println("START APP");
       
        
        /*System.out.println("CLEAN BDD");
        BddWorker.cleanBdd();
        System.out.println("END CLEAN BDD");
        
        System.out.println("LOAD MANUFACTURERS");
        ManufacturersWorker.loadManufacturers();
        System.out.println("END LOAD MANUFACTURERS");
        
        System.out.println("INSERT MANUFACTURERS");
        BddWorker.insertManufacturers();
        System.out.println("END INSERT MANUFACTURERS");
        
        System.out.println("LOAD BIKES");
        BikesWorker.loadBikes();
        System.out.println("END LOAD BIKES");
        
        System.out.println("INSERT BIKES");
        BddWorker.insertBikes();
        System.out.println("END INSERT BIKES");*/
        
        System.out.println("INSERT DICTIONARY FEATURES");
        DictionaryWorker.processFeatures();
        System.out.println("END INSERT DICTIONARY FEATURES");
        
        System.out.println("END APP");
    }

}
