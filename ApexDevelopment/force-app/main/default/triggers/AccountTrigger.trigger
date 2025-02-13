trigger AccountTrigger on Account  (before insert,before delete) {
 if(Trigger.isBefore && Trigger.isInsert)
 {
    AccountHandler.updateAccountDescription(Trigger.New);
 }
 if (Trigger.isBefore && Trigger.isdelete)
 {
    AccountHandler.deleteAccountPrevention(Trigger.old);

 }
}