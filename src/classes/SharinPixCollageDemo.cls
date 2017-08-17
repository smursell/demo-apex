public with sharing class SharinPixCollageDemo {
    public String parameters {get; set;}
    public static SharinPix.Utils sharinPixUtils = new SharinPix.Utils();
    public static String albumId {get; set;}

    static {
        albumId = 'c74c803b-62a6-4b41-b7d8-7e7e14503dae';
    }

    public SharinPixCollageDemo() {
        parameters = JSON.serialize(new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                albumId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_list' => true,
                        'image_upload' => true
                    }
                }
            },
            'Id' => albumId
        });
    }

    @RemoteAction
    public static List<String> generateCollage(String albumId, Integer columns, Integer rows, Integer widthLength, Integer heightLength, String cropType, String background) {
        List<Object> images = sharinPixUtils.getAlbumImages(albumId);
        List<String> imagePublicIds = new List<String>();
        for (Object imageObj: images) {
            Map<String, Object> image = (Map<String, Object>) imageObj;
            imagePublicIds.add((String) image.get('public_id'));
        }
        List<Map<String, Object>> imageParams = new List<Map<String, Object>>();
        for (Integer i = 0; i < imagePublicIds.size(); i++) {
            String currentId = imagePublicIds.get(i);
            Integer pic = (i / columns) / rows;
            Integer row = Math.mod((i / columns), rows);
            Integer column = Math.mod(i, columns);
            if (row == 0 && column == 0) {
                imageParams.add(new Map<String, Object> {
                    'id' => currentId,
                    'transformation' => new List<Map<String, Object>> {
                        new Map<String, Object> {
                            'width' => widthLength,
                            'height' => heightLength,
                            'crop' => cropType,
                            'background' => background
                        }
                    }
                });
            } else {
                List<Map<String, Object>> transformation = (List<Map<String, Object>>) imageParams.get(pic).get('transformation');
                transformation.add(new Map<String, Object> {
                    'overlay' => currentId,
                    'width' => widthLength,
                    'height' => heightLength,
                    'crop' => cropType,
                    'x' => column * widthLength,
                    'y' => row * heightLength,
                    'background' => background,
                    'gravity' => 'north_west'
                });
            }
        }
        List<String> imageUrls = new List<String>();
        for (Map<String, Object> imageParam: imageParams) {
            Map<String, Object> sharinpix = new Map<String, Object> {
                'download' => false,
                'auto' => false,
                'full_size' => false
            };
            imageUrls.add((String) sharinPixUtils.getImageExternalUrl(new Map<String, Object> {
                'image_id' => (String) imageParam.get('id'),
                'sharinpix' => sharinpix,
                'transformations' => (List<Object>) imageParam.get('transformation')
            }).get('resource_url'));
        }
        return imageUrls;
    }

}