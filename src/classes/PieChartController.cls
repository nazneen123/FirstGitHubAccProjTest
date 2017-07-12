public class PieChartController 
{
    public contact con{get;set;}
    Public List<application__c> app{get;set;}
    
    public PieChartController()
    {
                app =[select  Id,Applicant_name__c,Applicant__c,Application_ID__c,Application_Status__c,Payment_Status__c FROM Application__c];
           system.debug('----------------app-=------------------------'+app);
                        
    }
    
    public List<PieWedgeData> getPieData() 
    {
        List<PieWedgeData> data = new List<PieWedgeData>();
        data.add(new PieWedgeData('Draft', 30));
        data.add(new PieWedgeData('Submitted', 15));
        data.add(new PieWedgeData('Physical Verification', 35));
        data.add(new PieWedgeData('Medical Verification', 20));
        data.add(new PieWedgeData('Refree Verification', 20));
        //data.add(new PieWedgeData('Approved', 5));
        return data;
    }

    // Wrapper class
    public class PieWedgeData 
    {

        public String name { get; set; }
        public Integer data { get; set; }

        public PieWedgeData(String name, Integer data) {
            this.name = name;
            this.data = data;
        }
    }
}

/*public with sharing class PieChartController 
{  
    //List<Application__c> appli;
    //List<PieWedgeData> data;
    //List<Application__c> sql;
    //public PieChartController()
    //{
        
   // }
        public List<PieWedgeData> getPieData() 
        {  
            List<PieWedgeData> data = new List<PieWedgeData>();
            List<Application__c> appli= new List<Application__c>();  
            
            String sql = 'SELECT Id, Applicant_name__c,  Application_Status__c FROM Application__c';
            System.debug('-------------------sql------------' + sql);
           
            appli = Database.Query(sql);
            
            for(Application__c temp:appli)
            {           
                data.add(new PieWedgeData(temp.Applicant_name__c,temp.Application_Status__c));
                system.debug('----------data------------'+data);
            }
            return data;  
        }
     
    
    // Wrapper class  
    public class PieWedgeData 
    {  
        public String name { get; set; }  
        public String data { get; set; }  
        
        public PieWedgeData(String name, String data) 
        {  
            this.name = name;  
            this.data = data;  
        }  
    }  
}*/