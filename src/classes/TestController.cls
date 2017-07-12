public class TestController 
{
    public Id armid { set; get; }
    public Id certId {set; get;}
    public String armName {set; get;}
    public Arms_Held__c armheld { set; get; }
    
	ApexPages.StandardController controller;
    
    public TestController(ApexPages.StandardController controller)
    {              
        this.controller = controller;                
    }    
    public TestController()
    {
        
    }
    public PageReference NewArm()
    {                                
		String createNewArm = 'https://c.ap2.visual.force.com/apex/TestPage?';         
        PageReference pg = new PageReference(createNewArm);         
        return pg;
    }
    
    public Id SaveArm()
    {
        System.debug('**'+ApexPages.currentPage().getParameters().get('certId'));
        return null;
        /*
        PageReference ret_page = controller.save();       	
        armid = String.valueof(controller.getRecord().get('id'));
        System.debug('****ID ***'+certId+'***'+armid);	
        return null;		
		*/
    }
}