import { LightningElement, api, wire } from 'lwc';
import login from '@salesforce/apex/CommunityLoginWithLWCController.login';
export default class LoginFormWithLwc extends LightningElement {
    corporateNumber = '';

    @wire(login, {corporateNumber : '$corporateNumber'})
    wiredAccount;

    handleLogin(event) {
        
    }
}