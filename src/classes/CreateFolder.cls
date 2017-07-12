public class CreateFolder {

public static void testBoxApiMethod1(){
        System.debug('BEGIN');
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.box.com/2.0/folders');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer cjDFZcPkaf4LbqebjFZlVOlkEi0NjPez');
      req.setBody('{"name":"Test Demo2", "parent": {"id": "0"}}');
      //req.setHeader('Content-Type', 'application/x-www-form-urlencoded'); 
        HttpResponse res = h.send(req);
        System.debug(res.getBody());
}

}