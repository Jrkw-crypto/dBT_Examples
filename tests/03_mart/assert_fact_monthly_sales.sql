-- Este test PASA si esta consulta devuelve CERO filas.
-- Selecciona cualquier registro de la tabla de hechos donde las métricas clave sean negativas.

SELECT
    DDATE,
    ID_SALESPERSON,
    ID_CARMAKE, 
    TOTALSALE, 
    TOTALCOM
FROM  {{ ref('fact_monthly_sales') }}
WHERE
    TOTALSALE < 0 OR TOTALCOM < 0