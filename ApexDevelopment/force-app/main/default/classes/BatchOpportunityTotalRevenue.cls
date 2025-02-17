global with sharing class BatchOpportunityTotalRevenue implements Database.Batchable<SObject>,Database.Stateful {

// write a apex class that process all the closed won oppand sum their amount field 
public Decimal totalRevenue = 0;
 
global Database.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator('SELECT Id,Amount FROM Opportunity WHERE StageName=\'Closed Won\'');
}
global void execute(Database.BatchableContext bc, List<Opportunity> scope){

    for(Opportunity opp : scope){
        totalRevenue+=opp.Amount();
    }
}
global void finish(Database.BatchableContext bc){
    System.debug('Total Revenue of all closed won opportunity'+totalRevenue);
}
}