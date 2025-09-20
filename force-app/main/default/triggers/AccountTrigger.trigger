trigger AccountTrigger on Account (before insert, after insert) {
    If(Trigger.isBefore){
        AccountTriggerHandler.setIndustry(trigger.new);
    }
    if(Trigger.isAfter) {
        AccountTriggerHandler.createContact(trigger.new);
    }
}