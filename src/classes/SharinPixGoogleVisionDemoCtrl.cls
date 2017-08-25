public with sharing class SharinPixGoogleVisionDemoCtrl {
    public String parameters {get; private set;}
    public String albumId {get; private set;}

    private static String GOOGLE_API_KEY = 'YOUR_KEY_HERE';
    
    public SharinPixGoogleVisionDemoCtrl() {
        albumId = 'SharinPixGoogleVisionOCRDemoAlbum';
        parameters = JSON.serialize(new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                albumId => new Map<String, Object> {
                    'see' => true,
                    'image_list' => true,
                    'image_upate' => true
                }
            },
            'Id' => albumId
        });
    }

    @RemoteAction
    public static Object getGoogleVisionDetails(String imageUrl) {
        String visionEndpoint = 'https://vision.googleapis.com/v1/images:annotate?key=' + GOOGLE_API_KEY;
        HttpRequest request = new HttpRequest();
        request.setEndpoint(visionEndpoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(JSON.serialize(new Map<String, Object> {
            'requests' => new List<Object> {
                new Map<String, Object> {
                    'image' => new Map<String, Object> {
                        'source' => new Map<String, String> {
                            'imageUri' => imageUrl
                        }
                    },
                    'features' => new List<Map<String, Object>> {
                        new Map<String, Object> {
                            'type' => 'LABEL_DETECTION',
                            'maxResults' => 25
                        },
                        new Map<String, Object> {
                            'type' => 'TEXT_DETECTION',
                            'maxResults' => 25
                        },
                        new Map<String, Object> {
                            'type' => 'DOCUMENT_TEXT_DETECTION',
                            'maxResults' => 25
                        },
                        new Map<String, Object> {
                            'type' => 'FACE_DETECTION',
                            'maxResults' => 25
                        },
                        new Map<String, Object> {
                            'type' => 'LANDMARK_DETECTION',
                            'maxResults' => 25
                        },
                        new Map<String, Object> {
                            'type' => 'LOGO_DETECTION',
                            'maxResults' => 25
                        },
                        new Map<String, Object> {
                            'type' => 'SAFE_SEARCH_DETECTION',
                            'maxResults' => 25
                        },
                        new Map<String, Object> {
                            'type' => 'IMAGE_PROPERTIES',
                            'maxResults' => 25
                        }
                    }
                }
            }
        }));

        Http http = new Http();
        HttpResponse response = http.send(request);
        Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        return ((List<Object>) jsonResponse.get('responses')).get(0);
    }

    class SharinPixImage {
        public SharinPixInfos infos;
    }

    class SharinPixInfos {
        public String secure_url;
    }
}