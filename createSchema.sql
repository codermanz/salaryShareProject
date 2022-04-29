CREATE TABLE IF NOT EXISTS LOCATION (
	COUNTRY VARCHAR(50) NOT NULL,
	STATE VARCHAR(50) NOT NULL,
    -- Composite Primary Key
	PRIMARY KEY (COUNTRY, STATE)
);

CREATE TABLE IF NOT EXISTS COMPANY (
	COMPANY_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	COMPANY_NAME VARCHAR(60) NOT NULL,
	COMPANY_STANDING TEXT,
    -- Foreign keys
    COMPANY_COUNTRY VARCHAR(50) NOT NULL,
    COMPANY_STATE VARCHAR(50) NOT NULL,
    COMPANY_FIELD VARCHAR(50) NOT NULL,
    FOREIGN KEY (COMPANY_COUNTRY, COMPANY_STATE) REFERENCES LOCATION(COUNTRY, STATE),
    FOREIGN KEY (COMPANY_FIELD) REFERENCES FIELD(NAME)
);

--All fields can be null except PK, Job name & field
CREATE TABLE IF NOT EXISTS JOB (
	JOB_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    JOB_NAME VARCHAR(50) NOT NULL, 
	JOB_LEVEL VARCHAR(50),
	JOB_COMMITMENT VARCHAR(50),
	JOB_SHIFT_TIME VARCHAR(50),
	JOB_LOCATION_TYPE VARCHAR(50),
    JOB_FIELD VARCHAR(50) NOT NULL,
	FOREIGN KEY (JOB_FIELD) REFERENCES FIELD(NAME)
);

CREATE TABLE IF NOT EXISTS FIELD (
	NAME VARCHAR(50) NOT NULL PRIMARY KEY UNIQUE
);

CREATE TABLE IF NOT EXISTS USER_INPUT(
    INPUT_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    USER_COMPANY_ID INTEGER NOT NULL,
    USER_JOB_ID INTEGER NOT NULL,
    YEARS_WORKING INTEGER NOT NULL,
	YEARS_AT_COMPANY INTEGER NOT NULL,
	SALARY INTEGER NOT NULL,
	NEGOTIATED VARCHAR(3),
    USER_COUNTRY VARCHAR(50) NOT NULL,
    USER_STATE VARCHAR(50) NOT NULL,
    -- Foreign keys
    FOREIGN KEY (USER_COUNTRY) REFERENCES LOCATION(COUNTRY),
    FOREIGN KEY (USER_STATE) REFERENCES LOCATION(STATE),
    FOREIGN KEY (USER_JOB_ID) REFERENCES JOB(JOB_ID),
    FOREIGN KEY (USER_COMPANY_ID) REFERENCES COMPANY(COMPANY_ID) 
);