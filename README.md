# Download images from an album in zip archive (demo-jszip-image-download)

You can download a zip archive containing an album's original images using this demo code. The zipping process is done using javascript. Thus, you need a modern browser for it to run successfully.

## Implementation Steps

The Apex controller (with API version 38) can be found [here](src/classes/SharinPixDemoAlbumImageDownloadCtrl.cls).

The Visualforce page (with API version 38) can be found [here](src/pages/SharinPixDemoAlbumImageDownload.page).

To run the codes, log in to your salesforce instance. Access the SharinPixDemoAlbumImageDownload page from your browser's navigation bar and provide the ID of the album to download the images for. The ID needs to be a valid Salesforce object ID.

For example, if your Salesforce URL is
```
https://cs10.salesforce.com/
```
, you need to go to
```
https://cs10.salesforce.com/apex/SharinPixDemoAlbumImageDownload?id=00158000003NLMy
```
to download images from the Salesforce object with the ID 00158000003NLMy.

You can also append
```
&filename=Extract
```
to the URL so as to provide a custom filename (Extract.zip in this case) to the zip output.

[<img src="https://raw,githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=js-zip-download)