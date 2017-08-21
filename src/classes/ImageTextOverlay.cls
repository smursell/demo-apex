public class ImageTextOverlay {
    private sharinpix.Utils utils;

    public ImageTextOverlay(){
        utils = new sharinpix.Utils();
    }
    
    public String overlayText(String imageId, String text, String fontStyle, String fontSize, String fontEmphasis, String gravity, String borderWidth, String borderStyle, String borderColor){  
        String sanitizedText = EncodingUtil.urlEncode(text, 'UTF-8').replaceAll('\\+', '%20').replaceAll('%2C', '%252C');
        String overlay       = 'text:'+fontStyle+'_'+fontSize+'_'+fontEmphasis+'_stroke:'+sanitizedText+',bo_'+borderWidth+'px_'+borderStyle+'_'+borderColor;
        String imgExtUrl     = (String)utils.getImageExternalUrl(new Map<String, Object> {
            'image_id'  => imageId,
            'sharinpix' => new Map<String, Object> {
                'download'  => true,
                'auto'      => false,
                'full_size' => false
            },
            'transformations' => new Map<String, Object> {
                'overlay'   => overlay,
                'gravity'   => gravity
            }  
        }).get('resource_url');        
        return imgExtUrl;
    }  
}