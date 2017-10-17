@isTest
global with sharing class ServiceNowGetTest {
      
        @isTest static void testCallout() {
        
         Test.setMock(HttpCalloutMock.class, new ServiceNowGetMockTestGenerator());
          // Call method to test.
          // This causes a fake response to be sent
          // from the class that implements HttpCalloutMock. 
          HttpResponse res = ServiceNowGet.GetIncident('admin','Test@123','https://dev44403.service-now.com');

          // Verify response received contains fake values
          String contentType = res.getHeader('Content-Type');
          System.assert(contentType == 'application/json');
          String actualValue = res.getBody();
          String expectedValue = '{"result":[{"short_description":"SNow case test3 in SF","sys_id":"8fa252484fd90300bcdf78e18110c74a","contact_type":"phone","incident_state":"1","impact":"1"},{"short_description":"SNow case2 9/14","sys_id":"8749ca404fd90300bcdf78e18110c783","contact_type":"email","incident_state":"1","impact":"3"}]}';
 
          System.assertEquals(actualValue, expectedValue);
          System.assertEquals(200, res.getStatusCode()); 
          
          
           ServiceNowGet.UpsertCase(expectedValue);         
          
  /*       Deserialization d1 = new Deserialization();       
           d1.short_description = 'SNow case test3 in SF';
           d1.sys_id = '8fa252484fd90300bcdf78e18110c74a';
           d1.incident_state = '1';
           d1.contact_type = 'phone';
           d1.impact = '1';
           
           
           Deserialization d2 = new Deserialization();
           d2.short_description = 'SNow case2 9/14';
           d2.sys_id = '8749ca404fd90300bcdf78e18110c783';
           d2.incident_state = '1';
           d2.contact_type = 'email';
           d2.impact = '3';
           
                  
          Case c1 = new case(Priority = d1.impact,  Status = d1.incident_state,
                            Subject = d1.short_description, ServiceNowId__c = d1.sys_id,
                            Origin = d1.impact);
                            
          Case c2 = new case(Priority = d2.impact,  Status = d2.incident_state,
                            Subject = d2.short_description, ServiceNowId__c = d2.sys_id,
                            Origin = d2.impact);                   
                
          insert c1;   
          insert c2;
          
          
          Case cs1 = [Select Priority, Subject, Status, Origin, ServiceNowId__c From Case where Id =: c1.id];   
          Case cs2 = [Select Priority, Subject, Status, Origin, ServiceNowId__c From Case where Id =: c2.id];         
          
          System.assertEquals(cs1.Subject, 'SNow case test3 in SF');
          System.assertEquals(cs1.ServiceNowId__c, '8fa252484fd90300bcdf78e18110c74a');
          System.assertEquals(cs2.Subject, 'SNow case2 9/14');
          System.assertEquals(cs2.ServiceNowId__c, '8749ca404fd90300bcdf78e18110c783');
           
   */
          
      }             
    
         
}