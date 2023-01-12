trigger scaleMattersOpportunityTrigger on Opportunity (after update , after Delete, after Insert) {
    
    //checking if permission to run triggers exists in custom settings object 
    List<scaleMatters__Run_Triggers__c> runTriggersList = [Select scaleMatters__Deactivate_All__c, scaleMatters__Run_Opportunity_Triggers__c, scaleMatters__Run_Delete_Trigger__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c LIKE 'scaleMatters Run Triggers' AND isDeleted = false ];
	
    if(runTriggersList.size()>0 && runTriggersList[0].scaleMatters__Deactivate_All__c != true){
    		
    if(runTriggersList[0].scaleMatters__Run_Opportunity_Triggers__c){
    
    //creating List of ids to store ids from Trigger.New context variable    
    List<ID> oppSetNew = new List<ID>();
    
    
        
    //execute this block whenever opportunity record is created    
    if(Trigger.isInsert){
        
        for(Opportunity opp: Trigger.New){
                
                oppSetNew.add(opp.Id);
        }
    //checking if Boolean Variable in OpportunityBatchUpdate is set to true , to avoid trigger recursion
    if(scaleMattersOpportunityBatch.firstRun){
                
        		//setting Boolean variable in OpportunityBatchUpdate value to false , to avoid trigger recursion and calling insertOppStage method
                scaleMattersOpportunityBatch.firstRun = false;
                scaleMattersOpportunityBatch.insertOppStage(oppSetNew);

                
    		}
        	
        
    }
    
    //execute this block whenever opportunity record is updated        
    if(Trigger.isUpdate){
        
        //creating Map to store record ids and StageName value from Trigger.Old context variable     
   		Map<ID, String> oppStagesMap = new Map<ID, String>();
        
        //creating Map to store ID and Discard checkbox value from trigger.Old Context variable to process Record Discard Operation
        Map<ID,Boolean> oldDiscardMap = new Map<ID,Boolean>();
        
        //creating List of Discard Object to create bulkified discard records 
    	List<scaleMatters__Discarded_Record__c> discList = new List<scaleMatters__Discarded_Record__c>();
        
        
        for(Opportunity opp: Trigger.Old){
            
                oppStagesMap.put(opp.Id, opp.StageName);
            	oldDiscardMap.put(opp.Id , opp.scaleMatters__Opportunity_Discard__c);
                
            }
           
        
        for(Opportunity opp: Trigger.New){
                
        oppSetNew.add(opp.Id);
            
        //running loop on Old Discard Map to verify if Discard checkbox was set to true and its old values was not true    
        for(ID oppID: oldDiscardMap.keySet()){
                    if(opp.Id == oppID && opp.scaleMatters__Opportunity_Discard__c != oldDiscardMap.get(oppID) && opp.scaleMatters__Opportunity_Discard__c ){
                        
                        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        				discObj.scaleMatters__Discarded_Business_Unit__c = opp.scaleMatters__Business_Unit__c;
        				discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        				discObj.scaleMatters__Discarded_Object__c = 'Opportunity'; 
        				discObj.scaleMatters__Discarded_SafeID__c = opp.Id;
            			discList.add(discObj);
                        
                    }
                }
                
             
       }
        
        //checking if Discard List contains any records, if yes insert this List 
        if(discList.size()>0){
        insert discList;
        }

        //checking if Boolean Variable in OpportunityBatchUpdate is set to true , to avoid trigger recursion
        if(scaleMattersOpportunityBatch.firstRun){
                    
            		//setting Boolean variable in OpportunityBatchUpdate value to false , to avoid trigger recursion and calling insertOppStage method
                    scaleMattersOpportunityBatch.firstRun = false;
                    scaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppSetNew);

                
    		}
        	
    }
    
    }else{
        
            //do nothing, as permission to run this trigger was revoked
        
        
    }
        
    if(runTriggersList[0].scaleMatters__Run_Delete_Trigger__c  && runTriggersList[0].scaleMatters__Deactivate_All__c != true ){
    
    //execute this block whenever opportunity record is deleted    
    if(Trigger.isDelete){
    
    //creating list of Deleted Records to insert bulkified delete records     
    List<scaleMatters__Deleted_Record__c> delList = new List<scaleMatters__Deleted_Record__c>();
        
        
    for(Opportunity opp: Trigger.Old){
    		
            scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        	delObj.scaleMatters__Deleted_Business_Unit__c = opp.scaleMatters__Business_Unit__c;
        	delObj.scaleMatters__Deleted_Date_Time__c = system.Now();
        	delObj.scaleMatters__Deleted_Object__c = 'Opportunity'; 
        	delObj.scaleMatters__Deleted_SafeID__c = opp.ID;
        	delList.add(delObj);  

            }
        //checking if delete List contains any records, if yes insert this List 
        if(delList.size()>0){    
    	insert delList;
        }
        		        
    }
        
    }else{
        
            //do nothing, as permission to run this trigger was revoked

    }
        
    }else{
        
            //do nothing, as permission to run this trigger was revoked

    }
    
    
    
}