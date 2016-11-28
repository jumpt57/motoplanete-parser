package fr.jumpt.motoplanete.extractor.models;

public class Transmission {

	private int id;
	private String gearboxSpeeds;
	private String geerboxType;
	private String secondaryTransmission;
	private String type;
	private String reverse;

	public Transmission() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGearboxSpeeds() {
		return gearboxSpeeds;
	}

	public void setGearboxSpeeds(String gearboxSpeeds) {
		this.gearboxSpeeds = gearboxSpeeds;
	}

	public String getGeerboxType() {
		return geerboxType;
	}

	public void setGeerboxType(String geerboxType) {
		this.geerboxType = geerboxType;
	}

	public String getSecondaryTransmission() {
		return secondaryTransmission;
	}

	public void setSecondaryTransmission(String secondaryTransmission) {
		this.secondaryTransmission = secondaryTransmission;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReverse() {
		return reverse;
	}

	public void setReverse(String reverse) {
		this.reverse = reverse;
	}

}
