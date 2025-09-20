// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

        list<account> accList = [select id,name from Account limit 5];
        for (Account acc :acclist) {
            // System.debug(acc.name);
            Map<Id, Account> accMap = new Map<Id, Account>();
            accMap.put(acc.id,acc);
            system.debug(accMap);
        }