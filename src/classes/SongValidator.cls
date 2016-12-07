public with sharing class SongValidator implements Validator{
	public SongValidator() {
		
	}

	public boolean validateRecord(sObject obj){
		obj = (Song__c)obj;

		return true;
	} //make trows exceptions!
	public boolean validateRecordList(List<Song__c> objList){
		//objList.get(0).addError('err');
		for(Song__c songIterator: objList){
			if(songIterator.Track_Licenses__c<0){
				songIterator.addError('Track Licenses Varible must be bigger than zero');
			}
			if(songIterator.Length_m__c < 0){
				songIterator.addError('Length Varible must be bigger than zero');
			}
			if(songIterator.Track_Count__c < 0){
				songIterator.addError('Track Count Varible must be bigger than zero');
			}
		}
		return true;

	}//make trows exceptions!
}