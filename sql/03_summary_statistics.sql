
-- Purpose: Compare distributions of hospital charges and payments.

SELECT COUNT(*) AS hospital_drg_records,

    -- Gross covered charges
    ROUND(AVG(average_covered_charges), 2) AS mean_charge,
    APPROX_QUANTILES(average_covered_charges, 100) [OFFSET(25)] AS p25_charge,
    APPROX_QUANTILES(average_covered_charges, 100) [OFFSET(50)] AS median_charge,
    APPROX_QUANTILES(average_covered_charges, 100) [OFFSET(75)] AS p75_charge,
    MAX(average_covered_charges) AS max_charge,

    -- Total payments
    ROUND(AVG(average_total_payments), 2) AS mean_total_payment,
    APPROX_QUANTILES(average_total_payments, 100) [OFFSET(25)] AS p25_total_payment,
    APPROX_QUANTILES(average_total_payments, 100) [OFFSET(50)] AS median_total_payment,
    APPROX_QUANTILES(average_total_payments, 100) [OFFSET(75)] AS p75_total_payment,
    MAX(average_total_payments) AS max_total_payment,

    -- Medicare payments
    ROUND(AVG(average_medicare_payments), 2) AS mean_medicare_payment,
    APPROX_QUANTILES(average_medicare_payments, 100) [OFFSET(25)] AS p25_medicare_payment,
    APPROX_QUANTILES(average_medicare_payments, 100) [OFFSET(50)] AS median_medicare_payment,
    APPROX_QUANTILES(average_medicare_payments, 100) [OFFSET(75)] AS p75_medicare_payment,
    MAX(average_medicare_payments) AS max_medicare_payment
    
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`