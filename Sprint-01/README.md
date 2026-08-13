# Sprint 1 – Salesforce Fundamentals

## Overview

This sprint focused on learning the fundamentals of the Salesforce platform, including custom objects, custom fields, SOQL, Apex basics, Apex Triggers, Trigger Handler Pattern, and Lightning Web Components (LWC).

---

## Objectives Completed

* Created custom objects for the Library Management System.
* Added custom fields to support business requirements.
* Practiced SOQL queries for data retrieval.
* Developed Apex classes and triggers.
* Implemented the Trigger Handler Pattern.
* Wrote and executed Apex test classes.
* Built a Lightning Web Component (LWC) to display records.
* Deployed components to Salesforce Org.
* Verified functionality through testing and code coverage.

---

## Custom Objects Created

### Books

Stores information about books available in the library.

### Members

Stores information about library members.

### Issue Record

Tracks book issue and return transactions.

### Issue Severity

Stores severity-related information for issue handling.

---

## Apex Development

### Apex Classes

* BookController
* IssueSeverityHandler

### Apex Trigger

* IssueSeverityTrigger

### Test Class

* IssueSeverityHandlerTest

### Features Implemented

* Before Insert validation logic
* Duplicate record prevention
* After Update processing
* Trigger Handler Pattern implementation
* Test coverage above required Salesforce limits

---

## SOQL Practice

Sample queries executed:

```sql
SELECT Name FROM Books__c

SELECT Name FROM Members__c

SELECT Name, Status__c FROM Books__c

SELECT COUNT(Id) FROM Books__c
```

---

## Lightning Web Components (LWC)

### Component Created

* bookList

### Features

* Displays records from the Books object
* Uses @wire service
* Retrieves live Salesforce data
* Added to Lightning App Builder
* Configured for Home Page visibility

---

## Testing & Validation

* Executed Apex test classes successfully.
* Verified trigger functionality.
* Confirmed duplicate prevention logic.
* Verified related record updates.
* Checked code coverage in Developer Console.

---

## Screenshots Included

* Custom Objects
* Record Creation
* SOQL Queries
* Apex Classes
* Trigger Logic
* Test Class Execution
* Code Coverage
* LWC Component
* Lightning App Builder Configuration
* Home Page Output

---

## Key Learnings

* Salesforce Data Model
* Custom Objects and Fields
* SOQL Fundamentals
* Apex Programming Basics
* Apex Triggers
* Trigger Handler Design Pattern
* Test Class Development
* Lightning Web Components
* Deployment and Validation

---

## Outcome

Successfully completed Sprint 1 by building a functional Library Management System foundation using Salesforce declarative and programmatic features, including Apex, SOQL, Triggers, Test Classes, and Lightning Web Components.


