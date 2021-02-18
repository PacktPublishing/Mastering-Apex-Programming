@isTest
private with sharing class CodeToProfile_Test {
    
    //private static final Integer NUM_ACCOUNTS = 1000;
    private static final Boolean INCLUDE_DUPLICATE = true;

    @isTest
    private static void testProfileCheckForDuplicates5() {
        Integer NUM_ACCOUNTS = 5;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }


    @isTest
    private static void testProfileCheckForDuplicates10() {
        Integer NUM_ACCOUNTS = 10;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }

    @isTest
    private static void testProfileCheckForDuplicates25() {
        Integer NUM_ACCOUNTS = 25;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }

    @isTest
    private static void testProfileCheckForDuplicates50() {
        Integer NUM_ACCOUNTS = 50;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }

    @isTest
    private static void testProfileCheckForDuplicates100() {
        Integer NUM_ACCOUNTS = 100;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }

    @isTest
    private static void testProfileCheckForDuplicate250() {
        Integer NUM_ACCOUNTS = 250;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    
    }

    @isTest
    private static void testProfileCheckForDuplicates400() {
        Integer NUM_ACCOUNTS = 400;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }

    @isTest
    private static void testProfileCheckForDuplicates500() {
        Integer NUM_ACCOUNTS = 500;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }

    @isTest
    private static void testProfileCheckForDuplicates550() {
        Integer NUM_ACCOUNTS = 550;
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < NUM_ACCOUNTS; i++) {
            if(i == NUM_ACCOUNTS - 1 && INCLUDE_DUPLICATE) {
                testAccounts.add(new Account(Name = 'Account 0'));
            } else {
                testAccounts.add(new Account(Name = 'Account ' + i));
            }
        }

        Test.startTest();
        ProfilingUtility.startRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Boolean containsDuplicates = CodeToProfile.checkForDuplicates(testAccounts);
        ProfilingUtility.stopRecording('checkForDuplicates' + NUM_ACCOUNTS, ProfilingUtility.Resource.CPU_TIME);
        Test.stopTest();

        System.assertEquals(INCLUDE_DUPLICATE, containsDuplicates);
    }
}
