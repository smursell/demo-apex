# Download images from an album in zip archive (demo-jszip-image-download)

You can download a zip archive containing an album's original images using this demo code. The zipping process is done using javascript. Thus, you need a modern browser for it to successfully run.

### Solutions
There are two possible solutions for downloading and zipping images:
#### Solution 1:
* Download images from a single album.
* Number of callouts made are restricted due to Salesforce's governor limits.
#### Solution 2:
* Download images from multiple albums.
* Number of callouts made are not restricted by Salesforce's governor limits.

#### Implementation steps for Solution 1

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

### Implementation steps for Solution 2
The Apex controller (with API version 38) can be found [here](src/classes/SharinPixDemoAlbumImageDownloadV2Ctrl.cls).

The Visualforce page (with API version 38) can be found [here](src/pages/SharinPixDemoAlbumImageDownloadV2Page.page).

Access the code found inside the Apex controller and modify the following line by replacing the placeholder values 'album-id-1' and 'album-id-2' with the album ids relevant to your own use case. 
```Java  
public List<Id> albumIdList = new List<Id> { 'album-id-1', 'album-id-2' };
```

To launch Solution 2, log in to your Salesforce instance and access the `SharinPixDemoAlbumImageDownloadV2Page` visualforce page. Preview the page and wait till the download and zipping process reach completion.

### IMPORTANT NOTICE
You will found in the Visualfore Page (SharinPixDemoAlbumImageDownloadV2Page), the following code snippet:
```Java
image.filename + Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5),
```
The use for the code above is to generate and append a random value at the end of each image filename. The reason behind its usage is to distinguish between images with identical filenames. Without this piece of code, the JS Libraries used in this example will overwrite (replace the initial image with the next one) the image files with duplicate filenames. In the event you are required to preserve the original filename, you must ensure the original filenames are unique and you will need to remove the following code:
```Java
+ Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5)
```
### JavaScript Libraries
The following libraries are used in both solutions.

* JSZIP [https://stuk.github.io/jszip/](https://stuk.github.io/jszip/)
* FileSaver [https://github.com/eligrey/FileSaver.js/](https://github.com/eligrey/FileSaver.js/)
* Jquery (v3.1.1) [https://jquery.com/browser-support/](https://jquery.com/browser-support/)


[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=js-zip-download)
