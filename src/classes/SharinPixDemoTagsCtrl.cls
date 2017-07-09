public class SharinPixDemoTagsCtrl {
    public String parameters { get; set; }
    
    public SharinPixDemoTagsCtrl(ApexPages.StandardController controller) {
        Id contactId = controller.getId();
        Map<String, Object> params = new Map<String, Object> {
            'abilities' => new Map<String, Object> {
                contactId => new Map<String, Object> {
                    'Access' => new Map<String, Object> {
                        'see' => true,
                        'image_list' => true,
                        'image_upload' => true,
                        'image_tag' => true,
                        'image_delete' => true
                    },
                    'Tags' => new Map<String, Object> {
                        'Cartoon' => new Map<String, Object> {
                            'en' => 'Cartoon',
                            'fr' => 'Déssin Animés'
                        },
                        'Building' => new Map<String, Object> {
                            'en' => 'Building',
                            'fr' => 'Bâtiment'
                        }
                    }
                }
            }
        };
        parameters = JSON.serialize(params);
    }
}