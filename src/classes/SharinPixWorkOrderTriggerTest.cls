@isTest
public class SharinPixWorkOrderTriggerTest {

    @isTest
    public static void testWorkOrderTrigger() {
        WorkOrder wOrder = new WorkOrder(Subject='Visiting Green Field');
        Test.startTest();
        insert wOrder;
        Test.stopTest();
        List<WorkOrder> expectedWorkOrder = [
                                                    SELECT Id, Subject, SharinPix_App_URL__c, SharinPix_Token__c
                                                    FROM WorkOrder
                                                    WHERE Id = :wOrder.Id
                                                    LIMIT 1
                                                ];
        System.assertEquals('Visiting Green Field', expectedWorkOrder[0].Subject);
        System.assert(expectedWorkOrder[0].SharinPix_App_URL__c.startsWith('sharinpix://upload?token='));
        System.assert(expectedWorkOrder[0].SharinPix_Token__c.length() > 0);
    }
}