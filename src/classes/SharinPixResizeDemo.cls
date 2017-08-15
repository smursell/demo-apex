public with sharing class SharinPixResizeDemo {
	public String albumId {get; set;}
	public String parameters {get; set;}

	public static SharinPix.Utils sharinPixUtils = new SharinPix.Utils();

	public SharinPixResizeDemo() {
		albumId = generateRandomString();
		parameters = JSON.serialize(new Map<String, Object> {
			'abilities' => new Map<String, Object> {
				albumId => new Map<String, Object> {
					'Access' => new Map<String, Object> {
						'see' => true,
						'image_list' => true
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

	public String generateRandomString() {
		return 'demo_' + generateRandomString(32);
	}

	public static String generateRandomString(Integer len) {
		final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
		String randStr = '';
		while (randStr.length() < len) {
			Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
			randStr += chars.substring(idx, idx+1);
		}
		return randStr; 
	}
}