global class BatchUpdateContact implements Database.Batchable<SObject>
{
   global Database.QueryLocator start(Database.BatchableContext bc){
      //return 
      return Database.getQueryLocator('SELECT Id, Name, Status__c,Account.Active__c FROM Contact where AccountId!=Null');
    }
    global void execute (Database.BatchableContext bc, List<Contact> con)
    {
      List<Contact> updateContact =new List<Contact>();
        for(Contact a:con)
        {
            if(a.Account.Active__c=='Yes')
            {
                a.Status__c='Active';    
               
            }
            else 
                {
                    a.Status__c='InActive';  
                }
                updateContact.add(a);
        } 
            
        
        if(!updateContact.isEmpty())
        {
            update updateContact;
        }
    }
    global void finish(Database.BatchableContext bc)
    {
     //post execution tasks
    }
    
}


