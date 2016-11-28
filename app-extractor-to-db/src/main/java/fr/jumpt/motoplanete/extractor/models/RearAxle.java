package fr.jumpt.motoplanete.extractor.models;

public class RearAxle {

	private int id;
	private String rearShock;
	private String rearBrake;
	private String rearWheel;
	private String type;

	public RearAxle() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRearShock() {
		return rearShock;
	}

	public void setRearShock(String rearShock) {
		this.rearShock = rearShock;
	}

	public String getRearBrake() {
		return rearBrake;
	}

	public void setRearBrake(String rearBrake) {
		this.rearBrake = rearBrake;
	}

	public String getRearWheel() {
		return rearWheel;
	}

	public void setRearWheel(String rearWheel) {
		this.rearWheel = rearWheel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
