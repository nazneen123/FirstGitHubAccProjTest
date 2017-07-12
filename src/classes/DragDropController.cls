public class DragDropController {

    public list<Product2> prod {
        get{
        return [Select ProductCode, Name, Image__c From Product2 where Family= 'Mobiles'];
    }
                            set;}

public DragDropController(){

//prod = new list<Product2>();

//list<Product2> prod = [Select ProductCode, Name From Product2 where Family= 'Mobiles'];
system.debug('-------------------------'+prod);

}

}