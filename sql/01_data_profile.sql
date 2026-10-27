
-- Purpose: Understanding the scope and basic structure of the dataset

SELECT

    -- Dataset size 
    COUNT(*) AS total_rows,

    -- Geographic coverage
    COUNT(DISTINCT provider_id) AS unique_hospitals,
    COUNT(DISTINCT provider_state) AS unique_states,
    COUNT(DISTINCT provider_city) AS unique_cities,
    COUNT(DISTINCT hospital_referral_region_description) AS unique_referral_regions,

    -- Clinical coverage
    COUNT(DISTINCT drg_definition) AS unique_drgs

FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`;