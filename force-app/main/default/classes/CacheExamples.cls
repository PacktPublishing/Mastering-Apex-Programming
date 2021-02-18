public with sharing class CacheExamples {
    
    public static void cacheFXRate(Double rate, String pairing) {
        Cache.Org.put('local.FXRate.' + pairing, rate, 900);
    }

    public static Double retrieveFXRate(String pairing) {
        return (Double)Cache.Org.get('local.FXRate.' + pairing);
    }

}