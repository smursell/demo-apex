trigger SharinPixWorkOrderTrigger on WorkOrder (after insert, before update) {
    sharinpix.Client clientInstance = sharinpix.Client.getInstance();
    String token, appUrl;
    List<WorkOrder> updatedWOrders = new List<WorkOrder>();
    for (WorkOrder wOrder : Trigger.new) {
        if (String.isBlank(wOrder.SharinPix_Token__c) || String.isBlank(wOrder.SharinPix_App_URL__c)) {
            token = sharinpix.Client.getInstance().token(
                new Map<String, Object> {
                    'album_id' => wOrder.Id,
                    'exp' => 0,
                    'path' => '/pagelayout/' + wOrder.Id,
                    'native_app_options' => new Map<String, String> {},
                    'abilities' => new Map<String, Object> {
                        wOrder.Id => new Map<String, Object> {
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
                updatedWOrders.add(new WorkOrder(
                    Id = wOrder.Id,
                    SharinPix_Token__c = token,
                    SharinPix_App_URL__c = appUrl
                ));
            } else {
                wOrder.SharinPix_Token__c = token;
                wOrder.SharinPix_App_URL__c = appUrl;
            }
            
        }
    }
    if (Trigger.isInsert) { update updatedWOrders; }
}