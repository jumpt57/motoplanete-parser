package fr.jumpt.motoplanete.extractor.models;

import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "@name")
public class Manufacturer {
	
	public static int ID = 0;
	
	private int id;
	private String name;
	private List<String> years;
	private String description;
	private String logoUrl;
	private List<String> imagesUrl; 
	private int idMotoplanete;
	private String nameMotoplanete;

	public Manufacturer() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getYears() {
		return years;
	}
	
	public Array getArrayYears(Connection con){
		String[] years = new String[this.years.size()];
		years = this.years.toArray(years);
		try {
			return con.createArrayOf("text", years);
		} catch (SQLException e) {
			System.out.println("problème pour convertir la list en tableau");
		}
		return null;	
	}

	public void setYears(List<String> years) {
		this.years = years;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public List<String> getImagesUrl() {
		return imagesUrl;
	}
	
	public Array getArrayImagesUrl(Connection con){
		String[] imagesUrl = new String[this.imagesUrl.size()];
		imagesUrl = this.imagesUrl.toArray(imagesUrl);
		try {
			return con.createArrayOf("text", imagesUrl);
		} catch (SQLException e) {
			System.out.println("problème pour convertir la list en tableau");
		}
		return null;	
	}

	public void setImagesUrl(List<String> imagesUrl) {
		this.imagesUrl = imagesUrl;
	}

	public int getIdMotoplanete() {
		return idMotoplanete;
	}

	public void setIdMotoplanete(int idMotoplanete) {
		this.idMotoplanete = idMotoplanete;
	}

	public String getNameMotoplanete() {
		return nameMotoplanete;
	}

	public void setNameMotoplanete(String nameMotoplanete) {
		this.nameMotoplanete = nameMotoplanete;
	}	
	
	

}