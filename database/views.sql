CREATE OR REPLACE VIEW vw_survey_overview AS
SELECT
    s.id AS survey_id,
    s.title AS survey_title,
    s.status,
    s.start_date,
    s.end_date,
    COUNT(DISTINCT q.id) AS question_count,
    COUNT(DISTINCT r.id) AS response_count
FROM surveys s
LEFT JOIN questions q ON q.survey_id = s.id
LEFT JOIN responses r ON r.survey_id = s.id
GROUP BY s.id, s.title, s.status, s.start_date, s.end_date;

