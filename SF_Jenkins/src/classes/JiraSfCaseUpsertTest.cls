@isTest
global with sharing class JiraSfCaseUpsertTest {
     
     @isTest static void testCallout() {
        
         Test.setMock(HttpCalloutMock.class, new JiraSfCaseUpsertMockGenerator());
          // Call method to test.
          // This causes a fake response to be sent
          // from the class that implements HttpCalloutMock. 
          HttpResponse res = JiraSfCaseUpsert.Upsertfields('skbasha467@gmail.com','Test12345', 'https://sfjiranew1.atlassian.net/');

          // Verify response received contains fake values
          String contentType = res.getHeader('Content-Type');
          System.assert(contentType == 'application/json');
          String actualValue = res.getBody();
          String expectedValue = '{"expand":"schema,names","startAt":0,"maxResults":50,"total":3,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10034","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10034","key":"SFCAS-12","fields":{"summary":"sfjira3","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10033","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10033","key":"SFCAS-11","fields":{"summary":"sfjira2","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10032","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10032","key":"SFCAS-10","fields":{"summary":"sfjira1","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}';
          System.assertEquals(actualValue, expectedValue);
          System.assertEquals(200, res.getStatusCode()); 
        	        	        
      }
      
      static testMethod void testCreateCase(){
      
       String req = '{"expand":"schema,names","startAt":0,"maxResults":50,"total":3,"issues":[{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10034","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10034","key":"SFCAS-12","fields":{"summary":"sfjira3","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10033","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10033","key":"SFCAS-11","fields":{"summary":"sfjira2","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}},{"expand":"operations,versionedRepresentations,editmeta,changelog,renderedFields","id":"10032","self":"https://sfjiranew1.atlassian.net/rest/api/2/issue/10032","key":"SFCAS-10","fields":{"summary":"sfjira1","priority":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/priority/3","iconUrl":"https://sfjiranew1.atlassian.net/images/icons/priorities/medium.svg","name":"Medium","id":"3"},"status":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://sfjiranew1.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://sfjiranew1.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}}}}]}';
       
       //HttpResponse res = req.getBody();
       
        deserializejirajson.ResponseIssues theresult1 = (deserializejirajson.ResponseIssues)JSON.deserialize(req,  deserializejirajson.ResponseIssues.class);
        System.debug('Results == :' + theresult1 ); 
       
	     
	      
	     deserializejirajson.issues[] issues = theresult1.issues == null ? New deserializejirajson.issues[]{} : theresult1.issues;
	     
	     for(deserializejirajson.issues d : issues){

            Case c = new Case(); 
           
            deserializejirajson.Field tmp = d.Fields;
				   		    	
		         tmp.Priority.Name ='Medium'; 
		         tmp.status.Name='To Do'; 
		         tmp.summary='test xxx 4/11';
		         //tmp.issue_type=;
		         
		         		  
		  Case c1 = new case(Priority =  tmp.Priority.Name,  Status = tmp.status.Name,Subject = tmp.summary);
		 // Case c2 = new case(Priority =  tmp.Priority.Name,  Status = tmp.status.Name,Subject = tmp.summary);
		  insert c1;
		  
		  Case cs1 = [Select Priority, Subject, Status From Case where Id =: c1.id];   
          System.assertEquals(cs1.Subject, 'test xxx 4/11');
          System.assertEquals(cs1.Priority, 'Medium');
          		  		  
		  		         
		    }
	     }
      
      
      }