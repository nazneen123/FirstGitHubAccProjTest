Public class ApplicationEdit
{
    public contact con1{get;set;}
    Public application__c app1{get;set;}
    public List<Application__c> ListApplications{get;set;}
    public Contact conRecord1{get;set;}
    public id applicantID{set;get;}
    
    public ApplicationEdit(){}
    public ApplicationEdit(ApplicationFormController controller)
    {
        con1 = new contact();
        conRecord1 = new Contact();
        conRecord1 = [Select Id,name from contact where name =: userinfo.getName() Limit 1];
        applicantID= ApexPages.currentPage().getParameters().get('applicantID');
        ListApplications  = new List<Application__c>();
        
        //ListApplications  = [select Id, Name, License_Type__c, status__c,Edit__c from Application__c where Applicant__c =: conRecord.Id];
        ListApplications  = [select  Id,Action__c,additional_information__c,Applicant_name__c,Applicant__c,Application_ID__c,Application_Status__c,Box_com_Folder_Id__c,convicted_of_any_offence__c,Co_Termious__c,
                Date__c,Declaration__c,Detailsmedicaltreatment__c,Details_Of_medical_Conditions__c,Disclaimer__c,Edit__c,Firearm_certificate__c,Firearm__c,GPE_mail__c,GP_Address__c,
                GP_Name__c,GP_Postcode__c,GP_Tel_number__c,IsDeleted,Is_Applicant_a_Minor__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Last_Modified__c,
                License_Type__c,Name,OwnerId,Parent_Guardian_Name__c,Parent_Guardian__c,Payment_Status__c,Security_Details__c,Shotgun_certificate__c,Shotgun__c,Status__c,
                treatment_for_depression_or_other__c,You_suffer_from_any_medical_condition__c FROM Application__c where Applicant__c =: conRecord1.Id];
        
    }
    
}