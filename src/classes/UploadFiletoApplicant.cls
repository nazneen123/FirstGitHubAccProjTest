public with sharing class UploadFiletoApplicant {

    public Attachment att{get; set;}
    private Id parentId{get; set;}

    public UploadFiletoApplicant(ApexPages.StandardController controller) {
    
        att=new Attachment();
        parentId=controller.getId();
    }
        
        public void uploadImage()
        {
        //att.parentId=parentId;
        //att.Name='image';
        //insert att;
      testUploadFile.boxFileUpload('0',att,'VquUJDFd38FH1lDrrmtzRP9S2JPSg0PP');
        system.debug(att.id);
        att=new Attachment();
        
     
        }
        public Id getImageId()
        {
        Id result=null;
        List<Attachment> images=[select id from Attachment where Name='image' and parentId=:parentId order by CreatedDate DESC];
        if(images.size()>0)
        {
            result=images[0].id;
        }
        return result;
        }
}