# Upload attachments to SharinPix (Email-to-Case)

Once deployed, this demo will add a trigger to all newly created attachments on Salesforce cases. After that, set up Email-to-Case in your salesforce org if not already done. Ensure you have a SharinPix album in your case page.

You can now send and email with image (JPEG) attachments to see this demo in action.

A possible use case for this demo is automatically uploading received attachments from emails (when using Email-to-Case) to the SharinPix album for the related case.

Feel free to use the code provided in the [SharinPixDemoEmail2CaseAttachmentHandler](src/classes/SharinPixDemoEmail2CaseAttachmentHandler.cls) class to upload existing attachments to your SharinPix album.
For example, you may use these [lines of code](/src/classes/SharinPixDemoEmail2CaseAttachmentHandler.cls#L15) to upload an existing attachment (`attachmentId`) to a SharinPix album (`albumId`).
```
sharinpix.Utils utl = new sharinpix.Utils();
utl.uploadAttachment(attachmentId, albumId);
```

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=email2case_attachment)
