trigger Track_trigger on Track__c (before insert, after insert, before update, after update, before delete, after delete ) {
	 TriggerFactory.createHandler(Track__c.sObjectType);

}