trigger bookTrigger on book__c (before insert) {      
     /**
      * Webkul Software.
      *
      * @category  Webkul
      * @author    Webkul
      * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
      * @license   https://store.webkul.com/license.html
      */  
 
        list<book__c> li = trigger.new;
         
        for(book__c str : li){
        
            str.Price__c = str.Price__c * 0.8;
        } 
         
}