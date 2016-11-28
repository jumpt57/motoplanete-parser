package fr.jumpt.motoplanete.extractor.processors;

import org.jsoup.nodes.Element;

public class TransmissionProcessor {

	public static String processGearboxSpeeds(Element element) {
		if (element.text().contains("Boite") && element.text().contains("�")
				|| element.text().contains("Bo�te") && element.text().contains("�")) {
			return element.text().split("�")[1].trim();
		} else if (element.text().contains("Boite") && !element.text().contains("�")) {
			return element.text().split("Boite")[1].trim();
		} else if (element.text().contains("Bo�te") && !element.text().contains("�")) {
			return element.text().split("Bo�te")[1].trim();
		} else if (element.text().contains("Bo�te") && !element.text().contains("�")) {
			return element.text().split("Bo�te")[1].trim();
		} else if (element.text().contains("s�quentielle") && element.text().contains("�")) {
			return element.text().split("�")[1].trim();
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
