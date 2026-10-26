# CMS Hospital Inpatient Billing Variation Analysis
An analysis of CMS Medicare inpatient and outpatient data in BigQuery, using supervised and unsupervised learning in Python to benchmark hospital pricing. 

## Overview
Hospital pricing is notoriously complex and varied. The amount a hospital lists as a charge for a procedure can differ substantially from the amount paid by Medicare, and pricing patterns across providers, geographic markets, and service categories add further complexity to the mix. 
This project aims to measure that variation fairly, comparing markups against hospitals performing the same procedures. 

## Research Question
How much of a hospital's procedure pricing is explained by regional characteristics, ownership, hospital type, and volume? 

## Data
Source: CMS Medicare public dataset in Google BigQuery (`bigquery-public-data.cms_medicare`). 
