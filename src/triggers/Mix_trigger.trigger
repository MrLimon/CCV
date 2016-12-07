trigger Mix_trigger on Mix__c (before insert, after insert, before update, after update, before delete, after delete) {
	TriggerFactory.createHandler(Mix__c.sObjectType);
}