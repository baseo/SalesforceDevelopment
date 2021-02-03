import { LightningElement, api, wire } from "lwc";
import login from "@salesforce/apex/CommunityLoginWithLWCController.login";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class LoginFormWithLwc extends LightningElement {
  corporateNumber = "";

  @wire(login, { corporateNumber: "$corporateNumber" })
  result;

  handleLoginAction() {
    console.log("🐣");
    if (result) {
      window.location.href = "/";
    } else {
      const toast = new ShowToastEvent({
        title: "ログイン失敗",
        message: this.error,
        variant: "error"
      });
    }
  }
}
