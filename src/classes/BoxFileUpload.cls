public class BoxFileUpload {
public static string boxFileUpload(String folderId,Attachment file,String token,String folderName,String parentFolder){
  String boundary = '----------------------------741e90d31eff';
      String header = '--'+boundary+'\nContent-Disposition: form-data; name="file"; filename="'+file.name+'";\nContent-Type: application/octet-stream';
    String footer = '--'+boundary+'--';             
  String headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
  while(headerEncoded.endsWith('=')){
   header+=' ';
   headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
  }
  String bodyEncoded = EncodingUtil.base64Encode(file.body);
  // GW: Do not encode footer yet
  // String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));

  Blob bodyBlob = null;
  String last4Bytes = bodyEncoded.substring(bodyEncoded.length()-4,bodyEncoded.length());
 // GW: replacement section to get rid of padding without corrupting data
 if(last4Bytes.endsWith('==')) {
        last4Bytes = last4Bytes.substring(0,2) + '0K';
    bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
    // We have appended the \r\n to the Blob, so leave footer as it is.
    String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
    bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);
  } else if(last4Bytes.endsWith('=')) {
        last4Bytes = last4Bytes.substring(0,3) + 'N';
    bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
    // We have appended the CR e.g. \r, still need to prepend the line feed to the footer
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
  req.setHeader('Authorization', 'Bearer KjhCMl1DzNsLcJGLHozqtoEqE4mQytsP');
  req.setHeader('Content-Length',String.valueof(req.getBodyAsBlob().size()));
  Http http = new Http();
  HTTPResponse res = http.send(req);

  system.debug('----------res.getBody()----------------'+res.getBody());
    return 'veer';
}
}