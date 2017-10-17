@isTest  
global with sharing class ServiceNowUpsertMockTestGenerator implements HttpCalloutMock { 
        
          // Implement this interface method  
          global HTTPResponse respond(HTTPRequest req) {
             
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.        
              System.assertEquals('https://dev44403.service-now.com/api/now/table/incident?sysparm_fields=impact%2Cincident_state%2Csys_updated_onONLast%2520minute%40javascript%3Ags.minutesAgoStart(30)%40javascript%3Ags.minutesAgoEnd(0)%2Cshort_description%2Csys_id%2Ccontact_type&sysparm_limit=2&u_sftype=true&sysparm_query=ORDERBYDESCsys_updated_on', req.getEndpoint());
              System.assertEquals('GET', req.getMethod());   
              
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"result":[{"short_description":" test","sys_id":"d7c905144f110300bcdf78e18110c7e7","contact_type":"","incident_state":"1","impact":"1"},{"short_description":"SNow case test3 in SF","sys_id":"8fa252484fd90300bcdf78e18110c74a","contact_type":"phone","incident_state":"1","impact":"1"}]}');
              res.setStatusCode(200);
              return res;
        
         }
         
         
                
    
}