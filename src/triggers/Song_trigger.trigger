trigger Song_trigger on Song__c (before insert, after insert, before update, after update, before delete, after delete) {
	System.debug('trigger');
	TriggerFactory.createHandler(Song__c.sObjectType);
}