public class PageBlockTable{

    public List<Account> listAccount {get;set;}
    public Double totalRevenue {get;set;}
    
    public PageBlockTable() {
    
        totalRevenue = 0;
        listAccount = [SELECT Name, AnnualRevenue FROM Account];
        calculateTotalRevenue();
       
    }
    
    private void calculateTotalRevenue() {
    
    
        for(Account acct : listAccount) {
        
            if(acct.AnnualRevenue != null)
                totalRevenue += acct.AnnualRevenue;
        }
    }
}