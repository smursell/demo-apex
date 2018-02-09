# SharinPix Mobile App Launcher using WorkOrder object (FSL / works offline)

The trigger `SharinPixWorkOrderTrigger` on the `WorkOrder` standard object adds a SharinPix Mobile App Launcher URL to the `SharinPix_App_URL__c` custom field and adds a SharinPix token value to the custom field `SharinPix_Token__c`.
Both custom fields possess the following field properties:

* Data Type: Long Text Area
* Length: 32, 768

These two field values prove to be invaluable as their usage come into play in the event of launching the SharinPix Mobile Application from inside the `Field Service Lightning Mobile Application` through the following methods:

* App extensions for both Android and IOS Platforms
* Flow

The implementation instructions of the above methods can be found in the SharinPix Cookbook documentation.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=fsl_workorder_trigger)
