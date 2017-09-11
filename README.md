# SharinPix Mobile App Launcher (FSL / works offline)

The trigger `FieldVisitTrigger` on the `Field_Visit__c` object adds a token to the `Mobile_App_Token__c` field. This field is then used to generate the URL for the SharinPix mobile application while offline. Due to Salesforce1 limitations, this method only works with the Salesforce Field Service Lightning (FSL) application.

To use this demo, create a `Detail Page Button` on the object you wish to use it on, with `Behavior` as `Display in new window` and `Content Source` as `URL`. Assuming the API name of the object you wish to use is (again) `Field_Visit__c`, in the URL field, use:
```
{!Field_Visit__c.Mobile_App_URL__c}&confirmation=true&mode=camera&roll=true
```

The options passed (similar to HTML GET parameters) are as follows.
 - `mode=[camera|roll]`
 - `roll=[true|false]`
 - `confirmation=[true|false]`

`camera` mode will open the camera for the user once the application is launched.

`roll` determines whether to allow the user to choose from the roll or not. If `mode` is set to `roll`, `roll` will always be set to `true` and is not required to be specified.

The `confirmation` parameter determines whether to preview an image before uploading.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=mobile_app_launcher_fsl)
