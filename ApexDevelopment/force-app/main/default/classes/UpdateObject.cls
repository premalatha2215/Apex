public with sharing class UpdateObject {
    public static void updateAccount(){
        Account acc=[Select id, Name, Phone from Account where name='Humaira' WITH USER_MODE];
        acc.Phone='8097654';
        update as user acc;
    }
}