# Student Assessment Database

This project implements a relational database system for managing students, modules, staff, and assessments. It was developed as part of the CE205 Databases and Information Retrieval module.

## Overview
The database models a university assessment structure where:
- Each student can register for multiple modules.
- Each module is supervised and moderated by staff members.
- Each module includes several assessments (assignments, tests, exams).
- Marks are recorded for each student per assessment.

## Features
- Fully normalized to **Third Normal Form (3NF)**.
- Includes **referential integrity constraints** and **validation checks**.
- MySQL **CREATE**, **INSERT**, and **SELECT** statements provided.
- Sample dataset for demonstration and testing.

## Database Structure
**Tables:**
1. `STUDENT(studentID, studentName)`
2. `STAFF(staffID, staffName)`
3. `MODULE(moduleID, moduleTitle, staffID, moderatorID)`
4. `ASSESSMENT(moduleID, assessmentID, AssessmentType, AssessmentPercentage, Deadline)`
5. `MARKS(studentID, moduleID, assessmentID, marksObtained)`

Each table uses appropriate primary and foreign key constraints to ensure data consistency.

## Files
- `ce205_assignment1_create_insert.sql` — Database creation and data insertion scripts.
- `ce205_assignment1_queries.sql` — SQL queries to retrieve key information.
- `CE205_Assignment 1.pdf` — Full documentation, normalization steps, and explanations.

## Example Queries
- List all assessments of a specific module.
- Display all modules taught by a particular staff member.
- Show students who passed modules with an overall mark of 40% or higher.
- Count how many modules each staff member supervises.
- Display all staff with their total number of module roles (supervisor or moderator).

## Usage
1. Open MySQL Workbench or terminal.
2. Run `ce205_assignment1_create_insert.sql` to create and populate the database.
3. Run `ce205_assignment1_queries.sql` to test and view query results.

## Author
MohammadBasir Asghari Oskoei  
University of Essex — CE205: Databases and Information Retrieval  
2025
