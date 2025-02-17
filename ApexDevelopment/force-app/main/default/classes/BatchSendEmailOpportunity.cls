global with sharing class BatchSendEmailOpportunity implements Database.Batchable<SObject> {
   //write a batch class to send email to opportuniy owner whose opp have been stuck in negotiation for more than 30days
   global Database.QueryLocator start(Database.BatchableContext bc)
   {
    return Database.getQueryLocator('SELECT Id,Name,StageName,LastModifiedDate FROM Opportunity Where StageName=\'Negotiation\' AND LastModifiedDate < LAST_N_DAYS:30');
   }
   global void execute(Database.BatchableContext bc,List<Opportunity> oppList)
   {
     List<Messaging.SingleEmailMessage> mails= new List<Messaging.SingleEmailMessage>();//EMPTY LIst to store emails . A sf class used to send emailMessaging.SingleEmailMessage
     for(Opportunity opp:oppList)
     {
        User owner=[SELECT Email FROM User WHERE Id=:opp.OwnerId WITH USER_MODE LIMIT 1];//opp owner email
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();// CREATE A NEW EMAILMSG
        mail.setSubject('Reminider :Stagnant Opportunity');
        mail.setPlainTextBody('Your Opportunity '+opp.Name+ ' has been created on date '+opp.LastModifiedDate+' and stage is '+opp.StageName);
        mail.setToAddresses(new String[]{owner.Email});
        mails.add(mail);
     }
      Messaging.sendEmail(mails);
   }
   global void finish (Database.BatchableContext bc)
   {
    System.debug('email is set to the owner ');
   }
}