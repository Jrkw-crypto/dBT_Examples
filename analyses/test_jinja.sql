SELECT
    *,
    '{{ target.name }}' AS environment
FROM {{ ref("stg_sales_data_20p") }} 
{% if target.name == 'default' %}
LIMIT 10
{% endif %}
