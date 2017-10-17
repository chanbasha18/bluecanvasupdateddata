/*
* An Apex Class used to Schedule ServiceNow Incidents.
* Gets all ServiceNow Incidents whose sftype is equal to true for every scheduled intervals.
*/

global class SchedulingServiceNow implements Schedulable {
    
  global  void execute(SchedulableContext SC){
        
        SchedulingServiceNow.testServiveNow();
        
        // to run every 10 mints need to write 6 times jobs
        System.schedule('Scheduled Job-0', '0 5 * * * ?', new SchedulingServiceNow());   
        System.schedule('Scheduled Job-1', '0 10 * * * ?', new SchedulingServiceNow());
        System.schedule('Scheduled Job-2', '0 15 * * * ?', new SchedulingServiceNow());
        System.schedule('Scheduled Job-3', '0 20 * * * ?', new SchedulingServiceNow());
        System.schedule('Scheduled Job-4', '0 30 * * * ?', new SchedulingServiceNow());
      //  System.schedule('Scheduled Job-5', '0 60 * * * ?', new SchedulingServiceNow());        

           
 /*     // schedule job for every 10 minutes          
        String day = string.valueOf(system.now().day());
        String month = string.valueOf(system.now().month());
        String hour = string.valueOf(system.now().hour());
        String minute = string.valueOf(system.now().minute());
        String second = string.valueOf(system.now().second());
        String year = string.valueOf(system.now().year());
        
        String strJobName = 'Job-' + second + '_' + minute + '_' + hour + '_' + day + '_' + month + '_' + year;
        String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        System.schedule(strJobName, strSchedule, new SchedulingServiceNow());     
 */       
         
         
            for( CronTrigger c:[Select State,Id,EndTime,CronExpression From CronTrigger where  
                                        NextFireTime = null  AND State='DELETED' Limit 100]){
                                            
                    System.abortJob(c.id);
            }
            
        
            
   }
        
                 
        //@future(callout=true)
        public static void testServiveNow(){
        
            ServiceNowGet j = new ServiceNowGet();   
            ServiceNowGet.getfieldsFuture('admin','Test@123','https://dev44403.service-now.com'); 
        
        }
    
}