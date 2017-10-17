public class vf_DynamicComponentExmp{  
  
    transient public Component.Apex.PageBlockTable table {get;set;}  
      
   //list of record to display  
    public list<Case> caseLst {get; set;}  
      
    //fields and labels to display in the page block table  
   public list<String> displayFieldLst= new list<String>{'CaseNumber', 'Subject', 'Priority', 'Status', 'ContactID'};  
   public list<String> labelFieldLst= new list<String>{'Case Number', 'Subject', 'Priority', 'Status', 'Contact'};  
      
    public vf_DynamicComponentExmp(){  
    
      String dynamicSQL='SELECT id ';  
      for(String field : displayFieldLst)  
        dynamicSQL+=', ' + field;  
         
      dynamicSQL+=' FROM Case';  
    
      caseLst=Database.query(dynamicSQL);  
            
      table = new Component.Apex.PageBlockTable(var='rec');  
      table.expressions.value='{!caseLst}';  
          
      //add the field  
      Component.Apex.Column column;  
      Component.Apex.InputField inputField;  
       
      for(Integer index=0;index<displayFieldLst.size();index++)  
      {  
        column = new Component.Apex.Column(headerValue= '' + labelFieldLst.get(index) + '');  
        inputField = new Component.Apex.InputField();  
        inputField.expressions.value = '{!rec.' + displayFieldLst.get(index) + '}';  
        column.childComponents.add(inputField);  
        table.childComponents.add(column);  
     }  
   }  
     
  public PageReference saveData(){  
      try{   
      
        update caseLst;   
     }   
     catch(Exception e){   
     
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error while saving ' + e));   
     }   
      return ApexPages.currentPage();   
   }  
 }