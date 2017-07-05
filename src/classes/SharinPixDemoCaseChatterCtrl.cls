global with sharing class SharinPixDemoCaseChatterCtrl {
    public String parameters { get; set; }

    public SharinPixDemoCaseChatterCtrl(ApexPages.StandardController stdCtrl) {
        Id albumId = stdCtrl.getId();
        Map<String, Object> params = new Map<String, Object> {
            'Id' => albumId,
            'abilities' => new Map<String, Object> {
                albumId => new Map<String, Object> {
                    'Access' => new Map<String, Boolean> {
                        'see' => true,
                        'image_list' => true,
                        'image_tag' => true,
                        'image_upload' => true,
                        'image_delete' => true,
                        'image_copy' => true,
                        'image_duplicate' => true,
                        'image_annotate' => true,
                        'image_rotate' => true,
                        'image_crop' => true,
                        'image_download' => true,
                        'paste' => true,
                        'share' => true
                    },
                    'Actions' => new List<String> { 'Share on Chatter' }
                }
            }
        };
        parameters = JSON.serialize(params);
    }

    @RemoteAction
    global static void postToChatter(String jsonParams) {
        List<Object> paramImages = (List<Object>)JSON.deserializeUntyped(jsonParams);
        Map<String, Object> paramImage;
        String albumId, imageUrl, filename, postText;
        Blob imageBlob;
        Id fileId;
        for (Object paramImageObj : paramImages) {
            paramImage = (Map<String, Object>)paramImageObj;
            imageUrl = (String)paramImage.get('imageUrl');

            postText = 'SharinPix image shared.';
            imageBlob = getResourceAsBlob(imageUrl);
            paramImage.put('imageBlob', imageBlob);
        }
        for (Object paramImageObj : paramImages) {
            paramImage = (Map<String, Object>)paramImageObj;
            filename = (String)paramImage.get('filename') + '.jpg';
            imageBlob = (Blob)paramImage.get('imageBlob');
            albumId = (String)paramImage.get('albumId');

            fileId = addContentToObject(filename, imageBlob, albumId);
            postChatterRichText(albumId, postText, fileId, 'Image');
        }
    }

    @TestVisible
    private static Blob getResourceAsBlob(String endpoint) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        Http binding = new Http();
        HttpResponse res = binding.send(req);
        return res.getBodyAsBlob();
    }

    @TestVisible
    private static Id addContentToObject(String filename, Blob contentBlob, Id objectId) {
        ContentVersion cVer = new ContentVersion();
        cVer.Title = filename;
        cVer.PathOnClient = 'sharinpix://' + filename;
        cVer.VersionData = contentBlob;
        insert cVer;

        Id documentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :cVer.Id].ContentDocumentId;

        ContentDocumentLink cDocLink = new ContentDocumentLink();
        cDocLink.LinkedEntityId = objectId;
        cDocLink.ContentDocumentId = documentId;
        cDocLink.ShareType = 'V';
        cDocLink.Visibility = 'AllUsers';
        insert cDocLink;

        return documentId;
    }

    @TestVisible
    private static void postChatterRichText(Id targetUserOrGroupOrRecordId, String postText, Id fileId, String altText) {
        String communityId = null;
        ConnectApi.FeedItemInput input = new ConnectApi.FeedItemInput();
        input.subjectId = targetUserOrGroupOrRecordId;
        input.feedElementType = ConnectApi.FeedElementType.FeedItem;

        ConnectApi.MessageBodyInput messageInput = new ConnectApi.MessageBodyInput();
        ConnectApi.TextSegmentInput textSegment;
        ConnectApi.MarkupBeginSegmentInput markupBeginSegment;
        ConnectApi.MarkupEndSegmentInput markupEndSegment;
        ConnectApi.InlineImageSegmentInput inlineImageSegment;

        messageInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();

        textSegment = new ConnectApi.TextSegmentInput();
        textSegment.text = postText;
        messageInput.messageSegments.add(textSegment);

        inlineImageSegment = new ConnectApi.InlineImageSegmentInput();
        inlineImageSegment.altText = altText;
        inlineImageSegment.fileId = fileId;
        messageInput.messageSegments.add(inlineImageSegment);

        input.body = messageInput;

        ConnectApi.ChatterFeeds.postFeedElement(communityId, input);
    }
}