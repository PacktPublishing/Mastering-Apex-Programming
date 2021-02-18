trigger UpdateAccountEventTrigger on UpdateAccount__e (after insert) {
    Set<String> names = new Set<String>();
    for(UpdateAccount__e evt : Trigger.new) {
        names.add(evt.Account_Name__c);
    }

    Map<String, Account> accountsByName = new Map<String, Account>();
    for(Account acc : [SELECT Name, AccountNumber FROM Account WHERE Name in :names]) {
        accountsByName.put(acc.Name, acc);
    }
    
    for(UpdateAccount__e evt : Trigger.new) {
        if(accountsByName.containsKey(evt.Account_Name__c)) {
            accountsByName.get(evt.Account_Name__c).AccountNumber = evt.Account_Number__c;
        } else {
            throw new Eventbus.RetryableException('No account exists for Name currently');
        }
    }

    update accountsByName.values();
}