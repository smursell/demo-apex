public class SharinPixDemoEmail2CaseAttachmentHandler {
    public static void uploadAttachment(List<Attachment> attachments, Set<Id> emailMsgIds) {
        Map<Id, Id> albumIdMapper = new Map<Id, Id>();
        for (EmailMessage email : [SELECT Id, ParentId FROM EmailMessage WHERE Id IN :emailMsgIds]) {
            albumIdMapper.put(email.Id, email.ParentId);
        }
        for (Attachment att : attachments) {
            uploadPhoto(att.Id, albumIdMapper.get(att.parentId));
        }
    }
    
    @future(callout=true)
    public static void uploadPhoto(String attachmentId, String albumId) {
        sharinpix.Utils utl = new sharinpix.Utils();
        utl.uploadAttachment(attachmentId, albumId);
    }
}