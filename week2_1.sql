SELECT submission_date AS day, COUNT(DISTINCT hacker_id) AS total_hackers, 
       hacker_id, name, MAX(submissions_per_day) AS max_submissions
FROM (
   SELECT s.hacker_id, s.submission_date, h.name, COUNT(*) AS submissions_per_day
   FROM submissions s
   JOIN hackers h ON s.hacker_id = h.hacker_id
   WHERE s.submission_date >= '2016-03-01' AND s.submission_date <= '2016-03-15'
   GROUP BY s.hacker_id, s.submission_date
) AS daily_submissions
GROUP BY submission_date, hacker_id
HAVING COUNT(*) >= 1
ORDER BY day;
