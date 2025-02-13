public with sharing class ContactHandler {
    public static void updateContactDetails(List<Contact> con){
        //Trigger to Update Contact Last Name Before Update:
        for(Contact c:con){
          c.LastName= 'Updated LastName';
        }

    
    }
}