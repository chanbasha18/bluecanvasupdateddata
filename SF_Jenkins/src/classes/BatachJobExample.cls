global class BatachJobExample implements Database.Batchable<sObject>,Database.Stateful{
	
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
    global void finish(Database.BatchableContext BC){
    	
    	
    	/*  
    	
    	   //send email to single user
	       AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =:BC.getJobId()];
		   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		   String[] toAddresses = new String[] {a.CreatedBy.Email};
		   mail.setToAddresses(toAddresses);
		   mail.setSubject('Apex Sharing Recalculation ' + a.Status);
		   mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
		   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		   
		   
		
    	   //send email to group of users
		   AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =:BC.getJobId()];
		   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();          
		   List<String> mailList = new List<String>();
		   List<String> mailAddresses = new List<String>();
		   Group g = [SELECT (select userOrGroupId from groupMembers) FROM group WHERE name = 'SFDC'];
		   
			for (GroupMember gm : g.groupMembers){
			  	
			      mailList.add(gm.userOrGroupId); 
			  }
			  
			  User[] usr = [SELECT email FROM user WHERE id IN :mailList];
			  
			  for(User u : usr){
			  		  
				   mailAddresses.add(u.email);
				   System.debug('EmailAddresses:::'+mailAddresses);
				   mail.setToAddresses(mailAddresses);				 
				   mail.setSubject('Apex Sharing Recalculation ' + a.Status);
			       mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
			       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
			       }
			  */ 
	    		   

    }
}