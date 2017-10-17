/*
* An Apex Class used to assign cases to Users 
* CaseUser is the centeralized object. Based on skillset of the caseuser, it checks for the availablity.
* If CaseUser is available with the specified skillset, the case which is created from web, email,
  and from diffrent orgins are been assigned to all available users in a Round-robin arrangement.
* If CaseUser is on holiday, or no CaseUser is available for handling a case. Then the cases will be assigned to the Queue.
  Email will be sent to the Queue members. 
*/

public class CaseAssignment {
    
      public static void updateCaseStage(List<Case> cases) {
         
              Map<ID, Case_User__c> cusermap = new Map<ID, Case_User__c>();
        
              //find available users and assign              
              try{
                   
                   // query all available users
                   List<Case_User__c> availableCaseUsers = [SELECT Id, LightningApp__AvailableUsers__c, LightningApp__Timings__c,LightningApp__SkillSet__c FROM Case_User__c where LightningApp__Availability__c = TRUE ORDER BY LightningApp__Last_Case_Allocated_Time__c ASC];
                   
                   integer i=0; 
                   integer nomatchingSkillset = availableCaseUsers.size();
                  
                   for(Case c: cases){
                       
                        for(; i<=availableCaseUsers.size();i++){   // assigning Cases to Caseusers in Round-robin 
               
                                if(availableCaseUsers.get(i).LightningApp__SkillSet__c.contains(c.CaseRelatedTo__c)){  // check for match in Case skill field (CaseRelatedTo__c) with CaseUser skillset
                                    // if matched assign the Case to CaseUser 
                                    system.debug('before Assignment to CaseHandling User, the case owner is :'+ c.OwnerId );
                                    c.OwnerId =  availableCaseUsers.get(i).LightningApp__AvailableUsers__c;
                                    system.debug('The ownerId After assignment :::' +c.OwnerId);
                                    availableCaseUsers.get(i).Last_Case_Allocated_Time__c = DateTime.now(); // update the Allocatedtime
                                    cusermap.put(availableCaseUsers.get(i).id, availableCaseUsers.get(i));
                                    system.debug('The Case assigned to :' + cusermap); 
                                    
                                } else {
                                 
                                            nomatchingSkillset--;  
                                             
                                            // if case skill dosent matches, no available CaseUser, then assign Case to Queue
                                            if(nomatchingSkillset == 0){                         
                                                // query Queue memebers
                                                List<User> u =[SELECT Email FROM User WHERE Id IN (SELECT UserOrGroupId FROM GroupMember WHERE Group.DeveloperName ='CaseQueue')];
                                                
                                                 for(User u1 : u){
                                                 
                                                        String us = u1.Email;
                                                        // send email to Queue members   
                                                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                                                        String[] toAddresses = new String[] {us};
                                                        mail.setToAddresses(toAddresses );
                                                        mail.setSubject('No Users available to handle this case');
                                                        mail.plainTextBody='handle this case';
                                                        Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});
                                                      }    
                                            break;
                                            }
                                          continue;
                                          
                                       }
                                       
                                if(i>=availableCaseUsers.size()){
                                     i=0;  // if Cases are greater than available users size, then set i=0 and iterate the loop for Round-robin assignment
                                }
                                break;
                        }  
                   } 
                    
                   if(!cusermap.isEmpty()) { 
                        update cusermap.values();  // if CaseUsers records are not empty, then update the records
                   }   
                                        
              }
              catch(System.DmlException e){
        
                  System.debug('Missing the required field in record');
             
              }catch(Exception e){
        
                  System.debug('An Error Occured at:' +e.getMessage());
             
              }
                      
      }
      
}