@isTest
private with sharing class CommunityLoginWithLWCControllerTest {
    public CommunityLoginWithLWCControllerTest() {}

    @TestSetup
    private static void makeData(){
        Account testAccount = new Account();
        testAccount.Name = 'テスト取引先';
        testAccount.AccountCode__c = '3450349';
        insert testAccount;
    }

    @isTest
    private static void loginContollerTest001() {
        CommunityLoginWithLWCController controller = new CommunityLoginWithLWCController();

        String expectedLoginId = '3450349';
        CommunityLoginWithLWCController.login(expectedLoginId);
    }
}
