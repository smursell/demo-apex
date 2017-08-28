# Deploy to Salesforce

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=image_crop_resize)

# Image Crop/Resize

Open your Setup and find the Visualforce page named 'SharinPixResizeDemo'. Preview the Visualforce page. Once on the page, you must click on an image so that the resize options will be available. Set a width, height and crop type then click on the 'Resize' button.

## Explaining the crop parameters available
* scale - The image is made to scale in both horizontally and vertically in order to match the new height and new width. Hence no detail loss but proportion is not maintained.

<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/scale.jpg">

* fit - The image is made to fit either horizontally or vertically in way so as not to lose any detail of the image and also preserve the proportion. Some unused spaces may be left which results in a smaller image than expected.

<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/fit.jpg">

* fill - The image is made to fill completely the new space either horizontally or vertically in way to preserve proportion but some detail might be lost.

<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/fill.jpg">

* pad - Same as for fit but the unused spaces are filled with whitespace.

<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/pad.jpg">

* crop - The image is cropped starting from the center (gravity = center), the image preserves its original zoom level. You can also specify the gravity parameter alongside the crop parameter.

<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/crop.jpg">

* thumb - Used for displaying thumbnails and must always be used alongside the gravity parameter.

<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/thumb.jpg">
