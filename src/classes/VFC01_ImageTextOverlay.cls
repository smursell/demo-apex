global class VFC01_ImageTextOverlay {
    public String parameters {get;set;}
    public String albumId {get;set;}
    private sharinpix.Utils utils;
    public String extUrl {get;set;}
    public String text {set;get;}
    public String fontStyle {set;get;}
    public String fontSize {set;get;}
    public String fontEmphasis {set;get;}
    public String gravity {set;get;}
    public String borderWidth {set;get;}
    public String borderStyle {set;get;}
    public String borderColor {set;get;}

	public VFC01_ImageTextOverlay(ApexPages.standardController controller){ 
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
        album_abilities.put('Access', new map<string, boolean>{
                'see' => true,
                'image_list' => true,
                'image_upload' => true,
                'image_delete' => true,
                'image_crop' => true,
                'image_rotate' => true
            });
        
        parameters = JSON.serialize(new map<string, object>{
            'abilities' => new map<string, object>{
                    albumId => album_abilities
                },
            'Id' => albumId
            });
    }//end constructor
    }//end constructor

	@RemoteAction
    global static String overlayText(String imageId, String text, String fontStyle, String fontSize, String fontEmphasis, String gravity, String borderWidth, String borderStyle, String borderColor){
        //Getting all configuration paramseters
        ImageTextOverlay ito = new ImageTextOverlay();
        return ito.overlayText(imageId, text, fontStyle, fontSize, fontEmphasis, gravity, borderWidth, borderStyle, borderColor);
    }//end overlayText    
}//end class