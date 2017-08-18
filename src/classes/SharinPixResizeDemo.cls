public with sharing class SharinPixResizeDemo {
    public String albumId {get; set;}
    public String parameters {get; set;}

    public SharinPixResizeDemo() {
        albumId = 'SharinPixResizeDemo';
        parameters = JSON.serialize(new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                albumId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_list' => true,
                        'image_upload' => true
                    }
                }
            },
            'Id' => albumId
        });
    }

    /**
     * This method resizes/crops an image.
     * 
     * @param imageId The image ID of the image that needs to be resized/cropped
     * @param width The new width of the image
     * @param height The new height of the image
     * @param crop The crop type for the resize/crop
     * @return Returns the URL of the resized/cropped image
     */
    @RemoteAction
    public static String resizeImage(String imageId, Integer width, Integer height, String crop) {
        sharinpix.Utils sharinPixUtils = new sharinpix.Utils();
        return (String) sharinPixUtils.getImageExternalUrl(new Map<String, Object> {
            'image_id' => imageId,
            'sharinpix' => new Map<String, Object> {
                'download' => false,
                'auto' => false,
                'full_size' => false
            },
            'transformations' => new Map<String, Object> {
                'crop' => crop,
                'width' => width,
                'height' => height
            }
        }).get('resource_url');
    }

}