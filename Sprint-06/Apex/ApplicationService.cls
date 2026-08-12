
public class ApplicationService {

    public static Boolean isDuplicateApplication(Id studentId, Id jobId) {

        List<Application__c> applications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
        ];

        return !applications.isEmpty();
    }

    public static String createApplication(Id studentId, Id jobId) {

        if(isDuplicateApplication(studentId, jobId)){
            return 'Application already exists.';
        }

        Application__c app = new Application__c(
            Student__c = studentId,
            Job__c = jobId,
            Status__c = 'Applied'
        );

        insert app;

        return 'Application submitted successfully.';
    }

    public static String updateApplicationStatus(
        Id applicationId,
        String newStatus
    ) {

        Application__c app = [
            SELECT Id, Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        app.Status__c = newStatus;
        update app;

        return 'Application status updated successfully.';
    }
}
