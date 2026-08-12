trigger ApplicationTrigger on Application__c (
    before insert,
    after update
) {

    // Before Insert - Validate new applications
    if (Trigger.isBefore && Trigger.isInsert) {

        ApplicationService.validateApplications(
            Trigger.new
        );
    }


    // After Update - Handle status changes
    if (Trigger.isAfter && Trigger.isUpdate) {

        for (Application__c app : Trigger.new) {

            Application__c oldApp = Trigger.oldMap.get(app.Id);

            // Check whether status changed to Selected
            if (
                app.Status__c == 'Selected' &&
                oldApp.Status__c != 'Selected'
            ) {

                System.debug(
                    'Application selected: ' + app.Id
                );

                // Statistics processing
                StatisticsService.getSelectedCount();

                // Notification processing
                NotificationService.sendStatusUpdateNotification(
                    'Student',
                    'Selected'
                );
            }
        }
    }
}
