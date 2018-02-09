@isTest
public class SharinPixCaseTriggerTest {

    @isTest
    public static void testCaseTrigger() {
        Case newCase = new Case(Status ='New', Origin='Email');
        Test.startTest();
        insert newCase;
        Test.stopTest();
        List<Case> expectedCase = [
                                                    SELECT Id, Status, SharinPix_App_URL__c, SharinPix_Token__c
                                                    FROM Case
                                                    WHERE Id = :newCase.Id
                                                    LIMIT 1
                                                ];
        System.assertEquals('New', expectedCase[0].Status);
        System.assert(expectedCase[0].SharinPix_App_URL__c.startsWith('sharinpix://upload?token='));
        System.assert(expectedCase[0].SharinPix_Token__c.length() > 0);
    }
}