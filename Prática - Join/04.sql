SELECT c.id, u.name, r.name AS role, c.name AS company, e."startDate"
FROM users u JOIN experiences e
ON u.id = e."userId"
JOIN companies c ON e."companyId" = c.id
JOIN roles r ON e."roleId" = r.id
WHERE u.id=50 AND e."endDate" IS NULL;