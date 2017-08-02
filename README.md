# Webhook site

This demo consists of an example Visualforce page and its associated Apex controller, which are used to handle webhooks from SharinPix.

Make the Visualforce page available as a Salesforce Site and then set up a webhook on the SharinPix administration dashboard with its URL. 

You have the possibility to set up webhooks for several events from which you can enrich the information on your system. Such events are "new image", "new publication", "new provider reply", "new tag image" and "delete image". Whenever an event that is included in the webhook configuration occurs, SharinPix will send a request to the URL set up.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=webhook)
