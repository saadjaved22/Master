@isTest(SeeAllData=true)
public class scaleMattersTest {
    
    
    @isTest static void TestAccount(){
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Account accUpdate = new Account(id = acc.Id);
        accUpdate.Name = 'Test Account Updated';
        accUpdate.scaleMatters__Account_Discard__c = true;
        update accUpdate;
        
        delete acc;
        
       
        
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = acc.Id;
        
        insert delObj;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = acc.scaleMatters__Business_Unit__c;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Account'; 
        discObj.scaleMatters__Discarded_SafeID__c = accUpdate.Id;
        
        insert discObj;

        
        
        
    }
    
    @isTest static void TestContact(){
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Test contact';
        con.AccountId = acc.id;
        con.scaleMatters__Business_Unit__c = 'Unassigned';
        insert con;
        
        Contact conUpdate = new Contact(id = con.id);
        conUpdate.LastName = 'Test Contact Updated';
        conUpdate.scaleMatters__Contact_Discard__c = true;
        update conUpdate;
        
        
      
        delete con;
        
       
        
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = con.Id;
        
        insert delObj;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c =  con.scaleMatters__Business_Unit__c;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Contact'; 
        discObj.scaleMatters__Discarded_SafeID__c = conUpdate.Id;
        
        insert discObj;
        
        
        
    }
    
    @isTest static void TestOpportunity(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;
        opp.scaleMatters__Opportunity_Discard__c = false;
        
        insert opp;
        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
		oppUpdate.scaleMatters__Opportunity_Discard__c = false;
      
        update oppUpdate;
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
		oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
      
        update oppUpdate2;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = acc.scaleMatters__Business_Unit__c;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Account'; 
        discObj.scaleMatters__Discarded_SafeID__c = oppUpdate.Id;
        
        insert discObj;
        
        delete opp;
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = opp.Id;
        
        insert delObj;
        
        
        
        
        
        
        
    }
    
    @isTest static void TestOpportunity2(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 1';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 2';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 2';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 3';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Stage 3';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 4';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        //testing if stages are 7 and 8
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Stage 4';
        opp4.CloseDate = system.today();
        opp4.AccountId = acc.id;
        opp4.Amount = 1200;
        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp4;
        oppStagesMap4.put(opp4.Id, opp4.StageName);
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp4.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 5';
        oppUpdate4.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate4;
        oppListNew4.add(oppUpdate4.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap4, oppListNew4);
        
        //testing if stages are 9 and 10 (Won and Lost)
        Opportunity opp5 = new Opportunity();
        opp5.Name = 'Test Opportunity';
        opp5.StageName = 'Stage 5';
        opp5.CloseDate = system.today();
        opp5.AccountId = acc.id;
        opp5.Amount = 1200;
        opp5.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp5;
        oppStagesMap5.put(opp5.Id, opp5.StageName);
        
        Opportunity oppUpdate5 = new Opportunity(Id= opp5.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Stage 6';
        oppUpdate5.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate5;
        oppListNew5.add(oppUpdate5.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap5, oppListNew5);
        
         
    }
    
    @isTest static void TestOpportunity3(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 6';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 7';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 7';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 8';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Closed Lost';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Won';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        //testing if stages are 7 and 8
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Stage 8';
        opp4.CloseDate = system.today();
        opp4.AccountId = acc.id;
        opp4.Amount = 1200;
        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp4;
        oppStagesMap4.put(opp4.Id, opp4.StageName);
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp4.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Booked';
        oppUpdate4.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate4;
        oppListNew4.add(oppUpdate4.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap4, oppListNew4);
        
        //testing if stages are 9 and 10 (Won and Lost)
        Opportunity opp5 = new Opportunity();
        opp5.Name = 'Test Opportunity';
        opp5.StageName = 'Closed Booked';
        opp5.CloseDate = system.today();
        opp5.AccountId = acc.id;
        opp5.Amount = 1200;
        opp5.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp5;
        oppStagesMap5.put(opp5.Id, opp5.StageName);
        
        Opportunity oppUpdate5 = new Opportunity(Id= opp5.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Closed Ghosted';
        oppUpdate5.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate5;
        oppListNew5.add(oppUpdate5.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap5, oppListNew5);
        
         
    }
        
    @isTest static void TestOpportunity4(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 7';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Ghosted';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 8';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Closed Ghosted';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Lost';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        //testing if stages are 7 and 8
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Closed Ghosted';
        opp4.CloseDate = system.today();
        opp4.Amount = 1200;
        opp4.AccountId = acc.id;
        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp4;
        oppStagesMap4.put(opp4.Id, opp4.StageName);
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp4.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Won';
        oppUpdate4.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate4;
        oppListNew4.add(oppUpdate4.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap4, oppListNew4);
        
        //testing if stages are 9 and 10 (Won and Lost)
        Opportunity opp5 = new Opportunity();
        opp5.Name = 'Test Opportunity';
        opp5.StageName = 'Closed Ghosted';
        opp5.CloseDate = system.today();
        opp5.AccountId = acc.id;
        opp5.Amount = 1200;
        opp5.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp5;
        oppStagesMap5.put(opp5.Id, opp5.StageName);
        
        Opportunity oppUpdate5 = new Opportunity(Id= opp5.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Closed Booked';
        oppUpdate5.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate5;
        oppListNew5.add(oppUpdate5.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap5, oppListNew5);
        
         
    }
    
    @isTest static void TestOpportunity5(){
        
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        
        List<ID> oppListNew3 = new List<ID>();
       
        List<ID> oppListNew4 = new List<ID>();
		
        List<ID> oppListNew5 = new List<ID>();

        List<ID> oppListNew6 = new List<ID>();

        List<ID> oppListNew7 = new List<ID>();

        List<ID> oppListNew8 = new List<ID>();

        List<ID> oppListNew9 = new List<ID>();
        
        List<ID> oppListNew10 = new List<ID>();
        
        List<ID> oppListNew11 = new List<ID>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 1';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppListNew.add(opp.Id);

        
        ScaleMattersOpportunityBatch.insertOppStage(oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 2';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppListNew2.add(opp2.Id);        
        ScaleMattersOpportunityBatch.insertOppStage(oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Stage 3';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppListNew3.add(opp3.Id);        
        ScaleMattersOpportunityBatch.InsertOppStage(oppListNew3);
        
        //testing if stages are 7 and 8
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Stage 4';
        opp4.CloseDate = system.today();
        opp4.AccountId = acc.id;
        opp4.Amount = 1200;

        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp4;
        oppListNew4.add(opp4.Id);        
        ScaleMattersOpportunityBatch.InsertOppStage(oppListNew4);
        
        //testing if stages are 9 and 10 (Won and Lost)
        Opportunity opp5 = new Opportunity();
        opp5.Name = 'Test Opportunity';
        opp5.StageName = 'Stage 5';
        opp5.CloseDate = system.today();
        opp5.AccountId = acc.id;
        opp5.scaleMatters__Business_Unit__c = 'Unassigned';
        opp5.Amount = 1200;
        insert opp5;
        oppListNew5.add(opp5.Id);        
        ScaleMattersOpportunityBatch.insertOppStage(oppListNew5);
        
         
    }
    
    @isTest static void TestOpportunity6(){
        
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 2';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 1';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 3';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 2';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Stage 4';
        opp3.Amount = 1200;
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 3';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        
        
    }
    
    @isTest static void TestOpportunity7(){
        
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 1';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Ghosted';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 2';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Closed Ghosted';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 3';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        
        
    }
    
    @isTest static void TestOpportunity8(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 4';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Ghosted';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 5';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Closed Ghosted';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 6';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        //testing if stages are 7 and 8
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Closed Ghosted';
        opp4.CloseDate = system.today();
        opp4.AccountId = acc.id;
        opp4.Amount = 1200;
        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp4;
        oppStagesMap4.put(opp4.Id, opp4.StageName);
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp4.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 7';
        oppUpdate4.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate4;
        oppListNew4.add(oppUpdate4.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap4, oppListNew4);
        
        //testing if stages are 9 and 10 (Won and Lost)
        Opportunity opp5 = new Opportunity();
        opp5.Name = 'Test Opportunity';
        opp5.StageName = 'Closed Ghosted';
        opp5.CloseDate = system.today();
        opp5.AccountId = acc.id;
        opp5.Amount = 1200;
        opp5.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp5;
        oppStagesMap5.put(opp5.Id, opp5.StageName);
        
        Opportunity oppUpdate5 = new Opportunity(Id= opp5.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Stage 8';
        oppUpdate5.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate5;
        oppListNew5.add(oppUpdate5.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap5, oppListNew5);
        
         
    }
    
    @isTest static void TestOpportunity9(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Closed Lost';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Ghosted';
        opp2.CloseDate = system.today();
        opp2.AccountId = acc.id;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Closed Won';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Closed Ghosted';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Booked';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        //testing if stages are 7 and 8
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Closed Ghosted';
        opp4.CloseDate = system.today();
        opp4.AccountId = acc.id;
        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp4;
        oppStagesMap4.put(opp4.Id, opp4.StageName);
        
        
        
         
    }
    
    @isTest static void TestOpportunity10(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 5';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 4';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 6';
        opp2.CloseDate = system.today();
        opp2.Amount = 1200;
        opp2.AccountId = acc.id;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 5';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Stage 7';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 6';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
        
        
         
    }
    
    @isTest static void TestOpportunity11(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 8';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 7';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Lost';
        opp2.CloseDate = system.today();
        opp2.Amount = 1200;
        opp2.AccountId = acc.id;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 8';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Closed Booked';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Won';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
         
         
        
        
         
    }
    
    @isTest static void TestOpportunity12(){
        
        Map<ID, String> oppStagesMap = new Map<ID, String>();
        List<ID> oppListNew = new List<ID>();
        
        List<ID> oppListNew2 = new List<ID>();
        Map<ID, String> oppStagesMap2 = new Map<ID, String>();
        
        List<ID> oppListNew3 = new List<ID>();
        Map<ID, String> oppStagesMap3 = new Map<ID, String>();
		
        List<ID> oppListNew4 = new List<ID>();
        Map<ID, String> oppStagesMap4 = new Map<ID, String>();
		
        List<ID> oppListNew5 = new List<ID>();
        Map<ID, String> oppStagesMap5 = new Map<ID, String>();

        List<ID> oppListNew6 = new List<ID>();
        Map<ID, String> oppStagesMap6 = new Map<ID, String>();

        List<ID> oppListNew7 = new List<ID>();
        Map<ID, String> oppStagesMap7 = new Map<ID, String>();

        List<ID> oppListNew8 = new List<ID>();
        Map<ID, String> oppStagesMap8 = new Map<ID, String>();

        List<ID> oppListNew9 = new List<ID>();
        Map<ID, String> oppStagesMap9 = new Map<ID, String>();
        
        List<ID> oppListNew10 = new List<ID>();
        Map<ID, String> oppStagesMap10 = new Map<ID, String>();
        
        List<ID> oppListNew11 = new List<ID>();
        Map<ID, String> oppStagesMap11 = new Map<ID, String>();



        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = acc.id;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        opp.scaleMatters__S2_Date__c = Null;

        insert opp;
        oppStagesMap.put(opp.Id, opp.StageName);

        
        Opportunity oppUpdate = new Opportunity(Id= opp.Id);
        oppUpdate.Name = 'Test';
        oppUpdate.StageName = 'Stage 2';
        oppUpdate.scaleMatters__S2_Date__c = system.today();
        oppUpdate.scaleMatters__S3_Date__c = system.today();
        oppUpdate.scaleMatters__S4_Date__c = system.today();
        oppUpdate.scaleMatters__S5_Date__c = system.today();
        oppUpdate.scaleMatters__S6_Date__c = system.today();
        oppUpdate.scaleMatters__S7_Date__c = system.today();
        oppUpdate.scaleMatters__S8_Date__c = system.today();
        oppUpdate.scaleMatters__S9_Date__c = system.today();
        oppUpdate.scaleMatters__S10_Date__c = system.today();
        oppUpdate.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate.scaleMatters__IsGhosted__c = false;
        oppUpdate.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate;
        oppListNew.add(oppUpdate.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap, oppListNew);
        
        //testing if stages are 3 and 4
        
        
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Ghosted';
        opp2.CloseDate = system.today();
        opp2.Amount = 1200;
        opp2.AccountId = acc.id;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp2;
        oppStagesMap2.put(opp2.Id, opp2.StageName);
        
        Opportunity oppUpdate2 = new Opportunity(Id= opp2.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 3';
        oppUpdate2.scaleMatters__Opportunity_Discard__c = true;
        oppUpdate2.scaleMatters__S2_Date__c = system.today();
        oppUpdate2.scaleMatters__S3_Date__c = system.today();
        oppUpdate2.scaleMatters__S4_Date__c = system.today();
        oppUpdate2.scaleMatters__S5_Date__c = system.today();
        oppUpdate2.scaleMatters__S6_Date__c = system.today();
        oppUpdate2.scaleMatters__S7_Date__c = system.today();
        oppUpdate2.scaleMatters__S8_Date__c = system.today();
        oppUpdate2.scaleMatters__S9_Date__c = system.today();
        oppUpdate2.scaleMatters__S10_Date__c = system.today();
        oppUpdate2.scaleMatters__Last_Stage_Before_Loss__c = 3;
        oppUpdate2.scaleMatters__IsGhosted__c = false;
        oppUpdate2.scaleMatters__IsCertifiedDeal__c = false;
        update oppUpdate2;
        oppListNew2.add(oppUpdate2.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap2, oppListNew2);
        
        //testing if stages are 5 and 6
        
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Closed Ghosted';
        opp3.CloseDate = system.today();
        opp3.AccountId = acc.id;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        insert opp3;
        oppStagesMap3.put(opp3.Id, opp3.StageName);
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp3.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 4';
        oppUpdate3.scaleMatters__Opportunity_Discard__c = true;
        update oppUpdate3;
        oppListNew3.add(oppUpdate3.Id);        
        ScaleMattersOpportunityBatch.updateOppStage(oppStagesMap3, oppListNew3);
         
         
        
        
         
    }
    
    
    
    
    
    @isTest static void TestTask(){
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Test contact';
        con.AccountId = acc.id;
        insert con;
        
        Task tsk = New Task();
        tsk.Status = 'Not Started';
        tsk.WhoId = con.Id;
        tsk.WhatId = acc.id;
        tsk.Subject = 'Call';
        tsk.Priority = 'High';
        tsk.scaleMatters__Task_Discard__c = false;
        insert tsk;
        
        Task tskUpdate =  New Task(Id = tsk.id);
        tskUpdate.Status = 'In Progress';
        tsk.scaleMatters__Task_Discard__c = true;
        update tskUpdate;
        
        
      
        delete tsk;
        
       
        
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = tsk.Id;
        
        insert delObj;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = 'None';
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Task'; 
        discObj.scaleMatters__Discarded_SafeID__c = tskUpdate.Id;
        
        insert discObj;
        
        
        
    }
    
    @isTest static void TestLead(){
        
        Lead lead = new Lead();
        lead.Status = 'Open Not Contacted';
        lead.LastName = 'Test Lead';
        lead.Company = 'Test Company';
        insert lead;
        
        Lead leadUpdate = new Lead(id=lead.Id);
        leadUpdate.LastName = 'Test Lead Updated';
        leadUpdate.scaleMatters__Lead_Discard__c = true;
        update leadUpdate;
        
        delete lead;
                
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = lead.Id;
        insert delObj;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = lead.scaleMatters__Business_Unit__c;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Lead'; 
        discObj.scaleMatters__Discarded_SafeID__c = leadUpdate.Id;
        
        insert discObj;
        
        
        
        
    }
    
    @isTest static void TestEvent(){
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Test contact';
        con.AccountId = acc.id;
        insert con;
        
        Event event = New Event();
        event.WhoId = con.Id;
        event.WhatId = acc.id;
        event.Subject = 'Call';
        event.DurationInMinutes = 12;
        event.ActivityDateTime = system.today();
        insert event;
        
        Event eventUpdate =  New Event(Id = event.id);
        eventUpdate.scaleMatters__Task_Discard__c = true;
        update eventUpdate;
        
        
      
        delete event;
         
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'None';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Event';
        delObj.scaleMatters__Deleted_SafeID__c = event.Id;
        
        insert delObj;
        
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = 'None';
        discObj.scaleMatters__Discarded_Date_Time__c = system.today();
        discObj.scaleMatters__Discarded_Object__c = 'Event'; 
        discObj.scaleMatters__Discarded_SafeID__c = eventUpdate.Id;
        
		
        insert discObj;

            
        
            
        
        
        
    }
	

}