public with sharing class SharinPixResizeDemo {
	public String publicId {get; set;}
	public Integer height {get; set;}
	public Integer width {get; set;}
	public String imageUrl {get; set;}

	public static SharinPix.Utils sharinPixUtils = new SharinPix.Utils();

	public void resizeImage() {
		height = 100;
		width = 150;
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

	@RemoteAction
	public static String faceCrop(String publicId) {
		return (String) sharinPixUtils.getImageExternalUrl(new Map<String, Object> {
			'image_id' => publicId,
			'sharinpix' => new Map<String, Object> {
				'download' => false,
				'auto' => false,
				'full_size' => false
			},
			'transformations' => new Map<String, Object> {
				'crop' => 'thumb',
				'gravity' => 'face',
				'width' => 200,
				'height' => 200
			}
		}).get('resource_url');
	}
}