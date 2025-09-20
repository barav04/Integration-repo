/*Exercise 3: Map of Account Id → Account
Query 5 Accounts.
Store them in a Map<Id, Account>.
Loop through the map and debug Id → Name.
Retrieve one Account by its Id from the map.
*/

public with sharing class listsmaps {
    public listsmaps() {
        list<account> accList = [select id,name from Account limit 5];
        /*Map<Id, Account> accMap = new Map<Id, Account>(accList);
        system.debug(accMap);
*/
        
        
        for (Account acc :acclist) {
            // System.debug(acc.name);
            Map<Id, Account> accMap = new Map<Id, Account>();
            accMap.put(acc.id,acc);
        }
        system.debug(accMap);
        
    }
}