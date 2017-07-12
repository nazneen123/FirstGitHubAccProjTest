public class testObjectExtension {

    Test_Object__c toc {get; set;}

    public testObjectExtension(ApexPages.StandardController controller) {
        toc = (Test_Object__c)controller.getRecord();
    }

    public pageReference save()
    {
        // compare values - do what you like here regarding your two fields
        if(toc.number1__c < toc.number2__c)
        {
            // Add a custom error message to the page >>> THIS IS THE MAGIC LINE!
            //ApexPages.Message myMsg = new  ApexPages.Message(ApexPages.Severity.INFO,'Number 1 is smaller than ' + toc.Number2__c);
            ApexPages.Message myMsg = new  ApexPages.Message(ApexPages.Severity.ERROR,'Number 1 must not be smaller than ' + toc.Number2__c);            
            ApexPages.addMessage(myMsg); 
            return null;
        }

        // otherwise save as usual
        upsert toc;

        return null;
    }    

}