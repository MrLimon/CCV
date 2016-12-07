@isTest
public class TestDataFactory {

    public static Mix__c createOneMixStatement(
                                                 Boolean withTrack) { 
        // Create one invoice statement
        Mix__c testMix = createMixStatement();    
        
        if (withTrack == true) {
            // Create a merchandise item
            Song__c s = addSongItem('Numb');
            // Create one line item and associate it with the invoice statement.        
            addSong(testMix, s);
        }                   
        
        return testMix;
    }            
    
    // Helper methods
    //
    private static Song__c addSongItem(String merchName) {
        Song__c m = [select Id, Name from Song__c where Name =: merchName];//new Merchandise__c(
         //   Name=merchName,
           // Description__c='Fresh juice',
            //Price__c=2,
            //Total_Inventory__c=1000);
       // insert m;
        return m;
    }
    
    private static Mix__c createMixStatement() {        
        Mix__c mix = new Mix__c();      
        insert mix;
        
        return mix;
    } 
    
    private static Track__c addSong(Mix__c mix, 
                                            Song__c s) {
        Track__c track = new Track__c(
                                    Mix__c = mix.Id, 
                                    Song__c = s.Id
                                    //Unit_Price__c = m.Price__c, 
                                    //Units_Sold__c = (Double)(10*Math.random()+1)
                                    );
        insert track;
        
        return track;
    }       
}