package fr.jumpt.motoplanete.extractor.processors;

import org.jsoup.nodes.Element;

public class TransmissionProcessor {

	public static String processGearboxSpeeds(Element element) {
		if (element.text().contains("Boite") && element.text().contains("à")
				|| element.text().contains("Boîte") && element.text().contains("à")) {
			return element.text().split("à")[1].trim();
		} else if (element.text().contains("Boite") && !element.text().contains("à")) {
			return element.text().split("Boite")[1].trim();
		} else if (element.text().contains("Boîte") && !element.text().contains("à")) {
			return element.text().split("Boîte")[1].trim();
		} else if (element.text().contains("Boïte") && !element.text().contains("à")) {
			return element.text().split("Boïte")[1].trim();
		} else if (element.text().contains("séquentielle") && element.text().contains("à")) {
			return element.text().split("à")[1].trim();
		} else {
			return "";
		}
	}

	/*
	 * public static String processGeerboxType(Element element) {
	 * 
	 * }
	 */

}
