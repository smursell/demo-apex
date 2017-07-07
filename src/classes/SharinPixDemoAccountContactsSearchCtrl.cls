public class SharinPixDemoAccountContactsSearchCtrl {
    public String parameters { get; set; }

    public SharinPixDemoAccountContactsSearchCtrl(ApexPages.StandardController stdCtrl) {
        Id accountId = stdCtrl.getId();
        List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId = :accountId];
        Map<String, String> query = new Map<String, String>();
        String queryStr = '';
        for (Contact contact : contacts) {
            queryStr += contact.Id + ' ';
        }
        query.put('q', queryStr);
        sharinpix.Client c = sharinpix.Client.getInstance();
        Map<String, String> params = new Map<String, String> { 'path' => '/search?search_bar=false&q=' + c.token(query) };
        parameters = JSON.serialize(params);
    }
}