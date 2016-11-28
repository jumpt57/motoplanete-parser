package fr.jumpt.motoplanete.extractor.models;

import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class Bike {
	
	public static int ID = 0;

	private int id;
	private int idMotoplanete;
	private String name;
	private String urlMotoplanete;
	private String urlImgMotoplanete;
	private String year;
	private Integer maxSpeed;
	private Double zeroToHundred;
	private Integer price;
	private Integer priceABS;
	private Integer categoryId;
	private List<String> imagesUrl;
	private int idManufacturer;

	private RearAxle rearAxle;
	private FrontAxle frontAxle;
	private Engine engine;
	private Transmission transmission;
	private Frame frame;

	public Bike() {
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
		this.name = name.trim();
	}

	public String getUrlMotoplanete() {
		return urlMotoplanete;
	}

	public void setUrlMotoplanete(String urlMotoplanete) {
		this.urlMotoplanete = urlMotoplanete;
	}

	public String getUrlImgMotoplanete() {
		return urlImgMotoplanete;
	}

	public void setUrlImgMotoplanete(String urlImgMotoplanete) {
		this.urlImgMotoplanete = urlImgMotoplanete;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year.trim();
	}

	public Integer getMaxSpeed() {
		return maxSpeed;
	}

	public void setMaxSpeed(Integer maxSpeed) {
		this.maxSpeed = maxSpeed;
	}

	public Double getZeroToHundred() {
		return zeroToHundred;
	}

	public void setZeroToHundred(Double zeroToHundred) {
		this.zeroToHundred = zeroToHundred;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public RearAxle getRearAxle() {
		return rearAxle;
	}

	public void setRearAxle(RearAxle rearAxle) {
		this.rearAxle = rearAxle;
	}

	public FrontAxle getFrontAxle() {
		return frontAxle;
	}

	public void setFrontAxle(FrontAxle frontAxle) {
		this.frontAxle = frontAxle;
	}

	public Engine getEngine() {
		return engine;
	}

	public void setEngine(Engine engine) {
		this.engine = engine;
	}

	public Transmission getTransmission() {
		return transmission;
	}

	public void setTransmission(Transmission transmission) {
		this.transmission = transmission;
	}

	public Frame getFrame() {
		return frame;
	}

	public void setFrame(Frame frame) {
		this.frame = frame;
	}

	public int getIdMotoplanete() {
		return idMotoplanete;
	}

	public void setIdMotoplanete(int idMotoplanete) {
		this.idMotoplanete = idMotoplanete;
	}

	public Integer getPriceABS() {
		return priceABS;
	}

	public void setPriceABS(Integer priceABS) {
		this.priceABS = priceABS;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public List<String> getImagesUrl() {
		return imagesUrl;
	}
	
	public Array getImagesUrlArray(Connection con){
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

	public int getIdManufacturer() {
		return idManufacturer;
	}

	public void setIdManufacturer(int idManufacturer) {
		this.idManufacturer = idManufacturer;
	}
	
	

}
