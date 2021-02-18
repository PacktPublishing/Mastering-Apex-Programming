@isTest
private with sharing class LoopPerformance_Test {
    
    @TestSetup
    static void makeData(){
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 5000; i++) {
            accounts.add(new Account(Name = 'Test ' + i));
        }

        insert accounts;
    }

    @isTest
    private static void testSOQLFor() {
        Integer start = Limits.getCpuTime();

        for(Account acc : [SELECT Name FROM Account]) {
            String output = acc.Name;
        }

        Integer stop = Limits.getCpuTime();
        Integer total = stop - start;
        Integer heap = Limits.getHeapSize();
        System.assert(false, 'SOQL For Loop Heap = ' + heap);
        //System.assert(false, 'SOQL For Loop Total = ' + total);
    }

    @isTest
    private static void testSOQLForDynamic() {
        Integer start = Limits.getCpuTime();

        for(Account acc : [SELECT Name FROM Account]) {
            String output = (String)acc.get('Name');
        }

        Integer stop = Limits.getCpuTime();
        Integer total = stop - start;
        Integer heap = Limits.getHeapSize();
        //System.assert(false, 'SOQL For Loop Heap = ' + heap);
        System.assert(false, 'SOQL For Loop Dynamic Total = ' + total);
    }

    // @isTest
    // private static void testSOQLBatchedFor() {
    //     Integer start = Limits.getCpuTime();

    //     for(List<Account> accs : [SELECT Name FROM Account]) {
    //         for(Account acc : accs) {
    //             System.debug(acc.Name);
    //         }
    //     }

    //     Integer stop = Limits.getCpuTime();
    //     Integer total = stop - start;
    //     Integer heap = Limits.getHeapSize();
    //     System.assert(false, 'Batched SOQL For Loop Heap = ' + heap);
    //     System.assert(false, 'Batched SOQL For Loop Total = ' + total);
    // }

    @isTest
    private static void testIteratorExternalMax() {
        Integer start = Limits.getCpuTime();

        List<Account> accs = [SELECT Name FROM Account];
        Integer max = accs.size();

        for(Integer i = 0; i < max; i++) {
            System.debug(accs[i].Name);
        }
        Integer oldHeap = Limits.getHeapSize();

        //accs = null;
        // Integer stop = Limits.getCpuTime();
        // Integer total = stop - start;
        Integer newHeap = Limits.getHeapSize();
        System.assert(false, 'Old Heap = ' + oldHeap + ', New Heap = ' + newHeap);
        //System.assert(false, 'Iterator External Max Total = ' + total);
    }

    // @isTest
    // private static void testIteratorInlineMax() {
    //     Integer start = Limits.getCpuTime();

    //     List<Account> accs = [SELECT Name FROM Account];

    //     for(Integer i = 0; i < accs.size(); i++) {
    //         System.debug(accs[i].Name);
    //     }

    //     Integer stop = Limits.getCpuTime();
    //     Integer total = stop - start;
    //     Integer heap = Limits.getHeapSize();
    //     System.assert(false, 'Iterator Inline Max Heap = ' + heap);
    //     System.assert(false, 'Iterator Inline Max Total = ' + total);
    // }
}
