public with sharing class SharinPixDemoWebhookCtrl {
    public PageReference handleWebHook() {
        String eventType = ApexPages.currentPage().getHeaders().get('x-sharinpix-event');

        Map<String, Object> body = ApexPages.currentPage().getParameters().containsKey('p') ?
            (Map<String, Object>)JSON.deserializeUntyped(ApexPages.currentPage().getParameters().get('p'))
            : new Map<String, Object>();

        if (eventType == 'new_image') {
            Map<String, Object> album = (Map<String, Object>)body.get('album');
            String albumId = (String)album.get('public_id'); // usually the Salesforce object ID
            // Do whatever you want with the information from the payload of a new image
            System.debug('New image in album ' + albumId);
        } else if (eventType == 'new_provider_reply') {
            Map<String, Object> payload = (Map<String, Object>)body.get('payload');
            Map<String, Object> provider = (Map<String, object>)body.get('provider');
            String providerId = (String)provider.get('id');
            String providerName = (String)provider.get('name');
            Map<String, Object> image = (Map<String, Object>)body.get('image');
            Map<String, Object> thumbnails = (Map<String, Object>)image.get('thumbnails');
            String thumbnail = (String)thumbnails.get('mini');
            Map<String, Object> album = (Map<String, Object>)image.get('album');
            String albumId = (String)album.get('public_id'); // usually the Salesforce object ID
            // Do whatever you want with the information from the payload of a new_provider_reply
            System.debug('New provider reply for image in album ' + albumId);
        } else {
            // Handle other events
            System.debug('Unknown request.');
        }
        return null;
    }
}