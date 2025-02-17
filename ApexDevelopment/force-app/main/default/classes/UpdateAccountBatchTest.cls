@isTest
public with sharing class UpdateAccountBatchTest {
    @testSetup
    static void setUpTestData()
    {
        List<Account> acc=new List<Account>();
        for(Integer i=1;i<=5;i++)
        {
            acc.add(new Account (Name='Test Account'+i , Industry=NULL));
        }
        insert acc;
    }
    @isTest
    static void testBatchExecution(){
        //verify that account exist and have industry is null
        List<Account> acc=[SELECT Id,Industry FROM Account WHERE Industry=Null ];
        System.assertEquals(5, acc.size());
        //Create the Batch Class instance and execute
        Test.startTest();
        BatchClassUpdateAccount uab=new BatchClassUpdateAccount();
        Database.executeBatch(uab,200);
        Test.stopTest();
        //Assert that account have industry value
        List<Account> accUpdated=[SELECT Id,Industry FROM Account WHERE Industry='Agriculture'];
        System.Assert.areEqual(5, accUpdated.size());
    }
}