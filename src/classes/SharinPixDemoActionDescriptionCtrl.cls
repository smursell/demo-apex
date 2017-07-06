global with sharing class SharinPixDemoActionDescriptionCtrl {

    global String parameters { get; set; }
    global String contact { get; set; }

    global SharinPixDemoActionDescriptionCtrl(ApexPages.StandardController stdCtrl) {
        Id contactId = stdCtrl.getId();

        Map<String, Object> params = new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                contactId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_list' => true,
                        'image_upload' => true,
                        'image_delete' => true,
                        'image_crop' => true,
                        'image_rotate' => true
                    },
                    'Actions' => new List<String> {
                        'Add to description'
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
    }

    @RemoteAction
    global static void addToDescription(String imageJson) {
        List<Object> imageList = (List<Object>)JSON.deserializeUntyped(imageJson);
        List<String> imageUrlList = new List<String>();
        String contactId;
        for (Object img : imageList) {
            Map<String, Object> imgMap = (Map<String, Object>)img;
            Map<String, Object> thumbnailMap = (Map<String, Object>)imgMap.get('thumbnails');
            imageUrlList.add(String.valueOf(thumbnailMap.get('large')));
            contactId = String.valueOf(imgMap.get('album_id'));
        }
        // Use a rich-text field instead of Description to view inline images.
        Contact con = [SELECT Id, Description FROM Contact WHERE Id = :contactId LIMIT 1];
        if (!imageUrlList.isEmpty()) {
            String body = con.description == null ? '' : con.description;
            for (String url : imageurllist) {
                body += '<img src="'+url+'" /><br/>';
            }
            con.Description = body;
            update con;
        }
    }
}