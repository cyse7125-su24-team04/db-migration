CREATE SCHEMA IF NOT EXISTS cve;

CREATE TABLE cve.cves (
    id SERIAL PRIMARY KEY,
    cve_id VARCHAR(255) UNIQUE NOT NULL,
    data JSONB NOT NULL,
    version INTEGER,
    UNIQUE(cve_id, version)
);

CREATE INDEX idx_cve_records_data ON cve.cves USING gin (data);
