public with sharing class ApplicationManagementController {

    public String close { get; set; }

    public List<Application__c> ListApplications{get;set;}
    public contact conRecord{get;set;}
    public contact con{get;set;}
    public Application__c app{get;set;}
    public Application__c appid{get;set;}
    
    public Id applicantID;
    
    public Payment__c pay{get;set;} 
    
    //----------------------------------------------------------
     public Attachment att{get; set;}
    private Id parentId{get; set;}
    //----------------------------------------------------------

    public String getApplications() {
        return null;
    }
    /*public ApplicationManagementController(ApplicationFormController controller)
    {
        
    }*/

    public ApplicationManagementController()
    {
    
    conRecord = new Contact();
    con = new Contact();
    app = new Application__c();
    pay =new Payment__c();
    Id applicantID=ApexPages.currentPage().getParameters().get('applicantID');
    //conRecord = [Select Id,name from contact where name =: userinfo.getName() Limit 1];
    
     conRecord = [SELECT Age_group__c,Any_disability__c,Any_other_Asian_background__c,Any_other_Black_African_Caribean_backgro__c,Any_other_ethnic_group__c,Any_other_mixed_multiple_ethnic_backgrou__c,Any_Other_White_Backgrount_Details__c,
    Any_previous_home_addresses__c,Asian_or_Asian_British__c,AssistantName,AssistantPhone,Birthdate,Black_African_Caribbean_Black_British__c,CleanStatus,CreatedById,CreatedDate,Department,Description,Does_not_want_to_answer_equality_info__c,
    Email,EmailBouncedDate,EmailBouncedReason,Ethnic_group__c,Fax,FirstName,Forenames_state_all__c,Gender__c,Height_in_cm__c,HomePhone,Id,IsDeleted,IsEmailBounced,Jigsaw,JigsawContactId,Languages__c,LastActivityDate,LastCURequestDate,
    LastCUUpdateDate,LastModifiedById,LastModifiedDate,LastName,LastReferencedDate,LastViewedDate,LeadSource,Level__c,MailingAddress,MailingCity,MailingCountry,MailingLatitude,MailingLongitude,MailingPostalCode,MailingState,MailingStreet,
    MasterRecordId,Mixed_multiple_ethnic_groups__c,MobilePhone,Name,Nationality__c,Occupation__c,OtherAddress,OtherCity,OtherCountry,OtherLatitude,OtherLongitude,OtherPhone,OtherPostalCode,OtherState,OtherStreet,Other_ethnic_group__c,
    OwnerId,Phone,PhotoUrl,Place_of_birth__c,Previous_surname_s__c,ReportsToId,Salutation,SystemModstamp,Title,White__c FROM Contact  where Email =: userinfo.getUserEmail() Limit 1];
    
    app = [SELECT Id,Name, Applicant__c, Application_Status__c from Application__c where Applicant__c=: conRecord.Id order by CreatedDate DESC Limit 1];
    
    
    ListApplications  = new List<Application__c>();
    //ListApplications  = [select Id, Name, License_Type__c, status__c,Edit__c from Application__c where Applicant__c =: conRecord.Id];
       ListApplications  = [select  Id,Action__c,additional_information__c,Applicant_name__c,Applicant__c,Application_ID__c,Application_Status__c,Box_com_Folder_Id__c,convicted_of_any_offence__c,Co_Termious__c,
                Date__c,Declaration__c,Detailsmedicaltreatment__c,Details_Of_medical_Conditions__c,Disclaimer__c,Edit__c,Firearm_certificate__c,Firearm__c,GPE_mail__c,GP_Address__c,
                GP_Name__c,GP_Postcode__c,GP_Tel_number__c,IsDeleted,Is_Applicant_a_Minor__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Last_Modified__c,
                License_Type__c,Name,OwnerId,Parent_Guardian_Name__c,Parent_Guardian__c,Payment_Status__c,Security_Details__c,Shotgun_certificate__c,Shotgun__c,Status__c,
                treatment_for_depression_or_other__c,You_suffer_from_any_medical_condition__c FROM Application__c where Applicant__c =: conRecord.Id 
                order by CreatedDate DESC];
      con.LastName= conRecord.LastName;
     
    }
    public void addhelditem(){}
    
    public pagereference editApplication()
    {
         Id conId=conRecord.Id;
         System.debug('conRecord ----------------------------------'+conId);
         if(app.Application_Status__c=='Draft' || app.Application_Status__c=='Need More Information')
         {
             PageReference pageRef = new PageReference('/apex/ApplicationForm_PartA?applicantID='+ApexPages.currentPage().getParameters().get('applicantID'));
             system.debug('----applicantID------'+applicantID);
             return pageRef;
         }
         else
         {
             PageReference pageRef = new PageReference('/apex/ApplicationManagement');
             return pageRef;
         }

    }
    
    public pagereference ChangePaymentStatus()
    {
        system.debug('----Inside ChangePaymentStatus-----');
        //String id= ApexPages.currentPage().getParameters().get('applicantID');
         appid =[select  Id,Action__c,additional_information__c,Applicant_name__c,Applicant__c,Application_ID__c,Application_Status__c,Payment_Status__c,convicted_of_any_offence__c,Co_Termious__c,
                        Date__c,Declaration__c,Detailsmedicaltreatment__c,Details_Of_medical_Conditions__c,Disclaimer__c,Firearm_certificate__c,Firearm__c,GPE_mail__c,GP_Address__c,GP_Name__c,GP_Postcode__c,
                        GP_Tel_number__c,Is_Applicant_a_Minor__c,License_Type__c,Name,OwnerId,Parent_Guardian_Name__c,Parent_Guardian__c,Security_Details__c,Shotgun_certificate__c,Shotgun__c,Status__c,
                        treatment_for_depression_or_other__c,You_suffer_from_any_medical_condition__c FROM Application__c where Id=: ApexPages.currentPage().getParameters().get('id')];
                        system.debug('----------------appid-=------------------------'+appid);
                        
                        system.debug('----------------Before Payment-=------------------------'+appid.Payment_Status__c);
        appid.Payment_Status__c ='paid';
        pay.Application__c = appid.Id;
        
        system.debug('----------------Payment done-=------------------------'+appid.Payment_Status__c);
        upsert appid;
        insert pay;
        system.debug('----------------Pay Id-=------------------------'+pay.Id);
        
        return new PageReference('javascript:window.opener.location.reload()');
       //return new PageReference('javascript:window.close()');
        //return null;

    }
    
    public pagereference CloseWindow()
    {
        system.debug('Inside CloseWindow');
        return new PageReference('javascript:window.close()');
    }
    
    public pagereference RedirectToHome()
    {
     PageReference pageRef = new PageReference('/apex/Box');
            return pageRef;

    }
    
    //--------------------------------------------------------
     /*public pagereference uploadFile()
        {
        PageReference pageRef = new PageReference('/apex/UploadDocuments');
            return pageRef;
        
        
         }*/
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
        //--------------------------------------------------------------
        
        ///////////////////////////////////////////////////////////
        public pagereference close()
        {
        return new PageReference('javascript:window.close()');
        }
        ////////////////////////////////////////////////////////////
    
}