public with sharing class CustomAccountIterator implements Iterator<Account> {
    
    @TestVisible
    private List<Account> accounts;
    private Integer iterator = 0;

    public CustomAccountIterator(Id globalParentId) {
        Boolean hasChildAccounts = true;
        Set<Id> parentIds = new Set<Id> { globalParentId };
        accounts = [SELECT Id, Name FROM Account WHERE Id = :globalParentId];

        while(hasChildAccounts) {
            Map<Id,Account> childAccounts = getChildAccounts(parentIds);
            if(childAccounts.size() > 0) {
                parentIds.clear();
                parentIds.addAll(childAccounts.keySet());
                accounts.addAll(childAccounts.values());
            } else {
                hasChildAccounts = false;
            }
        }
    }

    public Boolean hasNext() {
        return iterator < accounts.size();
    }

    public Account next() {
        if(iterator < accounts.size()) {
            iterator++;
            return accounts[iterator-1];
        }
        return null;
    }

    private Map<Id, Account> getChildAccounts(Set<Id> parentAccountIds) {
        return new Map<Id, Account>([SELECT Id, Name FROM Account WHERE ParentId in :parentAccountIds]);
    }
}