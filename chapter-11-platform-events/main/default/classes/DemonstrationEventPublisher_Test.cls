@isTest
private with sharing class DemonstrationEventPublisher_Test {
    
    @isTest
    private static void testPublishEventWithMessage() {
        Test.startTest();
        Boolean success = DemonstrationEventPublisher.publishEventWithMessage('test');
        Test.stopTest();
        System.assert(success, 'Event was not published successfully');
    }
}
