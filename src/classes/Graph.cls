public with sharing class Graph 
{  
    public List<PieWedgeData> getPieData() 
    {  
        List<PieWedgeData> data = new List<PieWedgeData>();
        List<Application__c> memb = new List<Application__c>();  
        
        String sql = 'SELECT Name, Applicant__c FROM Application__c';
        memb = Database.Query(sql);
        for(Application__c temp:memb)
        {           
            data.add(new PieWedgeData(temp.Name,temp.Applicant__c ));
        }
        return data;  
    }  
    
    }