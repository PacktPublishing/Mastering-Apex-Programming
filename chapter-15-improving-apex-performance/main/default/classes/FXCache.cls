public with sharing class FXCache implements Cache.CacheBuilder {
    public Object doLoad(String pairing) {
        return FXRateRetriever.getCurrentRate(pairing);
    }
}