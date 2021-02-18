@isTest
public with sharing class TestDataFactoryDefaults {
    
    public static Map<Schema.SObjectField, Object> getDefaultValues(Schema.SObjectType sobjType) {
        return objectDefaultsMap.get(sobjType);
    }
    
    private static Map<Schema.SObjectField, Object> accountDefaults = new Map<Schema.SObjectField, Object> {
        Account.Name => 'Test Account'
    };

    private static Map<Schema.SObjectField, Object> contactDefaults = new Map<Schema.SObjectField, Object> {
        Contact.FirstName => 'John',
        Contact.LastName => 'Smith'
    };

    private static Map<Schema.SObjectType, Map<Schema.SObjectField, Object>> objectDefaultsMap = new Map<Schema.SObjectType, Map<Schema.SObjectField, Object>>{
        Account.SObjectType => accountDefaults,
        Contact.SObjectType => contactDefaults
    };

    
}
