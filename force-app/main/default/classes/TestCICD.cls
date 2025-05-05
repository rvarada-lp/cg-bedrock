public with sharing class TestCICD {
    
    public static void findAccounts(String userInput) {
        // SOQL Injection vulnerability
        String query = 'SELECT Id, Name FROM Account WHERE Name = \'' + userInput + '\'';
        List<Account> accounts = Database.query(query);
        
        // FLS violation: No field-level security check
        for (Account acc : accounts) {
            acc.AnnualRevenue = 1000000;
            update acc;
        }
    }
}