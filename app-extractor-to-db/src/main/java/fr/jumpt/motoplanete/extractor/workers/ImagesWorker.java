package fr.jumpt.motoplanete.extractor.workers;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.FileUtils;

import fr.jumpt.motoplanete.extractor.models.Bike;
import fr.jumpt.motoplanete.extractor.models.Manufacturer;
import fr.jumpt.motoplanete.extractor.utils.LinksMotoplanete;

public abstract class ImagesWorker {

	public static void dowload() {
		System.out.println("DOWLOAD IMAGES BIKES");
		String url = "";

		for (Manufacturer manufacturer : ManufacturersWorker.jsonToObject()) {
			for (Bike bike : BikesWorker.jsonToObject(manufacturer)) {

				if (bike == null) {
					continue;
				}

				url = bike.getUrlImgMotoplanete();

				if (url != null && !url.isEmpty() && url.contains(".jpg")) {
					System.out.println("Pour " + bike.getName());

					try {

						FileUtils.copyURLToFile(new URL(url), new File(LinksMotoplanete.VIGNETTES_MOTOS_DIRECTORY_LOGO
								+ "/" + manufacturer.getName().toLowerCase() + "/" + url.split("/")[4]));

					} catch (Exception e) {
						System.out.println("Erreur lors du téléchargement des images. " + url);
						e.printStackTrace();
					}
					System.out.println("Téléchargement de " + url + " OK");
				} else {
					System.out.println("Pour " + bike.getName());
					System.out.println("Téléchargement de " + url + " KO");
				}

			}

		}
		System.out.println("END DOWLOAD IMAGES BIKES");
	}

}
