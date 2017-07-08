trigger SharinPixDemoEmail2CaseAttachmentTrigger on Attachment (after insert) {
    List<Attachment> attachments = new List<Attachment>();
    Set<Id> emailMsgIds = new Set<Id>();

    for (Attachment att : Trigger.new) {
        if (String.valueOf(att.ParentId).startsWith('02s') && att.ContentType == 'image/jpeg') {
            attachments.add(att);
            emailMsgIds.add(att.ParentId);
        }
    }

    if (!attachments.isEmpty()) {
        SharinPixDemoEmail2CaseAttachmentHandler.uploadAttachment(attachments, emailMsgIds);
    }
}