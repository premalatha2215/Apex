global with sharing class BatchSummaryAccountReport implements Database.BatchableContext,Database.Stateful {
   //retrieve account records
   //categorizes them based on annual revenue 
   //low revenue(<1M), MEDIUM(1M-10M),HIGH(>10M)
   //END -SEND MAIL REPORT SUMMARY COUNT 
   public List<Account> lowRevenue =new List<Account>();
   public List<Account> mediumRevenue =new List<Account>();
   public List<Account> highRevenue =new List<Account>();

   global Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator('SELECT Id,Name,AnnualRevenue FROM Account Where AnnualRevenue !=null');
}
   global void execute(Database.BatchableContext bc, List<Account> accList){
       for(Account acc:accList){
           if(acc.AnnualRevenue<1000000){
               lowRevenue.add(acc);
           }
            else if(acc.AnnualRevenue>1000000 && acc.AnnualRevenue<10000000){
               mediumRevenue.add(acc);
            }
            else if(acc.AnnualRevenue>10000000)
            {
               highRevenue.add(acc);
            }
       }
       update accList;
   }
   global void finish(Database.BatchableContext bc)
   {
    Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
    mail.toaddresses(new String[]{'shaliniprema2215@gmail.com'});
    mail.setSubject('Expected outpout :An Email with summary category');
    mail.setPlainTextBody(
        'Expected Output :An email with:'+
        'Low revenue accounts:'+lowRevenue.size()+
        'Medium revenue accounts:'+mediumRevenue.size()+
        'High revenue accounts:'+highRevenue.size());
    Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
   }
}