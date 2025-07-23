{% set target_makes = ['Toyota','Ford','Chevrolet','Honda','Nissan'] %}

SELECT
    DDATE, 
    SALESPERSON,
    {% for make in target_makes %}SUM(CASE WHEN CARMAKE = '{{ make }}' THEN TOTALSALE ELSE 0 END) AS {{ make | lower }}{% if not loop.last %},
    {% endif %}{% endfor %}
FROM {{ ref("psg_monthly_sales_make") }}
GROUP BY DDATE, SALESPERSON