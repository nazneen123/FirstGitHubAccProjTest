public class ApplicationFormController {

    public contact con{get;set;}
    Public application__c app{get;set;}
    Public Boolean renderShotgun{get;set;}
    Public Boolean renderFirearm{get;set;}
    Public Contact conRecord{get;set;}
    public List<armsHeldWrapper> armsHeldWrapperList{get;set;}
    Public List<Arms_Held__c> ContactsArmsheldList{get;set;}
    Public List<Arms_Held__c> selectedArmHeldList{get;set;}
    public List<uploadDocumentWrapper> uploadDocumentWrapperList{get;set;}
    public List<Uploaded_Document__c> documentListToBeInserted{get;set;}
    public application__c AppRecord{get;set;}
    public integer rowNumber{get;set;}
    public String FolderId{get;set;}
    
  
    //Priyanka's Part
    
    //public Application__c applicationID{get;set;}  
    public Application__c a{get;set;}    
    public Application__c a1{get;set;}
    public Application__c appli{get;set;}
    public String appIdd{get;set;}
    public Attachment att{get;set;}
    
    public List<Application__c> ListApplications{get;set;}
    public id applicantID{set;get;}
    ApexPages.StandardController controller;
    Public Application__c app1{get;set;}
    Public Application__c appDetail{get;set;}
    public Application__c  app_update {set; get;}
    Public List<Previous_Address__c> prevAddr1{get;set;}
    
    Public Offence__c off{get;set;}
    Public List<Offence__c> offlist{get;set;}
    //Public application__c app{get;set;}
    Public Arms_Held__c armheld{get;set;}
    Public Arms_Requested__c armreq{get;set;}
    Public Type_Of_security__c tos {get;set;} 
    Public Type_Of_security__c tos1{get;set;}
    public Offence__c offences;
    public Offence__c del;
    public List<Offence__c > addoffenceList{get;set;}
    public List<Offence__c > deloffenceList{get;set;}
    public List<Offence__c > offenceList{get;set;}
    public List<Offence__c > FinaloffenceList{get;set;}
    public Integer totalCount {get;set;}
    public Integer rowIndex {get;set;}
    public List<Offence__c> delOffences{get; set;}  
    public Arms_Requested__c arms;
    public Arms_Requested__c delReq; 
    public List<Arms_Held__c> addarmsheld{get;set;} 
    public List<Arms_Requested__c> addarmsList{get;set;}

    public List<Arms_Requested__c> delarmsList {get;set;}
    public List<Arms_Requested__c> armList{get;set;}
    public List<Arms_Requested__c> finalarmsRequestedList{get;set;}
    public List<Arms_Requested__c> ShotgunRequestedList{get;set;}
    public List<Arms_Requested__c> shotgunList{get;set;}
    public List<Arms_Requested__c> delgunList {get;set;}

    public Arms_Requested__c delgun;
    
    Public Arms_Requested__c gunreq{get;set;}
    public List<ShotgunWrapper> shotgunWrapperList{get;set;}
    Public List<Arms_Held__c> armHeldCheck{get;set;}
    Public Boolean checkselected{get;set;}
    
    Public List<Arms_Held__c> ContactsShotgunList{get;set;}
    Public List<Arms_Held__c> selectedShotgunList{get;set;}
    public Integer totalCountReq{get;set;}
    public Integer rowIndexReq{get;set;}
    public Integer rowIndexGun {get;set;}
    public Integer test{get;set;}
    public Integer abc{get;set;}
    
    public List<Arms_Requested__c> delarms{get; set;}
    Public Nominated_Land_and_Club__c nlc{get;set;}
    
    public List<Previous_Address__c> addPrevAddress{get;set;} 
     public List<Previous_Address__c> FinalPrevAddrList{get;set;} 
    Public Previous_Address__c prevAddr{get;set;}
    Public Boolean renderPrevAddr{get;set;}
    
    Public Boolean signaturepage {get;set;}
    
    public List<Referee__c> RefList{get;set;}
    public List<Referee__c> FinalRefList{get;set;}
    
    //Naveen's Part
    
    public Referee__c ref{get;set;}
    public Referee__c ref1{get;set;}
    
    
    public Previous_Address__c  prevAddress{get;set;}
    
    public class armsHeldWrapper
    {
        public Arms_Held__c armsHeld{get; set;}
        public Boolean selected {get; set;}
        public armsHeldWrapper(Arms_Held__c  a)
        {
            armsHeld = a;
            selected = false;
        }
    }
    
    public class ShotgunWrapper
    {
        public Arms_Held__c shotgunHeld{get; set;}
        public Boolean selectedgun {get; set;}
        public ShotgunWrapper(Arms_Held__c  s)
        {
            shotgunHeld = s;
            selectedgun = false;
        }
    }
    
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
    /* public ApplicationFormController(ApexPages.StandardController controller)
    {              
        appId = apexpages.currentpage().getparameters().get('id');   
    }*/
    
    public ApplicationFormController()
    {
        rowNumber= 0;
        renderPrevAddr=false;
        
        renderShotgun = false;
        renderFirearm = false;
        checkselected = false;
        
        signaturepage =true;
        
        con = new contact();
        conRecord = new Contact();
        app = new application__c();
        app1 = new application__c();
        appDetail =new application__c();
        String us = userinfo.getUserType(); 
        system.debug('--------------userinfo.getUserType();-----------------'+userinfo.getUserType());
        system.debug('--------------userinfo.getName()-----------------'+userinfo.getName());
        system.debug('--------------userinfo.getFirstName()-----------------'+userinfo.getFirstName());
        //conRecord = [Select Id,name from contact where name =: userinfo.getName() Limit 1];
        system.debug('-----------conRecord --------------'+conRecord);
        
        //Priyanka's part
          
         applicantID= ApexPages.currentPage().getParameters().get('applicantID');
         system.debug('---------LINE 163 :APP ID  ---------------'+ApexPages.currentPage().getParameters().get('applicantID'));
         system.debug('---------URL ID ---------------'+ApexPages.currentPage().getParameters().get('applicantID'));
         appIdd = apexpages.currentpage().getparameters().get('applicantID');
        
        con = [SELECT Age_group__c,Any_disability__c,Any_other_Asian_background__c,Any_other_Black_African_Caribean_backgro__c,Any_other_ethnic_group__c,Any_other_mixed_multiple_ethnic_backgrou__c,Any_Other_White_Backgrount_Details__c,
            Any_previous_home_addresses__c,Asian_or_Asian_British__c,AssistantName,AssistantPhone,Birthdate,Black_African_Caribbean_Black_British__c,CleanStatus,CreatedById,CreatedDate,Department,Description,Does_not_want_to_answer_equality_info__c,
            Email,EmailBouncedDate,EmailBouncedReason,Ethnic_group__c,Fax,FirstName,Forenames_state_all__c,Gender__c,Height_in_cm__c,HomePhone,Id,IsDeleted,IsEmailBounced,Jigsaw,JigsawContactId,Languages__c,LastActivityDate,LastCURequestDate,
            LastCUUpdateDate,LastModifiedById,LastModifiedDate,LastName,LastReferencedDate,LastViewedDate,LeadSource,Level__c,MailingAddress,MailingCity,MailingCountry,MailingLatitude,MailingLongitude,MailingPostalCode,MailingState,MailingStreet,
            MasterRecordId,Mixed_multiple_ethnic_groups__c,MobilePhone,Name,Nationality__c,Occupation__c,OtherAddress,OtherCity,OtherCountry,OtherLatitude,OtherLongitude,OtherPhone,OtherPostalCode,OtherState,OtherStreet,Other_ethnic_group__c,
            OwnerId,Phone,PhotoUrl,Place_of_birth__c,Previous_surname_s__c,ReportsToId,Salutation,SystemModstamp,Title,White__c FROM Contact  where name =: userinfo.getName() Limit 1];

        system.debug('----------------conRecord -=------------------------'+conRecord);
        
        off = new Offence__c ();
        offenceList =new List<Offence__c>();
        offlist =new List<Offence__c>();
        armheld= new Arms_Held__c ();
        armreq = new Arms_Requested__c();
        gunreq = new Arms_Requested__c();
        tos =new Type_Of_security__c();
        tos1 =new Type_Of_security__c();
        armList=new List<Arms_Requested__c>(); 
        shotgunList =new List<Arms_Requested__c>(); 
        RefList =new List<Referee__c>();
          
        offences = new Offence__c();
        offenceList = [Select id,Date__c,Name from Offence__c where Id =: offences.Id];
        totalCount = offenceList.size();
        deloffenceList = new List<Offence__c>();
        delOffences = new List<Offence__c>();
        arms = new Arms_Requested__c();
        //armList = [Select id,Calibre__c,Type__c,Reason__c from Arms_Requested__c where Id =: arms.Id];
        //totalCountReq  = armList.size();
         //shotgunList = [Select id,Calibre__c,Type__c,Reason__c from Arms_Requested__c where Id =: arms.Id and Type__c='Shotgun'];
        delgunList = new List<Arms_Requested__c>();
        delarmsList = new List<Arms_Requested__c>();
        delarms = new List<Arms_Requested__c>(); 
        nlc =new Nominated_Land_and_Club__c();
        
        armHeldCheck =new List<Arms_Held__c>();
        
        prevAddr =new Previous_Address__c ();
        FinalPrevAddrList =new List<Previous_Address__c>();
        addPrevAddress=new List<Previous_Address__c>();
         for(integer i=0;i<3;i++)
         {
             Previous_Address__c p= new Previous_Address__c();
              addPrevAddress.add(p);
         }
       /* if(app.License_Type__c != null && (app.License_Type__c == 'Firearm'))
        {
            for(integer i=0;i<2;i++)
             {
                Referee__c r=new Referee__c();
                RefList.add(r);
             }
        }
        */
        //Naveen's Part
        
        ref = new Referee__c();
        ref1 = new Referee__c();
        prevAddress = new Previous_Address__c();
        
        
        
        //=======================EDIT =====================================
        
         if(ApexPages.currentPage().getParameters().get('applicantID') !=null)
                {     
                  app =[select  Id,Action__c,additional_information__c,Applicant_name__c,Applicant__c,Application_ID__c,Application_Status__c,convicted_of_any_offence__c,Co_Termious__c,
                        Date__c,Declaration__c,Detailsmedicaltreatment__c,Details_Of_medical_Conditions__c,Disclaimer__c,Firearm_certificate__c,Firearm__c,GPE_mail__c,GP_Address__c,GP_Name__c,GP_Postcode__c,
                        GP_Tel_number__c,Is_Applicant_a_Minor__c,License_Type__c,Name,OwnerId,Parent_Guardian_Name__c,Parent_Guardian__c,Payment_Status__c,Security_Details__c,Shotgun_certificate__c,Shotgun__c,Status__c,
                        treatment_for_depression_or_other__c,You_suffer_from_any_medical_condition__c FROM Application__c where Id=: applicantID];
                        system.debug('----------------app-=------------------------'+app);
                
                if(con.Any_previous_home_addresses__c==true)
                {
                    renderPrevAddr=true;
                    addPrevAddress =[SELECT Address_Line_1__c,Address_Line_2__c,Application__c,Contact__c,Country__c,From__c,Id,Name,Postcode__c,State__c,To__c FROM Previous_Address__c where Application__c =:applicantID];
                    system.debug('----------------addPrevAddress-=------------------------'+addPrevAddress);
                }
                if(app.convicted_of_any_offence__c =='Yes')
                {
                    offenceList = [SELECT Application__c,Contact__c,Date__c,Id,Name FROM Offence__c  where Application__c=: applicantID];
                    system.debug('----------------offenceList-=------------------------'+offenceList);
                    
                }
                
                if(app.License_Type__c == 'Firearm')
                {
                    armList= [SELECT Application__c,Calibre__c,Contact__c,Do_you_want_to_acquire_any_firearm__c,Id,Name,Reason__c,Type__c FROM Arms_Requested__c 
                        where Application__c =: applicantID and Type__c='Firearm'];
                    system.debug('----------------armList-=------------------------'+armList);
                    
                    tos = [SELECT Ammunition_storage_details__c,Application__c,CreatedById,CreatedDate,Details_of_security_arrangements__c,Id,
                        Name,OwnerId,security_arrangements__c,Security_Details__c,Security_shared_Details__c,security_shared_with_anothers__c,Type_of_security__c,
                        Type__c FROM Type_Of_Security__c where Application__c=: applicantID and Type__c='Firearm']; 
                    
                    RefList=[SELECT Application__c,Contact__c,CreatedById,CreatedDate,Date_of_birth__c,Forenames_state_all__c,Home_address__c,Home_Email__c,How_long_has_the_referee_known_you__c,
                        Id,In_what_capacity_do_you_know_the_referee__c,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Mobile_number__c,Name,Occupation__c,OwnerId,
                        Place_of_Birth__c,Postcode__c,Surname__c,SystemModstamp,Tel_number__c,Title__c,Work_Email__c,Work_Tel_number__c FROM Referee__c where Application__c=: applicantID ]; 
                     ref=RefList[0];
                     ref1=RefList[1];
                     
                     nlc=[SELECT Acreage_of_land__c,Application__c,Calibres_authorised__c,Club_name__c,Club_Secretary_s_name__c,Declaration_by_the_Club_Secretary__c,Declaration_by_the_land_owner__c,Id,
                         If_in_use_for_others__c,IsDeleted,Landowner_s_name__c,Landowner_s_telephone__c,Membership_expiry_Date__c,Name,Name_address_of_land__c,The_use_is_for__c 
                         FROM Nominated_Land_and_Club__c where Application__c=: applicantID];
                    
                   
                }
                
                if(app.License_Type__c == 'Shotgun')
                {
                    shotgunList= [SELECT Application__c,Calibre__c,Contact__c,Do_you_want_to_acquire_any_firearm__c,Id,Name,Reason__c,Type__c FROM Arms_Requested__c 
                            where Application__c =: applicantID and Type__c='Shotgun'];
                    system.debug('----------------shotgunList-=------------------------'+shotgunList);
                    
                    tos1 = [SELECT Ammunition_storage_details__c,Application__c,CreatedById,CreatedDate,Details_of_security_arrangements__c,Id,
                        Name,OwnerId,security_arrangements__c,Security_Details__c,Security_shared_Details__c,security_shared_with_anothers__c,Type_of_security__c,
                        Type__c FROM Type_Of_Security__c where Application__c=:applicantID and Type__c='Shotgun']; 
                    
                    ref =[SELECT Application__c,Contact__c,CreatedById,CreatedDate,Date_of_birth__c,Forenames_state_all__c,Home_address__c,Home_Email__c,How_long_has_the_referee_known_you__c,
                        Id,In_what_capacity_do_you_know_the_referee__c,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Mobile_number__c,Name,Occupation__c,OwnerId,
                        Place_of_Birth__c,Postcode__c,Surname__c,SystemModstamp,Tel_number__c,Title__c,Work_Email__c,Work_Tel_number__c FROM Referee__c where Application__c=: applicantID ];
                }
                
                if(app.License_Type__c == 'Both')
                {
                   armList= [SELECT Application__c,Calibre__c,Contact__c,Do_you_want_to_acquire_any_firearm__c,Id,Name,Reason__c,Type__c FROM Arms_Requested__c 
                        where Application__c =: applicantID and Type__c='Firearm'];
                    system.debug('----------------armList-=------------------------'+armList);
                    
                    tos = [SELECT Ammunition_storage_details__c,Application__c,CreatedById,CreatedDate,Details_of_security_arrangements__c,Id,
                        Name,OwnerId,security_arrangements__c,Security_Details__c,Security_shared_Details__c,security_shared_with_anothers__c,Type_of_security__c,
                        Type__c FROM Type_Of_Security__c where Application__c=: applicantID and Type__c='Firearm'];
                        
                    shotgunList= [SELECT Application__c,Calibre__c,Contact__c,Do_you_want_to_acquire_any_firearm__c,Id,Name,Reason__c,Type__c FROM Arms_Requested__c 
                            where Application__c =: applicantID and Type__c='Shotgun'];
                    system.debug('----------------shotgunList-=------------------------'+shotgunList);
                    
                    tos1 = [SELECT Ammunition_storage_details__c,Application__c,CreatedById,CreatedDate,Details_of_security_arrangements__c,Id,
                        Name,OwnerId,security_arrangements__c,Security_Details__c,Security_shared_Details__c,security_shared_with_anothers__c,Type_of_security__c,
                        Type__c FROM Type_Of_Security__c where Application__c=: applicantID and Type__c='Shotgun']; 
                    
                    RefList=[SELECT Application__c,Contact__c,CreatedById,CreatedDate,Date_of_birth__c,Forenames_state_all__c,Home_address__c,Home_Email__c,How_long_has_the_referee_known_you__c,
                        Id,In_what_capacity_do_you_know_the_referee__c,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Mobile_number__c,Name,Occupation__c,OwnerId,
                        Place_of_Birth__c,Postcode__c,Surname__c,SystemModstamp,Tel_number__c,Title__c,Work_Email__c,Work_Tel_number__c FROM Referee__c where Application__c=: applicantID ]; 
                     ref=RefList[0];
                     ref1=RefList[1];
                     
                    nlc=[SELECT Acreage_of_land__c,Application__c,Calibres_authorised__c,Club_name__c,Club_Secretary_s_name__c,Declaration_by_the_Club_Secretary__c,Declaration_by_the_land_owner__c,Id,
                         If_in_use_for_others__c,IsDeleted,Landowner_s_name__c,Landowner_s_telephone__c,Membership_expiry_Date__c,Name,Name_address_of_land__c,The_use_is_for__c 
                         FROM Nominated_Land_and_Club__c where Application__c=: applicantID];
                 }
                }
        
        //=======================EDIT =====================================
        
        
        integer ArmHeldCount = [Select count() from Arms_Held__c where Contact__c =: con.Id];
        if(ArmHeldCount >0)
        {
            ContactsArmsheldList = New List<Arms_Held__c>();
            ContactsArmsheldList = [Select Id,Name,Calibre__c,Certificate__c,Contact__c,Do_You_Hold_Any_Firearm__c,Make__c,Reason__c,Serial_No__c,Type__c,Type_Action__c 
                                    from Arms_Held__c where Contact__c =: con.Id and Type__c='Firearm'];
            if(ContactsArmsheldList!= null && !ContactsArmsheldList.isEmpty())
            {
                armsHeldWrapperList = new list<armsHeldWrapper>();
                for(Arms_Held__c armsHe :ContactsArmsheldList)
                {
                    armsHeldWrapperList.add(new armsHeldWrapper(armsHe));
                }    
            }
        }
        
                 
        integer ShotgunCount = [Select count() from Arms_Held__c where Contact__c =: con.Id and Type__c='Shotgun'];
        if(ShotgunCount >0)
        {
            ContactsShotgunList = New List<Arms_Held__c>();
            ContactsShotgunList = [Select Id,Name,Calibre__c,Certificate__c,Contact__c,Do_You_Hold_Any_Firearm__c,Make__c,Reason__c,Serial_No__c,Type__c,Type_Action__c 
                                   from Arms_Held__c where Contact__c =: con.Id and Type__c='Shotgun'];
            if(ContactsShotgunList!= null && !ContactsShotgunList.isEmpty())
            {
                shotgunWrapperList= new list<ShotgunWrapper>();
                for(Arms_Held__c gun1 :ContactsShotgunList)
                {
                    shotgunWrapperList.add(new ShotgunWrapper(gun1));
                }    
            }
        }
        
        
        
        uploadDocumentWrapperList = new List<uploadDocumentWrapper>();
        uploadDocumentWrapper varUpload = new uploadDocumentWrapper();
        uploadDocumentWrapperList.clear();
        uploadDocumentWrapperList.add(varUpload);
       // App = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : ApexPages.currentPage().getParameters().get('id')];
        
    }
    
     //EDITAPPLICATION ===============================
    
  /*  public pagereference editApplication()
    {
         
         applicantID = ApexPages.currentPage().getParameters().get('applicantID');
         app_update= (Application__c)controller.getRecord();
         app_update.Id=applicantID;
         System.debug('app_update----------------------------------'+app_update);
         //upsert app_update;
         //app1 =[select Id, Name, License_Type__c, status__c,Edit__c from Application__c where Id=: applicantID];
         System.debug('applicantID ----------------------------------'+applicantID);
         System.debug('app1----------------------------------'+app1);
         PageReference pageRef = new PageReference('/apex/ApplicationForm_PartA?id='+applicantID);
         return pageRef;

    }

    // RedirectToHome
    public pagereference RedirectToHome()
    {
         PageReference pageRef = new PageReference('/apex/Box');
         return pageRef;
    }*/
    
    // previous Address --------------
    
      
    public PageReference callPreviousAddress() 
    {
        system.debug('control came to previous address');
        if(con.Any_previous_home_addresses__c == false)
        {
            renderPrevAddr=false;
        }
        if(con.Any_previous_home_addresses__c == true)
        {
        
            renderPrevAddr=true;
            
        }
            return null;
    }
        

    public PageReference changeInLicenseType() 
    {
        system.debug('control came here');
        if(app.License_Type__c == null)
        {
            renderFirearm = false;
            renderShotgun = false;
        }
        if(app.License_Type__c != null)
        {
            if(app.License_Type__c == 'Shotgun')
            {
                renderShotgun = true;
                renderFirearm = false;
                system.debug('control came here1');
            }
            if(app.License_Type__c == 'Firearm')
            {
                renderFirearm = true;
                renderShotgun = false;
                system.debug('control came here2');
            }
            if(app.License_Type__c == 'Both')
            {
                renderShotgun = true;
                renderFirearm = true;     
            }
            
        }
            return null;
    }
    
    public PageReference RedirectToPage1() 
    {
        if(app.License_Type__c != null)
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartA');
            return pageRef;
        }
        
        return null;
    }
    
    public PageReference NextButton_PartA() 
    {   
       
        system.debug('-------------------conRecord.LastName after----------------------------'+con.LastName);
        system.debug('-------------------con.LastName----------------------------'+con.LastName); 
        conRecord.Gender__c = con.Gender__c ;
        //conRecord.LastName = con.LastName ;
        //conRecord.FirstName = con.FirstName ;
        conRecord.Title= con.Title;
        conRecord.Previous_surname_s__c = con.Previous_surname_s__c ;
        conRecord.Forenames_state_all__c = con.Forenames_state_all__c ;
        conRecord.MailingStreet = con.MailingStreet ;
        conRecord.MailingCity = con.MailingCity;
        conRecord.MailingState = con.MailingState ;
        conRecord.MailingPostalCode = con.MailingPostalCode ;
        conRecord.MailingCountry = con.MailingCountry ;
        conRecord.Phone = con.Phone ;
        conRecord.MobilePhone = con.MobilePhone ;
        conRecord.Email = con.Email;
        conRecord.Any_previous_home_addresses__c = con.Any_previous_home_addresses__c ;
        conRecord.Height_in_cm__c = con.Height_in_cm__c;
        conRecord.Birthdate = con.Birthdate ;
        conRecord.Place_of_birth__c = con.Place_of_birth__c ;
        conRecord.Nationality__c = con.Nationality__c;
        conRecord.Occupation__c = con.Occupation__c ;
        conRecord.OtherStreet = con.OtherStreet ;
        conRecord.OtherCity = con.OtherCity ;
        conRecord.OtherState = con.OtherState ;
        conRecord.OtherPostalCode = con.OtherPostalCode ;
        conRecord.OtherCountry = con.OtherCountry ;
        conRecord.OtherPhone = con.OtherPhone;
        
        system.debug('==============applicantID ====================='+applicantID);
        system.debug('-------------------conRecord.LastName after----------------------------'+conRecord.LastName);
        if(applicantID == null)
         {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartB');
            return pageRef;
         }
         else
         {
             PageReference pageRef = new PageReference('/apex/ApplicationForm_PartB?applicantID='+ApexPages.currentPage().getParameters().get('applicantID'));
             //pageRef.setRedirect(true);
             system.debug('-------------------conRecord.LastName after----------------------------'+conRecord.LastName);
            return pageRef;
         }
    }
    
    public PageReference NextButton_PartB() 
    {
        //Update conRecord;
        //app.Applicant__c = conRecord.Id;
        //Insert app;
         //PageReference pageRef;
         
         PageReference pageRef = new PageReference('/apex/ApplicationForm_PartC');
                return pageRef;
         
      /*  If(app.Disclaimer__c==false)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error,'please accept terms and conditions');
            ApexPages.addMessage(myMsg);
           
           PageReference pageRef = new PageReference('/apex/ApplicationForm_PartC');
           } 
        else {
               PageReference pageRef = new PageReference('/apex/ApplicationForm_PartC');
                return pageRef;
               }
            return null;
            */
    }
    public PageReference  show_error()
    {
    
    if (app.You_suffer_from_any_medical_condition__c == null)
{
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
    return null;
} 
    
        // if(app.You_suffer_from_any_medical_condition__c == '--None--')
         // {
         //  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter If you suffer from any medical condition'));
         //  }
          else if(app.treatment_for_depression_or_other__c == '--None--')
          {
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter If you have gone through any depression treatment'));
           } 
         
          else if(app.GP_Name__c == '' || app.GP_Name__c == null)
          {
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter General physician name'));
           } 
           
          else if(app.GPE_mail__c == '' || app.GPE_mail__c == null)
           {
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter General physician email Id'));
           //PageReference pageRef = new PageReference('/apex/ApplicationForm_PartC');
           PageReference pageRef = new PageReference('/apex/TestSamplePage');
           } 
        else 
           {
               PageReference pageRef = new PageReference('/apex/TestSamplePage');
               return pageRef;
           }
            return null;
    
    }
    
    public PageReference NextButton_PartC() 
    {
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartD');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartE');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartD');
            return pageRef;
        }
        
         //PageReference pageRef = new PageReference('/apex/ApplicationForm_PartD');
            //return pageRef;
        return null;
                
    }
    
    public PageReference NextButton_PartD() 
    {
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            app.Firearm_certificate__c=true;
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration');
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            app.Shotgun_certificate__c=true;
            PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartE');
            return pageRef;
        }
        
        return null;
        
    }
    
     public PageReference NextButton_PartE() 
    {
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            app.Shotgun_certificate__c=true;
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration');
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            app.Shotgun_certificate__c=true;
            app.Firearm_certificate__c=true;
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration');
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            return pageRef;
        }
        

        
        return null;   
    }
    
    public PageReference NextButton_Declaration() 
    {
    
     If(app.Declaration__c==false)
    {
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error,'please accept terms and conditions');
    ApexPages.addMessage(myMsg);
     }
    
       if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            PageReference pageRef = new PageReference('/apex/UploadDocuments');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            PageReference pageRef = new PageReference('/apex/UploadDocuments');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            PageReference pageRef = new PageReference('/apex/UploadDocuments');
            return pageRef;
        }
        upsert app;
        return null;   
        //PageReference pageRef = new PageReference('/apex/UploadDocuments');
          //  return pageRef;
    }
    
    public PageReference NextButton_PartF_Refree1() 
    {
    
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee2');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_EqualityInfo');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee2');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference NextButton_PartF_Refree2() 
    {
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/Nominated_Land_Club');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/Nominated_Land_Club');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference NextButton_NominatedLand() 
    {
    
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_EqualityInfo');
            return pageRef;
        } 
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee2');
            return pageRef;
        }     
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_EqualityInfo');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference RedirectToStartupPage() 
    {
        PageReference pageRef = new PageReference('/apex/ApplicationFormStartupPage');
            return pageRef;
    }
    
    public PageReference PreviousButton_PartB() 
    {
        PageReference pageRef = new PageReference('/apex/ApplicationForm_PartA');
            return pageRef;
    }
    
    public PageReference PreviousButton_PartC() 
    {
        PageReference pageRef = new PageReference('/apex/ApplicationForm_PartB');
            return pageRef;             
    }
    
    public PageReference PreviousButton_PartD() 
    {
        
        PageReference pageRef = new PageReference('/apex/ApplicationForm_PartC');
            return pageRef;
    }
    
     public PageReference PreviousButton_PartE() 
    {
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartC');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartC');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartD');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference PreviousButton_Declaration() 
    {
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_PartD');
            PageReference pageRef = new PageReference('/apex/ApplicationForm_EqualityInfo');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_PartE');
            PageReference pageRef = new PageReference('/apex/ApplicationForm_EqualityInfo');
            
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_PartE');
            PageReference pageRef = new PageReference('/apex/ApplicationForm_EqualityInfo');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference PreviousButton_PartF_Refree1() 
    {
    
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration');
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartD');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration');
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartE');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration');
            PageReference pageRef = new PageReference('/apex/ApplicationForm_PartE');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference PreviousButton_PartF_Refree2() 
    {
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference PreviousButton_NominatedLand() 
    {
    
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee2');
            return pageRef;
        }  
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee2');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference PreviousButton_EqualityInfo() 
    {
    
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            PageReference pageRef = new PageReference('/apex/Nominated_Land_Club');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            PageReference pageRef = new PageReference('/apex/ApplicationFormPartF_referee1');
            return pageRef;
        }
        else if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            PageReference pageRef = new PageReference('/apex/Nominated_Land_Club');
            return pageRef;
        }
        
        return null;   
    }
    
    public PageReference SaveData() 
    {
        system.debug('-------------SAVEDATA-----------------');
        system.debug('=======conRecord.LastName===='+conRecord.LastName);
        Update con;
        
        app.Applicant__c = con.Id;
        app.Applicant_name__c=con.Name;
        app.Application_Status__c = 'Draft';
        app.Payment_Status__c= 'Pending';
        Upsert app;
        
        FinaloffenceList = new List<Offence__c>();
        system.debug('-------------offenceList-----------------'+offenceList);
        for(Offence__c off :offenceList)
        {
            off.Application__c = app.Id;
            off.Contact__c = con.Id;
            FinaloffenceList.add(off);
        }
        system.debug('-------------FinaloffenceList-----------------'+FinaloffenceList);
        Upsert FinaloffenceList;
        
        if(con.Any_previous_home_addresses__c == true)
        {
            FinalPrevAddrList = new List<Previous_Address__c>();
            system.debug('-------------PrevAddrList -----------------'+addPrevAddress);
            for(Previous_Address__c prev_add:addPrevAddress)
            {
                prev_add.Application__c = app.Id;
                prev_add.Contact__c = con.Id;
                FinalPrevAddrList.add(prev_add);
            }
            if(FinalPrevAddrList!= null && !FinalPrevAddrList.isEmpty())
            {
                Upsert FinalPrevAddrList;
            }    
        }    
        
        //------------------------FIREARM -----------------------------------------
        
        if(app.License_Type__c != null && app.License_Type__c == 'Firearm')
        {
            finalarmsRequestedList = new List<Arms_Requested__c>();
            for(Arms_Requested__c armreq : armList)
            {
                armreq.Application__c = app.Id;
                armreq.Contact__c = con.Id;
                finalarmsRequestedList.add(armreq);
            }
            system.debug('-------------finalarmsRequestedList-----------------'+finalarmsRequestedList);
            Upsert finalarmsRequestedList;
            
            tos.application__c = app.Id;
            tos.Type__c = 'Firearm';
            Upsert tos;
            
            ref.Application__c= app.Id;
            ref.Contact__c = con.Id;
            system.debug('-------------ref-----------------'+ref);
            Upsert ref;

            ref1.Application__c= app.Id;
            ref1.Contact__c = con.Id;
            system.debug('-------------ref1-----------------'+ref1);
            Upsert ref1;
            
            nlc.Application__c= app.Id;
            Upsert nlc;
        }
        
        system.debug('-------------SHOTGUNLIST-----------------'+shotgunList);
        if(app.License_Type__c != null && app.License_Type__c == 'Shotgun')
        {
            ShotgunRequestedList = new List<Arms_Requested__c>();
            for(Arms_Requested__c gunreq : shotgunList)
            {
                gunreq.Application__c = app.Id;
                gunreq.Contact__c = con.Id;
                ShotgunRequestedList.add(gunreq);
            }
            system.debug('-------------ShotgunRequestedList-----------------'+ShotgunRequestedList);
            Upsert ShotgunRequestedList;
            
            tos1.application__c = app.Id;
            tos1.Type__c = 'Shotgun';
            Upsert tos1;
            
            ref.Application__c= app.Id;
            ref.Contact__c = con.Id;
            system.debug('-------------ref-----------------'+ref);
            Upsert ref;
            
        }
        
         //-------------BOTH-----------------
        if(app.License_Type__c != null && app.License_Type__c == 'Both')
        {
            
            finalarmsRequestedList = new List<Arms_Requested__c>();
            for(Arms_Requested__c armreq : armList)
            {
                armreq.Application__c = app.Id;
                armreq.Contact__c = con.Id;
                finalarmsRequestedList.add(armreq);
            }
            system.debug('-------------finalarmsRequestedList-----------------'+finalarmsRequestedList);
            Upsert finalarmsRequestedList;
            
            ShotgunRequestedList = new List<Arms_Requested__c>();
            for(Arms_Requested__c gunreq : shotgunList)
            {
                gunreq.Application__c = app.Id;
                gunreq.Contact__c = con.Id;
                ShotgunRequestedList.add(gunreq);
            }
            system.debug('-------------ShotgunRequestedList-----------------'+ShotgunRequestedList);
            Upsert ShotgunRequestedList;
            
            ref.Application__c= app.Id;
            ref.Contact__c = con.Id;
            system.debug('-------------ref-----------------'+ref);
            Upsert ref;
             
            ref1.Application__c= app.Id;
            ref1.Contact__c = con.Id;
            system.debug('-------------ref1-----------------'+ref1);
            Upsert ref1; 
            
            tos.application__c = app.Id;
            tos.Type__c = 'Firearm';
            Upsert tos;
            
            nlc.Application__c= app.Id;
            Upsert nlc;
            
            tos1.application__c = app.Id;
            tos1.Type__c = 'Shotgun';
            Upsert tos1;
            
            
        
            
        }
        
        //RefList 
       /* FinalRefList = new List<Referee__c>();
        system.debug('-------------RefList -----------------'+RefList );
        for(Referee__c refdet :RefList)
        {
            refdet.Application__c = app.Id;
            refdet.Contact__c = con.Id;
            FinalRefList.add(refdet);
            insert FinalRefList;
        }
        system.debug('-------------FinalRefList -----------------'+FinalRefList );
        */
        

            
 
        //tos1.application__c = app.Id;
        //tos1.Type__c = 'Shotgun';
        //insert tos1;
 
       /*string str = string.valueOf(app.id);

        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.box.com/2.0/folders');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer 1YXNPkOvNBrAqO8jHBrxUGmUsvOhk2LW');
        req.setBody('{"name":"'+ str +'", "parent": {"id": "0"}}');
        //req.setBody('{"name":"Test demo15", "parent": {"id": "0"}}');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded'); 
        HttpResponse res = h.send(req);
        System.debug(res.getBody());*/
        
        //PageReference pageRef = new PageReference('/apex/UploadDocuments');
      
       // PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?appId=a&imageData=null');
       
       
       //Application__c a = new Application__c();
       //a = [select id,name from Application__c where Id =: App.Id];
       
       
       appIdd =app.Id;
       system.debug('---------------------1024 Line : appidd--------------------'+appIdd);
       
       //system.debug('---------------------1026 Line : app.id--------------------'+appidd);
        //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?applicantID='+appIdd);
        PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?ID='+appIdd);
        
       //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?applicantID='+ApexPages.currentPage().getParameters().get('applicantID'));
       system.debug('-------pageref -----------'+pageref);
       //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?ID='+apexpages.currentpage().getparameters().get('appId'));
       //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?ID='+ApexPages.currentPage().getParameters().get('id'));
       
       return pageRef;
         
    }
    
    public PageReference  getApplicationId()
    {
        Application__c a1 = new Application__c();
         //a1 = [select id,name from Application__c where Id =: app.Id];
        system.debug('---------------------a1--------------------'+a1);
        PageReference pageRef = new PageReference('/apex/Application_Form_Pdf?a1='+ApexPages.currentPage().getParameters().get('a1 '));
        return pageRef;
    }
    
    public PageReference AddToArmsToBeAcquiredList() 
    {
        armHeldCheck =[Select Id,Calibre__c,Make__c,Reason__c from Arms_Held__c where Contact__c =: con.Id and Type__c='Firearm'];
        system.debug('----------armHeldCheck -------------------'+armHeldCheck);
        if(armHeldCheck  ==null)
        {
            checkselected =true;
            system.debug('----------checkselected -------------------'+checkselected);
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'No Arms.'));
        }
        selectedArmHeldList = new List<Arms_Held__c>();
    
        for(armsHeldWrapper wrapperRec: armsHeldWrapperList)
        { 
            if(wrapperRec.selected == true)
            {
            
                system.debug('----------checkselected -------------------'+checkselected);
                break;
            }
          
            if (wrapperRec.selected ==  false)
            {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select atleast one firearm.'));
            }   
            
        }
    
     for(armsHeldWrapper wrapperRec: armsHeldWrapperList)
        {   
            if(wrapperRec.selected == true)
            {
                selectedArmHeldList.add(wrapperRec.armsHeld);
                wrapperRec.selected = false;
            }
        }
        system.debug('----------selectedArmHeldList-------------------'+selectedArmHeldList);
        
        if(selectedArmHeldList!= null && !selectedArmHeldList.isEmpty())
        {
            for(arms_held__c ahrec : selectedArmHeldList)
            {
                Arms_Requested__c newArmReqRec = new Arms_Requested__c();
                newArmReqRec.Calibre__c = ahrec.Calibre__c;
                newArmReqRec.Type__c = ahrec.Type__c ;
                newArmReqRec.Reason__c = ahrec.Reason__c;
                armList.add(newArmReqRec);
                 //abc= Integer.valueOf(ApexPages.currentPage().getParameters().get('abc'));
                 //delReq= armList.remove(abc);
                 //integer rowIndexReq1  = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndexReq'));
                // rowNumber = rowNumber+1;
                 system.debug('------------------rowNumber-------------------'+rowNumber);
                //delarmsList.add(delReq);
                //abc=abc+1;
                //rowIndexReq= abc+1;
                
            }   
        }
        system.debug('----------armList-------------------'+armList);
        return null;
    }
    
    public PageReference RemoveFromArmsToBeAcquiredList() {
       
        return null;
    }
    
    public pagereference createFolderInBoxApplication()
    {
         AppRecord = new Application__c();
         AppRecord = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : App.Id];
        system.debug('------------------AppRecord.Name----------------'+AppRecord.Name);
        //if(AppRecord.Box_com_Folder_Id__c == '')
        //{
            String FolderId = BoxHelper.createFolder(AppRecord.Name,'0','');
            if(FolderId != '')
            {
                AppRecord.Box_com_Folder_Id__c = String.valueOf(FolderId);
                system.debug('--------------------String.valueOf(FolderId)-------------------'+String.valueOf(FolderId));
                //Update AppRecord;
            }
       // }
        return null;
    }
    
    //    ----------------shotgun Aquired---------------------
  
    public PageReference AddShotgunsToBeAcquiredList() 
    {
        armHeldCheck =[Select Id,Calibre__c,Make__c,Reason__c from Arms_Held__c where Contact__c =: con.Id and Type__c='Shotgun'];
        system.debug('----------armHeldCheck -------------------'+armHeldCheck);
        if(armHeldCheck ==null)
        {
            checkselected =true;
            system.debug('----------checkselected -------------------'+checkselected );
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'No Arms.'));
        }
        selectedShotgunList= new List<Arms_Held__c>();
        if(armHeldCheck != null)
        {
        for(ShotgunWrapper gunwrapper: ShotgunWrapperList)
        { 
            if(gunwrapper.selectedgun == true)
            {
                break;
            }
          
            if (gunwrapper.selectedgun == false)
            {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select atleast one shotgun.'));
            }   
            
        }
        }

        for(ShotgunWrapper gunwrapper: ShotgunWrapperList)
        { 

            if(gunwrapper.selectedgun == true)
            {
                selectedShotgunList.add(gunwrapper.shotgunHeld);
                gunwrapper.selectedgun = false;
            }
        }
        
        system.debug('----------selectedShotgunList-------------------'+selectedShotgunList);
        
        if(selectedShotgunList!= null && !selectedShotgunList.isEmpty())
        {
            for(arms_held__c gunrecord : selectedShotgunList)
            {
                Arms_Requested__c newgunrecord = new Arms_Requested__c();
                newgunrecord.Calibre__c = gunrecord.Calibre__c;
                newgunrecord.Type__c = gunrecord.Type__c ;
                newgunrecord.Reason__c = gunrecord.Reason__c;
                system.debug('------------------newgunrecord-------------------'+newgunrecord);
                shotgunList.add(newgunrecord);
  
            }   
        }
        system.debug('----------shotgunList-------------------'+shotgunList);
        return null;
    }
    

    
    public pagereference  goToSignaturePage()
    {
    
          //signaturepage=false;
          //String applicationID  = ApexPages.CurrentPage().getparameters().get('applicationID');
          //a= new Application__c();
          //a= [Select Id,name from Application__c Where Id = : App.Id];
          //update app;
          system.debug('----Inside goToSignaturePage method----');
          Pagereference pr = Page.OrderSignaturePage;
          pr.setRedirect(true);
          pr.getParameters().put('ID', App.Id);
          //pr.getParameters().put('imageData', 'imageData');
          
          
          return pr;
         
    }
    
     /*
        //----------------------FUNCTION FOR SIGNATURE CAPTURE-----------------------

    public pagereference captureSignature(){
        system.debug('--------------captureSignature------------------');
        appli= new Application__c();
        String orderVal = appId;
        String Image = String.valueOf(apexpages.currentpage().getparameters().get('imageData'));
        att = new Attachment(Name = 'test',Body = EncodingUtil.base64Decode(Image),ParentId = orderVal,ContentType = 'image/jpeg');
        system.debug('--------------att ------------------'+att);
        try{
            insert att;
            appli = [Select Id,Name,Signature_Url__c From Application__c Where Id =: appId];
            system.debug('--------------appli------------------'+appli);
            appli.Signature_Url__c = '/servlet/servlet.FileDownload?file='+att.Id ;
            
            upsert appli;
            system.debug('--------------After upsert appli------------------'+appli);
            
        }
        catch(Exception e){
        system.debug('--------------Exception thrown------------------'+e);}
        //PageReference pf= new PageReference('/apex/UploadDocuments?id=App.Id');
       // PageReference pf = new PageReference('/'+orderVal);
       // return pf;
       
       PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?ID='+apexpages.currentpage().getparameters().get('appId'));
           return pageRef;
       }*/
     
    /* public ApexPages.StandardSetController setApplication{
        get {
            if(setApplication== null) {
                setApplication= new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id, name from Application__c]));
            }
            return setApplication;
        }
        set;
    }
     public List<Application__c> getApplications() 
     {
         return (List<Application__c>) setApplication.getRecords();
     }  
    public PageReference Go()
    {
        Id id = System.currentPageReference().getParameters().get('id');
        PageReference nextpage = new PageReference('/apex/Application_Form_Pdf?id='+id);
        return nextpage;
    }*/
    
     public pagereference uploadFile()
     {  
         //Code to create folder in Box application
         
        AppRecord = new Application__c();
        AppRecord = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : App.Id];
        system.debug('--------------App.Id------------------'+App.Id);
        system.debug('------------------AppRecord.Name----------------'+AppRecord.Name);
        if(uploadDocumentWrapperList != null && !uploadDocumentWrapperList.isEmpty())
        {
        system.debug('-------------------uploadDocumentWrapperList[0].attach.body-----------'+uploadDocumentWrapperList[0].attach.body);
        if(uploadDocumentWrapperList[0].attach.body != null)
        {
        /*Changes made to handle token commit to Saleforce database in controller*/
        BoxOAuth__c boxoauth = new BoxOAuth__C();
        boxoauth =[select name,Auth_Token__C,Refresh_Token__c,AuthTokenExpires__c,RefreshTokenExpires__c from BoxOAuth__c where name='AtoS'];
        
        boxoauth = BoxHelper.authorizeBox(boxoauth);
        
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         
           if(AppRecord.Box_com_Folder_Id__c == '' || AppRecord.Box_com_Folder_Id__c == null)
           {
                FolderId = BoxHelper.createFolder(AppRecord.Name,'0',boxoauth.Auth_Token__c);
                system.debug('----------------FolderId createFolder-------------------------------'+FolderId);
            }
            if(AppRecord.Box_com_Folder_Id__c != null && AppRecord.Box_com_Folder_Id__c != '')
            {
               FolderId = AppRecord.Box_com_Folder_Id__c;
                system.debug('--------------------String.valueOf(FolderId)-------------------'+String.valueOf(FolderId));
                //Update AppRecord;  
            }
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*if(AppRecord.Box_com_Folder_Id__c == '')
        {
            //String FolderId = BoxHelper.createFolder(AppRecord.Name,'0',boxoauth.Auth_Token__c);
              FolderId = BoxHelper.createFolder(AppRecord.Name,'0',boxoauth.Auth_Token__c);
            if(FolderId != '')
            {
                AppRecord.Box_com_Folder_Id__c = String.valueOf(FolderId);
                system.debug('--------------------String.valueOf(FolderId)-------------------'+String.valueOf(FolderId));
                //Update AppRecord;
            }
         }*/
         //Code to create folder in Box application
         
        system.debug('-----------------uploadDocumentWrapperList[0]------------------'+uploadDocumentWrapperList[0]);
        system.debug('-----------------uploadDocumentWrapperList.size()------------------'+uploadDocumentWrapperList.size());
        application__c AppRecord1 = new Application__c();
        //AppRecord1 = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : App.Id];
        documentListToBeInserted = new List<Uploaded_Document__c>();
        //if(uploadDocumentWrapperList != null && uploadDocumentWrapperList.Size()>0)
        //{
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
            
            Update boxoauth;  
             
        }
        }
        AppRecord.Application_Status__c = 'Draft';
        AppRecord.Payment_Status__c= 'Pending';
        AppRecord.Box_com_Folder_Id__c = FolderId;
        Update AppRecord;
        PageReference pageRef = new PageReference('/apex/ThankYou_Save');
        return pageRef;
     }
     
     
     public pagereference SubmitApplication()
      {
                   //Code to create folder in Box application
         
        AppRecord = new Application__c();
        AppRecord = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : App.Id];
        system.debug('------------------AppRecord.Name----------------'+AppRecord.Name);
        system.debug('---------------- uploadDocumentWrapperList.Size()---------------'+ uploadDocumentWrapperList.Size());
        if(uploadDocumentWrapperList != null && uploadDocumentWrapperList.Size()>0)
        {
        if(uploadDocumentWrapperList[0].attach.body != null)
        {
        /*Changes made to handle token commit to Saleforce database in controller*/
        BoxOAuth__c boxoauth = new BoxOAuth__C();
        boxoauth =[select name,Auth_Token__C,Refresh_Token__c,AuthTokenExpires__c,RefreshTokenExpires__c from BoxOAuth__c where name='AtoS'];
        
        boxoauth = BoxHelper.authorizeBox(boxoauth);
        
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*if(AppRecord.Box_com_Folder_Id__c == '')
        {
            //String FolderId = BoxHelper.createFolder(AppRecord.Name,'0',boxoauth.Auth_Token__c);
              FolderId = BoxHelper.createFolder(AppRecord.Name,'0',boxoauth.Auth_Token__c);
            if(FolderId != '')
            {
                AppRecord.Box_com_Folder_Id__c = String.valueOf(FolderId);
                system.debug('--------------------String.valueOf(FolderId)-------------------'+String.valueOf(FolderId));
                //Update AppRecord;
            }
         }*/
         //Code to create folder in Box application
         
        system.debug('-----------------uploadDocumentWrapperList[0]------------------'+uploadDocumentWrapperList[0]);
        system.debug('-----------------uploadDocumentWrapperList.size()------------------'+uploadDocumentWrapperList.size());
        application__c AppRecord1 = new Application__c();
        //AppRecord1 = [Select Id,name,Box_com_Folder_Id__c from Application__c Where Id = : App.Id];
        documentListToBeInserted = new List<Uploaded_Document__c>();
        //if(uploadDocumentWrapperList != null && uploadDocumentWrapperList.Size()>0)
        //{
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
            
            
            
            Update boxoauth;  
             
        }
        }
        AppRecord.Application_Status__c = 'Submitted';
        Update AppRecord;
          //app.Application_Status__c = 'Submitted';
          //update app;
          PageReference pageRef = new PageReference('/apex/ThankYou_Submit');
            return pageRef;
      }
     
     
     public pagereference addFile()
      {
          //Uploaded_Document__c  docs= new Uploaded_Document__c();
          //DocumentList.add(docs);
        uploadDocumentWrapper varUpload1 = new uploadDocumentWrapper();
         
        uploadDocumentWrapperList.add(varUpload1);
        
        return null;
      }
    
    


    
    
    // Priyanka's Part
    
     public void addRow()
      {
          offence__c offs = new Offence__c();
          offenceList.add(offs);
      }
 
 
      public void addRowReq()
      {
          Arms_Requested__c ar= new Arms_Requested__c();
          
          //integer abc= Integer.valueOf(ApexPages.currentPage().getParameters().get('rowNumber'));
          //system.debug('------------------------------abc'+abc);
          armList.add(ar);  
      }
      
      public void addRowShotgun()
      {
          Arms_Requested__c sg= new Arms_Requested__c();
          shotgunList.add(sg);
      }
 
     public PageReference save()
     {
         upsert offenceList;
         delete deloffenceList;
         upsert armList;
         delete delarmsList;
         return (new ApexPages.StandardController(arms)).view();
     } 
 
     public void deleteRow()
     {
         rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
         System.debug('row deleted Offence ' + rowIndex);
         System.debug('row to be deleted offences '+offenceList[rowIndex]);
         del = offenceList.remove(rowIndex);
         deloffenceList.add(del);
     }
 
     public void deleteRowReq()
     {
        //rowIndexReq=abc;
         rowIndexReq  = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndexReq'));
         System.debug('row deleted arms requested' + rowIndexReq);
         System.debug('row to be deleted arms requested '+armList[rowIndexReq]);
         system.debug('-----------------armList size before-------------------------'+armList.size());
         delReq= armList.remove(rowIndexReq);
         system.debug('-----------------armList size after------------------------'+armList.size());
         delarmsList.add(delReq);
     }
     
     //veera modifications
       
        public List<SelectOption> getFirearm() {
       List<SelectOption> options = new List<SelectOption>();
       options.add(new SelectOption('Grant','Grant'));
       options.add(new SelectOption('Renewal','Renewal'));
       return options;
       
      }  
     
     public void deleteRowShotgun()
     {
        
        rowIndexGun  = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndexGun'));
        System.debug('row deleted arms requested' + rowIndexGun);
        System.debug('row to be deleted arms requested '+shotgunList[rowIndexGun]);
        delgun= shotgunList.remove(rowIndexGun);
        delgunList.add(delgun);
     }

}