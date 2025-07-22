{{ config(tags=['dash_sales_bi']) }}

SELECT 
    dimcm.ID_CARMAKE,
    dimsp.ID_SALESPERSON,
    psdm.DDATE,
    psdm.TOTALSALE,
    psdm.TOTALCOM
FROM {{ ref("psg_monthly_sales_make")}} AS psdm 
LEFT JOIN {{ ref("dim_carmake")}} AS dimcm ON psdm.CARMAKE = dimcm.CARMAKE 
LEFT JOIN {{ ref("dim_salesperson")}} AS dimsp ON psdm.SALESPERSON = dimsp.SALESPERSON 
