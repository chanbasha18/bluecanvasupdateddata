/* 
* An Apex Class used to Get Incidents from ServiceNow whose Sftype is equal to true.
* Use Http request and response methods for communication.
* The method GetIncident takes input as Username, Password, and endpointurl from trigger.
* we are giving this class to schedule to get records for specfic time interval
*/
 
 global with sharing class ServiceNowGet {     
   
    //@TestVisible 
    static HttpResponse res;
    
    @future(callout=true)        
    global static void getfieldsFuture(String username1, String password1, String endpointUrl1) {
        
        GetIncident(username1, password1, endpointUrl1);
        ServiceNowGet.UpsertCase(res.getBody());
    }
    
      
    public static HttpResponse GetIncident(String username1, String password1, String endpointUrl1){  
        
        //return type HttpResponse 
        Http http = new Http();
        HttpRequest req =  new HttpRequest();
            
        //Construct Authorization and Content headers
        Blob headerValue = Blob.valueOf(username1 + ':' + password1);
        String authorizationHeader = 'BASIC ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');  //displays data in JSON format
               
        req.setEndpoint(endpointUrl1+'/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true&sysparm_query=ORDERBYDESCsys_updated_on');                      
        req.setMethod('GET');
    
        try {
            res = http.send(req);
            System.debug('MyResult == :'+res.getBody());
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }
        
       return res;
    }
    
     
    
    public static void UpsertCase(String SNowresponse){
    
        SNowresponse = res.getBody();           
        System.debug('The Json Response is :::'+SNowresponse);
      
        //convert the JSON response into deserialized format to map with Case fields
        Deserialization.ResponseResult theresult = (Deserialization.ResponseResult)JSON.deserialize(SNowresponse,  Deserialization.ResponseResult.class);
        System.debug('MyResult == :' + theresult ); 
        
        //map the deserialization response fields with Salesforce Case fields     
        List<Case> casesToUpsert = new List<Case>();        
        for(Deserialization d : theresult.result ){
                            
                Case c = new Case(); 
                c.Priority = d.impact;
                c.Status =  d.incident_state;
                c.Subject = d.short_description;
                c.ServiceNowId__c = d.sys_id;
                c.Origin = d.contact_type;
                
                casesToUpsert.add(c);
               
        }
             system.debug('Cases to UPsert ::: ' +casesToUpsert);
        
             //performing the UPsert operation on records and committing to database
             if(casesToUpsert.size()>0){
                 Database.upsert(casesToUpsert,false) ;
            
             }   
    
    } 
     
     
     
    
}