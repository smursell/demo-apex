global with sharing class SharinPixDemoActionTaskCtrl {
    global String parameters { get; set; }

    global SharinPixDemoActionTaskCtrl(ApexPages.StandardController stdCtrl) {
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
                        'Create a task'
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
    }

    @RemoteAction
    global static string createTask(String albumId, String imageUrl) {
        Task aTask = new Task();
        aTask.Subject = 'Created from SharinPix';
        aTask.Status = 'Active';
        aTask.Description = '';
        aTask.WhoId = albumId;
        // Uncomment below to add image to task. Create SharinPix_Image__c field first
        // aTask.SharinPix_Image__c = imageUrl;
        insert aTask;
        return aTask.Id;
    }
}