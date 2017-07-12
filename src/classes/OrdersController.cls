public with sharing class OrdersController {

    public List<Order> orderList {get;set;}
    
    public OrdersController(){
        orderList = new List<Order>();
    }
    
    public List<Order> getOrders(){
        return [SELECT OrderNumber, TotalAmount, Status,Pricebook2Id FROM Order WHERE OwnerID=: UserInfo.getUserId()];
        // ,(Select Product2Id, Product2.Name From PricebookEntry__r Where Product2Id =: productdet)
    }
 }