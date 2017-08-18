public with sharing class SharinPixImageFromUrlsDemo {

    @RemoteAction
    public static Boolean uploadByUrls(String albumId, String url, String filename) {
        sharinpix.Utils utils = new sharinpix.Utils();
        utils.uploadFromUrl(url, albumId, filename);
        return true;
    }

}