package fr.jumpt.motoplanete.extractor.models;

public class Frame {

	private int id;
	private Double dryWeight;
	private Double seatHeight;
	private String type;
	private Double tankCapacity;
	private Integer lenght;
	private Integer wheelbase;
	private Integer width;
	private Double height;
	private Double movingWeight;

	public Frame() {
		super();
	}

	public Double getDryWeight() {
		return dryWeight;
	}

	public void setDryWeight(Double dryWeight) {
		this.dryWeight = dryWeight;
	}

	public Double getSeatHeight() {
		return seatHeight;
	}

	public void setSeatHeight(Double seatHeight) {
		this.seatHeight = seatHeight;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getTankCapacity() {
		return tankCapacity;
	}

	public void setTankCapacity(Double tankCapacity) {
		this.tankCapacity = tankCapacity;
	}

	public Integer getLenght() {
		return lenght;
	}

	public void setLenght(Integer lenght) {
		this.lenght = lenght;
	}

	public Integer getWheelbase() {
		return wheelbase;
	}

	public void setWheelbase(Integer wheelbase) {
		this.wheelbase = wheelbase;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getMovingWeight() {
		return movingWeight;
	}

	public void setMovingWeight(Double movingWeight) {
		this.movingWeight = movingWeight;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
