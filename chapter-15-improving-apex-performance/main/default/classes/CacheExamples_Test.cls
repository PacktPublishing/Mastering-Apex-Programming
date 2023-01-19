@isTest
private with sharing class CacheExamples_Test {

    @isTest
    private static void testSetAndRetrieve() {
        String pairing = 'GBPUSD';
        Double rate = FXRateRetriever.getCurrentRate(pairing);
        CacheExamples.cacheFXRate(rate, pairing);

        Test.startTest();
        Double returnedRate = CacheExamples.retrieveFXRate(pairing);
        Test.stopTest();

        System.assertEquals(rate, returnedRate, 'Incorrect rate returned from cache');
    }

    @isTest
    private static void testSetAndRetrieveNoValueSet() {
        String pairing = 'GBPUSD';

        Test.startTest();
        Cache.OrgPartition orgPart = Cache.Org.getPartition('local.FXRate');
        Double returnedRate = (Double)orgPart.get(FXCache.class, pairing);
        Test.stopTest();

        System.assertNotEquals(null, returnedRate, 'Incorrect rate returned from cache');
    }

}