
# Image Face Crop

Go to 'Setup' in your Salesforce organization instance. Find the Visualforce page named 'VFP01_CropFace' in the Visual Pages Section. Preview the Visualforce page. Once on the page, click on an image to define the image cropping configurations. Set a width, height ,crop type('crop'), radius('max') and gravity, then click on the 'Crop' button.

## Explaining the gravity parameters options

### Gravity

* Face - Automatically detect the largest face in an image and aim to make it the center of the cropped image. Alternatively, use face coordinates specified by API if available. Defaults to the 'north' gravity if no face was detected.

<img src="http://res.cloudinary.com/demo/image/upload/c_crop,g_face,h_80,w_80/face_top.jpg">

* face:center - Same as the 'face' gravity, but defaults to 'center' gravity instead of 'north' if no face is detected.

* faces:auto - Same as the 'faces' gravity, but defaults to 'auto' gravity instead of 'north' if no faces are detected.

* body:face - Automatically detect the largest body in an image and aim to make it the center of the cropped image. Defaults to the 'face' gravity if a full body was not detected

<img src="http://res.cloudinary.com/demo/image/upload/c_fill,g_body,h_80,w_80/face_top.jpg">

* adv_face - Automatically detect the largest face in an image with the Advanced Facial Attribute Detection add-on and make it the focus of the transformation.

<img src="http://res.cloudinary.com/demo/image/upload/c_thumb,g_adv_face,h_80,w_80/young_couple.jpg">

* adv_faces - Automatically detect all the faces in an image with the Advanced Facial Attribute Detection add-on and make them the focus of the transformation.

<img src="http://res.cloudinary.com/demo/image/upload/c_thumb,g_adv_faces,h_80,w_80/young_couple.jpg">

* custom:face - Same as the 'custom' gravity, but defaults to 'face' gravity if no custom coordinates are available.

* custom:faces - Same as the 'custom' gravity, but defaults to 'faces' gravity if no custom coordinates are available.

* custom:adv_face - Same as the 'custom' gravity, but defaults to 'adv_face' gravity if no custom coordinates are available.

* custom:adv_faces	- Same as the 'custom' gravity, but defaults to 'adv_faces' gravity if no custom coordinates are available.

# Resizing/cropping options
### Please refer to the following: [Image-resizing guide](https://github.com/SharinPix/demo-apex/tree/image_crop_resize)



