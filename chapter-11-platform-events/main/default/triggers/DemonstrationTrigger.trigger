trigger DemonstrationTrigger on Demonstration__e (after insert) {
	List<Task> tasks = new List<Task>();
    for(Demonstration__e demo : (List<Demonstration__e>)Trigger.new) {
        System.debug(demo.Message__c);
        Task tsk = new Task();
        tsk.Priority = 'High';
        tsk.Subject = demo.Message__c;
        tasks.add(tsk);
    }
    insert tasks;
}