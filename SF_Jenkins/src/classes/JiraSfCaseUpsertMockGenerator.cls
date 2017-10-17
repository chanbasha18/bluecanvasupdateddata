@isTest  
global with sharing class JiraSfCaseUpsertMockGenerator implements HttpCalloutMock  {
        
         // Implement this interface method  
         global HTTPResponse respond(HTTPRequest req) {
         	
         	  // ('ng.mounica@gmail.com','$Test12345', 'https://mysfjira.atlassian.net');
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.                
              //System.assertEquals('https://mysfjira.atlassian.net/rest/api/2/search?jql=project=SfCases&fields=issuetype=SFType,summary,status,priority&maxResults=2' , req.getEndpoint());
              System.assertEquals('GET', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"expand":"schema,names","startAt":0,"maxResults":50,"total":3,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10034","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10034","key":"SFCAS-12","fields":{"summary":"sfjira3","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10033","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10033","key":"SFCAS-11","fields":{"summary":"sfjira2","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10032","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10032","key":"SFCAS-10","fields":{"summary":"sfjira1","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}');
              res.setStatusCode(200);
              return res;
         }    
    
}