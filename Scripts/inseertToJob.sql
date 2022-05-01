-- Populating job table for TECHNOLOGY FIELD Use case:
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (1, 'Software Developer', 'Tech Lead', 'Full-time', 'Day', 'On-site', 'Technology');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (2, 'Software Developer', 'Senior', 'Full-time', 'Day', 'On-site', 'Technology');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (3, 'Software Developer', 'Staff', 'Full-time', 'Day', 'On-site', 'Technology');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (4, 'Software Developer', 'Junior', 'Full-time', 'Day', 'On-site', 'Technology');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (5, 'Product Manager', 'Manager', 'Full-time', 'Day', 'On-site', 'Technology');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (6, 'Systems Architect', 'Senior', 'Full-time', 'Day', 'On-site', 'Technology');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (7, 'Quality Engineer', 'Junior', 'Full-time', 'Day', 'On-site', 'Technology');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (8, 'CEO', 'Full-time', 'On-site', 'Technology');

-- Populating job table for MEDICINE FIELD Use case:
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (9, 'Family Physician', 'Full-time', 'Night', 'On-site', 'Medicine');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (10, 'Nurse', 'Senior', 'Full-time', 'Night', 'On-site', 'Medicine');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (11, 'Nurse', 'Junior', 'Part-time', 'Night', 'On-site', 'Medicine');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (12, 'Nurse', 'Senior', 'Full-time', 'Day', 'On-site', 'Medicine');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (13, 'Nurse', 'Junior', 'Part-time', 'Day', 'On-site', 'Medicine');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (14, 'Administrator', 'Full-time', 'Day', 'On-site', 'Medicine');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (15, 'Administrator', 'Full-time', 'Night', 'On-site', 'Medicine');

-- Populating job table for HOSPITALITY FIELD Use case:
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_LEVEL, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (16, 'Waiter', 'Entry', 'Part-time', 'Day', 'On-site', 'Hospitality');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (17, 'Waiter', 'Full-time', 'Day', 'On-site', 'Hospitality');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (18, 'Chef', 'Part-time', 'Day', 'On-site', 'Hospitality');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (19, 'Chef', 'Full-time', 'Day', 'On-site', 'Hospitality');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (20, 'Manager', 'Part-time', 'Day', 'On-site', 'Hospitality');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (21, 'Manager', 'Full-time', 'Day', 'On-site', 'Hospitality');
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (22, 'Owner', 'Full-time', 'Day', 'On-site', 'Hospitality');


-- Populating job table for single business (augments tech & medicine)
INSERT INTO JOB(JOB_ID, JOB_NAME, JOB_COMMITMENT, JOB_SHIFT_TIME, JOB_LOCATION_TYPE, JOB_FIELD)
        VALUES (23, 'Human Resource', 'Full-time', 'Day', 'On-site', 'Business');
