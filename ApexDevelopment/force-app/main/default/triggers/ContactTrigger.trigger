trigger ContactTrigger on Contact (before update) {
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        ContactHandler.updateContactDetails(Trigger.New);
    }
}