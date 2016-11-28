package fr.jumpt.motoplanete.extractor.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpRequestHelper {
	
	public static String get(String url) throws Exception{
		
		HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		
		if(con.getResponseCode() == HttpURLConnection.HTTP_OK){
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));  
			return processResponse(in);			
		}
		else {
			return "";
		}
		
	}
	
	private static String processResponse(BufferedReader in) throws IOException {
		
		String output;  
		StringBuffer response = new StringBuffer();  
  
		while ((output = in.readLine()) != null) {  
			response.append(output);  
		}   
		in.close(); 
		return response.toString();
	}

}
