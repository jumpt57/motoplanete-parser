package fr.jumpt.motoplanete.extractor.dba;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.jumpt.motoplanete.extractor.models.Bike;
import fr.jumpt.motoplanete.extractor.models.Dictionary;
import fr.jumpt.motoplanete.extractor.models.Engine;
import fr.jumpt.motoplanete.extractor.models.Frame;
import fr.jumpt.motoplanete.extractor.models.FrontAxle;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;
import fr.jumpt.motoplanete.extractor.models.RearAxle;
import fr.jumpt.motoplanete.extractor.models.Transmission;
import fr.jumpt.motoplanete.extractor.utils.ConnectionManager;

public class SimpleDba {

	public static final String DELETE_ALL_BIKE_GENERAL = "DELETE FROM data_bikes_old.bike_general_information;";
	public static final String DELETE_ALL_CATEGORIES = "DELETE FROM data_bikes_old.bike_categories;";
	public static final String DELETE_ALL_MANUFACTURERS = "DELETE FROM data_bikes_old.bike_manufacturers;";
	public static final String DELETE_ALL_BIKE_ENGINE = "DELETE FROM data_bikes_old.bike_engine;";
	public static final String DELETE_ALL_BIKE_FRAME = "DELETE FROM data_bikes_old.bike_frame;";
	public static final String DELETE_ALL_BIKE_FRONT_AXLE = "DELETE FROM data_bikes_old.bike_front_axle;";
	public static final String DELETE_ALL_BIKE_REAR_AXLE = "DELETE FROM data_bikes_old.bike_rear_axle;";
	public static final String DELETE_ALL_BIKE_TRANSMISSION = "DELETE FROM data_bikes_old.bike_transmission;";

	public static final String MAX_ID_BIKE_GENERAL = "SELECT MAX(id) FROM data_bikes_old.bike_general_information;";
	public static final String MAX_ID_CATEGORIES = "SELECT MAX(id) FROM data_bikes_old.bike_categories;";
	public static final String MAX_ID_MANUFACTURER = "SELECT MAX(id) FROM data_bikes_old.bike_manufacturers;";

	public static final String GET_BIKE_ID_BY_NAME = "SELECT id FROM data_bikes_old.bike_categories WHERE name LIKE ?;";
	public static final String GET_CATEGORY_ID_BY_NAME = "SELECT id FROM data_bikes_old.bike_categories WHERE name LIKE ?;";
	public static final String GET_MANUFACTURER_ID_BY_NAME = "SELECT id FROM data_bikes_old.bike_manufacturers WHERE name LIKE ?;";

	/**
	 * Permet de supprimer dans la BDD
	 * 
	 * @param la
	 *            query
	 * @return
	 */
	public static Integer deleteAll(String query) {
		Connection con = ConnectionManager.getConnexion();
		try {
			Statement stmt = con.createStatement();
			int result = stmt.executeUpdate(query);
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("deleteAll error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * @param la
	 *            query
	 * @return
	 */
	public static Integer getMaxId(String query) {
		Connection con = ConnectionManager.getConnexion();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int id = rs.getInt(1);
				rs.close();
				stmt.close();
				return id;
			}
			return null;
		} catch (Exception e) {
			System.out.println("getMaxId error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param name,
	 *            la query
	 * @return
	 */
	public static Integer getIdByName(String query, String name) {
		Connection con = ConnectionManager.getConnexion();
		try {
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, name);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				rs.close();
				stmt.close();
				return id;
			}
			return null;
		} catch (Exception e) {
			System.out.println("getIdByName error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param name,
	 *            la query
	 * @return
	 */
	public static Boolean getBikeExistByNameAndYear(String name, String year) {
		Connection con = ConnectionManager.getConnexion();
		try {
			PreparedStatement stmt = con.prepareStatement(
					"SELECT COUNT(id) as count FROM data_bikes_old.bike_general_information WHERE name LIKE ? AND year LIKE ?;");
			stmt.setObject(1, name);
			stmt.setObject(2, year);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				int count = rs.getInt("count");
				rs.close();
				stmt.close();
				if (count == 0) {
					return false;
				} else {
					return true;
				}
			}
			return null;
		} catch (Exception e) {
			System.out.println("getBikeExistByNameAndYear error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param id
	 * @param name
	 * @return
	 */
	public static Integer insertBike(Bike bike) {
		Connection con = ConnectionManager.getConnexion();
		try {

			String query = "INSERT INTO data_bikes_old.bike_general_information (id, name, images_url, year, max_speed, "
					+ " zero_to_hundred, price, price_with_abs, id_category, id_rear_axle, id_front_axle, id_engine, id_transmission, id_frame,  id_manufacturer) "
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setObject(1, bike.getId());
			stmt.setObject(2, bike.getName().trim());
			stmt.setObject(3, bike.getImagesUrlArray(con));
			stmt.setObject(4, bike.getYear());
			stmt.setObject(5, bike.getMaxSpeed());
			stmt.setObject(6, bike.getZeroToHundred());
			stmt.setObject(7, bike.getPrice());
			stmt.setObject(8, bike.getPriceABS());
			stmt.setObject(9, bike.getCategoryId());
			stmt.setObject(10, bike.getRearAxle().getId());
			stmt.setObject(11, bike.getFrontAxle().getId());
			stmt.setObject(12, bike.getEngine().getId());
			stmt.setObject(13, bike.getTransmission().getId());
			stmt.setObject(14, bike.getFrame().getId());
			stmt.setObject(15, bike.getIdManufacturer());

			int result = stmt.executeUpdate();
			stmt.close();
			return result;

		} catch (Exception e) {
			System.out.println("insertBike error");
			e.printStackTrace();
			return null;
		} finally {
			System.out.println("Insert " + bike.getName() + " " + bike.getYear() + " OK");
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param engine
	 * @return
	 */
	public static Integer insertEngine(Engine engine) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "INSERT INTO data_bikes_old.bike_engine (id, gas_supply, torque, act, power, cooling, displacement, type, "
					+ " power_to_weight_ratio, valve, valve_command, engine_intake, bridable, max_power_rpm, max_torque_rpm, camshaft, battery_pack) "
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setObject(1, engine.getId());
			stmt.setObject(2, engine.getGasSupply());
			stmt.setObject(3, engine.getTorque());
			stmt.setObject(4, engine.getAct());
			stmt.setObject(5, engine.getPower());
			stmt.setObject(6, engine.getCooling());
			stmt.setObject(7, engine.getDisplacement());
			stmt.setObject(8, engine.getType());
			stmt.setObject(9, engine.getPowerToWeightRatio());
			stmt.setObject(10, engine.getValve());
			stmt.setObject(11, engine.getValveCommand());
			stmt.setObject(12, engine.getEngineIntake());
			stmt.setObject(13, engine.getBridable());
			stmt.setObject(14, engine.getPowerRpm());
			stmt.setObject(15, engine.getTorqueRpm());
			stmt.setObject(16, engine.getCamshaft());
			stmt.setObject(17, engine.getBatteryPack());

			int result = stmt.executeUpdate();
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("insertEngine error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param frame
	 * @return
	 */
	public static Integer insertFrame(Frame frame) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "INSERT INTO data_bikes_old.bike_frame (id, dry_weight, seat_height, type, tank_capacity, "
					+ " lenght, wheel_base, width, height, moving_weight) " + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setObject(1, frame.getId());
			stmt.setObject(2, frame.getDryWeight());
			stmt.setObject(3, frame.getSeatHeight());
			stmt.setObject(4, frame.getType());
			stmt.setObject(5, frame.getTankCapacity());
			stmt.setObject(6, frame.getLenght());
			stmt.setObject(7, frame.getWheelbase());
			stmt.setObject(8, frame.getWidth());
			stmt.setObject(9, frame.getHeight());
			stmt.setObject(10, frame.getMovingWeight());

			int result = stmt.executeUpdate();
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("insertFrame error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param rearAxle
	 * @return
	 */
	public static Integer insertFrontAxle(FrontAxle frontAxle) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "INSERT INTO data_bikes_old.bike_front_axle (id, fork, front_shock, front_wheel, front_brake) "
					+ " VALUES (?, ?, ?, ?, ?);";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setObject(1, frontAxle.getId());
			stmt.setObject(2, frontAxle.getFork());
			stmt.setObject(3, frontAxle.getFrontShock());
			stmt.setObject(4, frontAxle.getFrontWheel());
			stmt.setObject(5, frontAxle.getFrontBrake());

			int result = stmt.executeUpdate();
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("insertFrontAxle error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param rearAxle
	 * @return
	 */
	public static Integer insertRearAxle(RearAxle rearAxle) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "INSERT INTO data_bikes_old.bike_rear_axle (id, rear_shock, rear_brake, rear_wheel, type) "
					+ " VALUES (?, ?, ?, ?, ?);";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setObject(1, rearAxle.getId());
			stmt.setObject(2, rearAxle.getRearShock());
			stmt.setObject(3, rearAxle.getRearBrake());
			stmt.setObject(4, rearAxle.getRearWheel());
			stmt.setObject(5, rearAxle.getType());

			int result = stmt.executeUpdate();
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("insertRearAxle error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param transmission
	 * @return
	 */
	public static Integer insertTransmission(Transmission transmission) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "INSERT INTO data_bikes_old.bike_transmission (id, gearbox_speeds, gearbox_type, secondary_transmission, type, reverse) "
					+ " VALUES (?, ?, ?, ?, ?, ?);";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setObject(1, transmission.getId());
			stmt.setObject(2, transmission.getGearboxSpeeds());
			stmt.setObject(3, transmission.getGeerboxType());
			stmt.setObject(4, transmission.getSecondaryTransmission());
			stmt.setObject(5, transmission.getType());
			stmt.setObject(6, transmission.getReverse());

			int result = stmt.executeUpdate();
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("insertTransmission error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param id
	 * @param name
	 * @return
	 */
	public static Integer insertCategory(Integer id, String name) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "INSERT INTO data_bikes_old.bike_categories (id, name) VALUES (?, ?);";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, id);
			stmt.setString(2, name);

			int result = stmt.executeUpdate();
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("insertCategory error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	/**
	 * 
	 * @param man
	 * @return
	 */
	public static Integer insertManufacturer(Manufacturer man) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "INSERT INTO data_bikes_old.bike_manufacturers (id, name, years, description, logo_url, images_url) VALUES (?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, man.getId());
			stmt.setString(2, man.getName());
			stmt.setArray(3, man.getArrayYears(con));
			stmt.setString(4, man.getDescription());
			stmt.setString(5, man.getLogoUrl());
			stmt.setArray(6, man.getArrayImagesUrl(con));

			int result = stmt.executeUpdate();
			stmt.close();
			return result;
		} catch (Exception e) {
			System.out.println("insertManufacturer error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}

	public static Integer insertBikeFeaturesValue(String type, String feature, String value) {
		Connection con = ConnectionManager.getConnexion();
		try {
			if (value == null) {
				return null;
			}
			String query1 = "SELECT COUNT(feature) as count FROM data_bikes_old.bike_features_dictionary WHERE type LIKE ? AND feature LIKE ? AND value LIKE ?;";
			PreparedStatement stmt = con.prepareStatement(query1);
			stmt.setObject(1, type);
			stmt.setObject(2, feature);
			stmt.setObject(3, value);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int result = rs.getInt(1);
				rs.close();
				stmt.close();

				if (result == 0) {
					String query2 = "INSERT INTO data_bikes_old.bike_features_dictionary (type, feature, value, correct_value) VALUES (?, ?, ?, ?);";
					PreparedStatement stmt2 = con.prepareStatement(query2);
					stmt2.setObject(1, type);
					stmt2.setObject(2, feature);
					stmt2.setObject(3, value);
					stmt2.setObject(4, "");

					int result2 = stmt2.executeUpdate();
					stmt2.close();
					
					System.out.println("Add feature " + type + " " + feature + " " + value + " OK");
					return result2;
				} else {
					return result;
				}
			}

			return null;

		} catch (Exception e) {
			System.out.println("insertBikeFeaturesValue error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}
	
	public static Integer insertBikeFeaturesValueCorrected(Dictionary dico) {
		Connection con = ConnectionManager.getConnexion();
		try {
			String query1 = "SELECT COUNT(feature) as count FROM data_bikes_old.bike_features_dictionary_corrected WHERE type LIKE ? AND feature LIKE ? AND correct_value LIKE ?;";
			PreparedStatement stmt = con.prepareStatement(query1);
			stmt.setObject(1, dico.getType());
			stmt.setObject(2, dico.getFeature());
			stmt.setObject(3, dico.getCorrectValue());

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int result = rs.getInt(1);
				rs.close();
				stmt.close();

				if (result == 0) {
					String query2 = "INSERT INTO data_bikes_old.bike_features_dictionary_corrected (type, feature, correct_value) VALUES (?, ?, ?);";
					PreparedStatement stmt2 = con.prepareStatement(query2);
					stmt2.setObject(1, dico.getType());
					stmt2.setObject(2, dico.getFeature());
					stmt2.setObject(3, dico.getCorrectValue());

					int result2 = stmt2.executeUpdate();
					stmt2.close();
					return result2;
				} else {
					return result;
				}
			}

			return null;

		} catch (Exception e) {
			System.out.println("insertBikeFeaturesValueCorrected error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}


	public static List<Dictionary> getAllDictionary() {

		Connection con = ConnectionManager.getConnexion();
		try {
			List<Dictionary> dicos = new ArrayList<Dictionary>();
			String query = "SELECT type, feature, value, correct_value FROM data_bikes_old.bike_features_dictionary;";
			PreparedStatement stmt = con.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Dictionary dico = new Dictionary();
				dico.setType(rs.getString(1));
				dico.setFeature(rs.getString(2));
				dico.setValue(rs.getString(3));
				dico.setCorrectValue(rs.getString(4));

				dicos.add(dico);

			}

			stmt.close();
			rs.close();
			return dicos;
		} catch (Exception e) {
			System.out.println("getAllDictionary error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}
	
	public static Integer updateDictionary(Dictionary dictionary) {

		Connection con = ConnectionManager.getConnexion();
		try {
			String query = "UPDATE data_bikes_old.bike_features_dictionary SET correct_value = ? WHERE type = ? AND feature = ? AND value = ?;";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setObject(1, dictionary.getCorrectValue());
			stmt.setObject(2, dictionary.getType());
			stmt.setObject(3, dictionary.getFeature());
			stmt.setObject(4, dictionary.getValue());

			int result = stmt.executeUpdate();
			stmt.close();

			return result;
		} catch (Exception e) {
			System.out.println("updateDictionary error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}
	
	public static Integer updateBikesValue(Dictionary dictionary) {
		
		System.out.println("Correct " + dictionary.getFeature());

		Connection con = ConnectionManager.getConnexion();
		
		String query = "UPDATE data_bikes_old."+ dictionary.getType() +" SET " + dictionary.getFeature() + " = '"
				+ dictionary.getCorrectValue() +"' WHERE "+dictionary.getFeature()+" = '"+dictionary.getValue()+"';";
		
		try {
			
			PreparedStatement stmt = con.prepareStatement(query);			

			int result = stmt.executeUpdate();
			
			stmt.close();

			return result;
		} catch (Exception e) {
			System.out.println("updateBikesValue error");
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Problème pour fermer la connexion");
			}
		}
	}
}
