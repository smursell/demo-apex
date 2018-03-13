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
    public static Object uploadByUrls(String albumId, String url, String filename, String tag) {
        List<String> tags = new List<String>();
        if(String.isNotBlank(tag)) {
            tags = tag.split('#');
        }

        Map<String, Object> claims = new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                albumId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_upload' => true
                    }
                }
            }
        };
        
        sharinpix.Client spClient = sharinpix.Client.getInstance();
        Map<String, Object> importPayload = new Map<String, Object> {
            'filename' => filename,
            'album_id' => albumId,
            'url' => url,
            'import_type' => 'url',
            'tags' => tags
        };
   
        Map<String, Object> importDetails = (Map<String, Object>) spClient.post('/imports/', Blob.valueOf(JSON.serialize(importPayload)), claims);
        return importDetails;
    }
}