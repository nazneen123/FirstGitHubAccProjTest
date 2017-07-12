public class DownFile{
public static String downloadBoxFile(){
   // BoxAuthParser bparser;
    //bparser=RefreshTokenrequest();
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    string endPointValue = 'https://api.box.com/2.0/files/';
    endPointValue=endPointValue+'49266964925'+'/content';
    req.setEndpoint(endPointValue);
    req.setMethod('GET');
    req.setHeader('Authorization', 'Bearer nq53Iq4BVLJVg2lfam4VVLJaQNTiRqk2');
    HttpResponse res = h.send(req);
    system.debug('pANY'+res.getBody());
    return res.getHeader('Location');
}

}