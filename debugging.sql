DROP TABLE IF EXISTS LOCATION;
DROP TABLE IF EXISTS COMPANY;
DROP TABLE IF EXISTS JOB;
DROP TABLE IF EXISTS FIELD;
DROP TABLE IF EXISTS USER_INPUT;

INSERT INTO COMPANY(COMPANY_ID, COMPANY_NAME, COMPANY_STANDING, COMPANY_COUNTRY, COMPANY_STATE, COMPANY_FIELD)
        VALUES(5, 'Washington Hospital', 'Government', 'United States', 'Washington', 'Medicine');