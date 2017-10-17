@isTest  
global with sharing class ServiceNowPostMockTestGenerator implements HttpCalloutMock {
      
        
         // Implement this interface method for ServiceNowPost
         global HTTPResponse respond(HTTPRequest req) {
            
              //ServiceNowPost.PostIncident('admin','Test@123','https://dev44403.service-now.com','test');
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.        
              System.assertEquals('https://dev44403.service-now.com/api/now/table/incident?sysparm_fields=caller_id%2Cimpact%2Curgency%2Cstate%2Csys_created_by%2Cu_sf_id%2Cu_sftype%2Csys_id%2Cshort_description', req.getEndpoint());
              System.assertEquals('POST', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"result":{"sys_id":"d7c905144f110300bcdf78e18110c7e7","short_description":" test","urgency":"3","caller_id":{"link":"https://dev44403.service-now.com/api/now/table/sys_user/Mounika Ng","value":"Mounika Ng"},"impact":"1","state":"1","u_sftype":"true","sys_created_by":"admin"}}');
              res.setStatusCode(200);
              return res;
         }
        
}