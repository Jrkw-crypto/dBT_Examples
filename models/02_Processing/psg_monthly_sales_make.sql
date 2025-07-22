{{
    config( 
        materialized='table',
        tags=['02_processing', 'sales', 'carmake']
    )
}}
SELECT
    DATE_TRUNC( 'MONTH', DDATE) AS DDATE, 
    SALESPERSON, 
    CARMAKE,
    SUM(SALEPRICE - COMNEA) AS TOTALSALE, 
    SUM(COMNEA) AS TOTALCOM
FROM {{ ref("stg_sales_data_20p") }} 
GROUP BY 
    DATE_TRUNC('MONTH', DDATE),
    SALESPERSON,
    CARMAKE    