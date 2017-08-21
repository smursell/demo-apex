# Upload to SharinPix using URL

Deploy this branch to your Salesforce organization and open the `SharinPixImageFromUrlsDemo` Visualforce page.
At the top of the page, insert the Album ID in which you wish to upload.

Fill in the fields.
* `filename` - the filename that will be used to store this file.
* `URL` - the URL of the image file.

You may add more URLs by clicking on the `Add URL` button.
Once done, click on `Upload`.

You may upload add more URL by clicking on the `Add URL` button.
Finally click on upload.

**Note:** Each URL is sent individually to the Apex controller for upload. (Multiple requests)

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=upload_by_url)
