trigger FieldVisitTrigger on Field_Visit__c (after insert) {
    sharinpix.Client clientInstance = sharinpix.Client.getInstance();
    String token, appUrl;
    List<Field_Visit__c> updatedVisits = new List<Field_Visit__c>();
    for (Field_Visit__c visit : Trigger.new) {
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
        updatedVisits.add(new Field_Visit__c(Id = visit.Id, Mobile_App_URL__c = appUrl, Mobile_App_Token__c=token));
    }
    update updatedVisits;
}
