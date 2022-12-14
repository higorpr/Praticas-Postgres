SELECT t.id, w.writer, u.name AS recipient, t.message
FROM testimonials t JOIN users u
ON t."recipientId" = u.id
JOIN
    (SELECT t.id, u.name AS writer
    FROM testimonials t LEFT JOIN users u
    ON t."writerId" = u.id) w   
ON t.id = w.id;