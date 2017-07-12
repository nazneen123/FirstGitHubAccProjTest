public with sharing class UploadSuppDocController {
public List<uploadDocumentWrapper> uploadDocumentWrapperList{get;set;}
public application__c AppRecord{get;set;}
Public application__c app{get;set;}
public List<Uploaded_Document__c> documentListToBeInserted{get;set;}

 public class uploadDocumentWrapper
    {
        public Uploaded_Document__c document{get; set;}
        public Attachment attach{get; set;}
        public uploadDocumentWrapper()
        {
            document = new Uploaded_Document__c();
            attach = new Attachment();
        }
        
    }
    
    public UploadSuppDocController (){
    
        uploadDocumentWrapperList = new List<uploadDocumentWrapper>();
        uploadDocumentWrapper varUpload = new uploadDocumentWrapper();
        uploadDocumentWrapperList.clear();
        uploadDocumentWrapperList.add(varUpload);
        app = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : ApexPages.currentPage().getParameters().get('id')];
        }
    
    public pagereference addFile()
      {
          //Uploaded_Document__c  docs= new Uploaded_Document__c();
          //DocumentList.add(docs);
        uploadDocumentWrapper varUpload = new uploadDocumentWrapper();
        uploadDocumentWrapperList.add(varUpload);
        
        return null;
      }
      
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      public pagereference uploadFile()
     {  
         //Code to create folder in Box application
         
       AppRecord = new Application__c();
        AppRecord = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : app.Id];
        system.debug('------------------AppRecord.Name----------------'+AppRecord.Name);
        
        /*Changes made to handle token commit to Saleforce database in controller*/
        BoxOAuth__c boxoauth = new BoxOAuth__C();
        boxoauth =[select name,Auth_Token__C,Refresh_Token__c,AuthTokenExpires__c,RefreshTokenExpires__c from BoxOAuth__c where name='AtoS'];
        
        boxoauth = BoxHelper.authorizeBox(boxoauth);
       String FolderId ; 
        if(AppRecord.Box_com_Folder_Id__c == '')
       {
       
       
            FolderId = BoxHelper.createFolder(AppRecord.Name,'0',boxoauth.Auth_Token__c);
            }
            if(AppRecord.Box_com_Folder_Id__c != '')
            {
               FolderId = AppRecord.Box_com_Folder_Id__c;
                system.debug('--------------------String.valueOf(FolderId)-------------------'+String.valueOf(FolderId));
                //Update AppRecord;
            
         }
         //Upload file
         
        system.debug('-----------------uploadDocumentWrapperList[0]------------------'+uploadDocumentWrapperList[0]);
        system.debug('-----------------uploadDocumentWrapperList.size()------------------'+uploadDocumentWrapperList.size());
        application__c AppRecord1 = new Application__c();
        //AppRecord1 = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : App.Id];
        documentListToBeInserted = new List<Uploaded_Document__c>();
        if(uploadDocumentWrapperList != null && !uploadDocumentWrapperList.isEmpty())
        {
            for(uploadDocumentWrapper varDocData : uploadDocumentWrapperList)
            {
                boxoauth = BoxHelper.authorizeBox(boxoauth);                     
                //String DocumentId = BoxHelper.boxFileUpload(AppRecord1.Box_com_Folder_Id__c,varDocData.attach,'JD5ivGmturZnNrum2ygI5C55EVjO1Xtv',varDocData.attach.name,'0');
                String DocumentId = BoxHelper.boxFileUpload(String.valueOf(FolderId),varDocData.attach,boxoauth.Auth_Token__c);
                system.debug('--------------------DocumentId ------------------'+DocumentId);
                varDocData.document.Document_ID__c  = DocumentId;
                varDocData.document.Application__c = app.id;
                documentListToBeInserted.add(varDocData.document);         
           }
            
            if(documentListToBeInserted!= null && !documentListToBeInserted.isEmpty())
            {
                insert documentListToBeInserted;// associate it with the application record 
            } 
            
//            AppRecord.Application_Status__c = 'Draft';
            Update AppRecord; 
           Update boxoauth;  
        }
 
String param = System.currentPagereference().getParameters().get('abc');
System.debug('-----------param'+param);
System.debug('-----------abc'+System.currentPagereference().getParameters().get('abc'));
 if(param == null)
 {
  return new PageReference('javascript:window.close()');
  }
 else
  {
  return new Pagereference('/apex/ApplicationManagement');
  }
     }
      
      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      

}