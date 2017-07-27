# Show account's contacts images (Search)

This demo adds a Visualforce named [SharinPixDemoAccountContactsSearch](/src/pages/SharinPixDemoAccountContactsSearch.page) to Account. This album does a search to retrieve all the contacts associated with the account and display their images.

The [line 12 of SharinPixDemoAccountContactsSearchCtrl](/src/classes/SharinPixDemoAccountContactsSearchCtrl.cls#L12) can be modified to choose which images to show in the search results.

For example, we have albums with IDs “album1”, “album2” and “new album” and tags named “tag1” and “tag 2”.

- To view images from all 3 albums, the line should be:
  - `query.put('q', 'album1 album2 "new album"');`
    - Note that double quotes are used for text with spaces. They are optional if no spaces are contained.
- To view images from 2 albums and with both of the 2 tags:
  - `query.put('q', 'tags:(+(album1 album2) +(tag1 AND "tag 2"))');`
- To view images from 2 albums and with either of the 2 tags:
  - `query.put('q', 'tags:(+(album1 album2) +(tag1 OR "tag 2"))');`
- To view images with both of the tags, irrespective of the albums they are in:
  - `query.put('q', 'tag1 "tag 2"');`

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=account_contacts_search)
