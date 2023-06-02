/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS tabla_01;
CREATE TABLE tabla_01 (
    letra STRING, 
    fecha DATE, 
    num INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE tabla_01;


DROP TABLE IF EXISTS tabla_02;
CREATE TABLE tabla_02 AS 
SELECT 
letra, 
COUNT(1) AS conteo
FROM tabla_01 GROUP BY letra ORDER BY letra; 

INSERT OVERWRITE LOCAL DIRECTORY './output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ','


SELECT * FROM tabla_02;