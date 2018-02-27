global with sharing class DownloadPDFCtrl {
    global String parameters { get; set; }

    global DownloadPDFCtrl (ApexPages.StandardController stdCtrl) {
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
                        'image_rotate' => true,
						'image_tag' => false,
						'image_download' => true
                    },
                    'Actions' => new List<String> {
                        'Send an email'
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
        System.debug(parameters);
    }
}