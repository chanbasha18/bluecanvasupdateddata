public class QueueableApex implements Queueable {
	
    public void execute(QueueableContext context) {
    	
        Account a = new Account(Name='Acme1',Phone='(415) 555-1212');
        insert a;        
    }
}
    //execute in developer console 
    //Id jobId = System.enqueueJob(new QueueableApex());