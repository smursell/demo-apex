@isTest
private class FlowControllerTest
{
	@isTest
	static void testFlowControllerConstructor(){
		Account acc = new Account(Name='Edge Telecommunications');
		insert acc;
		ApexPages.StandardController controller = new ApexPages.StandardController(acc);
		Test.startTest();
		FlowController flowCtrl = new FlowController(controller);
		Test.stopTest();
		System.assertEquals(acc.Id, controller.getId());
	}

	@isTest
	static void testFlowReference(){
		Account acc = new Account(Name='Edge Telecommunications');
		insert acc;
		ApexPages.StandardController controller = new ApexPages.StandardController(acc);
		Test.startTest();
		FlowController flowCtrl = new FlowController(controller);
		flowCtrl.sp_flow = new Flow.Interview.SharinPix_Account_Contacts(new Map<String, Object>());
		Test.stopTest();
		System.assertNotEquals(null, flowCtrl.sp_flow);
	}
}