public with sharing class ErrorMessageInVfController {
    
    public Application__c app{get;set;}
    public ErrorMessageInVfController(ApplicationFormController controller) {
    
        app= new Application__c ();

    }

    
 
    public void valid(){
      if(app.GP_Name__c == '' || app.GP_Name__c == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter GP name'));
 
       if(app.GP_Tel_number__c == '' || app.GP_Tel_number__c == null)
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter GP Telephone number'));
      
    }
}