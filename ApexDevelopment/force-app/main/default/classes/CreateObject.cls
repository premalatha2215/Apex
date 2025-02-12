public with sharing class CreateObject {
    public static void createAccount(){
        Account account=new Account();
        account.Name='Humaira';
        account.Phone='3456789487';
        insert account;
    }
    public static void createMultipleAccount()
    {
      List<Account>  acc  =new List<Account>();
      for(Integer i=1;i<3;i++)
      {
        Account account =new Account();
        account.Name='Deloitte Employee'+i;
        account.Phone='01234567'+i;
        acc.add(account);
      }
        insert acc;
    }
}