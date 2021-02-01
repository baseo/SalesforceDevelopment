@isTest
public with sharing class CommunityLoginWithLWCControllerTest {
    public CommunityLoginWithLWCControllerTest() {}

    CommunityLoginWithLWCController controller = new CommunityLoginWithLWCController();

    @isTest
    private void loginContollerTest001() {
        CommunityLoginWithLWCController controller = new CommunityLoginWithLWCController();

        String expectedLoginId = '3450349';
        CommunityLoginWithLWCController.login(expectedLoginId);
    }
}
