global without sharing class CommunityLoginWithLWCController {
  private static final String OK = 'OK';
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
  public static String login(String corporateNumber) {
    if (String.isBlank(corporateNumber))
      throw new IllegalArgumentException();

    User inspectedUser = [
      SELECT Id, Name
      FROM User
      WHERE AccountCode__c = :corporateNumber
    ];

    if (inspectedUser == null)
      throw new NoDataFoundException();

    try {
      Site.passwordlessLogin(inspectedUser.Id, methods, '/');
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }

    return OK;
  }
}
