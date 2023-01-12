public class DeleteRecordCntrl {
    
    public static void createDeleteObj(String busUnit, String obj, ID safeID){
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Deleted_Business_Unit__c = busUnit;
        delObj.scaleMatters__Deleted_Date_Time__c = system.Now();
        delObj.scaleMatters__Deleted_Object__c = obj; 
        delObj.scaleMatters__Deleted_SafeID__c = safeID;
        
        try{
            
            insert delObj;

        }catch(Exception ex){
            system.debug('Error occurs: ' + ex);
        }
        
        
    }
    
}