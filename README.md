# Demo - Update Salesforce fields with actions

SharinPix images can easily be added to Salesforce fields. For example, in cases where you want a primary picture to be displayed for a record.

In this demo, the field used is the Description field of a contact. If you create a custom rich-text field and use it instead at [line 47 of SharinPixDemoActionDescriptionCtrl](/src/classes/SharinPixDemoActionDescriptionCtrl.cls#L47), an image will display on that field.

The demo Visualforce page will be available on Contacts' page layouts once deployed.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=action_description)

Alternatively, to have this similar functionality but without using rich-text fields, you might make use of 2 fields:
 * One URL field which is updated with the URL of the image [(without the `img` tags)](/src/classes/SharinPixDemoActionDescriptionCtrl.cls#L45)
 * One formula text field with a formula ,making use of the `IMAGE` function to display the image from the URL.
