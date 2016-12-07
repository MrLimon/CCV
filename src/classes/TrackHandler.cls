public with sharing class TrackHandler implements ITrigger
{

    private List<Track__c> trackList;
   /**
     * bulkBefore
     *
     * This method is called prior to execution of a BEFORE trigger. Use this to cache
     * any data required into maps prior execution of the trigger.
     */
     public  void bulkBefore(){

     }
     
    /**
     * bulkAfter
     *
     * This method is called prior to execution of an AFTER trigger. Use this to cache
     * any data required into maps prior execution of the trigger.
     */
     public  void bulkAfter(){
       
     }
     
    /**
     * beforeInsert
     *
     * This method is called iteratively for each record to be inserted during a BEFORE
     * trigger. Never execute any SOQL/SOSL etc in this and other iterative methods.
     */
    public  void beforeInsert(){
        
    }
     
    /**
     * beforeUpdate
     *
     * This method is called iteratively for each record to be updated during a BEFORE
     * trigger.
     */
    public  void beforeUpdate(){
        
    }

    /**
     * beforeDelete
     *
     * This method is called iteratively for each record to be deleted during a BEFORE
     * trigger.
     */
    public  void beforeDelete(){

    }

    /**
     * afterInsert
     *
     * This method is called iteratively for each record inserted during an AFTER
     * trigger. Always put field validation in the 'After' methods in case another trigger
     * has modified any values. The record is 'read only' by this point.
     * этот метод будет вызываться в цикли из фабрики
     */
    public  void afterInsert(){
        List<Id> idList = new List<Id>();
        List<Song__c> songList = new List<Song__c>();
        trackList = trigger.new;

        for(Track__c i : trackList){
            idlist.add(i.Song__c);// это id песни!!!!!!!!!!!!!
        }
        for(Song__c i : [select Name, Track_Count__c, Track_Licenses__c from Song__c where Id IN : (idlist)]){
            i.Track_Licenses__c = i.Track_Licenses__c-1;
            i.Track_Count__c = i.Track_Count__c+1;
            songList.add(i);
        }
        update songList;
    }

    /**
     * afterUpdate
     *
     * This method is called iteratively for each record updated during an AFTER
     * trigger.
     */
    public  void afterUpdate(){
        
    }

    /**
     * afterDelete
     *
     * This method is called iteratively for each record deleted during an AFTER
     * trigger.
     */
    public void afterDelete(){
        List<Id> idList = new List<Id>();
        List<Song__c> songList = new List<Song__c>();
        trackList = trigger.old;

        for(Track__c i : trackList){
            idlist.add(i.Song__c);// это id песни!!!!!!!!!!!!!
        }
        for(Song__c i : [select Name, Track_Count__c, Track_Licenses__c from Song__c where Id IN : (idlist)]){
            i.Track_Licenses__c = i.Track_Licenses__c+1;
            i.Track_Count__c = i.Track_Count__c-1;
            songList.add(i);
        }
        update songList;
    }

    /**
     * andFinally
     *
     * This method is called once all records have been processed by the trigger. Use this 
     * method to accomplish any final operations such as creation or updates of other records.
     */
    public  void andFinally(){

    }
}