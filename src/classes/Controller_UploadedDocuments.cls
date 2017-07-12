public class Controller_UploadedDocuments
{

        public Document document 
        { 
            get 
            { 
                    if (document == null) 
                    document = new Document(); 
                    return document; 
            } 
        set; 
        } 

    Public Uploaded_Document__c upload{get;set;}
    public List<Uploaded_Document__c > uploadList{get;set;}
    
    public Controller_UploadedDocuments()
    {
        upload= new Uploaded_Document__c();
        uploadList=new List<Uploaded_Document__c >();        
    }
     
    /*public Controller_UploadedDocuments(ApexPages.StandardController controller) 
    {
        Document d = (Document) controller.getRecord();
        d.folderid = UserInfo.getUserId(); 
    }               
   */
    
    public void addFile()
      {
          Uploaded_Document__c  docs= new Uploaded_Document__c();
          uploadList.add(docs);
      }
   
   
  /*  public PageReference uploadfunc() 
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
     } 
        */
        
}