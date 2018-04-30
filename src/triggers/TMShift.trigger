trigger FieldVisitTrigger on Traffic_Management_Shift__c (after insert, before update) {
    sharinpix.Client clientInstance = sharinpix.Client.getInstance();
    String token, appUrl;
    List<Traffic_Management_Shift__c> updatedVisits = new List<Field_Visit__c>();
    for (Traffic_Management_Shift__c visit : Trigger.new) {
        token = sharinpix.Client.getInstance().token(
            new Map<String, Object> {
                'album_id' => visit.Id,
                'exp' => 0,
                'path' => '/pagelayout/' + visit.Id,
                'name' => visit.name,
                'native_app_options' => new Map<String, String> {},
                'abilities' => new Map<String, Object> {
                    visit.Id => new Map<String, Object> {
                        'Access' => new Map<String, Boolean> {
                            'see' => true,
                            'image_list' => true,
                            'image_upload' => true,
                            'image_delete' => true,
                            'image_annotate' => true
                        }
                    },
                    'Display' => new Map<String, Object>{
                        'tags'=> true
                    }
                }
            }
        );
        appUrl = 'sharinpix://upload?token=' + token;
        System.debug('appUrl = ' + appUrl);
        if (Trigger.isInsert) {
            updatedVisits.add(new Traffic_Management_Shift__c(Id = visit.Id, 	SharinPix_Token__c = appUrl, Mobile_App_Token__c=token));
        } else if (Trigger.isUpdate) {
            if (String.isBlank(visit.SharinPix_Token__c || String.isBlank(visit.SharinPix_Token__c)) {
                visit.	SharinPix_Token__c = token;
                visit.	SharinPix_Token__c = appUrl;
                updatedVisits.add(visit);
            }
        }
    }
    if (Trigger.isInsert) update updatedVisits;
}
