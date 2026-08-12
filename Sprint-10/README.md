# Sprint 10 – Student Placement Portal (LWC Component Communication)

## Overview

Sprint 10 focused on building a **Student Placement Portal** using Lightning Web Components (LWC). The objective was to understand component-based architecture, parent-child communication, custom events, reusable components, and user interaction within Salesforce.

The application allows students to view available job openings, view job details, and apply for jobs through an interactive user interface.

---

## Learning Objectives

* Understand Parent-to-Child communication using `@api`
* Implement Child-to-Parent communication using Custom Events
* Build reusable Lightning Web Components
* Display dynamic data using Apex and LWC
* Create modular and maintainable component architecture
* Handle user interactions through buttons and events

---

## Components Developed

### 1. placementHome

Acts as the main parent component that displays all available jobs and handles user interactions.

**Responsibilities**

* Fetch available jobs from Apex
* Display job cards
* Track selected job
* Track applied job

---

### 2. jobCard

Reusable child component used to display individual job information.

**Features**

* Displays Job Name
* Displays Company Name
* Displays Closing Date
* Displays Status
* Displays Minimum CGPA
* View Details button
* Apply button

---

### 3. statusBadge

Reusable component used to visually display job status.

**Example Status Values**

* Open
* Closed
* Applied

---

### 4. emptyState

Reusable component used when no records are available.

**Example Messages**

* No Jobs Available
* No Data Found

---

## Apex Controller

### PlacementController.cls

The Apex controller is responsible for retrieving Job Opening records from Salesforce.

**Method**

* `getJobs()`

**Purpose**

* Fetches Job Opening records
* Returns job information to Lightning Web Components

---

## Salesforce Configuration

### Custom Object

**Job Opening**

### Fields Created

| Field Name      | Type     |
| --------------- | -------- |
| Name            | Text     |
| Company__c      | Text     |
| Closing_Date__c | Date     |
| Status__c       | Picklist |
| Minimum_CGPA__c | Number   |

---

## Component Communication

### Child → Parent Communication

Implemented using Custom Events.

Example:

* User clicks **View Details**
* `jobCard` fires a custom event
* `placementHome` receives the selected Job Id

---

### Parent → Child Communication

Implemented using `@api`.

Example:

* Parent passes selected job data to child components
* Child component displays updated information

---

## User Interface Features

### Available Jobs Section

Displays:

* Job Name
* Company
* Closing Date
* Status
* Minimum CGPA

### Actions

#### View Details

Allows users to select a job and view detailed information.

#### Apply

Allows users to apply for a selected job.

---

## Sample Records

### Salesforce Developer

* Company: Salesforce
* Closing Date: 05-Aug-2026
* Status: Open
* Minimum CGPA: 8.7

### Java Developer

* Company: Infosys
* Closing Date: 31-Aug-2026
* Status: Open
* Minimum CGPA: 8.0

---

## Expected Output

The application displays available job openings as interactive job cards.

Users can:

1. View available jobs
2. Click **View Details**
3. Click **Apply**
4. View selected Job Id
5. View applied Job Id
6. Observe status badges
7. See empty state messages when no records exist

---

## Key Concepts Practiced

* Lightning Web Components (LWC)
* Apex Integration
* Custom Events
* @api Decorator
* Component Reusability
* Salesforce Data Model
* Event Handling
* Dynamic Data Rendering
* Parent-Child Communication
* UI Development using SLDS

---

## Outcome

Successfully developed a Student Placement Portal using Salesforce Lightning Web Components. The project demonstrates component communication, reusable component design, Apex integration, and interactive user interface development following Salesforce best practices.

