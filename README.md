# Salesforce field update on tag

You can set up an automatic update on a Salesforce field based on tag(s) added to image(s). This demo, once deployed and added to the Account pagelayout, will update the Description field with an image URL when an image is tagged with `tag_name`. Other data can also be retrieved and sent to Salesforce; these are available in the [`e.data.payload`](/src/pages/SharinPixDemoTagToField.page#L12) object.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=tag_to_field)
