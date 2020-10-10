public with sharing class DemonstrationEventPublisher {
    
    public static Boolean publishEventWithMessage(String message) {
        Demonstration__e demo = new Demonstration__e();
        demo.Message__c = message;
        Database.SaveResult result = Eventbus.publish(demo);
        System.debug('The publish event was a success: ' + result.isSuccess());
		return result.isSuccess();
    }

    // public static void publishEventsWithMessages(List<String> messages) {
    //     List<Demonstration__e> demos = new List<Demonstration__e>();
    //     for(String message : messages) {
    //         Demonstration__e demo = new Demonstration__e();
    //         demo.Message__c = message;
    //         demos.add(demo);
    //     }
    //     Database.SaveResult result = Eventbus.publish(demos);
    //     System.debug('The publish event was a success: ' + result.isSuccess());
    // }
}
