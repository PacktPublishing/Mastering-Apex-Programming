@RestResource(urlMapping = '/hospital/*')
global without sharing class HospitalRESTService {

    private enum DATA_TYPE {XML, JSON}
    
    @HttpGet
    global static HospitalWrapper doGet() {
        RestRequest req = RestContext.request;
        List<String> splitUrl = req.requestURI.split('/');
        String refCode = splitUrl[splitUrl.size() - 1];
        List<Account> hospitals = [SELECT Name, Hospital_Ref_Code__c FROM Account WHERE Hospital_Ref_Code__c = :refCode];
        if(hospitals.size() == 1) {
            return new HospitalWrapper(hospitals[0]);
        }
        return null;
    }

    //global static String doPost(String Name, String Ref_Code, String dummy) {
    @HttpPost
    global static String doPost() {
        Id hospitalRTId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Hospital').getRecordTypeId();
        List<API_Mapping__mdt> mappings = retrieveMappingsMetadata();
        Map<String, Object> hospitalData = new Map<String, Object>();
        if(RestContext.request.headers.get('Content-Type').contains('json')) {
            hospitalData = parseData(DATA_TYPE.JSON, RestContext.request.requestBody);
        } else if(RestContext.request.headers.get('Content-Type').contains('xml')) {
            hospitalData = parseData(DATA_TYPE.XML, RestContext.request.requestBody);
        }
        
        Account hospital = new Account();
        hospital.RecordTypeId = hospitalRTId;
        for(API_Mapping__mdt mapping : mappings) {
            if(hospitalData.containsKey(mapping.DeveloperName)) {
                hospital.put(mapping.Target_Field__c, hospitalData.get(mapping.DeveloperName));
            }
        }
        insert hospital;
        return hospital.Hospital_Ref_Code__c;    
    }

    private static List<API_Mapping__mdt> retrieveMappingsMetadata() {
        if(Test.isRunningTest()) {
            List<API_Mapping__mdt> testData = new List<API_Mapping__mdt>();
            testData.add(new API_Mapping__mdt(DeveloperName = 'Name', Target_Field__c = 'Name'));
            testData.add(new API_Mapping__mdt(DeveloperName = 'Ref_Code', Target_Field__c = 'Hospital_Ref_Code__c'));
            return testData;
        }

        return [SELECT DeveloperName, Target_Field__c FROM API_Mapping__mdt];
    }

    private static Map<String, Object> parseData(DATA_TYPE requestDataType, Blob data) {
        Map<String, Object> dataMapping = new Map<String, Object>();

        switch on requestDataType {
            when JSON {
                HospitalWrapper wrap = (HospitalWrapper)JSON.deserialize(data.toString(), HospitalWrapper.class);
                System.debug(wrap);
                dataMapping = (Map<String,Object>)JSON.deserializeUntyped(data.toString());
            }
            when XML {
                Dom.Document doc = new Dom.Document();
                doc.load(data.toString());
                Dom.XMLNode req = doc.getRootElement();

                for(Dom.XMLNode childNode : req.getChildElements()) {
                    dataMapping.put(childNode.getName(), childNode.getText());
                }
            }
        }
        return dataMapping;
    }
    // Account acc = new Account();
        // acc.RecordTypeId = hospitalRTId;
        // acc.Name = Name;
        // acc.Hospital_Ref_Code__c = Ref_Code;
        // insert acc;
        // return acc.Hospital_Ref_Code__c; 

    global class HospitalWrapper {
        @TestVisible
        String Name;
        @TestVisible
        String Ref_Code;
        public HospitalWrapper(Account acc) {
            if(acc != null) {
                this.Name = acc.Name;
                this.Ref_Code = acc.Hospital_Ref_Code__c;
            }
        }
    }

}
