public class MyCertificateHandler 
{
    public id armid { set; get; }
    public id cert_id { set; get; }
    public Certificate__c certificate1 { set; get; }
    Public Application__c app1{get;set;}
    Public Contact con1{get;set;}
    public Arms_Held__c armHeld_update {set; get;}
    public objectWrapper objWrap {set; get;}
    public String photo { set; get; }
    
    ApexPages.StandardController controller;    
    
    public List<Arms_Held__c> armList { set; get; }
    
    public MyCertificateHandler() 
    {
       cert_id = ApexPages.currentPage().getParameters().get('cert_id');
       system.debug('-----cert_id -----'+cert_id);
       certificate1=[Select Id,Name,Application__c,Contact__c,Type__c,Date_of_Issue__c,Date_of_Expiry__c from Certificate__c Where id=:cert_id]; 
       system.debug('-----certificate1-----'+certificate1);
       app1=[Select Id,Name,License_Type__c,Shotgun__c,GP_Name__c,GP_Postcode__c,Application_Status__c,GPE_mail__c,GP_Address__c,Applicant_name__c,Applicant__c from Application__c Where id=:certificate1.Application__c];           
       con1=[Select Id,Name,Email from Contact Where id=:certificate1.Contact__c];      
        armList = [select Name,Type__c,Calibre__c, Make__c,Serial_No__c,Arms_Renewal__c from Arms_Held__c where  Certificate__c =:cert_id ];
        system.debug('-----app1-----'+app1);
        system.debug('-----con1-----'+con1);
       objWrap = new objectWrapper(certificate1,app1,con1);
        
        photo = '/resource/1453349094000/test'; // need to do logic..........        
        
    }
    
    public MyCertificateHandler(ApexPages.StandardController controller)
    {              
        this.controller = controller;                    
    }
    
    public PageReference editHarm()
    {
        System.debug('***' + armid);
        String editarmurl = '/apex/EditMyArmDetails?id='+armid;
        PageReference pg = new PageReference(editarmurl);
        return pg;
    }
    
    
    public PageReference saveArmHeld()
    {
        PageReference ret_page = controller.save();
        Id ret_page_id = apexPages.currentPage().getParameters().get('id');
        Arms_Held__c armHeld = [ select id, Certificate__c from Arms_Held__c where id =: ret_page_id];        
        
        system.debug('My Session ID : '+UserInfo.getSessionId());
              //armHeld.Contact__c =   UserInfo.getUserId();
        update armHeld;
        String ret_cert = '/apex/viewmycertificate?id=' + armHeld.Certificate__c;
        PageReference pg = new PageReference(ret_cert); 
        pg.setRedirect(true);
        return pg;                
    }
    public PageReference cancel()
    {
        Id ret_page_id = apexPages.currentPage().getParameters().get('id');        
               
        if(ret_page_id==null)
        {
            ret_page_id = apexPages.currentPage().getParameters().get('certId');
            String ret_cert = '/apex/viewmycertificate?id=' + ret_page_id;
            PageReference pg = new PageReference(ret_cert);
            return pg; 
        }        
        Arms_Held__c armHeld = [ select id, Certificate__c from Arms_Held__c where id =: ret_page_id];
        String ret_cert = '/apex/viewmycertificate?id=' + armHeld.Certificate__c;
        PageReference pg = new PageReference(ret_cert);
        return pg; 
    }

    public PageReference addNewArm()
    {                 
        PageReference ret_page = controller.save();
        cert_id = ApexPages.currentPage().getParameters().get('certId');        
        
        armHeld_update= (Arms_Held__c)controller.getRecord();
        armHeld_update.Certificate__c = cert_id;
        update armHeld_update;        
                
        String ret_cert = '/apex/viewmycertificate?id=' +cert_id;
        PageReference pg = new PageReference(ret_cert);
        return pg; 
    }
    
    
    ////******************************************************************************
        public class objectWrapper
        {
            public Certificate__c crt { set; get;}
            public Application__c app {set; get;}
            public Contact con {set; get;}
            
            public objectWrapper(Certificate__c crt,Application__c app,Contact con)
            {
                this.crt = crt;
                this.app = app;
                this.con = con;
            }
        }
    ////******************************************************************************
}