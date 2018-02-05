public class SharinPixDemoAccountContactsSearchCtrl {
    private Map<String, String> params;
    private sharinpix.Client clientInstance = sharinpix.Client.getInstance();

    public SharinPixDemoAccountContactsSearchCtrl(ApexPages.StandardController stdCtrl) {
        Id accountId = stdCtrl.getId();
        List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId = :accountId];
        Map<String, String> query = new Map<String, String>();
        String queryStr = '';
        for (Contact contact : contacts) {
            queryStr += '"' + contact.Id + '" ';
        }
        query.put('q', queryStr);
        params = new Map<String, String> { 'path' => '/search?search_bar=false&q=' + clientInstance.token(query) };
    }
    
    public String getParameters() {
        return JSON.serialize(params);
    }
    
    public String getSearchUrl() {
        return clientInstance.getAppHost() + '?token=' + clientInstance.token(params);
    }
}
