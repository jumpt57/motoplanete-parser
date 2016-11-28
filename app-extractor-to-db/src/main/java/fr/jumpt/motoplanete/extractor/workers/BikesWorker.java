package fr.jumpt.motoplanete.extractor.workers;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import fr.jumpt.motoplanete.extractor.dba.SimpleDba;
import fr.jumpt.motoplanete.extractor.factories.BikeFactory;
import fr.jumpt.motoplanete.extractor.models.Bike;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;
import fr.jumpt.motoplanete.extractor.processors.BikeProcessor;
import fr.jumpt.motoplanete.extractor.utils.LinksMotoplanete;
import fr.jumpt.motoplanete.extractor.utils.ObjectToJsonHelper;

public abstract class BikesWorker {

	/**
	 * 
	 */
	public static void loadBikes(List<Manufacturer> mans) {

		try {
			for (Manufacturer manufacturer : mans) {
				/*
				 * if(manufacturer.getId() != 9){ continue; }
				 */
				for (String year : manufacturer.getYears()) {
					System.out.println(manufacturer.getName() + " " + year);
					try {
						processHtmlPage(manufacturer, year);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException(e);
					}
				}
				break;
			}

		} catch (Exception e) {
			System.out.println("Problème lors du chargement des motos");
		}
	}

	/**
	 * 
	 * @param manufacturer
	 * @param year
	 * @throws Exception
	 */
	private static void processHtmlPage(Manufacturer manufacturer, String year) throws Exception {
		try {
			Document sommaireManufacturer = Jsoup.connect(LinksMotoplanete.MANUFACTURER_PAGE + "/"
					+ manufacturer.getIdMotoplanete() + "/" + year + "/" + manufacturer.getNameMotoplanete() + ".php")
					.get();

			Element divinfofiche = sommaireManufacturer.getElementById("info_fiche");
			Element article = divinfofiche.getElementsByTag("article").first();

			Elements liBikes = article.getElementsByTag("li");
			for (Element liBike : liBikes) {
				if (!liBike.getElementsByTag("a").first().attr("href").contains("essai.html")) {
					Document ficheBike = Jsoup.connect(liBike.getElementsByTag("a").first().attr("href")).get();

					Bike bike = extractGeneralInfo(year, liBike, ficheBike);
					if (!SimpleDba.getBikeExistByNameAndYear(bike.getName(), bike.getYear())) {
						bike.setIdManufacturer(manufacturer.getId());

						extractChassisInfo(ficheBike, bike);
						extractTransmissionInfo(ficheBike, bike);
						extractTrainArriereInfo(ficheBike, bike);
						extractTrainAvantInfo(ficheBike, bike);
						extractMoteurInfo(ficheBike, bike);

						SimpleDba.insertFrame(bike.getFrame());
						SimpleDba.insertFrontAxle(bike.getFrontAxle());
						SimpleDba.insertRearAxle(bike.getRearAxle());
						SimpleDba.insertTransmission(bike.getTransmission());
						SimpleDba.insertEngine(bike.getEngine());
						SimpleDba.insertBike(bike);
					} else {
						continue;
					}

				}
			}
		} catch (Exception e) {
			System.out.println("Erreur 500 !");
		}

	}

	/**
	 * 
	 * @param year
	 * @param liBike
	 * @param ficheBike
	 * @return
	 * @throws Exception
	 */
	private static Bike extractGeneralInfo(String year, Element liBike, Document ficheBike) throws Exception {
		Bike bike = BikeFactory.create();

		bike.setIdMotoplanete(BikeProcessor.processIdMotoplanete(liBike.getElementsByTag("a").first()));

		bike.setCategoryId(
				BikeProcessor.processCategory(ficheBike.getElementsByAttributeValue("itemprop", "model").first()));

		bike.setUrlImgMotoplanete(BikeProcessor
				.processUrlImgMotoplanete(ficheBike.getElementsByAttributeValue("itemprop", "image").first()));

		bike.getImagesUrl().add(BikeProcessor
				.processUrlImgMotoplanete(ficheBike.getElementsByAttributeValue("itemprop", "image").first()));

		bike.setPrice(BikeProcessor.processPrice(ficheBike.getElementsByAttributeValue("itemprop", "price").first()));

		bike.setPriceABS(BikeProcessor.processPriceABS(ficheBike.getElementsByAttributeValue("itemprop", "offers")));

		bike.setName(BikeProcessor
				.processName(ficheBike.select("#info_fiche > article > div:nth-child(5) > h3 > a").first()));

		bike.setMaxSpeed(BikeProcessor.processMaxSpeed(ficheBike.select("#perf > ul > li:nth-child(1)").first()));

		bike.setZeroToHundred(
				BikeProcessor.processZeroToHundred(ficheBike.select("#perf > ul > li:nth-child(2)").first()));

		bike.setUrlMotoplanete(BikeProcessor.processUrlMotoplanete(liBike.getElementsByTag("a").first()));

		bike.setYear(year);

		System.out.println(bike.getName());

		return bike;
	}

	/**
	 * 
	 * @param ficheBike
	 * @param bike
	 * @throws Exception
	 */
	private static void extractMoteurInfo(Document ficheBike, Bike bike) throws Exception {
		Elements chassisData = ficheBike.select("#blocTech > ul.moteur > li");
		int i = 0;
		for (Element element : chassisData) {
			if (i != 0) {
				if (element.text().contains("mkg")) {
					String torque = element.text();
					if (torque.contains("à")) {
						bike.getEngine().setTorque(Double.parseDouble(torque.split("à")[0].replace("mkg", "").trim()));
						bike.getEngine()
								.setTorqueRpm(Double.parseDouble(torque.split("à")[1].replace("tr/min", "").trim()));
					} else {
						bike.getEngine().setTorque(Double.parseDouble(torque.replace("mkg", "").trim()));
					}
				} else if (element.text().contains("soupapes")) {
					bike.getEngine().setValve(element.text());
				} else if (element.text().contains("injecteurs")) {
					bike.getEngine().setGasSupply(element.text());
				} else if (element.text().contains("ACT")) {
					bike.getEngine().setAct(element.text());
				} else if (element.text().contains("kg/ch")) {
					bike.getEngine().setPowerToWeightRatio(Double.parseDouble(element.text().split(":")[1].trim().replace("kg/ch", "").trim()));
				} else if (element.text().contains("bridable") || element.text().contains("A2")) {
					bike.getEngine().setBridable(element.text());
				} else if (element.text().contains("ch")) {
					String power = element.text().replace("≈", "").trim();
					if (power.contains("à")) {
						bike.getEngine().setPower(Double.parseDouble(power.split("à")[0].replace("ch", "").trim()));
						bike.getEngine()
								.setPowerRpm(Double.parseDouble(power.split("à")[1].replace("tr/min", "").trim()));
					} else {
						bike.getEngine().setPower(Double.parseDouble(power.replace("ch", "").trim()));
					}
				} else if (element.text().contains("cc")) {
					bike.getEngine().setDisplacement(element.text());
				} else if (element.text().contains("Injection") || element.text().contains("injection")) {
					bike.getEngine().setGasSupply(element.text());
				} else if (element.text().contains("carburateur") || element.text().contains("Carburateur")
						|| element.text().contains("carbu")) {
					bike.getEngine().setGasSupply(element.text());
				} else if (element.text().contains("Admission") || element.text().contains("admission")
						|| element.text().contains("clapets")) {
					bike.getEngine().setEngineIntake(element.text());
				} else if (element.text().contains("Cylindres") || element.text().contains("monocylindre")
						|| element.text().contains("bicylindre") || element.text().contains("cylindres")
						|| element.text().contains("Bicylindre") || element.text().contains("Monocylindre")) {
					bike.getEngine().setType(element.text());
				} else if (element.text().contains("Electrique")) {
					bike.getEngine().setType(element.text());
				} else if (element.text().contains("culbuté") || element.text().contains("Culbuté")) {
					bike.getEngine().setValveCommand(element.text());
				} else if (element.text().contains("desmodromique") || element.text().contains("Desmodromique")) {
					bike.getEngine().setValveCommand(element.text());
				} else if (element.text().contains("valves rotatives")) {
					bike.getEngine().setValveCommand(element.text());
				} else if (element.text().contains("Refroidissement") || element.text().contains("refroidissement")) {
					bike.getEngine().setCooling(element.text().split(":")[1].trim());
				} else if (element.text().contains("2")) {
					// rien
				} else if(element.text().contains("simple arbre à came en tê")){
					bike.getEngine().setCamshaft(element.text().replace("tê", "tête"));
				}				
				else {
					System.out.println(element.text());
				}
			}
			i++;
		}
	}

	/**
	 * 
	 * @param ficheBike
	 * @param bike
	 * @throws Exception
	 */
	private static void extractTrainAvantInfo(Document ficheBike, Bike bike) throws Exception {
		Elements chassisData = ficheBike.select("#blocTech > ul.trainavant > li");
		int i = 0;
		for (Element element : chassisData) {
			if (i != 0) {
				if (element.text().contains("Fourche") || element.text().contains("fourche")
						|| element.text().contains("fourche téléscopique") || element.text().contains("fouche")) {
					bike.getFrontAxle().setFork(element.text());
				} else if (element.text().contains("assuré")) {
					bike.getFrontAxle().setFrontShock(element.text());
				} else if (element.text().contains("Duolever") || element.text().contains("telever")) {
					bike.getFrontAxle().setFrontShock(element.text());
				} else if (element.text().contains("oscillant") || element.text().contains("combiné")) {
					bike.getFrontAxle().setFrontShock(element.text());
				} else if (element.text().contains("disque")) {
					bike.getFrontAxle().setFrontBrake(element.text());
				} else if (element.text().contains("tambour")) {
					bike.getFrontAxle().setFrontBrake(element.text());
				} else if (element.text().contains("pas de frein avant")) {
					bike.getFrontAxle().setFrontBrake(element.text());
				} else if (element.text().contains("Roue") || element.text().contains("roue")) {
					bike.getFrontAxle().setFrontWheel(element.text().split(":")[1].trim());
				} else {
					System.out.println(element.text());
				}
			}
			i++;
		}
	}

	/**
	 * 
	 * @param ficheBike
	 * @param bike
	 * @throws Exception
	 */
	private static void extractTrainArriereInfo(Document ficheBike, Bike bike) throws Exception {
		Elements chassisData = ficheBike.select("#blocTech > ul.trainarriere > li");
		int i = 0;
		for (Element element : chassisData) {
			if (i != 0) {
				if (element.text().contains("amortisseur") || element.text().contains("Amortisseur")) {
					bike.getRearAxle().setRearShock(element.text());
				} else if (element.text().contains("assuré")) {
					bike.getRearAxle().setRearShock(element.text());
				} else if (element.text().contains("combinés")) {
					bike.getRearAxle().setRearShock(element.text());
				} else if (element.text().contains("Suspension supprimée")) {
					bike.getRearAxle().setRearShock(element.text());
				} else if (element.text().contains("combiné")) {
					bike.getRearAxle().setRearShock(element.text());
				} else if (element.text().contains("Mono-amortisseur") || element.text().contains("Monoamortisseur")) {
					bike.getRearAxle().setRearShock(element.text());
				} else if (element.text().contains("Paralever") || element.text().contains("paralever")) {
					bike.getRearAxle().setType(element.text());
				} else if (element.text().contains("bras oscillant") || element.text().contains("Bras oscillant")) {
					bike.getRearAxle().setType(element.text());
				} else if (element.text().contains("monobras") || element.text().contains("Monobras")) {
					bike.getRearAxle().setType(element.text());
				} else if (element.text().contains("rigide")) {
					bike.getRearAxle().setType(element.text());
				} else if (element.text().contains("Cantilever") || element.text().contains("cantilever")) {
					bike.getRearAxle().setType(element.text());
				} else if (element.text().contains("tambour") || element.text().contains("Tambour")
						|| element.text().contains("Tambour à")) {
					bike.getRearAxle().setRearBrake(element.text());
				} else if (element.text().contains("disque") || element.text().contains("Disque")) {
					bike.getRearAxle().setRearBrake(element.text());
				} else if (element.text().contains("Roue") || element.text().contains("roue")) {
					bike.getRearAxle().setRearWheel(element.text().split(":")[1].trim());
				} else {
					System.out.println(element.text());
				}

			}
			i++;
		}
	}

	/**
	 * 
	 * @param ficheBike
	 * @param bike
	 * @throws Exception
	 */
	private static void extractChassisInfo(Document ficheBike, Bike bike) throws Exception {
		Elements chassisData = ficheBike.select("#blocTech > ul.assise > li");
		int i = 0;
		for (Element element : chassisData) {
			if (i != 0) {
				if (element.text().contains("Poids à sec")) {
					String dryWeight = element.text().split(":")[1].replaceAll("kg", "").trim();
					if (dryWeight.contains("/")) {
						bike.getFrame().setDryWeight(Double.parseDouble(dryWeight.split("/")[1].trim()));
					} else {
						if (dryWeight.contains("env")) {
							bike.getFrame().setDryWeight(Double.parseDouble(dryWeight.replace("env", "").trim()));
						} else {
							bike.getFrame().setDryWeight(Double.parseDouble(dryWeight));
						}
					}
				} else if (element.text().contains("Poids en ordre de marche")
						|| element.text().contains("poids en ordre de marche")) {
					String movingWeight = element.text().split(":")[1].replace("kg", "").replace("env", "")
							.replace("avec ABS", "").trim();
					if (movingWeight.contains("/")) {
						bike.getFrame().setMovingWeight(Double.parseDouble(movingWeight.split("/")[1].trim()));
					} else {
						bike.getFrame().setMovingWeight(Double.parseDouble(movingWeight));
					}
				} else if (element.text().contains("Cadre") || element.text().contains("cadre")) {
					bike.getFrame().setType(element.text().split(":")[1].trim());
				} else if (element.text().contains("Largeur") || element.text().contains("largeur")) {
					bike.getFrame().setWidth(Integer.parseInt(element.text().split(":")[1].replace("mm", "").trim()));
				} else if (element.text().contains("Longueur") || element.text().contains("longueur")) {
					bike.getFrame().setLenght(Integer.parseInt(element.text().split(":")[1].replace("mm", "").trim()));
				} else if (element.text().contains("Empattement") || element.text().contains("empattement")) {
					bike.getFrame()
							.setWheelbase(Integer.parseInt(element.text().split(":")[1].replace("mm", "").trim()));
				} else if (element.text().contains("Hauteur de selle") || element.text().contains("hauteur de selle")) {
					String seatHeight = element.text().split(":")[1].replaceAll("mm", "").trim();
					if (seatHeight.contains("+")) {
						seatHeight = seatHeight.split(" ")[0].trim();
						bike.getFrame().setSeatHeight(Double.parseDouble(seatHeight));
					} else if (seatHeight.contains("/")) {
						bike.getFrame().setSeatHeight(Double.parseDouble(seatHeight.split("/")[1].trim()));
					} else {
						if (seatHeight.contains("réglable")) {
							bike.getFrame().setSeatHeight(Double.parseDouble(seatHeight.split("-")[1].trim()));
						} else {
							bike.getFrame().setSeatHeight(Double.parseDouble(seatHeight));
						}
					}
				} else if (element.text().contains("Hauteur") || element.text().contains("hauteur")) {
					String height = element.text().split(":")[1].replace("mm", "").trim();
					if (height.contains("/")) {
						bike.getFrame().setHeight(Double.parseDouble(height.split("/")[1].trim()));
					} else {
						bike.getFrame().setHeight(Double.parseDouble(height));
					}
				} else if (element.text().contains("Réservoir") || element.text().contains("réservoir")) {
					bike.getFrame().setTankCapacity(
							Double.parseDouble(element.text().split(":")[1].replace("litres", "").trim()));
				} else {
					System.out.println(element.text());
				}
			}
			i++;
		}
	}

	/**
	 * 
	 * @param ficheBike
	 * @param bike
	 * @throws Exception
	 */
	private static void extractTransmissionInfo(Document ficheBike, Bike bike) throws Exception {
		Elements chassisData = ficheBike.select("#blocTech > ul.transmission > li");
		int i = 0;
		for (Element element : chassisData) {
			if (i != 0) {
				if (element.text().contains("Boite") && element.text().contains("à")
						|| element.text().contains("Boîte") && element.text().contains("à")) {

					bike.getTransmission().setGearboxSpeeds(element.text().split("à")[1].trim());
					bike.getTransmission().setGeerboxType("manuelle");
				} else if (element.text().contains("Boite") && !element.text().contains("à")) {
					bike.getTransmission().setGearboxSpeeds(element.text().split("Boite")[1].trim());
					bike.getTransmission().setGeerboxType("manuelle");
				} else if (element.text().contains("Boîte") && !element.text().contains("à")) {
					bike.getTransmission().setGearboxSpeeds(element.text().split("Boîte")[1].trim());
					bike.getTransmission().setGeerboxType("manuelle");
				} else if (element.text().contains("Boïte") && !element.text().contains("à")) {
					bike.getTransmission().setGearboxSpeeds(element.text().split("Boïte")[1].trim());
					bike.getTransmission().setGeerboxType("manuelle");
				} else if (element.text().contains("séquentielle") && element.text().contains("à")) {
					bike.getTransmission().setGearboxSpeeds(element.text().split("à")[1].trim());
					bike.getTransmission().setGeerboxType("séquentielle");
				} else if (element.text().contains("secondaire") || element.text().contains("finale")
						|| element.text().contains("chaine")) {
					bike.getTransmission().setSecondaryTransmission(element.text().split("par")[1].trim());
				} else if (element.text().contains("chaîne") || element.text().contains("final par chaîne")) {
					bike.getTransmission().setSecondaryTransmission(element.text());
				} else if (element.text().contains("cardan")) {
					bike.getTransmission().setSecondaryTransmission(element.text());
				} else if (element.text().contains("HFT")) {
					bike.getTransmission().setType(element.text());
				} else if (element.text().contains("à 6 rapport") || element.text().contains("6 vitesses")
						|| element.text().contains("6 rapport")) {
					bike.getTransmission().setGearboxSpeeds(element.text());
					bike.getTransmission().setGeerboxType("manuelle");
				} else if (element.text().contains("à 5 rapport") || element.text().contains("5 vitesses")
						|| element.text().contains("5 rapport")) {
					bike.getTransmission().setGearboxSpeeds(element.text());
					bike.getTransmission().setGeerboxType("manuelle");
				} else {
					System.out.println(element.text());
				}
			}
			i++;
		}
	}

	public static void toJson(Manufacturer man) {
		try {
			ObjectToJsonHelper.convertManufacturer(man, man.getName() + ".json");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
