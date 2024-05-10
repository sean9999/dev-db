CREATE TABLE datalake_stg.gift_campaigns
(
    campaign_id STRING,
    uid STRING,
    typ STRING,
    gift_id INT64,
    amount INT64,
    visible_at TIMESTAMP,
    expired_at TIMESTAMP,
    ts TIMESTAMP
);

CREATE TABLE datalake_stg.gift_campaigns_errors
(
    campaign_id STRING,
    uid STRING,
    error STRING
);

CREATE TABLE datalake_stg.gift_campaigns_reports
(
    campaign_id STRING,
    start_ts TIMESTAMP,
    end_ts TIMESTAMP,
    success INT64,
    fail INT64,
    total INT64,
    error STRING
);



CREATE TABLE datalake_stg.inbox_promos_history
(
    name STRING,
    campaign_id STRING,
    ts TIMESTAMP,
    job_id STRING,
    status STRING,
    income_parameters STRING
);


CREATE TABLE papertrail.logs
(
    system STRING,
    ts TIMESTAMP,
    level STRING,
    message STRING
);