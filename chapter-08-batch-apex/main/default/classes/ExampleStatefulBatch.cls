public class ExampleStatefulBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	private Integer statefulCount = 0;
	private static Integer staticCount = 0;
	
    public Database.QueryLocator start(Database.BatchableContext bc) {
        //Retrieve our data for processing
        return Database.getQueryLocator('SELECT Id FROM Account');
    }
    
    public void execute(Database.BatchableContext bc, List<sObject> records){
        for(Account acc : (List<Account>)records) {
			statefulCount++;
			staticCount++;
		}
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug(statefulCount);
		System.debug(staticCount);
    }
}