# Launching SharinPix Offline Mobile App From Salesforce Mobile App using Trigger on Case Object

The trigger `SharinPixCaseTrigger` on the `Case` standard object adds a SharinPix Mobile App Launcher URL to the `SharinPix_App_URL__c` custom field and adds a SharinPix token value to the custom field `SharinPix_Token__c`.
Both custom fields possess the following properties:
* Data Type: Long Text Area
* Length: 32, 768

These two field values prove to be invaluable as their usage come into play in the event of launching the SharinPix Mobile Application from inside the `Salesforce Mobile Application` through the use of a Mobile & Lightning Action that will appear on the action bar on the `Salesforce Mobile Application`.

For an insight into how to implement the above method, access the SharinPix Cookbook documentation.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=)
