public with sharing class SharinPixDemoGpsCtrl {
    public String url { get; set; }
    
    public SharinPixDemoGpsCtrl(ApexPages.StandardController stdCtrl) {
        Id contactId = stdCtrl.getId();
        String token = sharinpix.Client.getInstance().token(
            new Map<String, Object> {
                'abilities' => new Map<String, Object> {
                    contactId => new Map<String, Object> {
                        'Access' => new Map<String, Boolean> {
                            'see' => true,
                            'image_list' => true,
                            'image_delete' => true,
                            'image_crop' => true,
                            'image_upload' => true,
                            'image_rotate' => true
                        }
                    }
                }
            }
        );
        url = 'https://app.sharinpix.com/pagelayout/' + contactId + '?token=' + token;
    }
}