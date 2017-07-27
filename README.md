# Automatically tag new images with tag(s)

Using this album, all new images are tagged with `Sea` as defined [here](/src/classes/SharinPixDemoAutoTagCtrl.cls#L11).

To add multiple tags to new images, use [`'auto_tag' => new List<String> { 'Sea', 'Land' }`](/src/classes/SharinPixDemoAutoTagCtrl.cls#L12).

If any tag specified in the `auto_tag` parameter is not already present on SharinPix, the user will get an `Access Denied` message if he does not have the right to create tags. To give a user the ability to create new tags, uncomment the [`'create' => true,`](/src/classes/SharinPixDemoAutoTagCtrl.cls#L10) line. Note that, it is better to create the tag yourself first and then add it's name to `auto_tag` instead of giving all users the ability to create tags.

[A version of the Visualforce page that does not require a controller is also provided.](/src/pages/SharinPixDemoAutoTagNoCtrl.page)

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=auto-tag)
