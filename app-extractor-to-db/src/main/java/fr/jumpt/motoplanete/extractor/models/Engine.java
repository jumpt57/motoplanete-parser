package fr.jumpt.motoplanete.extractor.models;

public class Engine {

	private int id;
	private String gasSupply;
	private Double torque;
	private Double torqueRpm;
	private String act;
	private Double power;
	private Double powerRpm;
	private String cooling;
	private String displacement;
	private String type;
	private Double powerToWeightRatio;
	private String valve;
	private String valveCommand;
	private String engineIntake;
	private String bridable;
	private String camshaft;
	private String batteryPack;

	public Engine() {
		super();
	}

	public String getGasSupply() {
		return gasSupply;
	}

	public void setGasSupply(String gasSupply) {
		this.gasSupply = gasSupply;
	}

	public Double getTorque() {
		return torque;
	}

	public void setTorque(Double torque) {
		this.torque = torque;
	}

	public String getAct() {
		return act;
	}

	public void setAct(String act) {
		this.act = act;
	}

	public Double getPower() {
		return power;
	}

	public void setPower(Double power) {
		this.power = power;
	}

	public String getCooling() {
		return cooling;
	}

	public void setCooling(String cooling) {
		this.cooling = cooling;
	}

	public String getDisplacement() {
		return displacement;
	}

	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getPowerToWeightRatio() {
		return powerToWeightRatio;
	}

	public void setPowerToWeightRatio(Double powerToWeightRatio) {
		this.powerToWeightRatio = powerToWeightRatio;
	}

	public String getValve() {
		return valve;
	}

	public void setValve(String valve) {
		this.valve = valve;
	}

	public String getEngineIntake() {
		return engineIntake;
	}

	public void setEngineIntake(String engineIntake) {
		this.engineIntake = engineIntake;
	}

	public String getValveCommand() {
		return valveCommand;
	}

	public void setValveCommand(String valveCommand) {
		this.valveCommand = valveCommand;
	}

	public String getBridable() {
		return bridable;
	}

	public void setBridable(String bridable) {
		this.bridable = bridable;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getTorqueRpm() {
		return torqueRpm;
	}

	public void setTorqueRpm(Double torqueRpm) {
		this.torqueRpm = torqueRpm;
	}

	public Double getPowerRpm() {
		return powerRpm;
	}

	public void setPowerRpm(Double powerRpm) {
		this.powerRpm = powerRpm;
	}

	public String getCamshaft() {
		return camshaft;
	}

	public void setCamshaft(String camshaft) {
		this.camshaft = camshaft;
	}

	public String getBatteryPack() {
		return batteryPack;
	}

	public void setBatteryPack(String batteryPack) {
		this.batteryPack = batteryPack;
	}

}
