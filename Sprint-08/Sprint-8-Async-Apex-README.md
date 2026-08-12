# Sprint 8 – Asynchronous Apex in Recruitment Management System

## Overview

In Sprint 8, asynchronous processing techniques in Salesforce Apex were implemented using the Recruitment Management System project. The sprint covered Queueable Apex, Future Methods, Queueable Chaining, Batch Apex, and Scheduled Apex.

---

# 1. Queueable Apex

## ApplicationPostProcessingJob.cls

```apex
public class ApplicationPostProcessingJob implements Queueable {

    private Id applicationId;

    public ApplicationPostProcessingJob(Id applicationId){
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context){

        Application__c app = [
            SELECT Id,
                   Name,
                   Student__c,
                   Job__c,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('===== Background Processing Started =====');
        System.debug('Application Number : ' + app.Name);
        System.debug('Student Id : ' + app.Student__c);
        System.debug('Job Id : ' + app.Job__c);
        System.debug('Application Status : ' + app.Status__c);
        System.debug('===== Background Processing Completed =====');
    }
}
```

### Queueable Execution

```apex
Application__c app = [
    SELECT Id
    FROM Application__c
    LIMIT 1
];

ApplicationService.processApplication(app.Id);
```

---

# 2. Future Method

## ApplicationFutureService.cls

```apex
public class ApplicationFutureService {

    @future
    public static void sendApplicationToExternalSystem(Id applicationId){

        Application__c app = [
            SELECT Id,
                   Name,
                   Student__c,
                   Job__c,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('===== Future Method Started =====');
        System.debug('Application Number : ' + app.Name);
        System.debug('Student Id : ' + app.Student__c);
        System.debug('Job Id : ' + app.Job__c);
        System.debug('Application Status : ' + app.Status__c);
        System.debug('===== Future Method Completed =====');
    }
}
```

### Future Method Execution

```apex
Application__c app = [
    SELECT Id
    FROM Application__c
    LIMIT 1
];

ApplicationFutureService.sendApplicationToExternalSystem(app.Id);
```

---

# 3. Queueable Chaining

## ExternalApplicationSyncJob.cls

```apex
public class ExternalApplicationSyncJob implements Queueable {

    private Id applicationId;

    public ExternalApplicationSyncJob(Id applicationId){
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context){

        Application__c app = [
            SELECT Id,
                   Name,
                   Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('===== External Sync Started =====');
        System.debug('Application : ' + app.Name);
        System.debug('Status : ' + app.Status__c);

        System.enqueueJob(
            new ApplicationNotificationJob(applicationId)
        );

        System.debug('===== External Sync Completed =====');
    }
}
```

## ApplicationNotificationJob.cls

```apex
public class ApplicationNotificationJob implements Queueable {

    private Id applicationId;

    public ApplicationNotificationJob(Id applicationId){
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context){

        Application__c app = [
            SELECT Id,
                   Name,
                   Student__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('===== Notification Processing Started =====');
        System.debug('Application : ' + app.Name);
        System.debug('Student Id : ' + app.Student__c);
        System.debug('Notification sent successfully.');
        System.debug('===== Notification Processing Completed =====');
    }
}
```

### Queueable Chaining Execution

```apex
Application__c app = [
    SELECT Id
    FROM Application__c
    LIMIT 1
];

System.enqueueJob(
    new ExternalApplicationSyncJob(app.Id)
);
```

---

# 4. Batch Apex

## ApplicationBatchJob.cls

```apex
public class ApplicationBatchJob
implements Database.Batchable<SObject> {

    public Database.QueryLocator start(
        Database.BatchableContext bc
    ) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Status__c FROM Application__c'
        );
    }

    public void execute(
        Database.BatchableContext bc,
        List<Application__c> scope
    ) {

        for(Application__c app : scope){
            System.debug(
                'Processing Application : ' + app.Name
            );

            app.Status__c = 'Interview Scheduled';
        }

        update scope;
    }

    public void finish(
        Database.BatchableContext bc
    ) {
        System.debug(
            '===== Batch Processing Completed ====='
        );
    }
}
```

### Batch Execution

```apex
ApplicationBatchJob batch =
    new ApplicationBatchJob();

Database.executeBatch(batch, 5);
```

---

# 5. Scheduled Apex

## JobScheduler.cls

```apex
public class JobScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {

        List<Job__c> jobs = [
            SELECT Id,
                   Name,
                   Application_Deadline__c
            FROM Job__c
            WHERE Application_Deadline__c < TODAY
        ];

        for(Job__c job : jobs){
            System.debug('Expired Job : ' + job.Name);
        }

        System.debug(
            'Total Expired Jobs : ' + jobs.size()
        );
    }
}
```

### Schedule Job Execution

```apex
String cronExp = '0 0 6 * * ?';

System.schedule(
    'Daily Job Scheduler',
    cronExp,
    new JobScheduler()
);
```

---

# Concepts Learned

* Queueable Apex
* Future Methods
* Queueable Chaining
* Batch Apex
* Scheduled Apex
* System.enqueueJob()
* Database.executeBatch()
* System.schedule()
* Asynchronous Processing
* Recruitment Management System Automation

---

# Outcome

Successfully implemented asynchronous processing techniques in Salesforce Apex to handle background processing, future execution, job chaining, bulk record processing, and scheduled automation within the Recruitment Management System project.

