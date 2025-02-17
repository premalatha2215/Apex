global with sharing class BatchUpdateHasOptedOutOfEmail implements Database.Batchable<SObject>, Database.Stateful {

    public Integer numberOfRecords = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name FROM Contact WHERE HasOptedOutOfEmail__c = false');
    }

    global void execute(Database.BatchableContext bc, List<Contact> contactList) {
        List<Contact> contactsToUpdate = new List<Contact>();

        for (Contact contact : contactList) {
            contact.HasOptedOutOfEmail__c = true;
            contactsToUpdate.add(contact);
        }

        numberOfRecords += contactList.size();

        update contactsToUpdate;
    }

    global void finish(Database.BatchableContext bc) {
        System.debug('Number of records updated: ' + numberOfRecords);
    }
}
