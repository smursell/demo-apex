global class ImageTextOverlayController {
    global String  parameters {set;get;}
    public Id      albumId;

    public ImageTextOverlayController(ApexPages.standardController controller){
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
     * [overlayText method overlays a text content on the specified image]
     * @param  imageId [SharinPix id of image]
     * @param  text    [text to be overlaid]
     * @param  options [JSON string with more image transformation options]
     * @return         [image URL of image with overlaid text]
     */
    @RemoteAction
    global static String overlayText(String imageId, String text, String options){
        map<string, object> optionsMap = (map<string, object>) JSON.deserializeUntyped(options);
        String fontStyle     = (String) optionsMap.get('fontStyle');
        String fontSize      = (String) optionsMap.get('fontSize');
        String fontEmphasis  = (String) optionsMap.get('fontEmphasis');
        String gravity       = (String) optionsMap.get('gravity');
        String borderWidth   = (String) optionsMap.get('borderWidth');
        String borderStyle   = (String) optionsMap.get('borderStyle');
        String borderColor   = (String) optionsMap.get('borderColor');
        ImageTextOverlay ito = new ImageTextOverlay();
        return ito.overlayText(imageId, text, fontStyle, fontSize, fontEmphasis, gravity, borderWidth, borderStyle, borderColor);
    }  
}