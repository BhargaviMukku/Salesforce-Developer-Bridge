# Sprint 2 – Apex Fundamentals, Governor Limits, Bulkification & Asynchronous Apex

## Overview

In this sprint, I learned the core concepts of Apex programming and Salesforce development. I explored Apex Collections such as Lists, Sets, and Maps, practiced loops, understood Salesforce Governor Limits, implemented bulkification techniques, and worked with Asynchronous Apex using Future Methods. I also learned how to monitor asynchronous jobs through Apex Jobs.

---

## Apex Collections

### List Example

```apex
List<String> cities = new List<String>();

cities.add('Delhi');
cities.add('Bhimavaram');
cities.add('Mumbai');
cities.add('Eluru');
cities.add('Guntur');

for(String city : cities)
{
    System.debug(city.toUpperCase());
}
```

### Set Example

```apex
Set<String> branches = new Set<String>();

branches.add('IT');
branches.add('CSE');
branches.add('ECE');
branches.add('IT');

System.debug(branches);
```

### Map Example

```apex
Map<Integer,String> students = new Map<Integer,String>();

students.put(1,'Bhargavi');
students.put(2,'Teja');
students.put(3,'Siri');

System.debug(students.get(1));
```

---

## Governor Limits & Bulkification

### Bad Trigger (SOQL Inside Loop)

```apex
trigger MemberTrigger on Members__c(after insert) {

    for(Members__c mem : Trigger.new)
    {
        List<Members__c> members = [
            SELECT Id, Name
            FROM Members__c
        ];

        System.debug(members.size());
    }

}
```

### Governor Limit Error

```text
System.LimitException: Too many SOQL queries: 101
```

### Bulkified Trigger

```apex
trigger MemberTrigger on Members__c (after insert) {

    List<Members__c> members = [
        SELECT Id, Name
        FROM Members__c
    ];

    System.debug('Total Members : ' + members.size());

    for(Members__c mem : Trigger.new)
    {
        System.debug(mem.Name);
    }

}
```

### Concepts Learned

- Salesforce Multi-Tenant Architecture
- Governor Limits
- SOQL Query Limits
- DML Limits
- Bulkification
- Apex Best Practices

---

## Asynchronous Apex

### Future Method

```apex
public class FutureMemberClass {

    @future
    public static void updateMember(Id memberId)
    {
        Members__c member = [
            SELECT Id, Name
            FROM Members__c
            WHERE Id = :memberId
            LIMIT 1
        ];

        member.Name = member.Name + ' Updated';

        update member;

        System.debug('Future Method Executed');
    }
}
```

### Execute Anonymous

```apex
Members__c member = [
    SELECT Id
    FROM Members__c
    LIMIT 1
];

FutureMemberClass.updateMember(member.Id);
```

### Verification

- Executed Future Method asynchronously
- Verified execution through Apex Jobs
- Confirmed successful record update

---

## Difference Between Future Method and Queueable Apex

| Future Method | Queueable Apex |
|--------------|---------------|
| Uses @future annotation | Implements Queueable interface |
| Supports primitive parameters only | Supports complex objects and sObjects |
| Cannot chain jobs | Supports job chaining |
| Suitable for simple background tasks | Suitable for complex asynchronous processing |

---

## Why Use Batch Apex Instead of a Trigger?

Triggers process records in a single transaction and may hit governor limits when handling large volumes of data. Batch Apex processes records in smaller batches, with each batch running as a separate transaction. This allows Salesforce to efficiently process thousands or millions of records while avoiding governor limit exceptions.

---

## Key Learnings

- Apex Collections (List, Set, Map)
- For Loops and Enhanced For Loops
- Governor Limits
- SOQL and DML Best Practices
- Bulkification Techniques
- Asynchronous Apex
- Future Methods
- Queueable Apex Basics
- Apex Jobs Monitoring

---

## Outcome

Successfully implemented Apex collection operations, demonstrated governor limit violations and bulkification techniques, created and executed a Future Method, monitored asynchronous execution using Apex Jobs, and gained practical experience with Salesforce Apex development best practices.
