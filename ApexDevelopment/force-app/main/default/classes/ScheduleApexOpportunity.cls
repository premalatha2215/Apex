global with sharing class ScheduleApexOpportunity implements Schedulable{
  //Clean all opportunities which were closed 60 days ago. 
  global void execute(SchedulableContext sc)
  {
     List<Opportunity> opp=[SELECT Id,Name,Amount,CloseDate FROM Opportunity Where isClosed =true AND CloseDate=Last_N_Days:60];
     try{
        if(opp.size()>0 && opp!=null)
        {
            delete opp;
        }
        
     }
     catch(Exception e)
     {
        System.debug('ERROR'+e.getMessage());
     }
     
  }
}