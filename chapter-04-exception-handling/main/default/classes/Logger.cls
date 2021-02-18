public with sharing class Logger {
    
    private static List<Log__c> currentLogs;

    public static void addLog(String stackTrace, String logMessage, String logType) {
        if(currentLogs == null) {
            currentLogs = new List<Log__c>();
        }
        Log__c log = new Log__c();
        log.Stack_Trace__c = stackTrace;
        log.Log_Message__c = logMessage;
        log.Type__c = logType;
        currentLogs.add(log);
    }

    public static void persistLogs() {
        if(currentLogs != null && currentLogs.size() > 0) {
            insert currentLogs;
            currentLogs = new List<Log__c>();
        }
    }

    public static void logWithState(String stackTrace, String logMessage, String logType, Object instance) {
        Log__c log = new Log__c();
        log.Stack_Trace__c = stackTrace;
        log.Log_Message__c = logMessage;
        log.Type__c = logType;
        insert log;
        
        ContentVersion cv = new ContentVersion();
        cv.VersionData = Blob.valueOf(JSON.serializePretty(instance));
        cv.Title = 'Log of state at ' + Datetime.now();
        cv.PathOnClient = 'Log of state at ' + Datetime.now();
        insert cv;

        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :cv.Id].ContentDocumentId;
        cdl.LinkedEntityId = log.Id;
        cdl.ShareType = 'V';

        insert cdl;
    }

    public static void log(String stackTrace, String logMessage, String logType) {
        Log__c log = new Log__c();
        log.Stack_Trace__c = stackTrace;
        log.Log_Message__c = logMessage;
        log.Type__c = logType;
        insert log;
    }

}
