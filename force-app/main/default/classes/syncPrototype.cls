public class syncPrototype {
    
    public static void run(){
        
        List<scaleMatters__Sync_Mapping__c> smList = [select scaleMatters__Filter_Type__c, scaleMatters__Filtering_Logic__c, scaleMatters__Name__c,scaleMatters__Sync_Mapping__c,scaleMatters__Filter_1_Mapping__c,scaleMatters__Filter_2_Mapping__c,scaleMatters__Filter_3_Mapping__c,scaleMatters__Filter_4_Mapping__c,scaleMatters__Filter_5_Mapping__c,scaleMatters__Filter_6_Mapping__c,scaleMatters__Filter_7_Mapping__c,scaleMatters__Filter_8_Mapping__c,scaleMatters__Filter_9_Mapping__c,scaleMatters__Filter_10_Mapping__c,scaleMatters__Filter_11_Mapping__c,scaleMatters__Filter_12_Mapping__c,scaleMatters__Filter_13_Mapping__c,scaleMatters__Filter_14_Mapping__c,scaleMatters__Filter_15_Mapping__c,scaleMatters__Filter_16_Mapping__c,scaleMatters__Filter_17_Mapping__c,scaleMatters__Filter_18_Mapping__c , scaleMatters__Filter_19_Mapping__c, scaleMatters__Filter_20_Mapping__c, scaleMatters__Filter_21_Mapping__c, scaleMatters__Filter_22_Mapping__c, scaleMatters__Filter_23_Mapping__c, scaleMatters__Filter_24_Mapping__c, scaleMatters__Filter_25_Mapping__c	 from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'];
        
        //checking if Filtering condition contains 1         
        String[] conArr1 = String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).split(' ');
        
       system.debug('Array on which all processing is being done ' +  conArr1);
        
        
        
        String cond1 = '(';
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
                con2 += smList[0].scaleMatters__Filter_2_Mapping__c + ' ) ';
                
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
                con3 += ' (' + smList[0].scaleMatters__Filter_3_Mapping__c + ' ';
                
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
                con4 += smList[0].scaleMatters__Filter_4_Mapping__c + ' ) ';
                
            }
            
            else{
            
            con4 += con + ' ';
                
            }
            
        }       
        system.debug('condition after execution of con 4 ' +  con4);
        
        //checking if Filtering condition contains 5
        String[] conArr5 = con4.split(' ');
        String con5 = '';
        for(String con :conArr5){
            
            if(con.contains('5') && !con.contains('$') && !con.contains('%')){
                con5 += smList[0].scaleMatters__Filter_5_Mapping__c + ' ) ';
                
            }
            
            else{
            
            con5 += con + ' ';
                
            }
            
        }       
        system.debug('condition after execution of con 5 ' +  con5);
        
        //checking if Filtering condition contains 6
        String[] conArr6 = con5.split(' ');
        String con6 = '';
        for(String con :conArr6){
            
            if(con.contains('6') && !con.contains('$') && !con.contains('%')){
                con6 += smList[0].scaleMatters__Filter_6_Mapping__c + ' ) ';
                
            }
            
            else{
            
            con6 += con + ' ';
                
            }
            
        }       
        system.debug('condition after execution of con 6 ' +  con6);
        
        //checking if Filtering condition contains 7
        String[] conArr7 = con6.split(' ');
        String con7 = '';
        for(String con :conArr7){
            
            if(con.contains('7') && !con.contains('$') && !con.contains('%')){
                con7 += smList[0].scaleMatters__Filter_7_Mapping__c + ' ) ';
                
            }
            
            else{
            
            con7 += con + ' ';
                
            }
            
        }       
        system.debug('condition after execution of con 7 ' +  con7);
        
        //checking if Filtering condition contains 8
        String[] conArr8 = con7.split(' ');
        String con8 = '';
        for(String con :conArr8){
            
            if(con.contains('8') && !con.contains('$') && !con.contains('%')){
                con6 += smList[0].scaleMatters__Filter_8_Mapping__c + ' ) ';
                
            }
            
            else{
            
            con8 += con + ' ';
                
            }
            
        }       
        system.debug('condition after execution of con 8 ' +  con8);
        
        //checking if Filtering condition contains 9
        String[] conArr9 = con8.split(' ');
        String con9 = '';
        for(String con :conArr9){
            
            if(con.contains('9') && !con.contains('$') && !con.contains('%')){
                con9 += smList[0].scaleMatters__Filter_9_Mapping__c + ' ) ';
                
            }
            
            else{
            
            con9 += con + ' ';
                
            }
            
        }       
        system.debug('condition after execution of con 9 ' +  con9);
        
         //checking if Filtering condition contains 9
        String[] conArr10 = con9.split(' ');
        String con10 = '';
        for(String con :conArr10){
            
            if(con.contains('10') && !con.contains('$') && !con.contains('%')){
                con10 += smList[0].scaleMatters__Filter_10_Mapping__c + ' ) ';
                
            }
            
            else{
            
            con10 += con + ' ';
                
            }
            
        }       
        system.debug('condition after execution of con 10 ' +  con10);
        
        
        
        
        
        
        
       
        
        
    }

}