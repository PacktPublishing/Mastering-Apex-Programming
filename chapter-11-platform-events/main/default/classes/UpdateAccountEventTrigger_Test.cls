@isTest
private with sharing class UpdateAccountEventTrigger_Test {
    
    @isTest
    private static void testPublishAndRetry() {
        String accName = 'HM Bonding Ltd';

        Test.startTest();

        UpdateAccount__e evt = new UpdateAccount__e ();
        evt.Account_Name__c = accName;
        evt.Account_Number__c = '007';
        EventBus.publish(evt);

        Test.getEventBus().deliver();

        EventBusSubscriber[] subscribers = [SELECT Name, Type, Position, Retries, LastError FROM EventBusSubscriber WHERE Topic='UpdateAccount__e'];
            
        for (EventBusSubscriber sub : subscribers) {  
            if (sub.Name == 'UpdateAccountEventTrigger') {
                System.assertEquals(1, sub.Retries);
            } 
        }

        Account acc = new Account();
        acc.Name = accName;
        insert acc;

        Test.getEventBus().deliver();

        Test.stopTest();

        acc = [SELECT AccountNumber FROM Account WHERE Id = :acc.Id LIMIT 1];
        System.assertEquals('007', acc.AccountNumber, 'Incorrect Account Number set');
    }
}
