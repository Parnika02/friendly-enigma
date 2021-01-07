public class updatePhonenumberCLASS {
    public static void updatephonenumber(list<Contact> conlist){
        list<Account> acclist = new list<Account>();   
        Account a = new Account();
        for(Contact con : conlist) {
            
            if(con.Is_Primary__c==true  && con.accountId != null ){
                list<contact> cList = [SELECT Id, Is_Primary__c FROM Contact where Is_Primary__c = true and AccountId = :con.accountId];
                if(cList.size() > 0  && a.Id == con.id ){
                    con.addError('primary contact already exsists for the account');
                    }
            }		
            if(con.Is_Primary__c==True && (con.Phone != null))	 {
                
                a.Id = con.AccountId;
                a.Phone = con.Phone;
                acclist.add(a); 
            }
        }
        update acclist;
    }}