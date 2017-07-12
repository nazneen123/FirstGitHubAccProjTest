public class SendEmail
{
    Application__c appl{get;set;}
    Contact conn{get;set;}
    public SendEmail(ApexPages.StandardController stdController) 
    {
        this.appl = (Application__c )stdController.getRecord();
        //this.conn= (Contact)stdController.getRecord();
        conn = new Contact();
        appl = new application__c();
        system.debug('-----------UserInfo.getUserId()--------------'+UserInfo.getUserId());
        system.debug('-----------Userinfo.getUserEmail()--------------'+Userinfo.getUserEmail());
        appl=[Select Id,name,Applicant__c from application__c where Id=: ApexPages.currentPage().getParameters().get('id')];
        system.debug('------appl-------'+appl.Applicant__c);
       // conn = [Select Id,name,Email from contact where Id=: UserInfo.getUserId() and Email=: Userinfo.getUserEmail()];
       //conn = [Select Id,name,Email from contact where Id =: appl.Applicant__c];
         system.debug('-----------conn--------------'+conn);
    }
    public SendEmail()
    {
        
    }
    
     public PageReference autoRun() {
 
        String theId = ApexPages.currentPage().getParameters().get('id');
        String email=conn.Email;
        
        if (theId == null) {
            // Display the Visualforce page's content if no Id is passed over
            return null;
        }

       
        // Redirect the user back to the original page
        
        PageReference pageRef = new PageReference('/_ui/core/email/author/EmailAuthor?rtype=003&p2_lkid=' + appl.Applicant__c +
        '&p3_lkid=' + theId  + '&retURL=' + theId  + 
        '&p5=&template_id=' + '00X28000000l7un');
        pageRef.setRedirect(true);
        return pageRef;
 
    }
    
}