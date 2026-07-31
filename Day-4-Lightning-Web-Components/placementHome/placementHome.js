import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {

    // Student Details
    studentName = 'Bhargavi';
    rollNumber = '23B81A1201';
    department = 'IT';

    // Dashboard Data
    todayDate = '31 July 2026';
    companies = 25;
    jobs = 63;
    applications = 5;

    // Welcome Message
    message = '';

    // Application Status
    status = 'Not Applied';

    showMessage() {
        this.message = 'Welcome to Salesforce Development.';
    }

    applyJob() {
        this.status = 'Applied';
    }
}
