public class ImageFaceCrop {
    private sharinpix.Utils utils;
    private String imgExtUrl{get;set;}

    public ImageFaceCrop(){    
        utils = new sharinpix.Utils();
    }

    /**
     *Description: Crops human face found in image
     * @param   imageId [Public ID of image from which to crop face]
     * @default crop    [crop]
     * @default gravity [face]
     * @default radius  [max]
     * @default width   [200 pixels]
     * @default height  [200 pixels]
     * @return  [URL of transformed image]
     */
    public String cropFace(String imageId){
        imgExtUrl = (String)utils.getImageExternalUrl(new Map<String, Object> {
            'image_id' => imageId,
            'sharinpix' => new Map<String, Object> {
                'download' => true,
                'auto' => false,
                'full_size' => false
            },
            'transformations' => new Map<String, Object> {
                'crop' => 'crop',
                'gravity' => 'face',
                'radius' => 'max',
                'width' => 200,
                'height' => 200
            }
        }).get('resource_url');
        return imgExtUrl;
    }

    /**
     *Description: Crops human face found in image
     * @param   imageId [Public ID of image from which to crop face]
     * @param   width   [width of cropped image]
     * @param   height  [height of cropped image]
     * @default crop    [crop]
     * @default gravity [face]
     * @default radius  [max]
     * @return  [URL of cropped image]
     */
    public String cropFace(String imageId, Integer width, Integer height){
        return cropFace(imageId, width, height, 'crop', 'face', 'max');
    }
    
    /**
     *Description: Crops human face found in image
     * @param  imageId [Public ID of image from which to crop face]
     * @param  width   [width of cropped image]
     * @param  height  [height of cropped image]
     * @param  crop    [crop mode]
     * @param  gravity [Decides which part of the image to keep while the 'crop', 'pad', 'thumb' and 'fill' crop modes are used]
     * @param  radius  [max]
     * @return [URL of cropped image]
     */
    public String cropFace(String imageId, Integer width, Integer height, String crop, String gravity, String radius){    
        imgExtUrl = (String)utils.getImageExternalUrl(new Map<String, Object> {
            'image_id' => imageId,
            'sharinpix' => new Map<String, Object> {
                'download' => true,
                'auto' => false,
                'full_size' => false
            },
            'transformations' => new Map<String, Object> {
                'crop' => crop,
                'gravity' => gravity,
                'radius' => radius,
                'width' => width,
                'height' => height
            }
        }).get('resource_url');  
        return imgExtUrl;
    }
}