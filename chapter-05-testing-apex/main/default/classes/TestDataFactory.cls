@isTest
public with sharing class TestDataFactory {
    
    public static SObject generateRecord(SObject obj) {
        Map<Schema.SObjectField, Object> defaultValues = TestDataFactoryDefaults.getDefaultValues(obj.getSObjectType());

        if(defaultValues != null) {
            populateFieldValues(obj, defaultValues);
        }

        return obj;
    }

    private static SObject populateFieldValues(SObject obj, Map<Schema.SObjectField, Object> defaultValues) {
        for(Schema.SObjectField field : defaultValues.keySet()) {
            obj.put(field, defaultValues.get(field));
        }

        return obj;
    }
}
