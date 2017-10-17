global class OtherBatchJobSchedule implements Schedulable{
	
    global void execute(SchedulableContext sc){
    	
        OtherBatchJob b = new OtherBatchJob(); 
        database.executebatch(b);
    }
}