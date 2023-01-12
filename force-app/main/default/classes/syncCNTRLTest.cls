@isTest(SeeAllData=true)
public class syncCNTRLTest {
    
     @isTest static void stageTest(){
         
         scaleMatterSyncCntrl smc = new scaleMatterSyncCntrl();
         smc.createSyncMapping();
         smc.updateSyncMapping();
         smc.fields = 'test';
         smc.getfields();
         List<String> vals = new List<String>();
         vals = scaleMatterSyncCntrl.getFieldsList();
         
         smc.oprtrs = 'test';
         smc.getoprtrs();
         
         List<SelectOption> vals2 = new List<SelectOption>();
         vals2 = smc.getoprtrs();
         
         String conditions = '';
         smc.setcondition(conditions);
         smc.getcondition();
         
         smc.condition = 'ss';
         
         
         
         
         
         
       
         
         
    
    
     }

}