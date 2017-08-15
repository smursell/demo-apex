public with sharing class SharinPixResizeDemo {
	public String albumId {get; set;}
	public String parameters {get; set;}

	public static SharinPix.Utils sharinPixUtils = new SharinPix.Utils();

	public SharinPixResizeDemo() {
		albumId = 'f9d581da-6121-4a92-a539-cef3fe1d68e5';
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
	public static String resizeImage(String publicId, Integer width, Integer height) {
		return (String) sharinPixUtils.getImageExternalUrl(new Map<String, Object> {
			'image_id' => publicId,
			'sharinpix' => new Map<String, Object> {
				'download' => false,
				'auto' => false,
				'full_size' => false
			},
			'transformations' => new Map<String, Object> {
				'crop' => 'fill',
				'width' => width,
				'height' => height
			}
		}).get('resource_url');
	}

}