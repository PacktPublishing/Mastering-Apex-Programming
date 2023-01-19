public with sharing class ProfilingUtility {
    private static Map<String, Integer> recordings;

    public enum Resource { 
        AGGREGATE_QUERIES, ASYNC_CALLS, CALLOUTS, CPU_TIME, DML_ROWS,
        DML_STATEMENTS, EMAIL_INVOCATIONS, FUTURE_CALLS, HEAP_SIZE,
        MOBILE_PUSH_CALLS, QUERIES, QUERY_LOCATOR_ROWS, QUERY_ROWS,
        QUEUEABLE_JOBS, SOSL_QUERIES
    }

public static void startRecording(String recordingName, Resource governor) {
    if(recordings == null) {
        recordings = new Map<String, Integer>();
    }
    recordings.put(recordingName, getResourceValue(governor));
}

public static void stopRecording(String recordingName, Resource governor) {
    Integer value = getResourceValue(governor);
    Integer total = value - recordings.get(recordingName);
    System.debug('Total usage of resource ' + governor.name() + ' for recording ' + recordingName + ' was: ' + total);
}

private static Integer getResourceValue(Resource governor) {
    Integer value = 0;
    switch on governor {
        when AGGREGATE_QUERIES{
            value = Limits.getAggregateQueries();
        }
        when ASYNC_CALLS{
            value = Limits.getAsyncCalls();
        }
        when CALLOUTS{
            value = Limits.getCallouts();
        }
        when CPU_TIME{
            value = Limits.getCpuTime();
        }
        when DML_ROWS{
            value = Limits.getDmlRows();
        }
        when DML_STATEMENTS{
            value = Limits.getDmlStatements();
        }
        when EMAIL_INVOCATIONS{
            value = Limits.getEmailInvocations();
        }
        when FUTURE_CALLS{
            value = Limits.getFutureCalls();
        }
        when HEAP_SIZE{
            value = Limits.getHeapSize();
        }
        when MOBILE_PUSH_CALLS{
            value = Limits.getMobilePushApexCalls();
        }
        when QUERIES{
            value = Limits.getQueries();
        }
        when QUERY_LOCATOR_ROWS{
            value = Limits.getQueryLocatorRows();
        }
        when QUERY_ROWS{
            value = Limits.getQueryRows();
        }
        when QUEUEABLE_JOBS{
            value = Limits.getQueueableJobs();
        }
        when SOSL_QUERIES{
            value = Limits.getSoslQueries();
        }
    }
    return value;

}
}
