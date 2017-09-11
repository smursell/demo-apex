public class SharinPixDemoMobileAppLauncherCtrl {
    private sharinpix.Client clientInstance = sharinpix.Client.getInstance();

    public PageReference getMobileAppUrl() {
        String albumId = ApexPages.currentPage().getParameters().get('id');
        String name = ApexPages.currentPage().getParameters().get('name');
        if (String.isBlank(name)) name = albumId;
        String encodedParams = ApexPages.currentPage().getParameters().get('params');
        String params = String.isBlank(encodedParams) ? '' : '&' + EncodingUtil.urlDecode(encodedParams, 'utf-8');

        //String appUrl = clientInstance.getAppHost() + '/native_upload?token=' + getToken(albumId, name) + params; // Web version
        String appUrl = 'sharinpix://upload?token=' + getToken(albumId, name) + params;
        PageReference pageRef = new PageReference(appUrl);
        pageRef.setRedirect(true);
        return pageRef;
    }

    private String getToken(String albumId, String name) {
        String token = clientInstance.token(
            new Map<String, Object> {
                'album_id' => albumId,
                'exp' => 0,
                'path' => '/pagelayout/' + albumId,
                'name' => name,
                'native_app_options' => new Map<String, String> { },
                'abilities' => new Map<String, Object> {
                    albumId => new Map<String, Object> {
                        'Access' => new Map<String, Boolean> {
                            'see' => true,
                            'image_list' => true,
                            'image_upload' => true,
                            'image_delete' => true,
                            'image_annotate' => true
                        }
                    },
                    'Display' => new Map<String, Object>{
                        'tags'=> true
                    }
                }
            }
        );
        return token;
    }
}