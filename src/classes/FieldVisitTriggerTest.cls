@isTest
public class FieldVisitTriggerTest {
    public static Field_Visit__c fieldVisitOne;
    public static Id expectedId;
    public static List<Field_Visit__c> expectedFieldVisit;
    
    @isTest
    public static void testFieldVisitTrigger() {
        fieldVisitOne = new Field_Visit__c(Name='Visiting Green Field');
        Test.startTest();
        insert fieldVisitOne;
        expectedId = fieldVisitOne.Id;
        expectedFieldVisit = [SELECT Id, Name, Mobile_App_URL__c, Mobile_App_Token__c
							  FROM Field_Visit__c 
                              WHERE Id = :expectedId
                              LIMIT 1
                             ];
        Test.stopTest();
		System.assertEquals('Visiting Green Field', expectedFieldVisit[0].Name);
        System.assert(expectedFieldVisit[0].Mobile_App_URL__c.startsWith('sharinpix://upload?token='));
        System.assert(expectedFieldVisit[0].Mobile_App_token__c.length() > 0);
      }
}