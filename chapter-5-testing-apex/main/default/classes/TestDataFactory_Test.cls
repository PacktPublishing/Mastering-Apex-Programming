@isTest
private with sharing class TestDataFactory_Test {
    
    @isTest
    private static void testPopulateAccountWithDefaults() {
        Account acc = (Account)TestDataFactory.generateRecord(new Account());
        System.assertEquals('Test Account', acc.Name, 'Incorrect default account name');
    }

    @isTest
    private static void testPopulateContactWithDefaults() {
        Contact con = (Contact)TestDataFactory.generateRecord(new Contact());
        System.assertEquals('John', con.FirstName, 'Incorrect default contact first name');
        System.assertEquals('Smith', con.LastName, 'Incorrect default contact last name');
    }

    @isTest
    private static void testReturnEmptyObjectNoDefaults() {
        StaticResource res = (StaticResource)TestDataFactory.generateRecord(new StaticResource());
        System.assertEquals(null, res.Name, 'No values set for record as no default provided');
    }
}
