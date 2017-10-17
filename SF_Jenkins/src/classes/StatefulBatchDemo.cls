global class StatefulBatchDemo implements Database.Batchable<sObject>, Database.stateful{
	
	public String query = 'Select id,Name from Contact' ;
	
	public Integer total = 0;
	
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<Contact> scope) {
		
		total += scope.size();
		System.debug('The total size'  +total);
		
	}
	
	global void finish(Database.BatchableContext BC) {

		system.debug('Total record processed:' + total); 

		
	}
	
}


/*

global class StatefulBatchDemo implements Database.Batchable<sObject>{
	
	public String query = 'Select id from Account' ;
	
	public Integer total = 0;
	
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		
		total += scope.size();
		

	}
	
	global void finish(Database.BatchableContext BC) {

		system.debug('Total record processed:' + total);
		
	}
	
}
*/