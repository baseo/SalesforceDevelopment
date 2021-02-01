global with sharing class CommunityLoginWithLWCController {

    public List<Auth.VerificationMethod> methods;

    public CommunityLoginWithLWCController() {
        // Add verification methods in priority order
        methods = new List<Auth.VerificationMethod>();
        methods.add(Auth.VerificationMethod.SMS);
        methods.add(Auth.VerificationMethod.EMAIL);
        methods.add(Auth.VerificationMethod.U2F);
        methods.add(Auth.VerificationMethod.SALESFORCE_AUTHENTICATOR);
        methods.add(Auth.VerificationMethod.TOTP);
    }

    @AuraEnabled(cacheable=true)
    public static PageReference login(String loginId){
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}
