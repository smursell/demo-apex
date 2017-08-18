public with sharing class SharinPixCollageDemo {
    public String parameters {get; private set;}
    public String albumId {get; private set;}

    public SharinPixCollageDemo() {
        albumId = 'SharinPixCollageDemo';
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

    /**
     * This method generates a collage from all the images of an album.
     * 
     * @param albumId The album ID of the album that will be used to generate the collage
     * @param columns The number of columns that a collage will contain
     * @param rows The number of rows that a collage will contain
     * @param width The width of each image in the collage
     * @param height The height of each image in the collage
     * @param cropType The crop type that will be used for this collage
     * @param background The background color that will be used for the collage
     * @return Returns the list of collage URLs generated
     */
    @RemoteAction
    public static List<String> generateCollage(String albumId, Integer columns, Integer rows, Integer width, Integer height, String cropType, String background) {
        SharinPix.Utils sharinPixUtils = new SharinPix.Utils();
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
                            'width' => width,
                            'height' => height,
                            'crop' => cropType,
                            'background' => background
                        }
                    }
                });
            } else {
                List<Map<String, Object>> transformation = (List<Map<String, Object>>) imageParams.get(pic).get('transformation');
                transformation.add(new Map<String, Object> {
                    'overlay' => currentId,
                    'width' => width,
                    'height' => height,
                    'crop' => cropType,
                    'x' => column * width,
                    'y' => row * height,
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