-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: galaxia
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'galaxia'
--
/*!50003 DROP FUNCTION IF EXISTS `getAlineados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAlineados`(l_dia INT , tipo INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
  DECLARE l_idPlaneta INTEGER DEFAULT 0;
  DECLARE l_coordenadaX FLOAT DEFAULT 0;
  DECLARE l_coordenadaY FLOAT DEFAULT 0;
  DECLARE l_finalizar INTEGER DEFAULT 0;
  DECLARE l_punto1    FLOAT DEFAULT 0;
  DECLARE l_punto2    INTEGER DEFAULT 0;
  DECLARE l_ax    FLOAT DEFAULT 0;
  DECLARE l_ay    FLOAT DEFAULT 0;
  DECLARE l_bx    FLOAT DEFAULT 0;
  DECLARE l_by    FLOAT DEFAULT 0; 
  DECLARE l_cx    FLOAT DEFAULT 0;
  DECLARE l_cy    FLOAT DEFAULT 0;
  DECLARE l_ba    FLOAT DEFAULT 0;
  DECLARE l_cb    FLOAT DEFAULT 0;
  DECLARE l_decimal   FLOAT DEFAULT 10;
  DECLARE l_retorno BOOLEAN DEFAULT false ;

IF tipo = 1 THEN 
   SELECT coordenadaX,coordenadaY 
    INTO l_ax , l_ay
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'BETASOIDE';
  
  SELECT coordenadaX,coordenadaY 
    INTO l_bx , l_by
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'VULCANO';
    
 SELECT coordenadaX,coordenadaY 
    INTO l_cx , l_cy
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'FERENGI';  
END IF ;

IF tipo = 2 THEN 

   SET  l_ax = 0;
   SET  l_ay = 0;
   
   
  SELECT coordenadaX,coordenadaY 
    INTO l_bx , l_by
   FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'FERENGI';  
  
  SELECT coordenadaX,coordenadaY 
    INTO l_cx , l_cy
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'BETASOIDE';
    
END IF ;

IF tipo = 3 THEN 

   SET  l_ax = 0;
   SET  l_ay = 0;
  
  SELECT coordenadaX,coordenadaY 
    INTO l_bx , l_by
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'VULCANO';
    
  SELECT coordenadaX,coordenadaY 
    INTO l_cx , l_cy
   FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'FERENGI';  

END IF ;
    
    SET l_ba =  (l_by-l_ay);
    SET l_cb =  (l_cy-l_by);
    SET l_punto1 = (l_bx-l_ax) / l_ba;
    SET l_punto2 = (l_cx-l_bx) / l_cb;
    SET l_punto1 = round(l_punto1*l_decimal)/l_decimal;
    SET l_punto2 = round(l_punto2*l_decimal)/l_decimal;
    
    IF l_punto1 = l_punto2 THEN
       SET l_retorno = true;
    END IF;
    
RETURN l_retorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCoordenadaX` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCoordenadaX`(dia INT,velocidad INT, radio INT, direccion INT) RETURNS float
    DETERMINISTIC
BEGIN
RETURN ( radio * cos(velocidad * dia * direccion));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCoordenadaY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCoordenadaY`(dia INT,velocidad INT, radio INT, direccion INT) RETURNS float
    DETERMINISTIC
BEGIN

RETURN ( radio * sin(velocidad * dia * direccion)); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getOrientacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getOrientacion`( l_ax FLOAT,l_ay FLOAT, l_bx FLOAT, l_by FLOAT, l_cx FLOAT ,l_cy FLOAT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE l_abc    FLOAT DEFAULT 0.0;
  DECLARE l_retorno FLOAT DEFAULT 0.0 ;
  
   SET l_abc = ((l_ax-l_cx)*(l_by-l_cy)) - ((l_ay-l_cy)*(l_bx-l_cx));
   IF l_abc >= 0.0 THEN 
	  SET l_retorno = 1;
   ELSE
     SET l_retorno = -1;
   END IF;

RETURN l_retorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getOrientacionTriangulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getOrientacionTriangulo`(l_dia INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

  DECLARE l_idPlaneta INTEGER DEFAULT 0;
  DECLARE l_coordenadaX FLOAT DEFAULT 0;
  DECLARE l_coordenadaY FLOAT DEFAULT 0;
  DECLARE l_finalizar INTEGER DEFAULT 0;
  DECLARE l_punto1    FLOAT DEFAULT 0;
  DECLARE l_punto2    INTEGER DEFAULT 0;
  DECLARE l_ax    FLOAT DEFAULT 0;
  DECLARE l_ay    FLOAT DEFAULT 0;
  DECLARE l_bx    FLOAT DEFAULT 0;
  DECLARE l_by    FLOAT DEFAULT 0; 
  DECLARE l_cx    FLOAT DEFAULT 0;
  DECLARE l_cy    FLOAT DEFAULT 0;
  DECLARE l_px    FLOAT DEFAULT 0;
  DECLARE l_py    FLOAT DEFAULT 0;
  DECLARE l_abc    FLOAT DEFAULT 0;
  DECLARE l_abp    FLOAT DEFAULT 0;
  DECLARE l_bcp   FLOAT DEFAULT 0;
  DECLARE l_cap   FLOAT DEFAULT 0;
  DECLARE l_perimetro  FLOAT DEFAULT 10;
  DECLARE l_retorno BOOLEAN DEFAULT false ;

  SELECT coordenadaX,coordenadaY 
    INTO l_ax , l_ay
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'BETASOIDE';
  
  SELECT coordenadaX,coordenadaY 
    INTO l_bx , l_by
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'VULCANO';
    
 SELECT coordenadaX,coordenadaY 
    INTO l_cx , l_cy
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'FERENGI';  

   SET l_abc = `galaxia`.`getOrientacion`(l_ax, l_ay, l_bx, l_by, l_cx, l_cy);
   SET l_abp = `galaxia`.`getOrientacion`(l_ax, l_ay, l_bx, l_by, l_px, l_py);
   SET l_bcp = `galaxia`.`getOrientacion`(l_bx, l_by, l_cx, l_cy, l_px, l_py);
   SET l_cap = `galaxia`.`getOrientacion`(l_cx, l_cy, l_ax, l_ay, l_px, l_py);
   
   IF l_abc = 1 && l_abp =1 && l_bcp = 1 && l_cap =1 THEN
      SET l_retorno = true;
   ELSEIF  l_abc = 1 && l_abp =1 && l_bcp = 1 && l_cap =1  THEN
     SET l_retorno = true;
   ELSE 
		SET l_retorno = false;
   END IF;
   
RETURN l_retorno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getTrianguloPerimetro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTrianguloPerimetro`(l_dia INT) RETURNS float
    DETERMINISTIC
BEGIN
 DECLARE l_idPlaneta INTEGER DEFAULT 0;
  DECLARE l_coordenadaX FLOAT DEFAULT 0;
  DECLARE l_coordenadaY FLOAT DEFAULT 0;
  DECLARE l_finalizar INTEGER DEFAULT 0;
  DECLARE l_punto1    FLOAT DEFAULT 0;
  DECLARE l_punto2    INTEGER DEFAULT 0;
  DECLARE l_ax    FLOAT DEFAULT 0;
  DECLARE l_ay    FLOAT DEFAULT 0;
  DECLARE l_bx    FLOAT DEFAULT 0;
  DECLARE l_by    FLOAT DEFAULT 0; 
  DECLARE l_cx    FLOAT DEFAULT 0;
  DECLARE l_cy    FLOAT DEFAULT 0;
  DECLARE l_ab    FLOAT DEFAULT 0;
  DECLARE l_bc    FLOAT DEFAULT 0;
  DECLARE l_ca    FLOAT DEFAULT 0;
  DECLARE l_perimetro  FLOAT DEFAULT 10;
  DECLARE l_retorno BOOLEAN DEFAULT false ;

  SELECT coordenadaX,coordenadaY 
    INTO l_ax , l_ay
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'BETASOIDE';
  
  SELECT coordenadaX,coordenadaY 
    INTO l_bx , l_by
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'VULCANO';
    
 SELECT coordenadaX,coordenadaY 
    INTO l_cx , l_cy
    FROM  galaxia.prediccion pr 
    inner join galaxia.planeta pl on pr.idplaneta = pl.id
    where pr.dia = l_dia
    and pl.nombre = 'FERENGI';  
    
  SET l_ab =  sqrt(power((l_ax -l_bx),2) + power((l_ay-l_by),2) )  ;
  SET l_bc =  sqrt(power((l_bx -l_cx),2) + power((l_by-l_cy),2) )  ;
  SET l_ca =  sqrt(power((l_cx -l_ax),2) + power((l_cy-l_ay),2) )  ;
  SET l_perimetro = l_ab + l_bc + l_ca ;
  
RETURN l_perimetro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculo_coordenadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculo_coordenadas`(l_dia INT)
BEGIN

  DECLARE l_idplaneta INT unsigned DEFAULT 0;  
  DECLARE l_velocidad INT unsigned DEFAULT 0;  
  DECLARE l_radio INT unsigned DEFAULT 0;
  DECLARE l_direccion INT ; 
  DECLARE l_coordenadaX float;
  DECLARE l_coordenadaY float;
  DECLARE l_finalizar INTEGER DEFAULT 0;
  #se trae la informacion de los planetas
  DECLARE planetas_cursor CURSOR FOR SELECT id,radio,velocidad,direccion FROM  galaxia.planeta ; 
  #Declaración de un manejador de error tipo NOT FOUND
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET l_finalizar = 1;

  OPEN planetas_cursor;
  loop1: LOOP
  FETCH planetas_cursor INTO l_idplaneta,l_radio,l_velocidad,l_direccion;
  #Se sale del bucle cuando no hay elementos por recorrer
   IF l_finalizar = 1 THEN
    LEAVE loop1;
   END IF;   
   #SELECT idplaneta,radiol,velocidadl,direccionl;
  #calcula coordenada X
  SET l_coordenadaX = (SELECT getCoordenadaX(l_dia ,l_velocidad, l_radio, l_direccion)) ;
  #calcula coordenada Y
  SET l_coordenadaY= (SELECT getCoordenadaY(l_dia ,l_velocidad, l_radio, l_direccion)) ;
  INSERT INTO `galaxia`.`prediccion` (`idplaneta`, `coordenadaX`, `coordenadaY`,`precicion`,`dia`)
  VALUES ( l_idplaneta,l_coordenadaX ,l_coordenadaY,1,l_dia);
  commit;   
  END LOOP loop1;
CLOSE planetas_cursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prediccion_clima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prediccion_clima`()
BEGIN

  DECLARE l_dia INT default 0;
  DECLARE l_perimetro float default 0;
  
  SELECT  COALESCE(MAX(dia),0)
    INTO l_dia
    FROM galaxia.clima;
  
  SET l_dia = l_dia+1;
  CALL `galaxia`.`calculo_coordenadas`(l_dia);
  
  IF `galaxia`.`getAlineados`(l_dia, 1) THEN 
       IF `galaxia`.`getAlineados`(l_dia, 2) && `galaxia`.`getAlineados`(l_dia, 3) THEN 
           INSERT INTO galaxia.clima (dia,prediccion) VALUES(l_dia,'Sequia');
       ELSE
            INSERT INTO galaxia.clima (dia,prediccion)  VALUES(l_dia,'Optimo');
       END IF; 
  ELSE
      /*Los planetas forma un triangulo y el esta en el triangulo*/
      IF `galaxia`.`getOrientacionTriangulo`(l_dia) THEN
         SET l_perimetro=`galaxia`.`getTrianguloPerimetro`(l_dia);
         INSERT INTO galaxia.clima (dia,prediccion,perimetro) VALUES(l_dia,'Llueve',l_perimetro);
      /*Los planetas forman un tringulo y el so esta fuera del trinfulo*/
      ELSE
         INSERT INTO galaxia.clima (dia,prediccion) VALUES(l_dia,'No llueve');
      END IF;   
  END IF;
  
 commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prediccion_DiezAnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prediccion_DiezAnos`()
BEGIN

DECLARE l_finalizar INTEGER DEFAULT 0;

loop1: LOOP
   IF l_finalizar = 3650 THEN
    LEAVE loop1;
   END IF; 
   CALL `galaxia`.`prediccion_clima`();

  SET l_finalizar = l_finalizar+1;
END LOOP loop1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-01 10:18:29
