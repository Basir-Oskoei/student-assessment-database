 SELECT 
  a.moduleID,
  m.moduleTitle,
  a.assessmentID,
  a.AssessmentType,
  a.AssessmentPercentage
FROM ASSESSMENT a
JOIN MODULE m ON m.moduleID = a.moduleID
WHERE a.moduleID = 'CS12'
ORDER BY a.assessmentID;



 SELECT 
  m.moduleID,
  m.moduleTitle,
  s.staffName  AS supervisor,
  s2.staffName AS moderator
FROM MODULE m
JOIN STAFF s  ON s.staffID  = m.staffID
JOIN STAFF s2 ON s2.staffID = m.moderatorID
WHERE m.staffID = 'T11'
ORDER BY m.moduleID;




SELECT
  mk.studentID,
  st.studentName,
  mk.moduleID,
  mo.moduleTitle,
  ROUND(SUM(mk.marksObtained * a.AssessmentPercentage) / 100, 2) AS overallPercent,
  CASE WHEN SUM(mk.marksObtained * a.AssessmentPercentage) / 100 >= 40
       THEN 'PASS' ELSE 'FAIL' END AS result
FROM MARKS mk
JOIN ASSESSMENT a
  ON a.moduleID = mk.moduleID AND a.assessmentID = mk.assessmentID
JOIN STUDENT st ON st.studentID = mk.studentID
JOIN MODULE  mo ON mo.moduleID  = mk.moduleID
GROUP BY mk.studentID, st.studentName, mk.moduleID, mo.moduleTitle
HAVING overallPercent >= 40
ORDER BY mk.studentID, mk.moduleID;





SELECT 
  s.staffID,
  s.staffName,
  COUNT(*) AS modules_taught
FROM MODULE m
JOIN STAFF s ON s.staffID = m.staffID
GROUP BY s.staffID, s.staffName
ORDER BY modules_taught DESC, s.staffID;







SELECT 
  s.staffID,
  s.staffName,
  SUM(m.staffID = s.staffID)      AS as_supervisor,
  SUM(m.moderatorID = s.staffID)  AS as_moderator,
  COUNT(*) AS total_roles
FROM MODULE m
JOIN STAFF s ON s.staffID IN (m.staffID, m.moderatorID)
GROUP BY s.staffID, s.staffName
ORDER BY total_roles DESC, s.staffID;
