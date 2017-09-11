# SharinPix Mobile App Launcher

The Apex controller `SharinPixDemoMobileAppLauncherCtrl` and its page `SharinPixDemoMobileAppLauncher` are responsible to generate a URL that will be recognized by the SharinPix mobile application. If you wish to cater for phones that do not yet have the application installed, swap the comment from line 11 to line 12 in the controller; this will lead to a page whereby the user will obtain a link to install the mobile application.

To use the code, create a `Detail Page Button` on the object you wish to use it on, with `Behavior` as `Display in new window` and `Content Source` as `URL`. Assuming the API name of the object you wish to use is `Field_Visit__c`, in the URL field, use:
```
/apex/SharinPixDemoMobileAppLauncher?id={!CASESAFEID(Field_Visit__c.Id)}&name={!Field_Visit__c.Name}&params={!URLENCODE('mode=camera&roll=false')}
```

Using this method, your phone needs to be online to be able to generate the URL since the URL generation will be done on the server.
