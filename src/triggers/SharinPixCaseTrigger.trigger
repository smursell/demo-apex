trigger SharinPixCaseTrigger on Case (after insert, before update) {
    sharinpix.Client clientInstance = sharinpix.Client.getInstance();
    String token, appUrl;
    List<Case> updatedCase = new List<Case>();
    for (Case caseObject : Trigger.new) {
        if (String.isBlank(caseObject.SharinPix_Token__c)) {
            token = sharinpix.Client.getInstance().token(
                new Map<String, Object> {
                    'album_id' => caseObject.Id,
                    'exp' => 0,
                    'path' => '/pagelayout/' + caseObject.Id,
                    'native_app_options' => new Map<String, String> {},
                    'abilities' => new Map<String, Object> {
                        caseObject.Id => new Map<String, Object> {
                            'Access' => new Map<String, Boolean> {
                                'see' => true,
                                'image_list' => true,
                                'image_upload' => true,
                                'image_delete' => true,
                                'image_annotate' => true
                            }
                        },
                        'Display' => new Map<String, Object> {
                            'tags'=> true
                        }
                    }
                }
            );
            appUrl = 'sharinpix://upload?token=' + token;
            if (Trigger.isInsert) {
                updatedCase.add(new Case(
                    Id = caseObject.Id,
                    SharinPix_Token__c = token,
                    SharinPix_App_URL__c = appUrl
                ));
            } else {
                caseObject.SharinPix_Token__c = token;
                caseObject.SharinPix_App_URL__c = appUrl;
            } 
        }
    }
    if (Trigger.isInsert) { update updatedCase; }
}