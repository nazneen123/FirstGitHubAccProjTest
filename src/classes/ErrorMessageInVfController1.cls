public with sharing class ErrorMessageInVfController1 {
    
    public Application__c app{get;set;}
    public ErrorMessageInVfController1(ApplicationFormController controller) {
    
        app= new Application__c ();

    }

    public void valid(){
     
       if(app.GP_Postcode__c == '' || app.GP_Postcode__c == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'GP Post Code valid : Extension 2'));
      
    }
}