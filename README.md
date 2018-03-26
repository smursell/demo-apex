# Show account's contacts images (Search)

This demo adds a Visualforce named [SharinPixDemoAccountContactsSearch](/src/pages/SharinPixDemoAccountContactsSearch.page) to Account. This album does a search to retrieve all the contacts associated with the account and display their images.

The [line 12 of SharinPixDemoAccountContactsSearchCtrl](/src/classes/SharinPixDemoAccountContactsSearchCtrl.cls#L12) can be modified to choose which images to show in the search results.

For example, we have albums with IDs “album1”, “album2” and “new album” and tags named “tag1” and “tag 2”.

- To view images from all 3 albums, the line should be:
  - `query.put('q', '"album1" "album2" "new album"');`
    - Note that double quotes are used for text with spaces. They are optional if no spaces are contained.
- To view images from 2 albums and with both of the 2 tags:
  - `query.put('q', 'tags:(+("album1" "album2") +("tag1" AND "tag 2"))');`
- To view images from 2 albums and with either of the 2 tags:
  - `query.put('q', 'tags:(+("album1" "album2") +("tag1" OR "tag 2"))');`
- To view images with both of the tags, irrespective of the albums they are in:
  - `query.put('q', '"tag1" "tag 2"');`
  
An `Open Salesforce record` link is available on a viewed image to view the Salesforce record associated with the album, if the IDs used for albums are actual Salesforce record IDs. The domain URL for this link is taken from the Salesforce environment; if it could not be retrieved, the URL defaults to `login.salesforce.com` or `test.salesforce.com`. To specify your own domain, set the `salesforceBaseUrl` key in the token. That is, [line 14](/src/classes/SharinPixDemoAccountContactsSearchCtrl.cls#L14) will be:
```
params = new Map<String, String> {
    'path' => '/search?search_bar=false&q=' + clientInstance.token(query),
    'salesforceBaseUrl' => 'https://custom-domain.my.salesforce.com'
};
```
and, images' record URLs will lead to, for e.g., https://custom-domain.my.salesforce.com/0Mf0Y000000PBXfAAO

### Enable download and zipping
It is possible to download the search image results into a zipped folder through the use of the following parameters.
- `download`  - (true or false ) enable or disable the download feature.
- `download_filename` - specify the name of the downloaded image file (only 1 image)
- `download_filenames` - specify the name format of the downloaded image files (multiple images)

Insert the values for these parameters within the following line of code found in the Apex controller:
```
params = new Map<String, String> { 'path' => '/search?search_bar=false&q=' + clientInstance.token(query) + '&download=true&download_filename=my_zip_filename&download_filenames=inside_the_zip-00001'};
```
Replace `my_zip_filename` and `inside_the_zip-00001` with the filename(s) of your choice.

[<img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">](https://githubsfdeploy.herokuapp.com?owner=sharinpix&repo=demo-apex&ref=account_contacts_search)
