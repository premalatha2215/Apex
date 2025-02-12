public with sharing class DeleteAccount {
    public static void deleteAccountRecord(){

        Account acc=[select id, name from Account where name='Humaira'  WITH USER_MODE];
        delete as user acc;
    }
}
//CRUD VIOLATION occurs when apex code queries or modify the record without checking user permission
//ONE WAY
/* To fix this use schema.SObjectType to check permission ,FLS before any DML Operation
Schema.SObjectType.Account.isAccessible()-read records
Schema.SObjectType.Account.isCreatable()-create
Schema.SObjectType.Account.isUpdateable()-modify
Schema.SObjectType.Account.isDeleteable()-delete
Schema.SObjectType.Account.fields.Status__c.isAccessible()-field level read
 */

 //OTHER WAY 
 //By default apex code runs in System mode which ingores user permission and allow access to all data 
 //Use WITH USER_MODE ensure the apex code respects user permission including crud, FLS,Sharing rules