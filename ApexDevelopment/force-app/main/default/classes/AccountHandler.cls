public with sharing class AccountHandler {
    public static void updateAccountDescription(List<Account> updateAccountDescription){
        //Formal parameter naming convention-camelcase 
        //Trigger to Update Account Description Before Insert:
       for (ACCOUNT acc:UpdateAccountDescription){
        acc.Description='Account Created by'+acc.CreatedBy.LastName;
       }
    }
    //Trigger to Prevent Account Deletion
    public static void deleteAccountPrevention(List<Account> accList)
    {
      for (Account acc:accList){
        if(acc.Type=='Prospect')
        {
            acc.addError('This Account cannot be deleted');
        }
      }
    }
}
