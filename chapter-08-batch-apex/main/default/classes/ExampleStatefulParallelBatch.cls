public class ExampleStatefulParallelBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	private Set<Id> idSet1 = new Set<Id>();
	private Set<Id> idSet2 = new Set<Id>();
	private Set<Id> idSet3 = new Set<Id>();
	private Set<Id> idSet4 = new Set<Id>();
	private Set<Id> idSet5 = new Set<Id>();
	private Integer count = 0;
	
    public Database.QueryLocator start(Database.BatchableContext bc) {
        //Retrieve all our data for processing using
		return Database.getQueryLocator('SELECT Id FROM Account');
    }
     
    public void execute(Database.BatchableContext bc, List<sObject> records){
        for(Account acc : (List<Account>)records) {
			switch on Math.mod(count, 5) {
				when 0 {
					idSet1.add(acc.Id);
				}
				when 1 {
					idSet1.add(acc.Id);
				}
				when 2 {
					idSet1.add(acc.Id);
				}
				when 3 {
					idSet1.add(acc.Id);
				}
				when else {
					idSet5.add(acc.Id);
				}
			}
			count++;
		}
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug(Limits.getHeapSize());
		ExampleInitialisedBatch batch1 = new ExampleInitialisedBatch(idSet1);
		Database.executeBatch(batch1);
		ExampleInitialisedBatch batch2 = new ExampleInitialisedBatch(idSet2);
		Database.executeBatch(batch2);
		ExampleInitialisedBatch batch3 = new ExampleInitialisedBatch(idSet3);
		Database.executeBatch(batch3);
		ExampleInitialisedBatch batch4 = new ExampleInitialisedBatch(idSet4);
		Database.executeBatch(batch4);
		ExampleInitialisedBatch batch5 = new ExampleInitialisedBatch(idSet5);
		Database.executeBatch(batch5);
    }
}