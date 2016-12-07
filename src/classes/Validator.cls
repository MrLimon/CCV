public interface Validator{
	boolean validateRecord(sObject obj); //make trows exceptions!
	boolean validateRecordList(List<sObject> objList);//make trows exceptions!
}