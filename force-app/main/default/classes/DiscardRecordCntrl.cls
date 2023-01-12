public class DiscardRecordCntrl {
    
	public static boolean firstRun = true;
    /**
    public static void createDiscardObj(String busUnit, String obj, ID safeID){
        
        scaleMatters__Discarded_Record__c delObj = new scaleMatters__Discarded_Record__c();
        delObj.scaleMatters__Discarded_Business_Unit__c = busUnit;
        delObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        delObj.scaleMatters__Discarded_Object__c = obj; 
        delObj.scaleMatters__Discarded_SafeID__c = safeID;
        
        try{
            
            insert delObj;

        }catch(Exception ex){
            system.debug('Error occurs: ' + ex);
        }
        
        
    }
    **/
    
    public static void createBulkifiedDisc(List<Opportunity> oppObj){
        
        List<scaleMatters__Discarded_Record__c> discList = new List<scaleMatters__Discarded_Record__c>();
        
        for(Opportunity opp: oppObj){
            
            if(opp.scaleMatters__Opportunity_Discard__c){
                
                scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        		discObj.scaleMatters__Discarded_Business_Unit__c = opp.scaleMatters__Business_Unit__c;
        		discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        		discObj.scaleMatters__Discarded_Object__c = 'Opportunity'; 
        		discObj.scaleMatters__Discarded_SafeID__c = opp.Id;
                discList.add(discObj);
                
                
            }
            
        }
        
        insert discList;
        
        
    }
    

}