CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> 60e20eb29d61

ALTER TABLE patients DROP COLUMN contact_number;

INSERT INTO alembic_version (version_num) VALUES ('60e20eb29d61');

-- Running upgrade 60e20eb29d61 -> 042d9bbdc549

ALTER TABLE patient_preferences ADD COLUMN toothpaste_flavor VARCHAR(100);

UPDATE alembic_version SET version_num='042d9bbdc549' WHERE alembic_version.version_num = '60e20eb29d61';

