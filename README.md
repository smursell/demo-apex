
# Image Crop/Resize

Open your Setup and find the Visualforce page named 'SharinPixResizeDemo'. Preview the Visualforce page. Once on the page, you must click on an image so that the resize options will be available. Set a width, height and crop type then click on the 'Resize' button.

## Explaining the crop parameters available
For this scenario, let's assume the image original size is 400 x 200 (width x height) and the resize width and height are 200 x 200.
* scale - The image is made to scale in both horizontally and vertically in order to match the new height and new width. Hence the proportion is not maintained.
[<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/scale.jpg">]
* fit - The image is made to fit either horizontally or vertically in way so as not to lose any
[<img src="https://raw.githubusercontent.com/Akhilesh05/img/master/fit.jpg">]

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=image-resize)

