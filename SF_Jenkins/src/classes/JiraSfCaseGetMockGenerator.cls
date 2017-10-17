@isTest  
global with sharing class  JiraSfCaseGetMockGenerator implements HttpCalloutMock {
    
         // Implement this interface method  
         global HTTPResponse respond(HTTPRequest req) {
                           
              system.debug('http endpoint url :: '+req.getEndpoint());
              // Optionally, only send a mock response for a specific endpoint and method.                
             // System.assertEquals('https://sfjiranew1.atlassian.net/rest/api/2/search?jql=updated>-1h&project=SfCases&fields=issuetype=SFType,summary,status,priority&maxResults=1', req.getEndpoint());
              System.assertEquals('GET', req.getMethod());             
        
              // Create a fake response
              HttpResponse res = new HttpResponse();              
              res.setHeader('Content-Type', 'application/json');              
              res.setBody('{"expand":"schema,names","startAt":0,"maxResults":50,"total":2,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10031","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10031","key":"SFCAS-9","fields":{"summary":"samplejira","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/1","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/highest.svg","name":"Highest","id":"1"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10030","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10030","key":"SFCAS-8","fields":{"summary":"Test  From JIRA","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}');
              res.setStatusCode(200);
              return res;
         }    
    
}