global with sharing class SharinPixDemoDeleteImageCtrl {
    public String parameters { get; set; }
    
    public SharinPixDemoDeleteImageCtrl(ApexPages.StandardController stdCtrl) {
        Id contactId = stdCtrl.getId();
        Map<String, Object> params = new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                contactId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_list' => true,
                        'image_upload' => true
                    },
                    'Actions' => new List<String> {
                        'Delete images'
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
    }
    
    @RemoteAction
    global static void deleteImages(String imagesJson) {
        List<Object> images = (List<Object>)JSON.deserializeUntyped(imagesJson);
        Map<String, Object> image, params;
        String albumId, imageId;
		sharinpix.Client clientInstance = sharinpix.Client.getInstance();
        for (Object imageObj : images) {
            image = (Map<String, Object>)imageObj;
            albumId = String.valueOf(image.get('album_id'));
            imageId = String.valueOf(image.get('public_id'));
            params = new Map<String, Object> {
                'abilities' => new Map<String, Object> {
                    albumId => new Map<String, Object> {
                        'Access' => new Map<String, Object> {
                            'image_delete' => true
                        }
                    }
                }
            };                
            clientInstance.destroy('/images/' + imageId, params);
        }
    }
}