public with sharing class CatFactService {
    public class CatFactResponse {
        public String fact;
        public Integer length;
    }

    @AuraEnabled(cacheable=true)
    public static String getRandomCatFact() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:CatFactsAPI/fact');
        req.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            CatFactResponse factObj = (CatFactResponse) JSON.deserialize(res.getBody(), CatFactResponse.class);
            return factObj.fact;
        } else {
            return 'Error: ' + res.getStatus();
        }
    }
}
