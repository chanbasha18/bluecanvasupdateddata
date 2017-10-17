trigger TriggerContextVarDemo on Book__c (before insert, after insert, before update, after update)
{
      /*This if block will run only before insert.It means mean time of 
        the records going to save into salesforce database*/
         
      if(Trigger.isInsert && Trigger.isBefore){
            System.debug('****Insert before Trigger.new******'+Trigger.new);
            /*Trigger.New-new versions of the sObject records.
              e.g. It will work both insert and update for insert every record will be new.
              creating 1st record on book it will return 1st record value,creating 2nd will return second
              record value like that it will go. 
            */
             
            System.debug('****Insert before Trigger.old******'+Trigger.old);
            /*Trigger.Old-old versions of the sObject records.
              this will not work both before and after insert.Then always the value will be null.
               because there will be no old version(old value) of the record, all are new record.
               old vesion in the sence while updating any record you may change some field value to new value .
               that old value with record will be in trigger.old.
            */
             
            System.debug('****Insert before Trigger new map******'+Trigger.newMap);
            /*Trigger.newMap-map of IDs to the new versions of the sObject records.
              It will work only on after insert because new map must store the Id and record.
              In the before insert how the id will be generated.
              so always it will return null.
            */
              System.debug('****Insert before Trigger old map******'+Trigger.oldMap);
              /*It will not return any value always its null*/
    }
    
    /*This if block will only run after succesful insert of records into salesforce database*/
         
    if(Trigger.isInsert && Trigger.isAfter){
            System.debug('****Insert after Trigger.new******'+Trigger.new);
            /*It will return same value as explained before insert of Trigger.new*/
             
            System.debug('****Insert after Trigger.old******'+Trigger.old);
            /* this will not work both before and after insert.Then always the value will be null.
               because the will be no old version(old value) of the record all are new record
               old vesion in the sence while updating any record you may change some field value to new value .
               that old value will be in trigger.old
            */
            System.debug('****Insert after Trigger new map******'+Trigger.newMap);
           /*It will return new map value as explained before insert of Trigger.newMap
             because id is generated for new record that is saved.
           */
           System.debug('****Insert after Trigger old map******'+Trigger.oldMap);
            /*It will not return any value always its null */
    }
     
      /*This if block will run only before update.It means mean time of 
        the records going to update into salesforce database*/
         
    if(Trigger.isupdate && Trigger.isBefore){
            System.debug('****update before Trigger.new******'+Trigger.new);
            /*As I explained previously Trigger.new is the new version of sobject record
              create first book record with price 200 then edit and change price 600 and click save
              now this Trigger.new will contain the new value of record that means price  value with 600 record
           */
            System.debug('****update before Trigger.old******'+Trigger.old);
             /*As I explained previously Trigger.new is the new version of sobject record
              Edit the created book record and change price from 200 to 600 and click save
              now this Trigger.old will contain the old value of record that means price value with 200 record
           */
            System.debug('****update before Trigger new map******'+Trigger.newMap);
            /*As I explained previously Trigger.new is the new version of sobject record
              create first book record with price 200 then edit and change price 600 and click save
              now this Trigger.newMap will contain the newmap value of record that means price  value with 600 record
           */
            System.debug('****update before Trigger old map******'+Trigger.oldMap);
             /*As I explained previously Trigger.new is the new version of sobject record
              Edit the created book record and change price from 200 to 600 and click save
              now this Trigger.oldMap will contain the oldMap value of record that means price value with 200 record
           */
   }
     
    /*This if block will only run after succesful update of records into salesforce database*/
    //This block will return same value as returned in is before update
     if(Trigger.isupdate && Trigger.isAfter){
            System.debug('****update after Trigger.new******'+Trigger.new);
            System.debug('****update after Trigger.old******'+Trigger.old);
            System.debug('****update after Trigger new map******'+Trigger.newMap);
            System.debug('****update after  Trigger old map******'+Trigger.oldMap);
 
    }
 
}