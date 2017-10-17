global class BatchJobExample5 implements Database.Batchable<sObject>,Database.Stateful{
	
	Integer i = 0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id,Name FROM Account';
       
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope){
    	
        for(Account a : scope){
        	
            a.Name += i;
            i += 1;
        }
        upsert scope;
    }
    global void finish(Database.BatchableContext BC){}}