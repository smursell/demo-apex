# SharinPix Mobile App Launcher

The Apex controller `SharinPixDemoMobileAppLauncherCtrl` and its page `SharinPixDemoMobileAppLauncher` are responsible to generate a URL that will be recognized by the SharinPix mobile application. If you wish to cater for phones that do not yet have the application installed, swap the comment from line 11 to line 12 in the controller; this will lead to a page whereby the user will obtain a link to install the mobile application. 

When using this demo, your phone needs to be online since the URL generation is done on the server (Salesforce).

To use the code, create a `Detail Page Button` on the object you wish to use it on, with `Behavior` as `Display in new window` and `Content Source` as `URL`. Assuming the API name of the object you wish to use is `Field_Visit__c`, in the URL field, use:
```
/apex/SharinPixDemoMobileAppLauncher?id={!CASESAFEID(Field_Visit__c.Id)}&name={!Field_Visit__c.Name}&params={!URLENCODE('mode=camera&roll=false')}
```

The options passed to `params` are as follows. These are passed similar to HTML GET parameters.
 - `mode=[camera|roll]`
 - `roll=[true|false]`
 - `confirmation=[true|false]`
 - `auto_tag=[any text value]`

`camera` mode will open the camera for the user once the application is launched.

`roll` determines whether to allow the user to choose from the roll or not. If `mode` is set to `roll`, `roll` will always be set to `true` and is not required to be specified.

The `confirmation` parameter determines whether to preview an image before uploading.

The `auto_tag` parameter enables the auto-tagging of images by specifying a text value.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=mobile_app_launcher)
