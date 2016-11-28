package fr.jumpt.motoplanete.extractor.models;

public class FrontAxle {

	private int id;
	private String fork;
	private String frontShock;
	private String frontWheel;
	private String frontBrake;

	public FrontAxle() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFork() {
		return fork;
	}

	public void setFork(String fork) {
		this.fork = fork;
	}

	public String getFrontWheel() {
		return frontWheel;
	}

	public void setFrontWheel(String frontWheel) {
		this.frontWheel = frontWheel;
	}

	public String getFrontBrake() {
		return frontBrake;
	}

	public void setFrontBrake(String frontBrake) {
		this.frontBrake = frontBrake;
	}

	public String getFrontShock() {
		return frontShock;
	}

	public void setFrontShock(String frontShock) {
		this.frontShock = frontShock;
	}

}
