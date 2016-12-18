package fr.jumpt.motoplanete.extractor.workers;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import fr.jumpt.motoplanete.extractor.factories.ManufacturerFactory;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;
import fr.jumpt.motoplanete.extractor.utils.LinksMotoplanete;
import fr.jumpt.motoplanete.extractor.utils.ObjectToJsonHelper;

public abstract class ManufacturersWorker {

	/**
	 * 
	 */
	public static void loadManufacturers() {
		System.out.println("LOAD MANUFACTURERS");
		System.out.println("Manufacturers loading start");
		try {			
			List<Manufacturer> mans = new ArrayList<Manufacturer>();
			
			processHtmlPage(Jsoup.connect(LinksMotoplanete.MANUFACTURERS_INDEX).get(), mans);
			processHtmlPage(Jsoup.connect(LinksMotoplanete.MANUFACTURERS_INDEX2).get(), mans);
			
			toJson(mans);			
			System.out.println("Manufacturers loading end");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("END LOAD MANUFACTURERS");
	}

	/**
	 * 
	 * @param doc
	 * @throws Exception
	 */
	private static void processHtmlPage(Document doc, List<Manufacturer> mans) throws Exception {
		
		
		Element divlisteMoto = doc.getElementById("listeMoto");
		Element ulconst = divlisteMoto.getElementById("const");
		Elements linksManufacturers = ulconst.getElementsByTag("a");
		
		for (Element link : linksManufacturers) {
			Manufacturer ma = createManufacturer(link.attr("href"));

			Element img = link.getElementsByTag("img").first();
			if (img != null) {
				ma.setLogoUrl(img.attr("src"));
			}
			
			mans.add(ma);
		}
	}

	/**
	 * 
	 * @param path
	 * @return
	 * @throws Exception
	 */
	private static Manufacturer createManufacturer(String path) throws Exception {
		String[] data = path.split("/");		

		Manufacturer man = ManufacturerFactory.create();
		man.setIdMotoplanete(Integer.parseInt(data[5]));		
		man.setName(getManufacturerName(data[7]));
		man.setNameMotoplanete(data[7].replace(".php", ""));
		man.setYears(new ArrayList<String>());
		man.setLogoUrl("");
		man.setDescription("");
		man.setImagesUrl(new ArrayList<String>());
		getManufacturerDates(man);

		System.out.println(man.getName());

		return man;
	}

	private static String getManufacturerName(String name) {
		
		name = name.replace(".php", "");
		
		if(name.contains("-")){
			String[] data = name.split("-");
			name = "";
			for (int i = 0; i < data.length; i++) {
				name += StringUtils.capitalize(data[i]) + " ";
			}
			
			return name.trim();
		}
		else {
			return StringUtils.capitalize(name);
		}		
	}

	/**
	 * 
	 * @param man
	 * @throws Exception
	 */
	private static void getManufacturerDates(Manufacturer man) throws Exception {
		try {
			Document doc = Jsoup
					.connect(LinksMotoplanete.MANUFACTURER_PAGE + "/" + man.getIdMotoplanete() + "/2016/" + man.getNameMotoplanete() + ".php")
					.get();
			Elements lists = doc.getElementsByClass("scrollbar");
			Element list = lists.first();
			if (list != null) {
				for (Element link : list.getElementsByTag("a")) {
					man.getYears().add(link.text());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param man
	 */
	public static void dowloadImgs(Manufacturer man) {
		try {
			FileUtils.copyURLToFile(new URL(man.getLogoUrl()),
					new File(LinksMotoplanete.MANUFACTURERS_DIRECTORY_LOGO + man.getLogoUrl().split("/")[4]));
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param mans
	 */
	public static void toJson(List<Manufacturer> mans){
		try {
			ObjectToJsonHelper.convertManufacturers(mans,"manufacturers.json");
		} catch (Exception e) {
			System.out.println("erreur lors de la transformation en json");
			e.printStackTrace();
		}
	}
	
	public static List<Manufacturer> jsonToObject(){
		ObjectMapper mapper = new ObjectMapper();		
		try {
			List<Manufacturer> mans = mapper.readValue(new File(LinksMotoplanete.OBJECT_JSON_DIRECTORY  + "manufacturers.json"), new TypeReference<List<Manufacturer>>(){});
			return mans;
		} catch (Exception e) {
			System.out.println("Erreur lors de la convertion json vers objet.");
			return null;
		}		
	}

}
