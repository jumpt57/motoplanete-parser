package fr.jumpt.motoplanete.extractor.utils;

import java.sql.Connection;
import java.sql.DriverManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author jmaupeti
 *
 */
public class ConnectionManager {

	private static final Logger logger = LoggerFactory.getLogger(ConnectionManager.class);

	public static final String HOSTNAME = "localhost";
	public static final String PORT = "5432";
	public static final String DBNAME = "motorcycleportal";
	public static final String SCHEMA = "dictionary_bikes";
	public static final String USERNAME = "motorcycleportal";
	public static final String PASSWORD = "motorcycleportal";

	/**
	 * Méthode permettant de récupérer une connexion à la BDD
	 * 
	 * @return
	 */
	public static Connection getConnexion() {
		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			String url = "jdbc:postgresql://" + HOSTNAME + ":" + PORT + "/" + DBNAME + "?currentSchema=" + SCHEMA;
			connection = DriverManager.getConnection(url, USERNAME, PASSWORD);
			return connection;
		} catch (Exception e) {
			logger.error("Problème getConnexion", e);
		}

		return null;
	}

}
