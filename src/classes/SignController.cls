public class SignController{
    public Application__c appli{get;set;}
    public String appId{get;set;}
    public Attachment att{get;set;}
    public SignController(ApexPages.StandardController ctr){
        //appId = apexpages.currentpage().getparameters().get('applicantID');
        appId = apexpages.currentpage().getparameters().get('Id');
    }
    
    public PageReference captureSignature(){
        appId = apexpages.currentpage().getparameters().get('appId');
        system.debug('--------------SignController :appId------------------'+appId);
        String orderVal = apexpages.currentpage().getparameters().get('appId');
        String Image = String.valueOf(apexpages.currentpage().getparameters().get('imageData'));
        system.debug('--------------orderVal ------------------'+orderVal);
        att = new Attachment(Name = 'test',Body = EncodingUtil.base64Decode(Image),ParentId = orderVal,ContentType = 'image/jpeg');
        system.debug('--------------att ------------------'+att);
        try{
            insert att;
            system.debug('--------------appId------------------'+appId);
            appli = [Select Id,Name,Signature_Url__c From Application__c Where Id =: appId];
            system.debug('--------------appli ------------------'+appli);
            appli.Signature_Url__c = '/servlet/servlet.FileDownload?file='+att.Id ;
            system.debug('--------------appli.Signature_Url__c------------------'+appli.Signature_Url__c);
            update appli;
            
        }
        catch(Exception e){system.debug('----------------Exception thrown----------------'+e);}
        
        //return new PageReference('javascript:window.close()');
        //PageReference pageRef = new PageReference('/'+orderVal);
           //PageReference pageRef = new PageReference('/apex/ApplicationForm_Declaration?ID='+appId);
          // return pageRef;
        return new PageReference('javascript:window.close()');
    }
}