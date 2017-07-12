public with sharing class BoxHelper{
    /*This method creates a folder in Box.com and returns the Box.com folder ID
     */
    
    public static String createFolder(String folderName, String parentFolder, String authToken){
        String folderid;
        //string authToken = BoxHelper.authorizeBox().Auth_Token__c;       
        if(authToken!=null){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.box.com/2.0/folders');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer '+authToken);
        if(String.isEmpty(parentFolder)) parentFolder='0';
        req.setBody('{"name":"'+folderName+'","parent": {"id": "'+parentFolder+'"}}');
        System.debug('test');
        System.debug(req.getBody());
        HttpResponse res = h.send(req);
        System.debug(res.getBody());
        BoxObject2.FolderFile folderFile =(BoxObject2.FolderFile)JSON.deserialize(res.getBody(), BoxObject2.FolderFile.class);
        System.debug(folderFile);
        System.debug(folderFile.id);
        folderId = folderFile.id;
       
        }
        return folderid;
    }
    
    /**
     * Upload file method
     **/
    public static string boxFileUpload(String folderId,Attachment file, String authToken){
      String fileId;
      //String authToken = BoxHelper.authorizeBox().Auth_Token__c;
      if(String.isEmpty(folderId)) folderId='0';
      if(authToken!=null){
          String boundary = '----------------------------741e90d31eff';
          String header = '--'+boundary+'\nContent-Disposition: form-data; name="file"; filename="'+file.name+'";\nContent-Type: application/octet-stream';
          String footer = '--'+boundary+'--';             
          String headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
          while(headerEncoded.endsWith('=')){
              header+=' ';
              headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
          }
          String bodyEncoded = EncodingUtil.base64Encode(file.body);
          Blob bodyBlob = null;
          String last4Bytes = bodyEncoded.substring(bodyEncoded.length()-4,bodyEncoded.length());
          if(last4Bytes.endsWith('==')) {
          last4Bytes = last4Bytes.substring(0,2) + '0K';
          bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
          String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
          bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);
          } 
          else if(last4Bytes.endsWith('=')) {
          last4Bytes = last4Bytes.substring(0,3) + 'N';
          bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
          footer = '\n' + footer;
          String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
          bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);              
          } else {
         // Prepend the CR LF to the footer
         footer = '\r\n' + footer;
         String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
         bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);  
         }
    
        String sUrl = 'https://upload.box.com/api/2.0/files/content?parent_id='+folderId;
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type','multipart/form-data; boundary='+boundary);
        req.setMethod('POST');
        req.setEndpoint(sUrl);
        req.setBodyAsBlob(bodyBlob);
        req.setTimeout(60000);
        req.setHeader('Authorization', 'Bearer '+authToken);
        req.setHeader('Content-Length',String.valueof(req.getBodyAsBlob().size()));
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug('----------res.getBody()----------------'+res.getBody());
        BoxObject2.ItemCollection itemCollection =(BoxObject2.ItemCollection)JSON.deserialize(res.getBody(), BoxObject2.ItemCollection.class);
        system.debug('Total count:'+itemCollection.total_count);
        system.debug('File ID:'+itemCollection.entries[0].id);
           fileId = itemCollection.entries[0].id;   
       }
    return fileId;
     
	}  
    
    
    
 /**
     Box OAuthtoken generation
     **/   
    public static BoxOAuth__c  authorizeBox(BoxOAuth__c boxoauth){
       
       BoxAccount__c boxaccount = new BoxAccount__c();
       boxaccount = [select id,name,ClientId__c,Client_Secret__c from BoxAccount__c where name='AtoS'];
       system.debug('------'+boxoauth+'---------');
       if(boxoauth.AuthTokenExpires__c>DateTime.now()){
           system.debug(boxoauth.Auth_Token__c); 
           //oauth = boxoauth.Auth_Token__c;
           return boxoauth;
       }else{
           if(boxoauth.RefreshTokenExpires__c>DateTime.now()){
               system.debug(boxoauth.Refresh_Token__c);
               Http http = new Http();
               HttpRequest req = new HttpRequest();
               req.setMethod('POST');
               req.setEndpoint('https://app.box.com/api/oauth2/token');
               req.setBody('grant_type=refresh_token&refresh_token='+boxoauth.Refresh_Token__c+ '&client_id=' + boxaccount.ClientId__c + '&client_secret=' + boxaccount.Client_Secret__c);
               HttpResponse res = http.send(req);
               String jsonString = res.getBody();
               System.debug('Response body: '+ res.getBody());
               if (res.getStatusCode() > 299) {
                   BoxObject2.BoxAuthError err = (BoxObject2.BoxAuthError)JSON.deserialize(jsonString, BoxObject2.BoxAuthError.class);
                   system.debug(err);
             	   /*if (boxOAuth != null) {
             	   delete boxOAuth;
                   boxOAuth = null;
                   }*/
            	   throw new BoxObject2.BoxAuthException(err.error_description);
               }
               if (jsonString.length() > 0) {
                     BoxObject2.BoxAuthResponse boxAuthRes = (BoxObject2.BoxAuthResponse) System.JSON.deserialize(jsonString, BoxObject2.BoxAuthResponse.class);
                     System.debug(boxAuthRes);
                     /*if (boxOAuth == null) {
                     BoxObject2.boxOAuth = new Box_OAuth__c(SetupOwnerId = UserInfo.getUserId());
                      }*/
                    system.debug('Auth_Token'+boxAuthRes.access_token); 
                    system.debug('Refresh_Token'+ boxAuthRes.refresh_token);
                    system.debug('AuthTokenExpires'+Datetime.now().addSeconds(boxAuthRes.expires_in));  
                    system.debug('RefreshTokenExpires'+Datetime.now().addDays(60)); 
                    boxoauth.Auth_Token__c = boxAuthRes.access_token;
                    boxoauth.AuthTokenExpires__c= Datetime.now().addSeconds(boxAuthRes.expires_in);
                    boxoauth.Refresh_Token__c=boxAuthRes.refresh_token;
                    boxoauth.RefreshTokenExpires__c=Datetime.now().addDays(60);
           
                    //update boxoauth;
                    //oauth = boxoauth.Auth_Token__c;      
                    return boxoauth;
        		}else{
                    return null;
                }
           }else{
               return null;
           }
        }
       //return oauth;
   }
    
}