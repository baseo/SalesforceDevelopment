global without sharing class CommunityLoginWithLWCController {

    private static final String START_URL = '/';
    private static List<Auth.VerificationMethod> methods;

    public CommunityLoginWithLWCController() {
        // Add verification methods in priority order
        methods = new List<Auth.VerificationMethod>();
        methods.add(Auth.VerificationMethod.SMS);
        //methods.add(Auth.VerificationMethod.EMAIL);
        //methods.add(Auth.VerificationMethod.U2F);
        //methods.add(Auth.VerificationMethod.SALESFORCE_AUTHENTICATOR);
        //methods.add(Auth.VerificationMethod.TOTP);
    }

    /**
     * Specified phrase with SMS login
     * @return root path by String
     */
    @AuraEnabled(cacheable=true)
    public static String login(String corporateNumber){

        if (String.isBlank(corporateNumber)) throw new IllegalArgumentException();

        Account inspectedAccount = [SELECT
                                        Id,
                                        Name
                                    FROM
                                        Account
                                    WHERE
                                        AccountCode__c = :corporateNumber
                                    ];
        
        if (inspectedAccount == null) throw new NoDataFoundException();

        try {
            Site.passwordlessLogin(inspectedAccount.Id, methods, START_URL);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return START_URL;
    }
    
}
