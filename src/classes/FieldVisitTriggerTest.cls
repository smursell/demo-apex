@isTest
public class FieldVisitTriggerTest {

    @isTest
    public static void testFieldVisitTrigger() {
        Field_Visit__c fieldVisit = new Field_Visit__c(Name='Visiting Green Field');
        Test.startTest();
        insert fieldVisit;
        Test.stopTest();
        List<Field_Visit__c> expectedFieldVisit = [
                                                    SELECT Id, Name, Mobile_App_URL__c, Mobile_App_Token__c
                                                    FROM Field_Visit__c
                                                    WHERE Id = :fieldVisit.Id
                                                    LIMIT 1
                                                ];
        System.assertEquals('Visiting Green Field', expectedFieldVisit[0].Name);
        System.assert(expectedFieldVisit[0].Mobile_App_URL__c.startsWith('sharinpix://upload?token='));
        System.assert(expectedFieldVisit[0].Mobile_App_token__c.length() > 0);
    }
}