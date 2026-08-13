# Day 3 – Salesforce Automation with Flow and Validation Rules

## Objective

The objective of this task was to automate business processes in Salesforce using Record-Triggered Flows and Validation Rules. The implementation was carried out on the **Issue Record** object in the Employee Leave Management / Library Management application.

---

## Tasks Completed

### 1. Record-Triggered Flow Creation

Created a **Before-Save Record-Triggered Flow** on the **Issue Record** object.

**Flow Details**

* Object: Issue Record
* Trigger: A record is created
* Optimization: Fast Field Updates (Before Save)
* Flow Name: Auto Set Issued Date

### Flow Logic

When a new Issue Record is created:

* If the Issued Date is left blank,
* The flow automatically sets the Issued Date to the current date.

### Assignment Configuration

* Variable: `$Record.Issued_Date__c`
* Operator: Equals
* Value: `$Flow.CurrentDate`

### Outcome

The Issued Date is automatically populated with today's date when a new Issue Record is saved.

---

### 2. Flow Testing

A new Issue Record was created with:

* Book selected
* Member selected
* Issued Date left blank

**Result**

* Record saved successfully.
* Issued Date was automatically populated with the current date.

---

### 3. Validation Rules Creation

#### Validation Rule 1 – Due Date Validation

**Purpose**
Prevent users from entering a Due Date earlier than the Issued Date.

**Formula**

```text
Due_Date__c < Issued_Date__c
```

**Error Message**

```text
Due Date cannot be before Issued Date.
```

---

#### Validation Rule 2 – Book Required

**Purpose**
Ensure that a Book is selected before saving an Issue Record.

**Formula**

```text
ISBLANK(Books__c)
```

**Error Message**

```text
Please select a Book.
```

---

#### Validation Rule 3 – Member Required

**Purpose**
Ensure that a Member is selected before saving an Issue Record.

**Formula**

```text
ISBLANK(Member__c)
```

**Error Message**

```text
Please select a Member.
```

---

## Testing Results

### Flow Testing

✔ Issued Date automatically populated with the current date.

### Validation Rule Testing

✔ Due Date cannot be earlier than Issued Date.

✔ Book field is mandatory.

✔ Member field is mandatory.

---

## Key Learnings

* Understood the difference between Before-Save and After-Save Flows.
* Learned how to create Record-Triggered Flows.
* Automated field updates using Flow Assignments.
* Implemented business validations using Validation Rules.
* Tested and verified Salesforce automation functionality.
* Gained hands-on experience with declarative automation tools in Salesforce.

---

## Conclusion

Successfully implemented Salesforce automation on the Issue Record object using Record-Triggered Flows and Validation Rules. The solution ensures automatic population of Issued Date and maintains data quality by enforcing mandatory fields and date validations.
