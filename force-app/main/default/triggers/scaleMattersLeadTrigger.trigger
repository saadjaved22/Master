trigger scaleMattersLeadTrigger on Lead (after Delete, after Update) {
    
    //checking if permission to run triggers exists in custom settings object 
    List<scaleMatters__Run_Triggers__c> runTriggersList = [Select scaleMatters__Deactivate_All__c, scaleMatters__Run_Delete_Trigger__c	, scaleMatters__Run_Discard_Trigger__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c LIKE 'scaleMatters Run Triggers' AND isDeleted = false ];
	
    if(runTriggersList.size()>0 && runTriggersList[0].scaleMatters__Deactivate_All__c != true){
      
	if(runTriggersList[0].scaleMatters__Run_Discard_Trigger__c){
    //execute this block whenever Lead record is Updated    
    if(Trigger.isUpdate){
        
        //creating List of Discard Object to create bulkified discard records 
        List<scaleMatters__Discarded_Record__c> discList = new List<scaleMatters__Discarded_Record__c>();
        //creating Map to store record ids and Discard value from Trigger.Old context variable    
    	Map<ID,Boolean> oldDiscardMap = new Map<ID,Boolean>();
    
        for(Lead lead: Trigger.Old){
            
            oldDiscardMap.put(lead.Id, lead.scaleMatters__Lead_Discard__c);
            
        }    
    	for(Lead lead: Trigger.New){
            
            //running loop on Old Discard Map to verify if Discard checkbox was set to true and its old values was not true
            for(ID leadID: oldDiscardMap.keySet()){
                if(lead.ID == leadID && lead.scaleMatters__Lead_Discard__c !=  oldDiscardMap.get(leadID) && lead.scaleMatters__Lead_Discard__c){
                   scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
                   discObj.scaleMatters__Discarded_Business_Unit__c = lead.scaleMatters__Business_Unit__c;
                   discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
                   discObj.scaleMatters__Discarded_Object__c = 'Lead'; 
                   discObj.scaleMatters__Discarded_SafeID__c = lead.Id;
                   discList.add(discObj);  
                                
                }
            }
    	}
        
        //checking if Discard List contains any records, if yes insert this List
        if(discList.size()>0){
    	insert discList;     
        }
        
    }
        
    }else{
        
        //do nothing as permission to run this trigger was revoked
        
    }
        
    if(runTriggersList[0].scaleMatters__Run_Delete_Trigger__c){ 
    //execute this block whenever Lead record is deleted    
    if(Trigger.isDelete){
        //creating List of Delete Object to create bulkified discard records    
        List<scaleMatters__Deleted_Record__c> delList = new List<scaleMatters__Deleted_Record__c>();
    	for(Lead lead: Trigger.Old){
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Deleted_Business_Unit__c = lead.scaleMatters__Business_Unit__c;
        delObj.scaleMatters__Deleted_Date_Time__c = system.Now();
        delObj.scaleMatters__Deleted_Object__c = 'Lead'; 
        delObj.scaleMatters__Deleted_SafeID__c = lead.Id;
   
        delList.add(delObj);


    }
        
        //checking if delete List contains any records, if yes insert this List
        if(delList.size()>0){    
    	insert delList;
        }
        
     
    }
        
    }else{
        
         //do nothing as permission to run this trigger was revoked

        
    }
    }else{
        
        //do nothing as permission to run this trigger was revoked
        
    }
    
}