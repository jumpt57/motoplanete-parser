package fr.jumpt.motoplanete.extractor.processors;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import fr.jumpt.motoplanete.extractor.dba.SimpleDba;

public class BikeProcessor {
		
	public static int processIdMotoplanete(Element element) {
		if(element.attr("href").contains("/")){
			return Integer.parseInt(element.attr("href").split("/")[4]);
		}
		return 0;
	}

	public static int processCategory(Element element){
		String categName = element.text();
		Integer categId = SimpleDba.getIdByName(SimpleDba.GET_CATEGORY_ID_BY_NAME, categName);
		if(categId == null){
			SimpleDba.insertCategory(SimpleDba.getMaxId(SimpleDba.MAX_ID_CATEGORIES) + 1, categName);
			categId = SimpleDba.getIdByName(SimpleDba.GET_CATEGORY_ID_BY_NAME, categName);
		}
		
		return categId;	
	}
	
	public static String processUrlImgMotoplanete(Element element){
		if(element != null){
			return element.attr("src");	
		}
		else{
			return null;
		}
	}
	
	public static Integer processPrice(Element element){
		if(element != null){
			String price = element.text().replace("nc", "");
			if(price.equals("")){
				return null;
			}
			else {
				return Integer.parseInt(price);
			}
		}
		else{
			return null;
		}
	}
	
	public static Integer processPriceABS(Elements elements){
		
		for (Element element : elements) {
			if(element.tagName().equals("div")){
				Element ul = element.getElementsByTag("ul").first();		
				if(ul != null){				
					Elements lis = ul.getElementsByTag("li");
					
					if(lis != null){
						for (Element li : lis) {
							Elements bs = li.getElementsByTag("b");
							
							if(bs != null){
								for (Element b : bs) {
									if(b.text().equals("Prix avec l'option ABS :")){
										Element span = li.getElementsByTag("span").first();
										if(span != null){
											return Integer.parseInt(span.text());
										}
									}
								}
							}
						}
					}
				}
			}			
		}
		
		
		
		return null;
	}
	
	public static String processName(Element element){		
		String name = element.text().substring(0, element.text().length() - 5);
		String[] data = name.split(" ");
		name = "";
		for (int i = 1; i < data.length; i++) {
			name += data[i] + " ";
		}
		name.trim();
		
		return name;
	}
	
	public static Integer processMaxSpeed(Element element){
		String maxSpeed = element.text().split(":")[1].replace("km/h", "").replace("environ", "").replace("supérieur à", "").replace("nc", "").replace("compteur", "").trim();
		if(maxSpeed.equals("")){
			return null;
		}
		else {
			return Integer.parseInt(maxSpeed);
		}
	}
	
	public static Double processZeroToHundred(Element element){
		String zeroToHundred = element.text().split(":")[1].replace("km/h", "").replace("nc", "").trim();
		if(zeroToHundred.equals("")){
			return null;
		}
		else{
			return Double.parseDouble(zeroToHundred.replace("s", "").trim());
		}
	}
	
	public static String processUrlMotoplanete(Element element){
		return element.attr("href");
	}
	
	
}
