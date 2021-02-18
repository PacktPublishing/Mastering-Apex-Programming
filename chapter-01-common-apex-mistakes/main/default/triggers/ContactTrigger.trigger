/**
 * @File Name          : ContactTrigger.trigger
 * @Description        : 
 * @Author             : Paul Battisson
 * @Group              : 
 * @Last Modified By   : Paul Battisson
 * @Last Modified On   : 10-10-2020
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/2/2020   Paul Battisson     Initial Version
**/
trigger ContactTrigger on Contact (before insert) {
	switch on Trigger.operationType {
        when BEFORE_INSERT {
    
		    Set<Id> accountIds = new Set<Id>();
		    
		    for(Contact con : Trigger.new) {
				accountIds.add(con.AccountId);
		    }
		    
		    Map<Id, Account> accountMap = new Map<Id, Account>([SELECT UpsellOpportunity__c  FROM Account WHERE Id in :accountIds]);
		    
			for(Contact con : Trigger.new) {
				con.Contact_for_Upsell__c = accountMap.get(con.AccountId).UpsellOpportunity__c != 'No';
		    }    
		}
		when AFTER_INSERT {
            List<Task> tasks = new List<Task>();
			for(Contact con : Trigger.new) {
                if(con.Contact_for_Upsell__c) {
                    Task t = new Task();
                    t.Subject = 'Discuss opportunities with new contact';
                    t.OwnerId = con.OwnerId;
                    t.WhoId = con.Id;
                   	tasks.add(t);
                }
		    } 
            insert tasks;
		}
	}
}