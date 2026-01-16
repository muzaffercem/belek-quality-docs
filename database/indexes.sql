-- USERS
CREATE INDEX IF NOT EXISTS idx_users_email
ON users(email);

-- USER_ROLES
CREATE INDEX IF NOT EXISTS idx_user_roles_user_id
ON user_roles(user_id);

CREATE INDEX IF NOT EXISTS idx_user_roles_role_id
ON user_roles(role_id);

-- FACULTIES / DEPARTMENTS / PROGRAMS / COURSES
CREATE INDEX IF NOT EXISTS idx_departments_faculty_id
ON departments(faculty_id);

CREATE INDEX IF NOT EXISTS idx_programs_department_id
ON programs(department_id);

CREATE INDEX IF NOT EXISTS idx_courses_program_id
ON courses(program_id);

-- SURVEYS
CREATE INDEX IF NOT EXISTS idx_surveys_status
ON surveys(status);

CREATE INDEX IF NOT EXISTS idx_surveys_created_by
ON surveys(created_by_user_id);

-- QUESTIONS
CREATE INDEX IF NOT EXISTS idx_questions_survey_id
ON questions(survey_id);

-- RESPONSES
CREATE INDEX IF NOT EXISTS idx_responses_survey_id
ON responses(survey_id);

CREATE INDEX IF NOT EXISTS idx_responses_user_id
ON responses(user_id);

-- RESPONSE ANSWERS
CREATE INDEX IF NOT EXISTS idx_response_answers_response_id
ON response_answers(response_id);

CREATE INDEX IF NOT EXISTS idx_response_answers_question_id
ON response_answers(question_id);

