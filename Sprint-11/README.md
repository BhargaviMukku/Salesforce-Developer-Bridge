# Sprint 11 - External Recruitment Integration

## Overview

In Sprint 11, I implemented integration between the Salesforce Placement Management System and an external recruitment platform. The objective was to learn how Salesforce communicates with external systems using REST APIs, Named Credentials, Queueable Apex, and Triggers.

## Features Implemented

### External Credential

Created an External Credential to manage authentication settings securely for external API communication.

**Configuration**

* Label: Recruitment External Credential
* Name: Recruitment_External_Credential
* Authentication Protocol: No Authentication

### Named Credential

Created a Named Credential to store the external API endpoint and simplify HTTP callouts from Apex.

**Configuration**

* Label: Recruitment API
* Name: Recruitment_API
* URL: https://jsonplaceholder.typicode.com

### Custom Fields Added

The following fields were added to the Application__c object to track integration activity:

| Field Name               | Data Type      |
| ------------------------ | -------------- |
| Integration Status       | Picklist       |
| External Candidate Id    | Text           |
| Last Integration Attempt | Date/Time      |
| Integration Error        | Long Text Area |

### Queueable Apex Implementation

Developed a Queueable Apex class named **CandidateSyncQueueable** to perform asynchronous HTTP callouts.

Responsibilities:

* Retrieve application information
* Prepare JSON payload
* Send data to external API
* Process API response
* Update integration status fields

### Trigger Implementation

Created **ApplicationTrigger** to automatically invoke the Queueable Apex class when an application's status changes to **Selected**.

Workflow:

Application Status Updated → Trigger Executes → Queueable Job Created → External API Callout → Integration Status Updated

## Concepts Learned

### REST API

REST APIs allow Salesforce to communicate with external systems using HTTP methods such as:

* GET
* POST
* PUT
* PATCH
* DELETE

### HTTP Callouts

Used Apex HTTP classes:

* HttpRequest
* HttpResponse
* Http

to send and receive data from external systems.

### Named Credentials

Named Credentials provide a secure method for storing endpoint URLs and authentication details without hardcoding them in Apex code.

### Queueable Apex

Queueable Apex allows long-running operations such as callouts to execute asynchronously in the background.

### Integration Status Tracking

Implemented status tracking using the following values:

* Pending
* Sent
* Failed
* Retry Required

This helps monitor communication with external systems and simplifies troubleshooting.

## Architecture

Placement Application

↓

Application Trigger

↓

CandidateSyncQueueable

↓

Named Credential

↓

External REST API

↓

Integration Status Update

## Outcome

Successfully implemented a basic external system integration using Salesforce best practices. This sprint provided hands-on experience with REST APIs, Named Credentials, Queueable Apex, Triggers, HTTP Callouts, and integration monitoring.

## Technologies Used

* Salesforce Platform
* Apex
* Queueable Apex
* Triggers
* REST API
* HTTP Callouts
* Named Credentials
* External Credentials
* SOQL
* DML Operations
* VS Code
* Salesforce CLI
