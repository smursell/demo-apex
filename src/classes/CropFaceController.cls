global class CropFaceController {
    public Id albumId {get;set;}
    private sharinpix.Utils utils;
    public String parameters {get;set;}

    public CropFaceController(ApexPages.standardController controller){
        utils = new sharinpix.Utils();
        albumId = controller.getId();     
        parameters = JSON.serialize(new map<string, object>{
            'abilities' => new map<string, object>{
                    albumId => new map<string, object>{
                        'Access' =>  new map<string, boolean>{
                            'see' => true,
                            'image_list' => true,
                            'image_upload' => true,
                            'image_delete' => true,
                            'image_crop' => true,
                            'image_rotate' => true
                        }
                    }
                },
            'Id' => albumId
        });
    }
    
    /**
     * Description: RemoteAction method returns URL of a cropped image
     * @param  imageId   [SharinPix id of image]
     * @param  width     [width of cropped image]
     * @param  height    [height of cropped image]
     * @param  options   [JSON string for extra cropping options '{"crop": "crop", "gravity": "face", "radius": "max"}']
     * @return imgExtUrl [URL of cropped image]
     */
    @RemoteAction
    global static String cropFace(String imageId, Integer width, Integer height, String options){
        Map<String, Object>  optionsMap = (Map<String, Object>) JSON.deserializeUntyped(options);
        String crop = (String)optionsMap.get('crop');
        String gravity = (String)optionsMap.get('gravity');    
        String radius = (String)optionsMap.get('radius');
        ImageFaceCrop ifc = new ImageFaceCrop();
        return ifc.cropFace(imageId, width, height, crop, gravity, radius);
    }
}