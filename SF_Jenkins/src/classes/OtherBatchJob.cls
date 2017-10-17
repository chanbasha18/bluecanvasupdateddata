global class OtherBatchJob implements Database.Batchable<sObject>{
	
    global Database.QueryLocator start(Database.BatchableContext BC){
    	
        String query = 'SELECT Id,Name FROM Account';
       
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope){
    	
        for(Account a : scope){
            a.Name = a.Name + 'U';
        }
        update scope;
    }
    global void finish(Database.BatchableContext BC){
    	
		    BatachJobExample b = new BatachJobExample();
		    BatchJobExample1 b1 = new BatchJobExample1(); 
		    BatchJobExample2 b2 = new BatchJobExample2();
		    BatchJobExample3 b3 = new BatchJobExample3();
		    BatchJobExample4 b4 = new BatchJobExample4();
		    BatchJobExample5 b5 = new BatchJobExample5();
		    
		    
			database.executebatch(b);
			database.executebatch(b1);
			database.executebatch(b2);
			database.executebatch(b3);
			database.executebatch(b4);
			database.executebatch(b5);
    }
}