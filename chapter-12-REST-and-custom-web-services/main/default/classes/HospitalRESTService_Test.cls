@isTest
private with sharing class HospitalRESTService_Test {
    
    @TestSetup
    static void makeData(){
        Id hospitalRTId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Hospital').getRecordTypeId();
        Account demoHospital = new Account(Name = 'Demo', Hospital_Ref_Code__c = 'DEMO');
        insert demoHospital;
    }

    @isTest
    private static void testRetrieveHospital() {
        RestRequest req = new RestRequest();
        req.requestURI = '/hospital/DEMO';
        req.httpMethod = 'GET';
        RestContext.request = req;

        Test.startTest();

        HospitalRESTService.HospitalWrapper hospital = HospitalRESTService.doGet();

        Test.stopTest();

        System.assertNotEquals(null, hospital, 'Null value returned');
        System.assertEquals('Demo', hospital.Name, 'Incorrect Name returned');
    }

    @isTest
    private static void testRetrieveNull() {
        RestRequest req = new RestRequest();
        req.requestURI = '/hospital/NO_RESULT';
        req.httpMethod = 'GET';
        RestContext.request = req;

        Test.startTest();

        HospitalRESTService.HospitalWrapper hospital = HospitalRESTService.doGet();

        Test.stopTest();

        System.assertEquals(null, hospital, 'Null value returned');
    }

@isTest
private static void testPostValidJSON() {
    RestRequest req = new RestRequest();
    req.requestURI = '/hospital/';
    req.httpMethod = 'POST';
    req.addHeader('Content-Type', 'application/json');
    req.requestBody = Blob.valueOf('{"Name":"Test Post JSON", "Ref_Code":"TEST_JSON"}');
    RestContext.request = req;

    Test.startTest();

    String resp = HospitalRESTService.doPost();

    Test.stopTest();

    System.assertEquals('TEST_JSON', resp, 'Incorrect response returned');
    List<Account> accounts = [SELECT Id FROM Account WHERE Name = 'Test Post JSON'];
    System.assertEquals(1, accounts.size(), 'Account not inserted');
}

@isTest
private static void testPostValidXML() {
    RestRequest req = new RestRequest();
    req.requestURI = '/hospital/';
    req.httpMethod = 'POST';
    req.addHeader('Content-Type', 'text/xml');
    req.requestBody = Blob.valueOf('<request><Name>Test Post XML</Name><Ref_Code>TEST_XML</Ref_Code></request>');
    RestContext.request = req;

    Test.startTest();

    String resp = HospitalRESTService.doPost();

    Test.stopTest();

    System.assertEquals('TEST_XML', resp, 'Incorrect response returned');
    List<Account> accounts = [SELECT Id FROM Account WHERE Name = 'Test Post XML'];
    System.assertEquals(1, accounts.size(), 'Account not inserted');
}
}
