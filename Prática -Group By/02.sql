SELECT
    "userId" AS id,
    COUNT("endDate") AS educations
FROM
    educations e
WHERE
    "endDate" IS NOT NULL
GROUP BY
    "userId"
ORDER BY
    "userId";