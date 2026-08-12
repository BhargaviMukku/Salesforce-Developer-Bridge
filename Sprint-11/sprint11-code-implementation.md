## CandidateSyncQueueable.cls

```apex
public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id,
                   Name,
                   Status__c,
                   Integration_Status__c,
                   Integration_Error__c,
                   Last_Integration_Attempt__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        HttpRequest req = new HttpRequest();

        req.setEndpoint('callout:Recruitment_API/posts');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        Map<String, Object> payload = new Map<String, Object>();

        payload.put('applicationId', app.Id);
        payload.put('applicationName', app.Name);
        payload.put('status', app.Status__c);

        req.setBody(JSON.serialize(payload));

        Http http = new Http();

        try {

            HttpResponse res = http.send(req);

            if(res.getStatusCode() == 200 ||
               res.getStatusCode() == 201) {

                app.Integration_Status__c = 'Sent';
                app.Integration_Error__c = null;

            } else {

                app.Integration_Status__c = 'Failed';
                app.Integration_Error__c = res.getBody();
            }

            app.Last_Integration_Attempt__c = System.now();

            update app;

        } catch(Exception e) {

            app.Integration_Status__c = 'Retry Required';
            app.Integration_Error__c = e.getMessage();
            app.Last_Integration_Attempt__c = System.now();

            update app;
        }
    }
}
```

---

## ApplicationTrigger.trigger

```apex
trigger ApplicationTrigger on Application__c (after update) {

    for(Application__c app : Trigger.new) {

        Application__c oldApp = Trigger.oldMap.get(app.Id);

        if(app.Status__c == 'Selected' &&
           oldApp.Status__c != 'Selected') {

            System.enqueueJob(
                new CandidateSyncQueueable(app.Id)
            );
        }
    }
}
```

---

## ApplicationTrigger.trigger-meta.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ApexTrigger xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>67.0</apiVersion>
    <status>Active</status>
</ApexTrigger>
```

---

## CandidateSyncQueueable.cls-meta.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>66.0</apiVersion>
    <status>Active</status>
</ApexClass>
```

---

## Named Credential Configuration

```text
Label: Recruitment API
Name: Recruitment_API
URL: https://jsonplaceholder.typicode.com
```

---

## External Credential Configuration

```text
Label: Recruitment External Credential
Name: Recruitment_External_Credential
Authentication Protocol: No Authentication
```

---

## Custom Fields Added

```text
Integration_Status__c
External_Candidate_Id__c
Last_Integration_Attempt__c
Integration_Error__c
```

