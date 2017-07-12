public with sharing class DisplayCerificatesControlller 
{
    public List<Certificate__c> Listcertificates{get;set;}
    public contact conRecord{get;set;}
    public String certId {set; get;}
    public user currentuser{get;set;}
    public String opp {get; set;} 
    
     public PageReference disNewcert()
    {                                
        String DisplayNewcert = '/apex/Display_certificate?';         
        PageReference pg = new PageReference(DisplayNewcert);         
        return pg;
    }
    
    
    public PageReference assetClicked() 
        {
        PageReference newocp = new PageReference('/apex/try_edit');
        newocp.setRedirect(true);
        return newocp;
        }
    
    public DisplayCerificatesControlller()
    {
    conRecord = new Contact();
    conRecord = [Select Id,name from contact where name =: userinfo.getName()];
    Listcertificates  = new List<Certificate__c>();
    Listcertificates  = [select Name,Date_of_Expiry__c,Type__c,Date_of_Issue__c from Certificate__c where Contact__c=: conRecord.Id];
        system.debug('+++'+Listcertificates);
   
        
        
        
    }
   
        public PageReference viewMyCertificate()
    {        
        System.debug('*****'+certId+'******'+ApexPages.currentPage().getParameters().get('id'));
        String str = '/apex/viewmycertificate?id='+certId;
        PageReference pg = new PageReference(str);        
        return pg;
    }

}