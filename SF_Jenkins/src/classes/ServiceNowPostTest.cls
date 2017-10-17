@isTest
global with sharing class ServiceNowPostTest {
         
        global static testMethod void testCallout() {         
        
         Test.setMock(HttpCalloutMock.class, new  ServiceNowPostMockTestGenerator());
          // Call method to test.
          // This causes a fake response to be sent
          // from the class that implements HttpCalloutMock. 
          HttpResponse res = ServiceNowPost.PostIncident('admin','Test@123','https://dev44403.service-now.com','test');

          // Verify response received contains fake values
          String contentType = res.getHeader('Content-Type');
          System.assert(contentType == 'application/json');
          String actualValue = res.getBody();
          String expectedValue = '{"result":{"sys_id":"d7c905144f110300bcdf78e18110c7e7","short_description":" test","urgency":"3","caller_id":{"link":"https://dev44403.service-now.com/api/now/table/sys_user/Mounika Ng","value":"Mounika Ng"},"impact":"1","state":"1","u_sftype":"true","sys_created_by":"admin"}}';
          System.assertEquals(actualValue, expectedValue);
          System.assertEquals(200, res.getStatusCode()); 
                        
            
         }
         
}