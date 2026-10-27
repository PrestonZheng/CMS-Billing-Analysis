
-- Purpose: Check missing values and anomalous records

SELECT 

    -- Missing fields
    COUNTIF(provider_id IS NULL) AS missing_provider_ids,
    COUNTIF(provider_name IS NULL) AS missing_provider_names,
    COUNTIF(provider_state IS NULL) AS missing_states,
    COUNTIF(drg_definition IS NULL) AS missing_drgs,

    -- Missing analytical info 
    COUNTIF(total_discharges IS NULL) AS missing_discharges,
    COUNTIF(average_covered_charges IS NULL) AS missing_charges,
    COUNTIF(average_total_payments IS NULL) AS missing_total_payments,
    COUNTIF(average_medicare_payments IS NULL) AS missing_medicare_payments,

    -- Basic nonzero checks
    COUNTIF(total_discharges <= 0) AS nonpositive_discharges,
    COUNTIF(average_covered_charges <= 0) AS nonpositive_charges,
    COUNTIF(average_total_payments <= 0) AS nonpositive_total_payments,
    COUNTIF(average_medicare_payments <= 0) AS nonpositive_medicare_payments

FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`;


-- Check duplicate hospital-DRG combinations.
SELECT provider_id, drg_definition, COUNT(*) AS record_count
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
GROUP BY provider_id, drg_definition
HAVING COUNT(*) > 1
ORDER BY record_count DESC;