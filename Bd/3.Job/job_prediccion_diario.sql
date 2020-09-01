CREATE EVENT galaxia.prediccion_clima_diario
ON SCHEDULE EVERY 1 DAY STARTS '2020-09-01 17:40:00'
DO 
CALL `galaxia`.`prediccion_clima`();
