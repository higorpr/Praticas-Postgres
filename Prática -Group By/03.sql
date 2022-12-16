SELECT
    u.name AS writer,
    COUNT(t.id) AS "testimonialCount"
FROM
    users u
    JOIN testimonials t ON u.id = t."writerId"
GROUP BY
    writer
ORDER BY
    writer;