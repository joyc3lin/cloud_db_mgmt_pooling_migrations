CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> 94399b7f0e10

INSERT INTO alembic_version (version_num) VALUES ('94399b7f0e10');

-- Running upgrade 94399b7f0e10 -> 420cff19541f

ALTER TABLE patient_preferences ADD COLUMN toothpaste_flavor VARCHAR(100);

UPDATE alembic_version SET version_num='420cff19541f' WHERE alembic_version.version_num = '94399b7f0e10';

