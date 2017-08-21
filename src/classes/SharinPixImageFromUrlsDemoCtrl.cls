public with sharing class SharinPixImageFromUrlsDemoCtrl {

    /**
     * This method uploads file using URL
     * 
     * @param albumId the ID of the album where the upload will be done
     * @param url URL of the image to be uploaded
     * @param filename The filename of the file to be uploaded
     * @return returns a void
     */
    @RemoteAction
    public static Void uploadByUrls(String albumId, String url, String filename) {
        sharinpix.Utils utils = new sharinpix.Utils();
        utils.uploadFromUrl(url, albumId, filename);
    }
}