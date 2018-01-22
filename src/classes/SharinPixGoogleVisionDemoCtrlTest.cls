@isTest
public class SharinPixGoogleVisionDemoCtrlTest {

    @isTest
	static void testSharinPixGoogleVisionDemoConstructor() {
		Test.startTest();
		SharinPixGoogleVisionDemoCtrl demoCtrl = new SharinPixGoogleVisionDemoCtrl();
		String albumId = 'SharinPixGoogleVisionOCRDemoAlbum';
        String parameters = JSON.serialize(new Map<String, Object> {
            'abilities' => new Map<String, Object> {
             	albumId => new Map<String, Object> {
                    'see' => true,
                    'image_list' => true,
                    'image_update' => true
                }
            },
            'Id' => albumId
        });
		Test.stopTest();        
        System.assert(demoCtrl.parameters.indexOf('{"image_update":true,"image_list":true,"see":true}') > 0);
	}

    @isTest 
    static void testCallout() {
       Test.setMock(HttpCalloutMock.class, new GoogleVisionMockResponse());
       String res = (String) SharinPixGoogleVisionDemoCtrl.getGoogleVisionDetails('http://via.placeholder.com/350x150');
	   System.assertEquals('data-response', res);
	}

	public class GoogleVisionMockResponse implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            System.assert(req.getEndpoint().startsWith('https://vision.googleapis.com/v1/images:annotate?key='));
            System.assertEquals('POST', req.getMethod());
    
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String body =  JSON.serialize(new Map<String, Object> {
                'responses' => new List<String> {
               		'data-response'
                }
            });
            res.setBody(body);
            res.setStatusCode(200);
            return res;
        }
	}
}