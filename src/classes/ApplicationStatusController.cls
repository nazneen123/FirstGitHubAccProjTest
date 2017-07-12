public class ApplicationStatusController {
public String imageName{get;set;}
    public Application__c currentApp{get;set;}
    public ApplicationStatusController (ApexPages.StandardController stdController){
        currentApp = [Select Id,Application_Status__c,Payment_Status__c  From Application__c Where Id =:apexpages.currentpage().getparameters().get('id')];
        //currentApp = [Select Id,Application_Status__c From Application__c Where Id =: 'a002800000Mjw9m'];
            
        System.debug('---------------this.currentApp----------'+this.currentApp);
        
        if(currentApp.Application_Status__c == 'Draft'){
            imageName = '1Draft.png';
        }
        if(currentApp.Application_Status__c == 'Submitted'){
            imageName = '2Submitted.png';
        }
        if(currentApp.Application_Status__c == 'Submitted' && currentApp.Payment_Status__c == 'Paid'){
            imageName = '3PhysicalVerification.png';
        }
        if(currentApp.Application_Status__c == 'In Progress'){
            imageName = '2Submitted.png';
        }
        if(currentApp.Application_Status__c == 'Physical Verification - Approved'){
            imageName = '4MedicalVerification.png';
        }
        if(currentApp.Application_Status__c == 'Medical Verification - Approved'){
            imageName = '5RefereeVerification.png';
        }
        if(currentApp.Application_Status__c == 'Referee Verification - Approved' || currentApp.Application_Status__c == 'Level-1 Approval - Approved'){
            imageName = '6PendingApproval.png';
        }
        //if(currentApp.Application_Status__c == 'Return' || currentApp.Application_Status__c == 'Return Requested' || currentApp.Application_Status__c == 'Returned'){
        //    imageName = '6PendingApproval.png';
       // }
       if(currentApp.Application_Status__c == 'Need More Information'){
            imageName = '7NeedMoreInformation.png';
        }
        if(currentApp.Application_Status__c == 'Approved'){
            imageName = '8Approved.png';
        }
        if(currentApp.Application_Status__c == 'Rejected'){
            imageName = '9Rejected.png';
        }
        System.debug('---------------*****----------'+imageName);
    }
}