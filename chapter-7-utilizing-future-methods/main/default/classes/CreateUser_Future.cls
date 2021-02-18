public class CreateUser_Future {
	@future
	public static void createUser(Id futureJobId) {
		Future_Job__c job = [SELECT Data_for_Processing__c, Error_Information__c FROM Future_Job__c WHERE Id = :futureJobId];
		ContactWrapper wrapper = (ContactWrapper)(JSON.deserializeStrict(job.Data_for_Processing__c, ContactWrapper.class));
		try {
			insert wrapper.generateContact();
			delete job;
		} catch(Exception ex) {
			job.Error_Information__c = JSON.serializePretty(ex);
			update job;
		}
	}
}