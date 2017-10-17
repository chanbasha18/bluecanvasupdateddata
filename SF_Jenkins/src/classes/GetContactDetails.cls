@RestResource(urlMapping='/details/*')
global with sharing class GetContactDetails {
	@HTTPGet
	global static void getDetails(){
	Set<ID> contactIDS = new Set<ID>();
	RestRequest req = RestContext.request; 
	String EmailId = ((String)req.requestURI.substring(req.requestURI.lastIndexOf('/')+1)).trim();
	
	RestResponse response = RestContext.response;
	if (response == null) {
	response = new RestResponse();
	RestContext.response = response;
	} 
	try {
	if(validEmailID(EmailId)){
		ContactData contactData = retrieveContact(EmailId);
		response.responseBody = Blob.valueOf(JSON.serialize(contactData));
		response.statusCode = 200;
	} else {
		response.statusCode = 404;
	}
	
	} catch (Exception e) {
	response.responseBody = Blob.valueOf(e.getStackTraceString());
	response.statusCode = 500;
	} 	
}

	static ContactData retrieveContact(String emailId){
		List<Contact> conList = [Select ID, FirstName, LastName, Phone FROM Contact where email=:emailId];
		if(!conList.isEmpty()){
			 Contact con = conList.get(0);
			 ContactData conData = new ContactData(con.Id, con.FirstName, con.LastName);
			 return conData;
		}
		return null;
	}
	
	static boolean validEmailID(String EmailId){
		boolean valid = true; 
		String emailRegex = '^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$'; 
		Pattern myPattern = Pattern.compile(emailRegex);
		Matcher myMatcher = myPattern.matcher(EmailId);
		
		if (!myMatcher.matches()){ 
			valid = false;
		}
		return valid; 
	}	

	public class ContactData{
	
		public Map<String, String> customer = new Map<String,String>();		
		public ContactData(String conId, String firstname, String lastname){
		
			customer.put('id', conId);
			customer.put('firstname', firstname);
			customer.put('lastname', lastname);
	
		}
	}
}