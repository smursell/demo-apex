global class CropFaceController {
    public String albumId{get;set;}
    private sharinpix.Utils utils;

    public CropFaceController(ApexPages.standardController controller){
        utils = new sharinpix.Utils();
        albumId = controller.getId();
        map<string, boolean> access = new map<string, boolean>();
        access.put('see', true);
        access.put('image_list', true);
        access.put('image_upload', true);
        access.put('image_delete', true);
        access.put('image_crop', true);
        access.put('image_rotate', true);
        map<string, object> album_abilities = new map<string, object>();
        album_abilities.put('Access', access);
        map<string, object> abilities = new map<string, object>();
        abilities.put(albumId, album_abilities);
        map<string, object> params = new map<string, object>();
        params.put('abilities', abilities);
        params.put('Id', albumId);
        parameters = JSON.serialize(params);
    }//end constructor
	
    @RemoteAction
    global static String cropFace(String imageId, Integer width, Integer height, String crop, String gravity, String radius){
        //Getting all configuration paramseters
        ImageFaceCrop ifc = new ImageFaceCrop();
        return ifc.cropFace(imageId, width, height, crop, gravity, radius);
    }//end cropFace
}//end class CropFaceController