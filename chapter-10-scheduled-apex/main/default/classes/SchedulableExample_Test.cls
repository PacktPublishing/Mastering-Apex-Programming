@isTest
private class SchedulableExample_Test {
	
    @isTest
    private static void testScheduleAndCreateNewAccount() {
        
        Test.startTest();
        String cronExp = '0 0 23 * * ?';
		String jobId = System.schedule('Example Scheduled Job', cronExp, new SchedulableExample());
        
        CronTrigger ct = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];

        System.assertEquals(0, ct.TimesTriggered);
		
        Time expected = Time.newInstance(23, 0, 0, 0);
	    System.assertEquals(expected, ct.NextFireTime.time());
        
		Test.stopTest();
        
        List<AggregateResult> results = [SELECT Count(Id) FROM Account];
        
        System.assertEquals(1, results[0].get('expr0'), 'Account not created as expected');
    }
}