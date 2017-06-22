trigger sharinpix_token_on_work_order on WorkOrder (before insert) {
    list<WorkOrder> objects = new list<WorkOrder>();
    for (WorkOrder obj: trigger.new){
        String token = sharinpix.Client.getInstance().token(
            new Map<String, Object> {
                'album_id' => obj.Id,
                'exp' => 0,
                'path' => '/pagelayout/' + obj.Id,
                'native_app_options' => new Map<String, String> {
                    'name' => obj.id
                },
                'abilities' => new Map<String, Object> {
                    obj.Id => new Map<String, Object> {
                        'Access' => new Map<String, Boolean> {
                            'see' => true,
                            'image_list' => true,
                            'image_upload' => true,
                            'image_delete' => true,
                            'image_annotate' => true
                        }
                    },
                    'Display' => new map<string, object>{
                        'tags'=> true
                    }
                }
            }
        );
        if(trigger.isInsert){
            objects.add(new WorkOrder(id=obj.id, sharinpix_token__c=token));
        }else{
            obj.sharinpix_token__c = token;
        }
    }
    update objects;
}