@isTest
private with sharing class DemonstrationTrigger_Test {
    
    @isTest
    private static void testCreateTasks() {
        Demonstration__e demo = new Demonstration__e();
        demo.Message__c = 'Test task creation';
        Test.startTest();
        Database.SaveResult result = Eventbus.publish(demo);
        Test.stopTest();
        System.assert(result.isSuccess(), 'Event failed to publish correctly');
        List<Task> tasks = [SELECT Id FROM Task WHERE Subject = 'Test task creation'];
        System.assertEquals(2, tasks.size(), 'Incorrect number of tasks created');
    }
}
