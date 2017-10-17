trigger sendEmail on Contact(after insert, after update)  {   
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    for(Contact e : trigger.new) {  
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.setContentType('application/pdf');
        attach.setFileName('ContactDetails.pdf');
       
        String body;
       
        body =' sample pdf for checking from apex class';
        System.debug('HTML is ' + body);
       
        attach.Body = Blob.toPDF(body);
               
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { 'skbasha467@gmail.com'});
        mail.setSubject('PDF Generation');
        mail.setHtmlBody('PFA');
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach });    
       
        mails.add(mail); 
    }
    if(!mails.isEmpty()) {
        Messaging.SendEmail(mails);
    }
}