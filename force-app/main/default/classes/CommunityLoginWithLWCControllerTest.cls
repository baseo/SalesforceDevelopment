@isTest
private with sharing class CommunityLoginWithLWCControllerTest {
    public CommunityLoginWithLWCControllerTest() {}

    @isTest
    private static void loginContollerTest001() {
        CommunityLoginWithLWCController controller = new CommunityLoginWithLWCController();

        String expectedLoginId = '3450349';
        CommunityLoginWithLWCController.login(expectedLoginId);
    }
}
