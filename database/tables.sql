-- belek_quality_mgmt.faculties definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.faculties;

CREATE TABLE belek_quality_mgmt.faculties (
	id serial4 NOT NULL,
	"name" varchar(150) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT faculties_name_key UNIQUE (name),
	CONSTRAINT faculties_pkey PRIMARY KEY (id)
);


-- belek_quality_mgmt.roles definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.roles;

CREATE TABLE belek_quality_mgmt.roles (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT roles_name_key UNIQUE (name),
	CONSTRAINT roles_pkey PRIMARY KEY (id)
);


-- belek_quality_mgmt.users definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.users;

CREATE TABLE belek_quality_mgmt.users (
	id uuid NOT NULL,
	first_name varchar(50) NULL,
	last_name varchar(50) NULL,
	email varchar(150) NOT NULL,
	user_type varchar(30) NOT NULL,
	is_active bool DEFAULT true NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT users_email_key UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (id)
);


-- belek_quality_mgmt.departments definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.departments;

CREATE TABLE belek_quality_mgmt.departments (
	id serial4 NOT NULL,
	faculty_id int4 NOT NULL,
	"name" varchar(150) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT departments_faculty_id_name_key UNIQUE (faculty_id, name),
	CONSTRAINT departments_pkey PRIMARY KEY (id),
	CONSTRAINT departments_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES belek_quality_mgmt.faculties(id) ON DELETE RESTRICT
);


-- belek_quality_mgmt.programs definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.programs;

CREATE TABLE belek_quality_mgmt.programs (
	id serial4 NOT NULL,
	department_id int4 NOT NULL,
	"name" varchar(150) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT programs_department_id_name_key UNIQUE (department_id, name),
	CONSTRAINT programs_pkey PRIMARY KEY (id),
	CONSTRAINT programs_department_id_fkey FOREIGN KEY (department_id) REFERENCES belek_quality_mgmt.departments(id) ON DELETE RESTRICT
);


-- belek_quality_mgmt.surveys definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.surveys;

CREATE TABLE belek_quality_mgmt.surveys (
	id bigserial NOT NULL,
	title varchar(200) NOT NULL,
	description text NULL,
	status varchar(20) NOT NULL,
	is_anonymous bool DEFAULT false NOT NULL,
	start_date timestamp NOT NULL,
	end_date timestamp NOT NULL,
	created_by_user_id uuid NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT surveys_pkey PRIMARY KEY (id),
	CONSTRAINT surveys_created_by_user_id_fkey FOREIGN KEY (created_by_user_id) REFERENCES belek_quality_mgmt.users(id) ON DELETE RESTRICT
);
CREATE INDEX idx_surveys_start_end ON belek_quality_mgmt.surveys USING btree (start_date, end_date);
CREATE INDEX idx_surveys_status ON belek_quality_mgmt.surveys USING btree (status);


-- belek_quality_mgmt.user_roles definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.user_roles;

CREATE TABLE belek_quality_mgmt.user_roles (
	id bigserial NOT NULL,
	user_id uuid NOT NULL,
	role_id int4 NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT user_roles_pkey PRIMARY KEY (id),
	CONSTRAINT user_roles_user_id_role_id_key UNIQUE (user_id, role_id),
	CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES belek_quality_mgmt.roles(id) ON DELETE CASCADE,
	CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES belek_quality_mgmt.users(id) ON DELETE CASCADE
);
CREATE INDEX idx_user_roles_role_id ON belek_quality_mgmt.user_roles USING btree (role_id);
CREATE INDEX idx_user_roles_user_id ON belek_quality_mgmt.user_roles USING btree (user_id);


-- belek_quality_mgmt.ai_survey_analysis definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.ai_survey_analysis;

CREATE TABLE belek_quality_mgmt.ai_survey_analysis (
	id bigserial NOT NULL,
	survey_id int8 NOT NULL,
	overall_sentiment_score numeric NULL,
	summary_text text NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT ai_survey_analysis_pkey PRIMARY KEY (id),
	CONSTRAINT ai_survey_analysis_survey_id_key UNIQUE (survey_id),
	CONSTRAINT ai_survey_analysis_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES belek_quality_mgmt.surveys(id) ON DELETE CASCADE
);
CREATE INDEX idx_ai_survey_analysis_survey_id ON belek_quality_mgmt.ai_survey_analysis USING btree (survey_id);


-- belek_quality_mgmt.courses definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.courses;

CREATE TABLE belek_quality_mgmt.courses (
	id serial4 NOT NULL,
	program_id int4 NOT NULL,
	course_code varchar(20) NOT NULL,
	"name" varchar(150) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT courses_pkey PRIMARY KEY (id),
	CONSTRAINT courses_program_id_course_code_key UNIQUE (program_id, course_code),
	CONSTRAINT courses_program_id_fkey FOREIGN KEY (program_id) REFERENCES belek_quality_mgmt.programs(id) ON DELETE RESTRICT
);


-- belek_quality_mgmt.improvement_actions definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.improvement_actions;

CREATE TABLE belek_quality_mgmt.improvement_actions (
	id bigserial NOT NULL,
	survey_id int8 NOT NULL,
	title varchar(200) NOT NULL,
	description text NULL,
	status varchar(30) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT improvement_actions_pkey PRIMARY KEY (id),
	CONSTRAINT improvement_actions_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES belek_quality_mgmt.surveys(id) ON DELETE CASCADE
);


-- belek_quality_mgmt.questions definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.questions;

CREATE TABLE belek_quality_mgmt.questions (
	id bigserial NOT NULL,
	survey_id int8 NOT NULL,
	question_text text NOT NULL,
	question_type varchar(30) NOT NULL,
	is_required bool DEFAULT false NOT NULL,
	order_no int4 NOT NULL,
	scale_min int4 NULL,
	scale_max int4 NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT questions_pkey PRIMARY KEY (id),
	CONSTRAINT questions_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES belek_quality_mgmt.surveys(id) ON DELETE CASCADE
);
CREATE INDEX idx_questions_survey_id ON belek_quality_mgmt.questions USING btree (survey_id);
CREATE INDEX idx_questions_type ON belek_quality_mgmt.questions USING btree (question_type);


-- belek_quality_mgmt.responses definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.responses;

CREATE TABLE belek_quality_mgmt.responses (
	id bigserial NOT NULL,
	survey_id int8 NOT NULL,
	user_id uuid NULL,
	anonymous_token varchar(100) NULL,
	submitted_at timestamp DEFAULT now() NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT responses_pkey PRIMARY KEY (id),
	CONSTRAINT responses_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES belek_quality_mgmt.surveys(id) ON DELETE CASCADE,
	CONSTRAINT responses_user_id_fkey FOREIGN KEY (user_id) REFERENCES belek_quality_mgmt.users(id) ON DELETE SET NULL
);


-- belek_quality_mgmt.survey_targets definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.survey_targets;

CREATE TABLE belek_quality_mgmt.survey_targets (
	id bigserial NOT NULL,
	survey_id int8 NOT NULL,
	target_type varchar(30) NOT NULL,
	faculty_id int4 NULL,
	department_id int4 NULL,
	program_id int4 NULL,
	course_id int4 NULL,
	role_id int4 NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT survey_targets_pkey PRIMARY KEY (id),
	CONSTRAINT survey_targets_course_id_fkey FOREIGN KEY (course_id) REFERENCES belek_quality_mgmt.courses(id) ON DELETE RESTRICT,
	CONSTRAINT survey_targets_department_id_fkey FOREIGN KEY (department_id) REFERENCES belek_quality_mgmt.departments(id) ON DELETE RESTRICT,
	CONSTRAINT survey_targets_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES belek_quality_mgmt.faculties(id) ON DELETE RESTRICT,
	CONSTRAINT survey_targets_program_id_fkey FOREIGN KEY (program_id) REFERENCES belek_quality_mgmt.programs(id) ON DELETE RESTRICT,
	CONSTRAINT survey_targets_role_id_fkey FOREIGN KEY (role_id) REFERENCES belek_quality_mgmt.roles(id) ON DELETE RESTRICT,
	CONSTRAINT survey_targets_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES belek_quality_mgmt.surveys(id) ON DELETE CASCADE
);


-- belek_quality_mgmt.question_options definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.question_options;

CREATE TABLE belek_quality_mgmt.question_options (
	id bigserial NOT NULL,
	question_id int8 NOT NULL,
	option_text varchar(250) NOT NULL,
	option_value varchar(50) NULL,
	order_no int4 NOT NULL,
	CONSTRAINT question_options_pkey PRIMARY KEY (id),
	CONSTRAINT question_options_question_id_fkey FOREIGN KEY (question_id) REFERENCES belek_quality_mgmt.questions(id) ON DELETE CASCADE
);
CREATE INDEX idx_question_options_question_id ON belek_quality_mgmt.question_options USING btree (question_id);


-- belek_quality_mgmt.response_answers definition

-- Drop table

-- DROP TABLE belek_quality_mgmt.response_answers;

CREATE TABLE belek_quality_mgmt.response_answers (
	id bigserial NOT NULL,
	response_id int8 NOT NULL,
	question_id int8 NOT NULL,
	option_id int8 NULL,
	numeric_value numeric NULL,
	text_value text NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT response_answers_pkey PRIMARY KEY (id),
	CONSTRAINT response_answers_option_id_fkey FOREIGN KEY (option_id) REFERENCES belek_quality_mgmt.question_options(id) ON DELETE SET NULL,
	CONSTRAINT response_answers_question_id_fkey FOREIGN KEY (question_id) REFERENCES belek_quality_mgmt.questions(id) ON DELETE CASCADE,
	CONSTRAINT response_answers_response_id_fkey FOREIGN KEY (response_id) REFERENCES belek_quality_mgmt.responses(id) ON DELETE CASCADE
);
CREATE INDEX idx_response_answers_question_id ON belek_quality_mgmt.response_answers USING btree (question_id);
CREATE INDEX idx_response_answers_response_id ON belek_quality_mgmt.response_answers USING btree (response_id);
