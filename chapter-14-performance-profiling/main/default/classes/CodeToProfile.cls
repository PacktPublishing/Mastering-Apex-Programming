public with sharing class CodeToProfile {
    public static Boolean checkForDuplicates(List<Account> accs) {
        Boolean hasDuplicates = false;
    
        for(Integer i = 0; i < accs.size(); i++) {
            for(Integer j = 0; j < accs.size(); j++) {
                if(i == j) {
                    continue;
                }
                
                if(accs[i].Name == accs[j].Name) {
                    hasDuplicates = true;
                }
            }
        }
        
        return hasDuplicates;
    }
}
