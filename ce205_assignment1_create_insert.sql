CREATE DATABASE IF NOT EXISTS ce205_assignment1;
USE ce205_assignment1;


DROP TABLE IF EXISTS MARKS;
DROP TABLE IF EXISTS ASSESSMENT;
DROP TABLE IF EXISTS MODULE;
DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS STUDENT;



CREATE TABLE STUDENT (
  studentID   VARCHAR(10) PRIMARY KEY,
  studentName VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE STAFF (
  staffID   VARCHAR(10) PRIMARY KEY,
  staffName VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE MODULE (
  moduleID    VARCHAR(10) PRIMARY KEY,
  moduleTitle VARCHAR(100) NOT NULL,
  staffID     VARCHAR(10) NOT NULL,
  moderatorID VARCHAR(10) NOT NULL,
  CONSTRAINT fk_module_staff
    FOREIGN KEY (staffID) REFERENCES STAFF(staffID),
  CONSTRAINT fk_module_moderator
    FOREIGN KEY (moderatorID) REFERENCES STAFF(staffID),
  CONSTRAINT chk_staff_diff_moderator CHECK (staffID <> moderatorID)
) ENGINE=InnoDB;

CREATE TABLE ASSESSMENT (
  moduleID             VARCHAR(10) NOT NULL,
  assessmentID         VARCHAR(10) NOT NULL,
  AssessmentType       VARCHAR(50) NOT NULL,
  AssessmentPercentage DECIMAL(5,2) NOT NULL,
  Deadline             DATE NOT NULL,
  PRIMARY KEY (moduleID, assessmentID),
  CONSTRAINT fk_assessment_module
    FOREIGN KEY (moduleID) REFERENCES MODULE(moduleID),
  CONSTRAINT chk_pct_range CHECK (AssessmentPercentage >= 0 AND AssessmentPercentage <= 100)
) ENGINE=InnoDB;

CREATE TABLE MARKS (
  studentID     VARCHAR(10) NOT NULL,
  moduleID      VARCHAR(10) NOT NULL,
  assessmentID  VARCHAR(10) NOT NULL,
  marksObtained DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (studentID, moduleID, assessmentID),
  CONSTRAINT fk_marks_student
    FOREIGN KEY (studentID) REFERENCES STUDENT(studentID),
  CONSTRAINT fk_marks_module
    FOREIGN KEY (moduleID) REFERENCES MODULE(moduleID),
  CONSTRAINT fk_marks_assessment
    FOREIGN KEY (moduleID, assessmentID) REFERENCES ASSESSMENT(moduleID, assessmentID),
  CONSTRAINT chk_mark_range CHECK (marksObtained >= 0 AND marksObtained <= 100)
) ENGINE=InnoDB;



INSERT INTO STUDENT VALUES
('STU001','Mitchell'),
('STU002','Michael Jordan');

INSERT INTO STAFF VALUES
('T10','James'),
('T05','Moderator Five'),
('T11','Basir Oskoei'),
('T12','Sam');

INSERT INTO MODULE VALUES
('CS08','Cyber Security','T10','T05'),
('CS12','Databases','T11','T12'),
('CS15','Application Programming','T12','T11');

INSERT INTO ASSESSMENT VALUES
('CS08','A04','Project',40.00,'2025-10-28'),
('CS08','A03','Final Exam',60.00,'2025-11-15');

INSERT INTO ASSESSMENT VALUES
('CS12','A01','Assignment',30.00,'2025-10-20'),
('CS12','A02','Progress Test',20.00,'2025-11-05'),
('CS12','A03','Final Exam',50.00,'2025-12-10');

INSERT INTO ASSESSMENT VALUES
('CS15','A01','Assignment',30.00,'2025-10-18'),
('CS15','A02','Progress Test',20.00,'2025-11-03'),
('CS15','A03','Final Exam',50.00,'2025-12-08');

INSERT INTO MARKS VALUES
('STU001','CS08','A04',29),
('STU001','CS08','A03',41),
('STU001','CS12','A01',68),
('STU001','CS12','A02',62),
('STU001','CS12','A03',55);

INSERT INTO MARKS VALUES
('STU002','CS08','A04',72),
('STU002','CS08','A03',64),
('STU002','CS15','A01',81),
('STU002','CS15','A02',74),
('STU002','CS15','A03',67);












