public class syncPrototype {
    
    public static void run(){
        
        List<scaleMatters__Sync_Mapping__c> smList = [select scaleMatters__Filter_Type__c, scaleMatters__Filtering_Logic__c, scaleMatters__Name__c,scaleMatters__Sync_Mapping__c,scaleMatters__Filter_1_Mapping__c,scaleMatters__Filter_2_Mapping__c,scaleMatters__Filter_3_Mapping__c,scaleMatters__Filter_4_Mapping__c,scaleMatters__Filter_5_Mapping__c,scaleMatters__Filter_6_Mapping__c,scaleMatters__Filter_7_Mapping__c,scaleMatters__Filter_8_Mapping__c,scaleMatters__Filter_9_Mapping__c,scaleMatters__Filter_10_Mapping__c,scaleMatters__Filter_11_Mapping__c,scaleMatters__Filter_12_Mapping__c,scaleMatters__Filter_13_Mapping__c,scaleMatters__Filter_14_Mapping__c,scaleMatters__Filter_15_Mapping__c,scaleMatters__Filter_16_Mapping__c,scaleMatters__Filter_17_Mapping__c,scaleMatters__Filter_18_Mapping__c , scaleMatters__Filter_19_Mapping__c, scaleMatters__Filter_20_Mapping__c, scaleMatters__Filter_21_Mapping__c, scaleMatters__Filter_22_Mapping__c, scaleMatters__Filter_23_Mapping__c, scaleMatters__Filter_24_Mapping__c, scaleMatters__Filter_25_Mapping__c	 from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'];
        
        //checking if Filtering condition contains 1         
        String[] conArr1 = String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).split(' ');
        
       system.debug('Array on which all processing is being done ' +  conArr1);
        
        String cond1 = '';
        for(String con :conArr1){
            
            if(con.contains('1') && !con.contains('$') && !con.contains('%')){
                cond1 += smList[0].scaleMatters__Filter_1_Mapping__c + ' ';
                
            }else{
                cond1 += con + ' ';
                
            }
            
            
            
        }
        
                system.debug('condition after execution of con 1 ' +  cond1);

        
        //checking if Filtering condition contains 2
        String[] conArr2 = cond1.split(' ');
        String con2 = '';
        for(String con :conArr2){
            
            if(con.contains('2') && !con.contains('$') && !con.contains('%')){
                con2 += smList[0].scaleMatters__Filter_2_Mapping__c + ' ';
                
            }
            
            else{
            
            con2 += con + ' ';
            }
            
        }
        
                system.debug('condition after execution of con 2 ' +  con2);

        
        //checking if Filtering condition contains 3
        String[] conArr3 = con2.split(' ');
        String con3 = '';
        for(String con :conArr3){
            
            if(con.contains('3') && !con.contains('$') && !con.contains('%')){
                con3 += smList[0].scaleMatters__Filter_3_Mapping__c + ' ';
                
            }
            
            else{
            
            con3 += con + ' ';
            }
            
        }
        
                system.debug('condition after execution of con 3 ' +  con3);

        
        //checking if Filtering condition contains 4
        String[] conArr4 = con3.split(' ');
        String con4 = '';
        for(String con :conArr4){
            
            if(con.contains('4') && !con.contains('$') && !con.contains('%')){
                con4 += smList[0].scaleMatters__Filter_4_Mapping__c + ' ';
                
            }
            
            else{
            
            con4 += con + ' ';
                
            }
            
        }
        
        
        system.debug('condition after execution of con 4 ' +  con4);
        
        
        
       
        
        
    }

}