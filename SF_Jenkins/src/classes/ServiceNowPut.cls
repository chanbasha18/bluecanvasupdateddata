/* 
* An Apex Class used to Post Incidents from Salesforce Whose Sftype in ServiceNow is equal to true.
* Use Http request and response methods for communication.
* The method postIncident takes input as Username, Password, endpointurl and subject from trigger when a case is created.
*/

global with sharing class ServiceNowPut {
    
    //@TestVisible 
    static HttpResponse res;
    
    @future(callout=true)        
    global static void putfieldsFuture(String username1, String password1, String endpointUrl1,String SNOWID) {
        
        PutIncident(username1, password1, endpointUrl1,SNOWID );
    }
    
      
    public static HttpResponse PutIncident(String username1, String password1, String endpointUrl1, String SNOWID){ 
    
         //return type HttpResponse        
        //Get jira key from Salesforce Case   
        List<sObject> s = [SELECT Subject, Priority,Status,Origin FROM Case WHERE ServiceNowId__c = :SNOWID LIMIT 1];
        
        for(sObject s1 : s){
         
            String c_subject = (String) s1.get('Subject');         
            String c_priority = (String) s1.get('Priority');
            String c_status = (String) s1.get('Status');       
            String c_Origin = (String) s1.get('Origin');       
              
              
        //Construct HTTP request and response           
        Http http = new Http();
        HttpRequest req =  new HttpRequest();
       // HttpResponse res = new HttpResponse();
                     
        //Construct Authorization and Content header
        Blob headerValue = Blob.valueOf(username1 + ':' + password1);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');  //displays data in JSON format
      
        //servicenow incident fields 
        String data = '{\"short_description\": \" ' + c_subject + '\", \"caller_id\":\"Mounika Ng\" , \"state\":\" ' + c_status + '\",  \"impact\":\" ' +c_priority + '\",\"contact_type\": \" ' + c_Origin + '\", \"u_sftype\":\"true\",}';
        req.setBody(data);
        
        //post incident from Salesforce to servicenow  
        req.setEndpoint(endpointUrl1+'/api/now/table/incident/'+SNOWID+'?sysparm_fields=caller_id%2Cimpact%2Cstate%2Ccontact_type%2Cu_sftype%2Cshort_description');
        req.setMethod('PUT');
                                               
        // https://dev44403.service-now.com/api/now/table/incident/c44939104f110300bcdf78e18110c7a3?sysparm_fields=short_description%2Cimpact&u-sftype=true 
        try {
            
            res = http.send(req);
            System.debug('MyResult == :'+res.getBody());
            
        } catch(System.CalloutException e) {
            
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }
        
        }
          return res;
        
    }
    
}