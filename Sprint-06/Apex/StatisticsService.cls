public class StatisticsService {

    public static Integer getTotalApplications() {

        return [
            SELECT COUNT()
            FROM Application__c
        ];
    }

    public static Integer getAppliedCount() {

        return [
            SELECT COUNT()
            FROM Application__c
            WHERE Status__c = 'Applied'
        ];
    }

    public static Integer getShortlistedCount() {

        return [
            SELECT COUNT()
            FROM Application__c
            WHERE Status__c = 'Shortlisted'
        ];
    }

    public static Integer getSelectedCount() {

        return [
            SELECT COUNT()
            FROM Application__c
            WHERE Status__c = 'Selected'
        ];
    }
}
