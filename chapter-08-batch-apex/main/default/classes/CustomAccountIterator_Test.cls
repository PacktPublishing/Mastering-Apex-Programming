@isTest
private with sharing class CustomAccountIterator_Test {
    
    @isTest
    private static void test() {

        Account top = new Account(Name = 'Top');
        insert top;
        List<Account> middle = new List<Account>();
        middle.add(new Account(Name = 'Mid 1', ParentId = top.Id));
        middle.add(new Account(Name = 'Mid 2', ParentId = top.Id));
        insert middle;

        List<Account> bottom = new List<Account>();
        bottom.add(new Account(Name = 'Bottom 1', ParentId = middle[0].Id));
        bottom.add(new Account(Name = 'Bottom 2', ParentId = middle[1].Id));
        insert bottom;

        Set<String> names = new Set<String>{'Top', 'Mid 1', 'Mid 2', 'Bottom 1', 'Bottom 2'};

        CustomAccountIterator iterator = new CustomAccountIterator(top.Id);
        System.assertEquals(5, iterator.accounts.size(), iterator.accounts);
        while(iterator.hasNext()) {
            System.assert(names.contains(iterator.next().Name));
        }
    } 
}
