public class ApplicationFormPDFController 
{
    Public Boolean renderOffencePDF{get;set;}
    Public Boolean renderPrevAddressPDF{get;set;}
    Public Boolean renderArmReqPDF{get;set;}
    Public Boolean renderRefree1PDF{get;set;}
    Public Boolean renderRefree2PDF{get;set;}
    Public Boolean renderTypeOfSecurityPDF{get;set;}
    Public Boolean renderNominatedLCPDF{get;set;}
   
    public Application__c app_Pdf{get;set;}
    public Contact conrecordPdf{get;set;}
    
    public List<Application__c> appList{get;set;}
    public List<Contact> contactList{get;set;}
    
    public List<Offence__c> offenceListPDF{get;set;}
    public List<Offence__c> FinaloffenceListPDF{get;set;}
    
    public List<Previous_Address__c> prevaddrListPDF{get;set;}
    public List<Previous_Address__c> FinalprevaddrListPDF{get;set;}
    
    public List<Arms_Requested__c> armreqListPDF{get;set;}
    public List<Arms_Requested__c> FinalarmreqListPDF{get;set;}
    
    public List<Referee__c> refree1PDF{get;set;}
    public List<Referee__c> refreesListPDF{get;set;}
   
    
    public Type_Of_Security__c tosPDF{get;set;}
    
    public Nominated_Land_and_Club__c nlcPDF{get;set;}
    
    private id applicantID;
    
    public ApplicationFormPDFController() 
    {
        applicantID = ApexPages.currentPage().getParameters().get('id');
 
        
        renderOffencePDF =false;
        renderPrevAddressPDF=false;
        renderArmReqPDF=false;
        renderRefree1PDF=false;
        renderRefree2PDF=false;
        renderTypeOfSecurityPDF=false;
        renderNominatedLCPDF=false;
               
        app_Pdf=new Application__c();
       
        conrecordPdf =new Contact();
        
        contactList=new  List<Contact>();
        offenceListPDF =new List<Offence__c>();
        FinaloffenceListPDF =new List<Offence__c>();
        
        prevaddrListPDF =new List<Previous_Address__c>();
        FinalprevaddrListPDF=new List<Previous_Address__c>();

        armreqListPDF =new List<Arms_Requested__c>();
        FinalarmreqListPDF=new List<Arms_Requested__c>();
        
        refree1PDF=new List<Referee__c>();
        refreesListPDF=new List<Referee__c>();
       
        tosPDF=new Type_Of_Security__c();
        nlcPDF=new Nominated_Land_and_Club__c();
        
        //conrecordPdf = [Select Id,Gender__c,name,LastName,Previous_surname_s__c,Forenames_state_all__c, from contact where Id=: 'a002800000KoCs7'];
        
        appList =new List<Application__c>();
        
        app_Pdf=  [SELECT Name, Applicant__c,You_suffer_from_any_medical_condition__c,Details_Of_medical_Conditions__c,treatment_for_depression_or_other__c,Detailsmedicaltreatment__c,License_Type__c,
               convicted_of_any_offence__c,Payment_Status__c,Application_Status__c 
               //(select Name,Date__c from Offences__r) 
               FROM Application__c where ID=: applicantID];
        
        system.debug('----------app_Pdf------------'+app_Pdf);
        
        conrecordPdf = [Select Id,Gender__c,name,LastName,Previous_surname_s__c,Forenames_state_all__c,Nationality__c,Place_of_birth__c,Birthdate,Occupation__c,Height_in_cm__c,Languages__c,Level__c,
                       Any_previous_home_addresses__c
                       from contact where Id=: app_Pdf.Applicant__c];
           system.debug('----------conrecordPdf ------------'+conrecordPdf );            
                       
        
        if(app_Pdf.convicted_of_any_offence__c =='Yes')
        {
            offenceListPDF =[Select Id,name, Date__c from Offence__c where Application__c=: applicantID];
            for(Offence__c off:offenceListPDF)
             {
                 FinaloffenceListPDF.add(off);
             }
             system.debug('----------offenceListPDF ------------'+offenceListPDF );
        }
        if(conrecordPdf.Any_previous_home_addresses__c ==true)
        {
             prevaddrListPDF =[Select Id,Address_Line_1__c, Address_Line_2__c,Country__c,Postcode__c,State__c,From__c,To__c from Previous_Address__c where Application__c=: applicantID];
             for(Previous_Address__c prev:prevaddrListPDF )
             {
                 FinalprevaddrListPDF.add(prev);
             } 
             system.debug('----------prevaddrListPDF ------------'+prevaddrListPDF ); 
         }
         
         if(app_Pdf.License_Type__c == 'Firearm')
         {
             armreqListPDF =[Select Id,Calibre__c, Do_you_want_to_acquire_any_firearm__c,Reason__c,Type__c from Arms_Requested__c where Application__c=: applicantID];
             for (Arms_Requested__c armreq:armreqListPDF )
             {
                 FinalarmreqListPDF.add(armreq);
             }
             system.debug('----------armreqListPDF ------------'+armreqListPDF ); 
         }
         refree1PDF=[Select Id,Date_of_birth__c, Email__c,Forenames_state_all__c,Home_address__c,Home_Email__c,How_long_has_the_referee_known_you__c,
                    In_what_capacity_do_you_know_the_referee__c,Mobile_number__c,Occupation__c,Place_of_Birth__c,
                    Postcode__c,Surname__c,Tel_number__c,Title__c,Work_Tel_number__c,Work_Email__c
                    from Referee__c where Application__c=: applicantID];
                    
                    system.debug('----------applicantID ------------'+applicantID);
                    system.debug('refree1PDF Size'+refree1PDF.size());
                    system.debug('--------------refree1PDF------------'+refree1PDF);
                    
                    
         for (Referee__c reff:refree1PDF)
         {
             refreesListPDF.add(reff);
             system.debug('----------refreesListPDF---------'+refreesListPDF);
                    
         }
         system.debug('----------refreesListPDF Size---------'+refreesListPDF.size());

           
         tosPDF =[Select Id,Ammunition_storage_details__c, Details_of_security_arrangements__c,security_arrangements__c,Security_Details__c,Security_shared_Details__c,security_shared_with_anothers__c,Type__c,Type_of_security__c
                 from Type_Of_Security__c where Application__c=: applicantID];
         
         system.debug('----------tosPDF ---------'+tosPDF);
         
         if(app_Pdf.License_Type__c == 'Firearm')
         {
          nlcPDF=[Select Id,Acreage_of_land__c, Calibres_authorised__c,Club_name__c,Club_Secretary_s_name__c,Declaration_by_the_Club_Secretary__c,Declaration_by_the_land_owner__c,If_in_use_for_others__c,Landowner_s_name__c,Landowner_s_telephone__c,
                 Membership_expiry_Date__c,Name_address_of_land__c,The_use_is_for__c
                 from Nominated_Land_and_Club__c where Application__c=: applicantID OR Application__c=:NULL];  
         }    
         
         
         //https://c.ap2.visual.force.com/apex/Application_Form_Pdf?id=a002800000KoCs7
         //https://c.ap2.visual.force.com/apex/Application_Form_Pdf?id=a002800000LHEO2
         //a002800000LHNCz without prevaddress
     
         
    
          if(app_Pdf.License_Type__c == null)
        {
            renderOffencePDF =false;
            renderPrevAddressPDF=false;
            renderArmReqPDF=false;
            renderRefree1PDF=false;
            renderRefree2PDF=false;
            renderTypeOfSecurityPDF=false;
            renderNominatedLCPDF=false;
       
        }
        if(app_Pdf.License_Type__c != null)
        {
            if(app_Pdf.License_Type__c == 'Shotgun')
            {
                
                //renderOffencePDF =true;
                //renderPrevAddressPDF=true;
                renderArmReqPDF=false;
                renderRefree1PDF=true;
                renderRefree2PDF=false;
                renderTypeOfSecurityPDF=true;
                renderNominatedLCPDF=false;
            }
            if(app_Pdf.License_Type__c == 'Firearm')
            {
                //renderOffencePDF =true;
                //renderPrevAddressPDF=true;
                renderArmReqPDF=true;
                renderRefree1PDF=true;
                renderRefree2PDF=true;
                renderTypeOfSecurityPDF=true;
                renderNominatedLCPDF=true;
                
 
                
            }
            if(app_Pdf.License_Type__c == 'Both')
            {
                //renderOffencePDF =true;
                //renderPrevAddressPDF=true;
                renderArmReqPDF=true;
                renderRefree1PDF=true;
                renderRefree2PDF=true;
                renderTypeOfSecurityPDF=true;
                renderNominatedLCPDF=true;
            }
            if(conrecordPdf.Any_previous_home_addresses__c ==true)
            {
                renderPrevAddressPDF=true;
            }
             if(app_Pdf.convicted_of_any_offence__c =='Yes')
            {
                renderOffencePDF=true;
            }
            
        }
         
        
       }
    

}