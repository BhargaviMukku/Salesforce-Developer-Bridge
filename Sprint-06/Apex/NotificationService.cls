public class NotificationService {

    public static void sendApplicationNotification(
        String studentName,
        String jobName
    ) {

        System.debug(
            'Notification: ' +
            studentName +
            ' applied for ' +
            jobName
        );
    }

    public static void sendStatusUpdateNotification(
        String studentName,
        String status
    ) {

        System.debug(
            'Notification: Application status changed to ' +
            status +
            ' for ' +
            studentName
        );
    }
}
