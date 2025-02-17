//Batch apex is used in sf to processes LARGE AMONTS OF DATA ASYNCHRONOUSLY
//usefully when u need to update,delete,insert a large no of record efficiently
//BATCH STRUCTURE 
//IMPLEMENT Database.Batchable<sobject>(mate it as batcha class process the sobject record) interface which consist of 3 methods
//start()-define the record to process
//execute()-perform actual operation
//finish()-final step after a batch is completed 
//-------------------------------------
//BATCH CLASS TO UPDATE ACCOUNT WHERE INDUSTRY IS NULL
global class BatchClassUpdateAccount implements Database.Batchable<SObject> {

    //global -allow access across the org
    //fetch record using start 
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id,Industry FROM Account Where Industry =Null');

    }
    //Perform actual operation-process record in batches(200 record at a time )
    global void execute (Database.BatchableContext bc, List<Account> accList)
    {
        for(Account acc:accList){
            acc.Industry='Agriculture';
        }
        update accList;
    }
    //Finish method -used for logging or sending the notification
    global void finish (Database.BatchableContext bc)
    {
        System.debug('Batch Processing completed');
    }
}
//creating instance of batch class ,batch is a variable stores instance os batch class
//max batch size allowed is 2000 per batch .if batch is not specified , sf default run 200/batch
//sinces it run in smaller chucks .it avoid Soql and DML Limits 
//BatchClassUpdateAccount batch =new  BatchClassUpdateAccount();
//Database.executeBatch(batch,200);
//----------------------------------------