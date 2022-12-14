SELECT c.id, u.name, c.name, s.name, e."endDate"
FROM users u JOIN educations e
ON u.id = e."userId"
JOIN courses c
ON e."courseId" = c.id
JOIN schools s
ON e."schoolId" = s.id
WHERE u.id = 30
ORDER BY c.id;