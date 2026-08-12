# Sprint 10 – Student Placement Portal (Code Implementation)

## Components Created

### 1. studentPortal

#### studentPortal.html

```html
<template>

    <c-student-profile
        onprofilesaved={handleProfileSaved}>
    </c-student-profile>

    <br/>

    <c-eligible-jobs
        onjobselect={handleJobSelect}>
    </c-eligible-jobs>

    <br/>

    <c-job-details
        job={selectedJob}
        onapply={handleApply}>
    </c-job-details>

</template>
```

#### studentPortal.js

```javascript
import { LightningElement } from 'lwc';

export default class StudentPortal extends LightningElement {

    selectedJob;

    handleProfileSaved() {
        console.log('Profile saved');
    }

    handleJobSelect(event) {
        this.selectedJob = event.detail;
    }

    handleApply(event) {
        console.log('Applied for Job Id: ' + event.detail.jobId);
    }
}
```

---

### 2. studentProfile

#### studentProfile.html

```html
<template>

    <lightning-card title="Student Profile">

        <lightning-input
            label="Name"
            value={name}
            onchange={handleNameChange}>
        </lightning-input>

        <lightning-input
            type="email"
            label="Email"
            value={email}
            onchange={handleEmailChange}>
        </lightning-input>

        <lightning-input
            label="Phone"
            value={phone}
            onchange={handlePhoneChange}>
        </lightning-input>

        <lightning-input
            label="Branch"
            value={branch}
            onchange={handleBranchChange}>
        </lightning-input>

        <lightning-input
            type="number"
            label="CGPA"
            value={cgpa}
            onchange={handleCgpaChange}>
        </lightning-input>

        <lightning-button
            label="Save Profile"
            variant="brand"
            onclick={handleSave}>
        </lightning-button>

    </lightning-card>

</template>
```

#### studentProfile.js

```javascript
import { LightningElement, track } from 'lwc';

export default class StudentProfile extends LightningElement {

    @track name = '';
    @track email = '';
    @track phone = '';
    @track branch = '';
    @track cgpa = '';

    handleNameChange(event) {
        this.name = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
    }

    handlePhoneChange(event) {
        this.phone = event.target.value;
    }

    handleBranchChange(event) {
        this.branch = event.target.value;
    }

    handleCgpaChange(event) {
        this.cgpa = event.target.value;
    }

    handleSave() {
        this.dispatchEvent(
            new CustomEvent('profilesaved')
        );
    }
}
```

---

### 3. eligibleJobs

#### eligibleJobs.html

```html
<template>

    <lightning-card title="Eligible Jobs">

        <template for:each={jobs}
                  for:item="job">

            <div key={job.Id}
                 class="slds-box slds-m-around_small">

                <p><strong>{job.Name}</strong></p>

                <p>
                    Company:
                    {job.Company__c}
                </p>

                <p>
                    Package:
                    {job.Package__c}
                </p>

                <lightning-button
                    label="View Details"
                    data-id={job.Id}
                    onclick={handleViewDetails}>
                </lightning-button>

            </div>

        </template>

    </lightning-card>

</template>
```

#### eligibleJobs.js

```javascript
import { LightningElement } from 'lwc';

export default class EligibleJobs extends LightningElement {

    jobs = [
        {
            Id:'1',
            Name:'Salesforce Developer',
            Company__c:'Salesforce',
            Package__c:'8 LPA'
        },
        {
            Id:'2',
            Name:'Java Developer',
            Company__c:'Infosys',
            Package__c:'6 LPA'
        }
    ];

    handleViewDetails(event) {

        const selectedJobId =
            event.target.dataset.id;

        const selectedJob =
            this.jobs.find(
                job => job.Id === selectedJobId
            );

        this.dispatchEvent(
            new CustomEvent('jobselect',{
                detail:selectedJob
            })
        );
    }
}
```

---

### 4. jobDetails

#### jobDetails.html

```html
<template>

    <template if:true={job}>

        <lightning-card title="Job Details">

            <div class="slds-p-around_medium">

                <p>
                    <strong>Job Title:</strong>
                    {job.Name}
                </p>

                <p>
                    <strong>Company:</strong>
                    {job.Company__c}
                </p>

                <p>
                    <strong>Package:</strong>
                    {job.Package__c}
                </p>

                <lightning-button
                    label="Apply"
                    variant="brand"
                    onclick={handleApply}>
                </lightning-button>

            </div>

        </lightning-card>

    </template>

</template>
```

#### jobDetails.js

```javascript
import { LightningElement, api } from 'lwc';

export default class JobDetails extends LightningElement {

    @api job;

    handleApply() {

        this.dispatchEvent(
            new CustomEvent('apply',{
                detail:{
                    jobId:this.job.Id
                }
            })
        );
    }
}
```

---

### 5. statusBadge

#### statusBadge.html

```html
<template>
    <lightning-badge
        label={status}>
    </lightning-badge>
</template>
```

#### statusBadge.js

```javascript
import { LightningElement, api } from 'lwc';

export default class StatusBadge extends LightningElement {

    @api status;

}
```

---

### 6. emptyState

#### emptyState.html

```html
<template>

    <div class="slds-box
                slds-theme_alert-texture
                slds-text-align_center">

        <h2>{title}</h2>

        <p>{message}</p>

    </div>

</template>
```

#### emptyState.js

```javascript
import { LightningElement, api } from 'lwc';

export default class EmptyState extends LightningElement {

    @api title;
    @api message;

}
```

---

## Apex Class

### PlacementController.cls

```apex
public with sharing class PlacementController {

    @AuraEnabled(cacheable=true)
    public static List<Job_Opening__c> getJobs() {

        return [
            SELECT Id,
                   Name,
                   Company__c,
                   Closing_Date__c,
                   Status__c,
                   Minimum_CGPA__c
            FROM Job_Opening__c
            ORDER BY CreatedDate DESC
        ];
    }
}
```

---

## Concepts Used

### Parent → Child Communication

```javascript
@api job;
```

### Child → Parent Communication

```javascript
this.dispatchEvent(
    new CustomEvent('jobselect')
);
```

### Event Handling

```html
onclick={handleViewDetails}
```

```html
onclick={handleApply}
```

### Iteration

```html
<template for:each={jobs}
          for:item="job">
</template>
```

### Conditional Rendering

```html
<template if:true={job}>
</template>
```

### Reusable Components

```html
<c-status-badge
    status="Open">
</c-status-badge>
```

```html
<c-empty-state
    title="No Jobs Available"
    message="Please check later">
</c-empty-state>
```

