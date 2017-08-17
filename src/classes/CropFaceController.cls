global class CropFaceController {
    public String parameters{get;set;}
    public Integer height{set;get;}
    public Integer width{set;get;}
    public String crop{get;set;}
    public String gravity{set;get;}
    public String radius{get;set;}
    public String id{get;set;}
    private sharinpix.Utils utils;
    public List<Object> listExtUrl{set;get;}
    public String imageId{set;get;}
    public Object listLength {set;get;}
    public List<Object> valueList {set;get;}
    public String extUrl {get;set;}
    
    public CropFaceController(ApexPages.standardController controller){
        utils = new sharinpix.Utils();
        id = controller.getId();
        map<string, boolean> access = new map<string, boolean>();
        access.put('see', true);
        access.put('image_list', true);
        access.put('image_upload', true);
        access.put('image_delete', true);
        access.put('image_crop', true);
        access.put('image_rotate', true);
        List<string> actions = new List<string>();
        actions.add('Send an email');
        map<string, object> album_abilities = new map<string, object>();
        album_abilities.put('Access', access);
        album_abilities.put('Actions', actions);
        map<string, object> abilities = new map<string, object>();
        abilities.put(id, album_abilities);
        map<string, object> params = new map<string, object>();
        params.put('abilities', abilities);
        params.put('Id', id);
        parameters = JSON.serialize(params);
    }//end constructor
	
    @RemoteAction
    global static String cropFace(String imageId, Integer width, Integer height, String crop, String gravity, String radius){
        //Getting all configuration paramseters
        ImageFaceCrop ifc = new ImageFaceCrop();
        return ifc.cropFace(imageId, width, height, crop, gravity, radius);
    }//end cropFace
}//end class CropFaceController