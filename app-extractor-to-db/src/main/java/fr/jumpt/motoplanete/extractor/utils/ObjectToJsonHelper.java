package fr.jumpt.motoplanete.extractor.utils;

import java.io.File;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import fr.jumpt.motoplanete.extractor.models.Manufacturer;

public class ObjectToJsonHelper {

	public static void convertManufacturers(List<Manufacturer> manufacturers, String fileName) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(SerializationFeature.INDENT_OUTPUT);
		mapper.writeValue(new File(LinksMotoplanete.OBJECT_JSON_DIRECTORY + fileName), manufacturers);
	}
	
	public static void convertManufacturer(Manufacturer manufacturer, String fileName) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(SerializationFeature.INDENT_OUTPUT);
		mapper.writeValue(new File(LinksMotoplanete.OBJECT_JSON_DIRECTORY + fileName), manufacturer);
	}

}
