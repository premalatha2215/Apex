global with sharing class BatchTrackAccount implements Database.Batchable<SObject,Database.Stateful>{
    //write a batch apex job that updates account records by setting a new priority fields to high 
    public List<Id> failedAccount =new List<Id>();
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id,Name,Priority FROM Account ');
    }
    global void execute(Database.BatchableContext bc,List<Account> acc)
    {
        List<Account> accountToUpdate = new List<Account>();

        for (Account accList : acc ) {
             
             try{accList .Priority = 'High';
             accountToUpdate.add(accList);}
             catch(Exception e){
                failedAccount.add(accList.Id);
            }
             }
        update contactsToUpdate;
        }
    global void finish(Database.BatchableContext bc)
{
    if(!failedAccount.isEmpty())
    {
            Messaging.SingleEmailMessage mail=new  Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[]{'shaliniprema2215@gmail.com'});
            mail.plaintextbody('Failed Account Ids:'+string.join(failedAccount,','));
            mail.setSubject('Failed Accounts');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});

    }
}
        
}
