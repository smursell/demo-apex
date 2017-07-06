global with sharing class SharinPixDemoActionEmailCtrl {
    global String parameters { get; set; }

    global SharinPixDemoActionEmailCtrl(ApexPages.StandardController stdCtrl) {
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
                        'Send an email'
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
        System.debug(parameters);
    }

    @RemoteAction
    global static void sendMail(String imageJson) {
        List<Object> imageList = (List<Object>)JSON.deserializeUntyped(imageJson);
        List<String> imageUrlList = new List<String>();
        String contactId;
        for (Object img : imageList) {
            Map<String, Object> imgMap = (Map<String, Object>)img;
            Map<String, Object> thumbnailMap = (Map<String, Object>)imgMap.get('thumbnails');
            imageUrlList.add(String.valueof(thumbnailMap.get('mini')));
            contactId = String.valueof(imgMap.get('album_id'));
        }

        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();

        Contact contact = [SELECT Id, Name, Email FROM Contact Where Id = :contactId LIMIT 1];
        if (!imageUrlList.isEmpty()) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String> { contact.Email });
            mail.setReplyTo(UserInfo.getUserEmail());
            mail.setSenderDisplayName(UserInfo.getName());
            mail.setSubject('Photo Uploaded');

            String body = 'Hello ' + contact.Name;
            body += '<br/>The following photo(s) have been uploaded on your record:<br/>';
            for (String url : imageurllist) {
                body += '<img src="' + url + '" /><br/>';
            }
            mail.setHtmlBody(body);

            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
}