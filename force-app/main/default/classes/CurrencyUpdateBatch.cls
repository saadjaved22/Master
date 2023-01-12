public class CurrencyUpdateBatch {
    
    
    public static boolean firstRun = true;
	//method to be used for updating currencies
	//
	@InvocableMethod(label='Update Opportunity Currencies'category='Opportunity') 
    public static List<String> updateCurrency(List<ID> OppIdList ){

        Map<ID, String> field1Map = New Map<ID, String>();
        Map<ID, String> field2Map = New Map<ID, String>();
        Map<ID, String> field3Map = New Map<ID, String>();
        Map<ID, String> field4Map = New Map<ID, String>();
        Map<ID, String> field5Map = New Map<ID, String>();
        Map<ID, String> field6Map = New Map<ID, String>();
        Map<ID, String> field7Map = New Map<ID, String>();
        Map<ID, String> field8Map = New Map<ID, String>();


        
        List<Opportunity> oppListtoUpdate = [select id,scaleMatters__MRR__c, scaleMatters__ACV__c, scaleMatters__FYCV__c, scaleMatters__TCV__c, scaleMatters__OneTime_Fee__c, scaleMatters__Product_OneTime_Fee__c from Opportunity where ID IN : OppIdList];
        
        List<scaleMatters__CurrencyMapping__c> cmd = [select scaleMatters__Currency_Field_1_Mapping__c,scaleMatters__Currency_Field_2_Mapping__c,scaleMatters__Currency_Field_3_Mapping__c,scaleMatters__Currency_Field_4_Mapping__c,scaleMatters__Currency_Field_5_Mapping__c,scaleMatters__Currency_Field_6_Mapping__c,scaleMatters__Currency_Field_7_Mapping__c,scaleMatters__Currency_Field_8_Mapping__c from scaleMatters__CurrencyMapping__c];
        if(cmd.size()>0){
        	            
            if(cmd[0].scaleMatters__Currency_Field_1_Mapping__c!=null){
            field1Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_1_Mapping__c , OppIdList);
               
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field1Map.keySet()){
                    
                    
                    if(opp.Id == ID.valueOf(key)){
                        
                                                
                    opp.scaleMatters__MRR__c = Decimal.valueOf(field1Map.get(key));
                        
                    }else{
                        
                        
                    }
                    
                }
            }
                
            }
            
            if(cmd[0].scaleMatters__Currency_Field_2_Mapping__c!=null){    
            field2Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_2_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field2Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                                                
                    opp.scaleMatters__ACV__c = Decimal.valueOf(field2Map.get(key));
                        
                    }
                    
                }
            }
                
            }
            
            if(cmd[0].scaleMatters__Currency_Field_3_Mapping__c!=null){    
            field3Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_3_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field3Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                                                
                    opp.scaleMatters__FYCV__c = Decimal.valueOf(field3Map.get(key));
                        
                    }
                    
                }
            }
                
            }
            
            if(cmd[0].scaleMatters__Currency_Field_4_Mapping__c!=null){    
            field4Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_4_Mapping__c , OppIdList);
               
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field4Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                                                
                    opp.scaleMatters__TCV__c = Decimal.valueOf(field4Map.get(key));
                        
                    }
                    
                }
            }
                 
            }
            
            if(cmd[0].scaleMatters__Currency_Field_5_Mapping__c!=null){    
            field5Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_5_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field5Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                                                
                    opp.scaleMatters__OneTime_Fee__c = Decimal.valueOf(field5Map.get(key));
                        
                    }
                    
                }
            }
                
            }
            
            if(cmd[0].scaleMatters__Currency_Field_6_Mapping__c!=null){    
            field6Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_6_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field6Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                                                
                    opp.scaleMatters__Product_OneTime_Fee__c = Decimal.valueOf(field6Map.get(key));
                        
                    }
                    
                }
            }
                
            }
            
            /**
            if(cmd[0].scaleMatters__Currency_Field_7_Mapping__c!=null){    
            field7Values = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_7_Mapping__c , OppIdSet);     
            }
            if(cmd[0].scaleMatters__Currency_Field_8_Mapping__c!=null){    
            field8Values = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_8_Mapping__c , OppIdSet);     
            }
			**/
                                        
        }
        
       
        try{
            
            update oppListtoUpdate;
            
        }catch(Exception ex){
            
            system.debug('Exception occurs: '+ ex);
        }
        return null;
        
        
    }
    public static Map<ID, String> setCurrencyValue(String field, List<ID> IDList){
        
        Map<ID, String> fieldValues = new Map<ID, String>();
        
        String query = 'Select Id,'  +field+ ' from Opportunity where ID IN : IDList';
        
        
        List<Opportunity> oppList = database.query(query);
        
                
        for(Opportunity opp: oppList){
            
            Map<String, Object> oppMap = Opp.getPopulatedFieldsAsMap();
                
            	String fieldValue = '0';
                String recordID;
                  
            for (String fieldName : oppMap.keySet()){
                
                
                if(fieldName == 'Id'){
                    recordID = String.valueOf(oppMap.get(fieldName));
                }
                if(fieldName == field){
                    
                   fieldValue = String.valueOf(oppMap.get(fieldName));

                }
                
               
                fieldValues.put(recordID, fieldValue);
                     
                
            }
    
        	}
    
        return fieldValues;
        
    }
    

}