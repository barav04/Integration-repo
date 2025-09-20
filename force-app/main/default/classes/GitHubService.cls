public with sharing class GitHubService {
    public class Repo {
        public String name;
        public String full_name;
    }

    @AuraEnabled(cacheable=true)
    public static List<Repo> getUserRepos() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:GitHubAPI/user/repos');
        req.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        system.debug('1234');
        
        if (res.getStatusCode() == 200) {
            List<Repo> repos = (List<Repo>) JSON.deserialize(res.getBody(), List<Repo>.class);
            return repos;
        } else {
            throw new AuraHandledException('GitHub API Error: ' + res.getStatus());
        }
    }
}
