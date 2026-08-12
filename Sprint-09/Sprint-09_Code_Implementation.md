# Sprint 9 - Eligible Jobs Lightning Web Component

## Objective

Developed a Lightning Web Component (LWC) to display available job opportunities for students in the Placement Management System.

---

# 1. Apex Controller

File: `EligibleJobsController.cls`

```java
public with sharing class EligibleJobsController {

    @AuraEnabled(cacheable=true)
    public static List<Job__c> getJobs() {

        return [
            SELECT Id,
                   Name,
                   Location__c,
                   Package__c,
                   Application_Deadline__c
            FROM Job__c
        ];
    }
}
```

---

# 2. Lightning Web Component JavaScript

File: `eligibleJobs.js`

```javascript
import { LightningElement, wire } from 'lwc';
import getJobs from '@salesforce/apex/EligibleJobsController.getJobs';

export default class EligibleJobs extends LightningElement {

    @wire(getJobs)
    jobs;

    handleApply(event) {

        const jobId = event.target.dataset.jobId;

        console.log('Selected Job Id: ' + jobId);
    }
}
```

---

# 3. Lightning Web Component HTML

File: `eligibleJobs.html`

```html
<template>
    <lightning-card title="Eligible Jobs" icon-name="standard:job_profile">

        <template if:true={jobs.data}>
            <template for:each={jobs.data} for:item="job">

                <div key={job.Id} class="slds-box slds-m-around_small">

                    <p>
                        <strong>Job Name:</strong>
                        {job.Name}
                    </p>

                    <p>
                        <strong>Location:</strong>
                        {job.Location__c}
                    </p>

                    <p>
                        <strong>Package:</strong>
                        {job.Package__c}
                    </p>

                    <p>
                        <strong>Application Deadline:</strong>
                        {job.Application_Deadline__c}
                    </p>

                    <lightning-button
                        label="Apply"
                        variant="brand"
                        data-job-id={job.Id}
                        onclick={handleApply}>
                    </lightning-button>

                </div>

            </template>
        </template>

        <template if:false={jobs.data}>
            <p class="slds-p-around_medium">
                No eligible jobs are currently available.
            </p>
        </template>

    </lightning-card>
</template>
```

---

# 4. Component Configuration

File: `eligibleJobs.js-meta.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>65.0</apiVersion>
    <isExposed>true</isExposed>

    <targets>
        <target>lightning__HomePage</target>
        <target>lightning__AppPage</target>
        <target>lightning__RecordPage</target>
    </targets>
</LightningComponentBundle>
```

---

# Features Implemented

- Created Eligible Jobs Lightning Web Component.
- Displayed Job records dynamically.
- Used Wire Service to fetch Salesforce data.
- Connected LWC with Apex Controller.
- Implemented list rendering using `for:each`.
- Added Apply button functionality.
- Added component to Lightning App Builder.
- Activated component on Home Page.
- Tested using sample Job records (TCS and Infosys).

---

# Salesforce Concepts Used

- Lightning Web Components (LWC)
- Apex Classes
- SOQL
- Wire Service
- Data Binding
- Event Handling
- Lightning App Builder
- VS Code Deployment

---

# Project Structure

```text
force-app
└── main
    └── default

        ├── classes
        │   ├── EligibleJobsController.cls
        │   └── EligibleJobsController.cls-meta.xml

        └── lwc
            └── eligibleJobs
                ├── eligibleJobs.html
                ├── eligibleJobs.js
                └── eligibleJobs.js-meta.xml
```

---

# Outcome

Successfully built and deployed an Eligible Jobs LWC that retrieves Job records from Salesforce and displays them dynamically on a Lightning Page.
