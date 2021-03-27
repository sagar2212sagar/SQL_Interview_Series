WITH cte
AS (
	SELECT id
		,swipe_flag
		,TIME
		,row_number() OVER (
			PARTITION BY id ORDER BY TIME DESC
			) AS r1
	FROM employee
	WHERE TIME <= TRY_TO_TIME('10:00:00')
	)
SELECT ID
FROM cte
WHERE swipe_flag = 'in'
	AND r1 = 1