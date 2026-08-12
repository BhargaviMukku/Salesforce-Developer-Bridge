Student__c student = [
    SELECT Id
    FROM Student__c
    LIMIT 1
];

Job__c job = [
    SELECT Id
    FROM Job__c
    LIMIT 1
];

Application__c app = new Application__c(
    Student__c = student.Id,
    Job__c = job.Id,
    Status__c = 'Applied'
);

insert app;
