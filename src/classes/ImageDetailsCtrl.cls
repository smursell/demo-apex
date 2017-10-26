public class ImageDetailsCtrl {
    public String parameters {get; set;}

    public ImageDetailsCtrl(ApexPages.StandardController stdCtrl){
		Id acctId = stdCtrl.getId();
        Map<String, Object> params = new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                acctId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_list' => true,
                        'image_upload' => true,
                        'image_tag' => true,
                        'image_crop' => true,
                        'image_rotate' => true,
                        'image_delete' => true
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
    }
}