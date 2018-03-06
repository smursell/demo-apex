global with sharing class SharinPixTagDelete {
    global String parameters { get; set; }
    global String url {get; set; }
    global Id contactId {get; set;}
	
	global SharinPixTagDelete(ApexPages.StandardController stdCtrl) {
		contactId = stdCtrl.getId();
        Map<String, Object> params = new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                contactId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_list' => true,
                        'image_upload' => true,
                        'image_delete' => false
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
        url = 'https://app.sharinpix.com/pagelayout/' + contactId + '?token=' + sharinpix.Client.getInstance().token(params);
    }

    @RemoteAction
    global static String deleteImage(String imageId, Id recordId) {
        String result = 'failed';
        sharinpix.Utils spUtils = new sharinpix.Utils();
        List<Object>  tagList = spUtils.getTagsOnImage(imageId);
        for(Object tag: tagList) {
            Map<String, Object> tagMap = (Map<String, Object>) tag;
            Map<String, Object> tagDetails = (Map<String, Object>) tagMap.get('tag');
            if(tagDetails.get('name') == 'delete') {
                Map<String, Object> claims = new Map<String, Object> {
                    'abilities' => new Map<String, Object> {
                        recordId => new Map<String, Object> {
                            'Access' => new Map<String, Object> {
                                'image_delete' => true
                            }
                        }
                    }
                };
                try{
                    sharinpix.Client.getInstance().destroy('/images/'+imageId, claims);
                    result = 'success';
                    return result;
                }catch(Exception e) {
                    result = e.getMessage();
                    return result;
                }
            }
        }
        return result;
    }
}
