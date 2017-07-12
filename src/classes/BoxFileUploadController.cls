public with sharing class BoxFileUploadController {


 

public List<uploadDocumentWrapper> uploadDocumentWrapperList{get;set;}
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

       /* public Document document 
        { 
            get 
            { 
                    if (document == null) 
                    document = new Document(); 
                    return document; 
            } 
        set; 
        } 
        
        public Attachment att{get; set;}
        private Id parentId{get; set;}*/

    //Public Uploaded_Document__c upload{get;set;}
    //public List<Uploaded_Document__c > DocumentList{get;set;}

    public BoxFileUploadController(ApexPages.StandardController controller) {

        //upload= new Uploaded_Document__c();
        //DocumentList=new List<Uploaded_Document__c >();
        
        //att=new Attachment();
        //parentId=controller.getId();
        
        uploadDocumentWrapperList = new List<uploadDocumentWrapper>();
        uploadDocumentWrapper varUpload = new uploadDocumentWrapper();
        uploadDocumentWrapperList.clear();
        uploadDocumentWrapperList.add(varUpload);
       
    }
    
    
     public void uploadFile()
     {
        system.debug('-----------------uploadDocumentWrapperList[0]------------------'+uploadDocumentWrapperList[0]);
        system.debug('-----------------uploadDocumentWrapperList.size()------------------'+uploadDocumentWrapperList.size());
        documentListToBeInserted = new List<Uploaded_Document__c>();
        if(uploadDocumentWrapperList != null && !uploadDocumentWrapperList.isEmpty())
        {
            for(uploadDocumentWrapper varDocData : uploadDocumentWrapperList)
            {
                system.debug('-------------varDocData----------------------'+varDocData);
                system.debug('-------------varDocData.attach.name----------------------'+varDocData.attach.name);
                system.debug('-------------varDocData.attach.body----------------------'+varDocData.attach.body);
                
                    BoxFileUpload.boxFileUpload('0',varDocData.attach,'JD5ivGmturZnNrum2ygI5C55EVjO1Xtv');
                   documentListToBeInserted.add(varDocData.document); 
                     
                    
            }
            if(documentListToBeInserted!= null && !documentListToBeInserted.isEmpty())
            {
                insert documentListToBeInserted;// associate it with the application record 
            }
            
           
        }
     }
        
        /*
        public Id getImageId()
        {
        Id result=null;
        List<Attachment> images=[select id from Attachment where Name='image' and parentId=:parentId order by CreatedDate DESC];
        if(images.size()>0)
        {
            result=images[0].id;
        }
        return result;
        } */
    


public pagereference addFile()
      {
          //Uploaded_Document__c  docs= new Uploaded_Document__c();
          //DocumentList.add(docs);
          uploadDocumentWrapper varUpload1 = new uploadDocumentWrapper();
        uploadDocumentWrapperList.add(varUpload1);
        
        return null;
      }
   
   
   /* public PageReference uploadfunc() 
    { 
        document.AuthorId = UserInfo.getUserId(); 
        document.FolderId = UserInfo.getUserId(); // put it in running user's folder 
        
        try { 
                insert document; 
            } catch (DMLException e) 
                { 
                    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading file')); 
                    return null; 
                } finally 
                    { 
                        document.body = null; // clears the viewstate 
                        document = new Document(); 
                    } 
                    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'File uploaded successfully')); 
         return null; 
     } */

}