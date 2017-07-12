public with sharing class DocumentDownloadController {

    

   public List<Uploaded_Document__c> ListDocuments{get;set;}
   public Uploaded_Document__c conRecord{get;set;}
   Public application__c app{get;set;}
    Public Uploaded_Document__c app1{get;set;}

    public DocumentDownloadController() {
conRecord = new Uploaded_Document__c();
 Id applicantID=ApexPages.currentPage().getParameters().get('applicantID');
 app = [Select Id, Name from Application__c Where Id = : ApexPages.currentPage().getParameters().get('id')];
 
   system.debug('***************************'+app+'****');
 //app1 = [Select Id from Uploaded_Document__c Where Id = : ApexPages.currentPage().getParameters().get('id')];
 
 
ListDocuments = new List<Uploaded_Document__c>();
ListDocuments = [Select Id, Document_ID__c, Name, Category__c, Description__c FROM Uploaded_Document__c Where application__c=:app.id];//Application__c =: app.Name ];

   system.debug('-----------'+ListDocuments+'------------');
    }


public PageReference Close() {
        return new PageReference('javascript:window.close()');
    }

}