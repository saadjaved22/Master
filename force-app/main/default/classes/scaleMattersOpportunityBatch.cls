public class scaleMattersOpportunityBatch {
    
    //boolean variable used by triggers to avoid Trigger Recursion 
    public static boolean firstRun = true;  
    
    //method to process on bulkified stages updates for Opportunity inserts
    public static void insertOppStage(List<ID> newSet){
        
        //quering to get actual stage mapping values stored in Custom settings                
        List<scaleMatters__Stage_Mapping__c> csList = [select scaleMatters__LSBL1__c,scaleMatters__LSBL2__c,scaleMatters__LSBL3__c,scaleMatters__LSBL4__c,scaleMatters__LSBL5__c,scaleMatters__LSBL6__c,scaleMatters__LSBL7__c,scaleMatters__LSBL8__c,scaleMatters__LSBLCW__c,scaleMatters__LSBLCL__c,scaleMatters__LSBLIC__c,scaleMatters__LSBLIG__c, scaleMatters__isGhosted_Mapping__c, scaleMatters__isCertified_Mapping__c, scaleMatters__Closed_Won_Mapping__c, scaleMatters__Closed_Lost_Mapping__c, scaleMatters__Stage_1_Mapping__c,scaleMatters__Stage_2_Mapping__c,scaleMatters__Stage_3_Mapping__c,scaleMatters__Stage_4_Mapping__c,scaleMatters__Stage_5_Mapping__c,scaleMatters__Stage_6_Mapping__c,scaleMatters__Stage_7_Mapping__c,scaleMatters__Stage_8_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false];    
        
        if(csList.size()>0){
        
        //quering Opportunity records from List of Ids passed in from Trigger    
        List<Opportunity> oppListNew = [select CreatedDate, scaleMatters__scaleMatters_Currency_7__c,scaleMatters__scaleMatters_Currency_8__c, scaleMatters__S1_Date__c, scaleMatters__MRR__c, scaleMatters__ACV__c, scaleMatters__FYCV__c, scaleMatters__TCV__c, scaleMatters__OneTime_Fee__c, scaleMatters__Product_OneTime_Fee__c,ID,StageName,scaleMatters__S2_Date__c,scaleMatters__S3_Date__c,scaleMatters__S4_Date__c,scaleMatters__S5_Date__c,scaleMatters__S6_Date__c,scaleMatters__S7_Date__c,scaleMatters__S8_Date__c,scaleMatters__S9_Date__c,scaleMatters__S10_Date__c from Opportunity where ID IN : newSet];
        
        //variables to process and get what is new stage's Numeric values    
        String stageNew;       
        
        for(Opportunity oppNew : oppListNew){
                    
            		//calling out setStageValue method and passing new stage value to get Numeric value              
                    stageNew = setStageValue(oppNew.StageName ,  csList);
                    
            		//setting s1 date value to create date 
                    if(oppNew.scaleMatters__S1_Date__c == Null){
                        oppNew.scaleMatters__S1_Date__c = date.newinstance(oppNew.CreatedDate.year(), oppNew.CreatedDate.month(), oppNew.CreatedDate.day());
                    }
                    
            		//setting stage date values as per numeric value retrieved from setStageValue method
                    if(stageNew!=null){
                        if(stageNew == '2'){
                            oppNew.scaleMatters__S2_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL2__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                        }else if(stageNew=='3'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S3_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL3__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;

        				}else if(stageNew=='4'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
            				oppNew.scaleMatters__S3_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S4_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL4__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;


        				}else if(stageNew=='5'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
            				oppNew.scaleMatters__S3_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S4_Date__c==Null){
            				oppNew.scaleMatters__S4_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S5_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL5__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;


        				}else if(stageNew=='6'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
           	 				oppNew.scaleMatters__S3_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S4_Date__c==Null){
            				oppNew.scaleMatters__S4_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S5_Date__c==Null){
            				oppNew.scaleMatters__S5_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S6_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL6__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;



        				}else if(stageNew=='7'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            				}
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL7__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;
                
                            }else if(stageNew=='8'){
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL8__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
                
                            }else if(stageNew=='9'){
                            //opportunity reaches Closed Lost Stage , we dont have to update anything in this stage
    
                            }else if(stageNew=='10'){
                
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S8_Date__c==Null){
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S9_Date__c==Null){
                            oppNew.scaleMatters__S9_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLCW__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;


    
                            }else if(stageNew == '11'){                
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S8_Date__c==Null){
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S9_Date__c==Null){
                            oppNew.scaleMatters__S9_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = true;
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIC__c;

    
                
                            }else if(stageNew == '12'){
                            oppNew.scaleMatters__IsGhosted__c = true;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
    
    
                            }
                        }
                        
                    
            
        		}
        
              
        update oppListNew;
            
            
        }      
        
        
        
    	}
    //method to process on bulkified stages updates for updates
    public static void updateOppStage(Map<ID,String> oppMap, List<ID> newSet){
        
        //quering sync mapping custom setting object
        List<scaleMatters__Sync_Mapping__c> smList = [select scaleMatters__Filter_Type__c, scaleMatters__Filtering_Logic__c, scaleMatters__Name__c,scaleMatters__Sync_Mapping__c,scaleMatters__Filter_1_Mapping__c,scaleMatters__Filter_2_Mapping__c,scaleMatters__Filter_3_Mapping__c,scaleMatters__Filter_4_Mapping__c,scaleMatters__Filter_5_Mapping__c,scaleMatters__Filter_6_Mapping__c,scaleMatters__Filter_7_Mapping__c,scaleMatters__Filter_8_Mapping__c,scaleMatters__Filter_9_Mapping__c,scaleMatters__Filter_10_Mapping__c,scaleMatters__Filter_11_Mapping__c,scaleMatters__Filter_12_Mapping__c,scaleMatters__Filter_13_Mapping__c,scaleMatters__Filter_14_Mapping__c,scaleMatters__Filter_15_Mapping__c,scaleMatters__Filter_16_Mapping__c,scaleMatters__Filter_17_Mapping__c,scaleMatters__Filter_18_Mapping__c , scaleMatters__Filter_19_Mapping__c, scaleMatters__Filter_20_Mapping__c, scaleMatters__Filter_21_Mapping__c, scaleMatters__Filter_22_Mapping__c, scaleMatters__Filter_23_Mapping__c, scaleMatters__Filter_24_Mapping__c, scaleMatters__Filter_25_Mapping__c	 from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'];
                
        //quering stage mapping custom setting object             
        List<scaleMatters__Stage_Mapping__c> csList = [select scaleMatters__LSBL1__c,scaleMatters__LSBL2__c,scaleMatters__LSBL3__c,scaleMatters__LSBL4__c,scaleMatters__LSBL5__c,scaleMatters__LSBL6__c,scaleMatters__LSBL7__c,scaleMatters__LSBL8__c,scaleMatters__LSBLCW__c,scaleMatters__LSBLCL__c,scaleMatters__LSBLIC__c,scaleMatters__LSBLIG__c, scaleMatters__isGhosted_Mapping__c, scaleMatters__isCertified_Mapping__c, scaleMatters__Closed_Won_Mapping__c, scaleMatters__Closed_Lost_Mapping__c, scaleMatters__Stage_1_Mapping__c,scaleMatters__Stage_2_Mapping__c,scaleMatters__Stage_3_Mapping__c,scaleMatters__Stage_4_Mapping__c,scaleMatters__Stage_5_Mapping__c,scaleMatters__Stage_6_Mapping__c,scaleMatters__Stage_7_Mapping__c,scaleMatters__Stage_8_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false];    
                
        //quering sync currency custom setting object
        List<scaleMatters__CurrencyMapping__c> cmList = [select scaleMatters__Currency_Field_1_Mapping__c,scaleMatters__Currency_Field_2_Mapping__c,scaleMatters__Currency_Field_3_Mapping__c,scaleMatters__Currency_Field_4_Mapping__c,scaleMatters__Currency_Field_5_Mapping__c,scaleMatters__Currency_Field_6_Mapping__c,scaleMatters__Currency_Field_7_Mapping__c,scaleMatters__Currency_Field_8_Mapping__c from scaleMatters__CurrencyMapping__c where scaleMatters__Name__c Like 'scaleMatters Currency Mapping Record' AND isDeleted = false];
              
        //quering Opportunity records from List of Ids passed in from Trigger    
        List<Opportunity> oppListNew = [select scaleMatters__Business_Unit__c, scaleMatters__Opportunity_Sync__c, CreatedDate, scaleMatters__scaleMatters_Currency_7__c,scaleMatters__scaleMatters_Currency_8__c, scaleMatters__S1_Date__c, scaleMatters__MRR__c, scaleMatters__ACV__c, scaleMatters__FYCV__c, scaleMatters__TCV__c, scaleMatters__OneTime_Fee__c, scaleMatters__Product_OneTime_Fee__c,ID,StageName,scaleMatters__S2_Date__c,scaleMatters__S3_Date__c,scaleMatters__S4_Date__c,scaleMatters__S5_Date__c,scaleMatters__S6_Date__c,scaleMatters__S7_Date__c,scaleMatters__S8_Date__c,scaleMatters__S9_Date__c,scaleMatters__S10_Date__c from Opportunity where ID IN : newSet];
        
	                       
        String stageNew;
        String stageOld;
        
        
        //checking if stage mapping custom setting object have any mapping stored in it, if yes process Stage update
        if(csList.size()>0){
        
            for(Opportunity oppNew : oppListNew){
                
            oppNew.scaleMatters__Opportunity_Sync__c = false;
            oppNew.scaleMatters__Opportunity_Discard__c = true;
                
            for(ID key: oppMap.keySet()){     
                if(oppNew.Id == Id.valueOf(key)){
                    
                    //calling out setStageValue method and passing new and old stage value to get Numeric value                               
                    stageNew = setStageValue(oppNew.StageName ,  csList);
                    stageOld = setStageValue(oppMap.get(key) ,  csList);
                   
                    //setting s1 date value to create date 
                    if(oppNew.scaleMatters__S1_Date__c == Null){
                        oppNew.scaleMatters__S1_Date__c = date.newinstance(oppNew.CreatedDate.year(), oppNew.CreatedDate.month(), oppNew.CreatedDate.day());
                    }
                    
                    if(stageNew != '' && stageOld!=''){
                        
                    //setting stage date values as per numeric value retrieved from setStageValue method    
                    if(Decimal.valueOf(stageNew) > Decimal.valueOf(stageOld)){
                        if(stageNew == '2'){
                            oppNew.scaleMatters__S2_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL2__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                        }else if(stageNew=='3'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S3_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL3__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;

        				}else if(stageNew=='4'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
            				oppNew.scaleMatters__S3_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S4_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL4__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;


        				}else if(stageNew=='5'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
            				oppNew.scaleMatters__S3_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S4_Date__c==Null){
            				oppNew.scaleMatters__S4_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S5_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL5__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;


        				}else if(stageNew=='6'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
           	 				oppNew.scaleMatters__S3_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S4_Date__c==Null){
            				oppNew.scaleMatters__S4_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S5_Date__c==Null){
            				oppNew.scaleMatters__S5_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S6_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL6__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;



        				}else if(stageNew=='7'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            				}
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL7__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;
                
                            }else if(stageNew=='8'){
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL8__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
                
                            }else if(stageNew=='9'){
                            //opportunity reaches Closed Lost Stage , we dont have to update anything in this stage
    
                            }else if(stageNew=='10'){
                
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S8_Date__c==Null){
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S9_Date__c==Null){
                            oppNew.scaleMatters__S9_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLCW__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;


    
                            }else if(stageNew == '11'){                
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S8_Date__c==Null){
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S9_Date__c==Null){
                            oppNew.scaleMatters__S9_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = true;
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIC__c;

    
                
                            }else if(stageNew == '12'){
                            oppNew.scaleMatters__IsGhosted__c = true;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
    
    
                            }
                        }
                    else if(stageOld == '12' && Decimal.valueOf(stageNew) > Decimal.valueOf(stageOld)){
                        if(stageNew == '2'){
                            oppNew.scaleMatters__S2_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL2__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                        }else if(stageNew=='3'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S3_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL3__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;

        				}else if(stageNew=='4'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
            				oppNew.scaleMatters__S3_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S4_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL4__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;


        				}else if(stageNew=='5'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
            				oppNew.scaleMatters__S3_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S4_Date__c==Null){
            				oppNew.scaleMatters__S4_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S5_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL5__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;


        				}else if(stageNew=='6'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S3_Date__c==Null){
           	 				oppNew.scaleMatters__S3_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S4_Date__c==Null){
            				oppNew.scaleMatters__S4_Date__c = system.today();
            			}
            				if(oppNew.scaleMatters__S5_Date__c==Null){
            				oppNew.scaleMatters__S5_Date__c = system.today();
            			}    
            				oppNew.scaleMatters__S6_Date__c = system.today();
            				oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL6__c;
            				oppNew.scaleMatters__IsGhosted__c = false;
            				oppNew.scaleMatters__IsCertifiedDeal__c = false;



        				}else if(stageNew=='7'){
            				if(oppNew.scaleMatters__S2_Date__c==Null){
            				oppNew.scaleMatters__S2_Date__c = system.today();
            				}
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL7__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;
                
                            }else if(stageNew=='8'){
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL8__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
                
                            }else if(stageNew=='9'){
                            //opportunity reaches Closed Lost Stage , we dont have to update anything in this stage
    
                            }else if(stageNew=='10'){
                
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S8_Date__c==Null){
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S9_Date__c==Null){
                            oppNew.scaleMatters__S9_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLCW__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;


    
                            }else if(stageNew == '11'){                
                            if(oppNew.scaleMatters__S2_Date__c==Null){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S3_Date__c==Null){
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S4_Date__c==Null){
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S5_Date__c==Null){
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S6_Date__c==Null){
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S7_Date__c==Null){
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S8_Date__c==Null){
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            }
                            if(oppNew.scaleMatters__S9_Date__c==Null){
                            oppNew.scaleMatters__S9_Date__c = system.today();
                            }
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = true;
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIC__c;

    
                
                            }else if(stageNew == '12'){
                            oppNew.scaleMatters__IsGhosted__c = true;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
    
    
                            }
                        }    
                    else if(stageOld == '12' && Decimal.valueOf(stageNew) < Decimal.valueOf(stageOld)){
      
                            if(stageNew== '1'){
                                oppNew.scaleMatters__S2_Date__c = Null;
                                oppNew.scaleMatters__S3_Date__c = Null;
                                oppNew.scaleMatters__S4_Date__c = Null;
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                            	oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL1__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                                
                        
                                    
                                }else if(stageNew== '2'){
                                oppNew.scaleMatters__S3_Date__c = Null;
                                oppNew.scaleMatters__S4_Date__c = Null;
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL2__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '3'){
                                oppNew.scaleMatters__S4_Date__c = Null;
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL3__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;

                            
                         
                                }else if(stageNew== '4'){
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL4__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
    
                            
                                
                                }else if(stageNew== '5'){
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL5__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
                                oppNew.scaleMatters__IsCertifiedDeal__c = false;
    
                            
                                    
                                }else if(stageNew== '6'){
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL6__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '7'){
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL7__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '8'){
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL8__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '9'){
                                 //opp reaches at Closed Lost stage                    
                                }else if(stageNew == '10'){
                                oppNew.scaleMatters__IsGhosted__c = false;
                                oppNew.scaleMatters__IsCertifiedDeal__c = false;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLCW__c;
                                }else if(stageNew == '11'){
                                oppNew.scaleMatters__IsGhosted__c = false;
                                oppNew.scaleMatters__IsCertifiedDeal__c = true;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIC__c;    
                                
                                }else if(stageNew == '12'){
                                    
                                oppNew.scaleMatters__IsCertifiedDeal__c = false;    
                                oppNew.scaleMatters__IsGhosted__c = true;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIG__c; 
                                               
                            	                                
                                }
                    }
                    else if(Decimal.valueOf(stageNew) < Decimal.valueOf(stageOld)){
      
                            if(stageNew== '1'){
                                oppNew.scaleMatters__S2_Date__c = Null;
                                oppNew.scaleMatters__S3_Date__c = Null;
                                oppNew.scaleMatters__S4_Date__c = Null;
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                            	oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL1__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                                
                        
                                    
                                }else if(stageNew== '2'){
                                oppNew.scaleMatters__S3_Date__c = Null;
                                oppNew.scaleMatters__S4_Date__c = Null;
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL2__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '3'){
                                oppNew.scaleMatters__S4_Date__c = Null;
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL3__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;

                            
                         
                                }else if(stageNew== '4'){
                                oppNew.scaleMatters__S5_Date__c = Null;
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL4__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
    
                            
                                
                                }else if(stageNew== '5'){
                                oppNew.scaleMatters__S6_Date__c = Null;
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL5__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
                                oppNew.scaleMatters__IsCertifiedDeal__c = false;
    
                            
                                    
                                }else if(stageNew== '6'){
                                oppNew.scaleMatters__S7_Date__c = Null;
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL6__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '7'){
                                oppNew.scaleMatters__S8_Date__c = Null;     
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL7__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '8'){
                                oppNew.scaleMatters__S9_Date__c = Null;                
                                oppNew.scaleMatters__S10_Date__c= Null;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL8__c;
                                oppNew.scaleMatters__IsGhosted__c = false;
            					oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                                    
                                }else if(stageNew== '9'){
                                 //opp reaches at Closed Lost stage                    
                                }else if(stageNew == '10'){
                                oppNew.scaleMatters__IsGhosted__c = false;
                                oppNew.scaleMatters__IsCertifiedDeal__c = false;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLCW__c;
                                }else if(stageNew == '11'){
                                oppNew.scaleMatters__IsGhosted__c = false;
                                oppNew.scaleMatters__IsCertifiedDeal__c = true;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIC__c;    
                                
                                }else if(stageNew == '12'){
                                    
                                oppNew.scaleMatters__IsCertifiedDeal__c = false;    
                                oppNew.scaleMatters__IsGhosted__c = true;
                                oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIG__c; 
                                               
                            	                                
                                }
                    }
                    else if(Decimal.valueOf(stageNew) == Decimal.valueOf(stageOld)){
                    //do nothing 
                        
                    }
                           
                	}
                	}
                
            }
        }
            
            if(cmList.size()>0 ){
                
        	updateCurrency(newSet,oppListNew,cmList,smList);
            
            }else{
            
            updateList(oppListNew);
                
            }
        
        
        }
        
        //checking if currency mapping custom setting object have any mapping stored in it, if yes process currency update
        if(cmList.size()>0 && csList.size()==0){
                
        	updateCurrency(newSet,oppListNew,cmList,smList);
            
        }
        
        //checking if sync mapping custom setting object have any mapping stored in it, if yes process Sync update
        if(csList.size()==0 && cmList.size()==0 && smList.size()>0){
            
            runSync(oppListNew, newSet , smList);
            
            
        }
        
        
        
        
        
	}    
    //method to return numeric stage based on value stored in custom settings
    Public static String setStageValue(String key, List<scaleMatters__Stage_Mapping__c> cmd){
        
        String currentStage = '0';
        
        //setting stage dates if stage move forward 
        if(cmd[0].scaleMatters__Stage_1_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_1_Mapping__c).contains(key) ){
			currentStage = '1';        
        }else if(cmd[0].scaleMatters__Stage_2_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_2_Mapping__c).contains(key)){
            currentStage = '2';
        }else if(cmd[0].scaleMatters__Stage_3_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_3_Mapping__c).contains(key)){
            currentStage = '3';
        }else if(cmd[0].scaleMatters__Stage_4_Mapping__c!=null &&  String.valueOf(cmd[0].scaleMatters__Stage_4_Mapping__c).contains(key)){
            currentStage = '4';
        }else if(cmd[0].scaleMatters__Stage_5_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_5_Mapping__c).contains(key)){
            currentStage = '5';
        }else if(cmd[0].scaleMatters__Stage_6_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_6_Mapping__c).contains(key)){
            currentStage = '6';
        }else if( cmd[0].scaleMatters__Stage_7_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_7_Mapping__c).contains(key)){
            currentStage = '7';
        }else if(cmd[0].scaleMatters__Stage_8_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_8_Mapping__c).contains(key)){
            currentStage = '8';
        }else if(cmd[0].scaleMatters__Closed_Lost_Mapping__c != null && String.valueOf(cmd[0].scaleMatters__Closed_Lost_Mapping__c).contains(key)){
            currentStage = '9';
        }else if(cmd[0].scaleMatters__Closed_Won_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Closed_Won_Mapping__c).contains(key)){
            currentStage = '10';
        }else if(cmd[0].scaleMatters__isCertified_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__isCertified_Mapping__c).contains(key)){
            currentStage = '11';
        }else if(cmd[0].scaleMatters__isGhosted_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__isGhosted_Mapping__c).contains(key)){
            currentStage = '12';
        }
        
        
        return currentStage;
        
       
        
    } 
    
    
    
    
    //method to process on bulkified currencies updates
    public static void updateCurrency(List<ID> OppIdList, List<Opportunity> oppListtoUpdate, List<scaleMatters__CurrencyMapping__c> cmd , List<scaleMatters__Sync_Mapping__c> smList){
        	
        	//Maps to process on all 8 currency fields and process on their actual values retrieved from custom settings 
            Map<ID, String> field1Map = New Map<ID, String>();
            Map<ID, String> field2Map = New Map<ID, String>();
            Map<ID, String> field3Map = New Map<ID, String>();
            Map<ID, String> field4Map = New Map<ID, String>();
            Map<ID, String> field5Map = New Map<ID, String>();
            Map<ID, String> field6Map = New Map<ID, String>();
            Map<ID, String> field7Map = New Map<ID, String>();
            Map<ID, String> field8Map = New Map<ID, String>();
           
        
            //checking if currency mapping custom setting object have any mapping stored in it, if yes process currency update
        	if(cmd.size()>0){
                
            //checking if mapping was found for individual scalematters currency fields, if found process on currency update , otherwise abort process
            if(cmd[0].scaleMatters__Currency_Field_1_Mapping__c!=Null){
                
            field1Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_1_Mapping__c , OppIdList);
               
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field1Map.keySet()){
                    
                    
                    if(opp.Id == ID.valueOf(key)){
                                                                           
                        
                    	opp.scaleMatters__MRR__c = Decimal.valueOf(field1Map.get(key));
                        
                        }
                       }
                    }
                    
                
            }               
            if(cmd[0].scaleMatters__Currency_Field_2_Mapping__c!=Null){
            field2Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_2_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field2Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                        
                    	opp.scaleMatters__ACV__c = Decimal.valueOf(field2Map.get(key));
                        
                        }
                    }
                    
                }
            
                
        }            
            if(cmd[0].scaleMatters__Currency_Field_3_Mapping__c!=Null){
            
            field3Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_3_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field3Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    
                    	opp.scaleMatters__FYCV__c = Decimal.valueOf(field3Map.get(key));
                        }
                    }
                    
                }
            
                
            }            
            if(cmd[0].scaleMatters__Currency_Field_4_Mapping__c!=Null){
            
            field4Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_4_Mapping__c , OppIdList);
               
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field4Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    	opp.scaleMatters__TCV__c = Decimal.valueOf(field4Map.get(key));
                        }
                    }
                    
                }
            }            
            if(cmd[0].scaleMatters__Currency_Field_5_Mapping__c!=Null){
            field5Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_5_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field5Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                                                 
                    	opp.scaleMatters__OneTime_Fee__c = Decimal.valueOf(field5Map.get(key));
                        }
                    }
                    
                }
            
            }               
            if(cmd[0].scaleMatters__Currency_Field_6_Mapping__c!=Null){
            field6Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_6_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field6Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    
                    	opp.scaleMatters__Product_OneTime_Fee__c = Decimal.valueOf(field6Map.get(key));
                        }
                    }
                    
                }
            }           
            if(cmd[0].scaleMatters__Currency_Field_7_Mapping__c!=Null){
            field7Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_7_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field7Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    	opp.scaleMatters__scaleMatters_Currency_7__c = Decimal.valueOf(field7Map.get(key));
                        }
                    }
                    
                }
            }            
            if(cmd[0].scaleMatters__Currency_Field_8_Mapping__c!=Null){
            field8Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_8_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field8Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    	opp.scaleMatters__scaleMatters_Currency_8__c = Decimal.valueOf(field8Map.get(key));
                        }
                    }
                    
                }
            }
                
                                         
        	}
        
        	//calling out run sync method to initiate sync process
        	runSync(oppListtoUpdate,OppIdList,smList);
        	
        
               
        
    }
    //method to retrieve custom setting records and run query on opportunity object to get its actual value and return Map of ID and Value
    public static Map<ID, String> setCurrencyValue(String field, List<ID> IDList){
        
        Map<ID, String> fieldValues = new Map<ID, String>();
        
        String query = 'Select id,'  +field+ ' from Opportunity where ID IN : IDList';
        
        
        List<Opportunity> oppList = database.query(query);
        
         
                
        for(Opportunity opp: oppList){
            
            Map<String, Object> oppMap = Opp.getPopulatedFieldsAsMap();
                
            	String fieldValue = '0.0';
                String recordID;
                  
            for (String fieldName : oppMap.keySet()){
                
                
                if(fieldName == 'Id'){
                    
                    recordID = String.valueOf(oppMap.get(fieldName));
                    
                }
                
                
                if(fieldName ==  field){
                    
                   fieldValue = String.valueOf(oppMap.get(fieldName));

                }
                
               
                fieldValues.put(recordID, fieldValue);
                     
                
            }
    
        	}
        
    
        return fieldValues;
        
    }
    
    
    //method to run Sync between sellScience and Salesforce
    public static void runSync(List<Opportunity> OppListtoUpdate , List<ID> newSet , List<scaleMatters__Sync_Mapping__c> smList ){
       
        //list to store all opportunities which were matched sync criteria
       List<ID> oppIDList = new List<ID>(); 

        
	   //checking if sync mapping custom setting object have any mapping stored in it, if yes process Sync update
       if(smList.size()>0){
           
           String conditions = '( ';
           
           /**
           if(smList[0].scaleMatters__Filter_Type__c == 'Easy'){
              
               if(String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).contains('1') && smList[0].scaleMatters__Filter_1_Mapping__c != '-'){
                   
                   conditions += String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).replace('1' , smList[0].scaleMatters__Filter_1_Mapping__c);
                   
               }
               
               if(String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).contains('2') && smList[0].scaleMatters__Filter_1_Mapping__c != '-'){
                   
                   conditions += String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).replace('2' , smList[0].scaleMatters__Filter_2_Mapping__c);
                   
               }
               
               if(String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).contains('3') && smList[0].scaleMatters__Filter_3_Mapping__c != '-'){
                   
                   conditions += String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).replace('3' , smList[0].scaleMatters__Filter_3_Mapping__c);
                   
               }
               
               if(String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).contains('4') && smList[0].scaleMatters__Filter_3_Mapping__c != '-'){
                   
                   conditions += String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).replace('4' , smList[0].scaleMatters__Filter_4_Mapping__c);
                   
               }
               
               
              //conditions += String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).replace('1' , smList[0].scaleMatters__Filter_1_Mapping__c).replace('2' , smList[0].scaleMatters__Filter_2_Mapping__c).replace('3' , smList[0].scaleMatters__Filter_3_Mapping__c).replace('4' , smList[0].scaleMatters__Filter_4_Mapping__c).replace('5' , smList[0].scaleMatters__Filter_5_Mapping__c).replace('6' , smList[0].scaleMatters__Filter_6_Mapping__c).replace('7' , smList[0].scaleMatters__Filter_7_Mapping__c).replace('8' , smList[0].scaleMatters__Filter_8_Mapping__c).replace('9' , smList[0].scaleMatters__Filter_9_Mapping__c).replace('10' , smList[0].scaleMatters__Filter_10_Mapping__c).replace('11' , smList[0].scaleMatters__Filter_11_Mapping__c).replace('12' , smList[0].scaleMatters__Filter_12_Mapping__c).replace('13' , smList[0].scaleMatters__Filter_13_Mapping__c).replace('14' , smList[0].scaleMatters__Filter_14_Mapping__c).replace('15' , smList[0].scaleMatters__Filter_15_Mapping__c).replace('16' , smList[0].scaleMatters__Filter_16_Mapping__c).replace('17' , smList[0].scaleMatters__Filter_17_Mapping__c).replace('18' , smList[0].scaleMatters__Filter_18_Mapping__c).replace('19' , smList[0].scaleMatters__Filter_19_Mapping__c).replace('20' , smList[0].scaleMatters__Filter_20_Mapping__c).replace('21' , smList[0].scaleMatters__Filter_21_Mapping__c).replace('22' , smList[0].scaleMatters__Filter_22_Mapping__c).replace('23' , smList[0].scaleMatters__Filter_23_Mapping__c).replace('24' , smList[0].scaleMatters__Filter_24_Mapping__c).replace('25' , smList[0].scaleMatters__Filter_25_Mapping__c) + ' )';
            		
           		
           
           }
           
           else if(smList[0].scaleMatters__Filter_Type__c == 'Hard'){
              **/ 
               conditions += smList[0].scaleMatters__Sync_Mapping__c + ' )';
               
           //}
               
            
             	String query = 'Select Id from Opportunity where '+ conditions + ' AND ID IN : newSet';       
        		List<Opportunity> oppList = database.query(query);
           
           		String recordID = '';
            
        		for(Opportunity opp: oppList){
            
            		Map<String, Object> oppMap = Opp.getPopulatedFieldsAsMap();
                    
                   for (String fieldName : oppMap.keySet()){
                
                	if(fieldName == 'Id'){
                        
                        
                        recordID = String.valueOf(oppMap.get(fieldName));
                        
                        
                        
                        
                    }
                       
                   }
                    oppIDList.add(ID.valueOf(recordID));
                
            	
    
        		}
    
            
        	}
        
        
        
		//checking if list to store opps with exect match with sync criteria has any records , if yes updating sync checkbox to true and discard checkbox to false
        if(oppIDList.size()>0){
            
        for(ID oppID : oppIDList){
                for(Opportunity opp: OppListtoUpdate){
                    if(oppID == opp.Id){
                        
                        opp.scaleMatters__Opportunity_Sync__c = true;
                        opp.scaleMatters__Opportunity_Discard__c = false;

                         
                        
                    }
                }
            }      
            
        }
        
        //passing opportunity list to Update Method 
        updateList(OppListtoUpdate);

        
        
     
    }
    
    
    //method to update opportunity list 
    public static void updateList(List<Opportunity> oppList){
        List<id> oppIDList = new List<Id>();
        String businessUnit = '';
        
        //checking if Discard checkbox value was true, if yes create Discard record 
        for(Opportunity opp: oppList){
            
            if(opp.scaleMatters__Opportunity_Discard__c){
                oppIDList.add(opp.Id);
                businessUnit = opp.scaleMatters__Business_Unit__c;
                
            }
        }
        
        if(oppIDList.size()>0){
            
            createDiscard(oppIDList , businessUnit);
            
        }
        
        //updating opportunity list and catching any exceptions if found
        try{
            update oppList ; 
            
        }catch(Exception ex){
            system.debug('Exception occurs: ' + ex);
        }
    }
    
    
    //method to create Discard Object records 
    public static void createDiscard(List<Id> ids , String businessUnit){
        
    List<scaleMatters__Discarded_Record__c> discList = new List<scaleMatters__Discarded_Record__c>();
        for(Id oppId : ids){
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = businessUnit;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Opportunity'; 
        discObj.scaleMatters__Discarded_SafeID__c = oppId;
        discList.add(discObj);
        }
        
        try{
            
            insert discList;
            
        }catch(Exception ex){
            
            system.debug('Exception occurs: ' + ex);
            
        }
        
        

    }
    
    
    
    

    
    
    

}