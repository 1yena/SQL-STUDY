SELECT
    *
FROM employees
WHERE salary > 4000
and job_id = 'IT_PROG';

--
SELECT
    *
FROM employees
WHERE salary > 4000
AND (job_id = 'IT_PROG'
OR job_id = 'FI_ACCOUNT');