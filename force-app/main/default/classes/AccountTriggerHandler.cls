public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {

    }

    public static void setIndustry(List<Account> accList) {
        for(Account acc:accList){
            If(acc.Industry == null) {
                acc.Industry = 'Technology';
            }
        }
    }

    public static void createContact(List<Account> accList) {
        List<Contact> conList = new List<Contact>();
        System.debug(accList);

        for (Account acc:accList) {
            for(Integer i = 1; i<=5 ; i++) {
                Contact con = new Contact();
                con.FirstName = 'Fname' + i;
                con.LastName  = 'Lname' + i;
                con.AccountId = acc.Id;
                conList.add(con);
                System.debug(con);
            }
        }
        insert conList;
    }
}