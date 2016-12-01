package fr.jumpt.motoplanete.extractor.models;

public class Dictionary {

	private String type;
	private String feature;
	private String value;
	private String correctValue;

	public Dictionary() {
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getCorrectValue() {
		return correctValue;
	}

	public void setCorrectValue(String correctValue) {
		this.correctValue = correctValue;
	}

}
