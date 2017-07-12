public class downloadDocsController {

public List<Uploaded_Document__c> ListDocuments{get;set;}
   public Uploaded_Document__c conRecord{get;set;}
   Public application__c app{get;set;}
    Public Uploaded_Document__c app1{get;set;}
    String FileId;

    public downloadDocsController(ApexPages.StandardSetController controller) {
        controller.setPageSize(10);
     
 // DownFile.downloadBoxFile();

/////////////////////////////////////////////////////////////////////////////////////////////
conRecord = new Uploaded_Document__c();
 Id applicantID=ApexPages.currentPage().getParameters().get('applicantID');
 app = [Select Id, Name from Application__c Where Id = : ApexPages.currentPage().getParameters().get('id')];
 
   system.debug('***************************'+app+'****');
 //app1 = [Select Id from Uploaded_Document__c Where Id = : ApexPages.currentPage().getParameters().get('id')];
 
 
ListDocuments = new list<Uploaded_Document__c>();
Uploaded_Document__c ud = new Uploaded_Document__c();
//ud= [Select Id, Document_ID__c, Name, Category__c, Description__c FROM Uploaded_Document__c Where application__c=:app.id];//Application__c =: app.Name ];
ListDocuments= [Select Document_ID__c FROM Uploaded_Document__c Where application__c=:app.id];//Application__c =: app.Name ];
FileId=ud.Document_ID__c;
   system.debug('-----------'+ListDocuments+'------------');
   system.debug('-----------'+FileId+'------------');
/////////////////////////////////////////////////////////////////////////////////////////////

}



public  String downloadBoxFile(){
   // BoxAuthParser bparser;
    //bparser=RefreshTokenrequest();
   
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    string endPointValue = 'https://api.box.com/2.0/files/';
    endPointValue=endPointValue+String.valueOf(FileId)+'/content';
    req.setEndpoint(endPointValue);
    req.setMethod('GET');
    req.setHeader('Authorization', 'Bearer JFyoZg6h9zQS3iycUgGFxCXbB7P5fZlw');
    HttpResponse res = h.send(req);
    system.debug('pANY'+res.getBody());
    return res.getHeader('Location');
    
    

}}