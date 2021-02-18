public class ExampleInitialisedBatch implements Database.Batchable<sObject> {
	
	private final Set<Id> processIds;
    
    public ExampleinitialisedBatch(Set<Id> recordIds) {
        processIds = recordIds;
    }
	
    public Database.QueryLocator start(Database.BatchableContext bc) {
        //Retrieve our data for processing
        return Database.getQueryLocator('SELECT Id, Name FROM Account WHERE Id in :processIds');
    }
    
    public void execute(Database.BatchableContext bc, List<sObject> records){
	    // Process records
    }
    
    public void finish(Database.BatchableContext bc){
        //Any required clean up code or trigger a new batch
    }
}