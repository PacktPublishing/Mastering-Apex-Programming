public without sharing class HospitalDataController {

    public String jsonOutput {get; private set;}

    public HospitalDataController() {
        String refCode = ApexPages.currentPage().getParameters().get('refCode');
        List<Account> hospitals = [SELECT Name, Hospital_Ref_Code__c FROM Account WHERE Hospital_Ref_Code__c = :refCode];
        if(hospitals.size() == 1) {
            jsonOutput = JSON.serializePretty(new HospitalRESTService.HospitalWrapper(hospitals[0]));
        }
    }
}
