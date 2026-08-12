# Sprint 5 – Retrieving and Managing Information with SOQL and DML

## Overview

In Sprint 5, I learned how Salesforce applications communicate with data using **SOQL (Salesforce Object Query Language)** and **DML (Data Manipulation Language)**.

The main principle of this sprint was:

> **Retrieve first. Decide afterwards.**

Before a software application can make a business decision, it needs to retrieve the correct information from Salesforce.

---

## Topics Covered

* Understanding data requirements
* SOQL
* Retrieving Salesforce records
* Identifying objects and fields
* Business questions and queries
* DML
* Creating and updating Salesforce records
* Data-driven business decisions
* SOQL and DML in Salesforce applications

---

## What I Learned

### 1. Data Before Decisions

I learned that software cannot make good decisions without first finding the required information.

For the Placement Management System, the application may need information such as:

* Student CGPA
* Branch
* Active Backlogs
* Graduation Year
* Job Eligibility
* Application Deadline
* Existing Applications
* Number of Current Offers

The important workflow is:

```text
Retrieve Information
        ↓
Make Decision
```

---

### 2. Data as a Business Asset

I learned that Salesforce records are not just database rows. They represent meaningful business information.

For example:

* A Student record represents academic information and career opportunities.
* A Job record represents an employment opportunity.
* An Application record represents a student's application for a job.

Understanding why the information matters helps in deciding what data needs to be retrieved.

---

# SOQL

## What is SOQL?

**SOQL** stands for **Salesforce Object Query Language**.

SOQL is used to retrieve information from Salesforce.

I learned to think of SOQL as a way of asking Salesforce a precise question.

For example:

```text
What are the details of this student?
```

Before writing a query, I should identify:

1. The Salesforce object.
2. The required fields.
3. The condition used to identify the required record.

---

## Basic SOQL Structure

```apex
SELECT Field1, Field2
FROM ObjectName
WHERE Condition
```

Example:

```apex
List<Student__c> students = [
    SELECT Id, Name, CGPA__c, Branch__c, Backlogs__c
    FROM Student__c
    WHERE Id = :studentId
];
```

The important lesson was that SOQL should be written to answer a **specific business question**, rather than simply demonstrating query syntax.

---

# Business Questions

During the sprint, I worked on identifying the correct Salesforce object and required information for different business questions.

### Question 1

**Has this student already applied for the selected company?**

Object:

```text
Application
```

Required information:

```text
Student
Job
Application Status
```

### Question 2

**Which companies are currently accepting applications?**

Object:

```text
Job
```

Required information:

```text
Company
Application Deadline
```

### Question 3

**How many students have already been selected by Amazon?**

Object:

```text
Application
```

Required information:

```text
Student
Job
Application Status
```

### Question 4

**Which students satisfy Microsoft's eligibility criteria?**

Objects:

```text
Student
Job
```

Required information:

```text
Student CGPA
Student Branch
Student Backlogs
Job Eligibility Criteria
```

These exercises helped me understand that a good SOQL query starts with a clear business question.

---

# DML

## What is DML?

**DML** stands for **Data Manipulation Language**.

DML is used when Salesforce records need to be created or updated.

Common DML operations include:

```text
INSERT
UPDATE
DELETE
UPSERT
```

Examples:

### Insert

```apex
insert student;
```

### Update

```apex
update student;
```

### Delete

```apex
delete student;
```

The sprint introduced DML as the next step after retrieving information, allowing the Placement Management System to store new information and update existing records.

---

# SOQL and DML Flow

The overall concept learned in this sprint can be represented as:

```text
Business Requirement
        ↓
Identify Required Information
        ↓
Identify Salesforce Object
        ↓
Identify Required Fields
        ↓
SOQL
        ↓
Retrieve Data
        ↓
Apply Business Logic
        ↓
Make Decision
        ↓
DML
        ↓
Create / Update Data
```

---

# Engineering Principles

### Retrieve Before Deciding

Always retrieve the information required for a decision before applying business logic.

### Every Query Should Answer One Business Question

Before writing SOQL, ask:

```text
I am writing this query because I need to know...
```

If the question is not clear, the query should not be written yet.

### Think About Information First

Professional software development begins by understanding the information requirement. The query then becomes the mechanism for retrieving that information.

### Focus on Business Requirements

A query does not need to be clever. It needs to retrieve the correct information consistently and efficiently.

---

# Sprint 5 Workflow

```text
Business Question
        ↓
Information Requirement
        ↓
Salesforce Object
        ↓
Required Fields
        ↓
SOQL Query
        ↓
Retrieve Records
        ↓
Business Logic
        ↓
Decision
        ↓
DML Operation
```

---

# Key Takeaways

* Learned the purpose of SOQL.
* Learned how to identify the correct object for a business question.
* Learned how to identify the fields required for a query.
* Understood the importance of retrieving data before making decisions.
* Learned the purpose of DML.
* Understood how SOQL and DML work together.
* Learned to think about Salesforce data as a business asset.
* Learned to design queries around business questions.

---

# Sprint Status

| Item     | Details                                               |
| -------- | ----------------------------------------------------- |
| Sprint   | Sprint 5                                              |
| Chapter  | Chapter 5 – Making Software Talk to Data              |
| Topic    | Retrieving and Managing Information with SOQL and DML |
| Platform | Salesforce                                            |
| Status   | ✅ Completed                                           |

---

## Conclusion

Sprint 5 helped me understand how Salesforce applications retrieve and manage information.

The most important concept I learned is:

> **Good software retrieves the right information before making a decision.**

SOQL is used to retrieve the information required by the application, while DML is used when Salesforce records need to be created or modified.
