-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ciberbook
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `tautor`
--

DROP TABLE IF EXISTS `tautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tautor` (
  `codAutor` char(3) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `nacionalidad` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`codAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tautor`
--

LOCK TABLES `tautor` WRITE;
/*!40000 ALTER TABLE `tautor` DISABLE KEYS */;
INSERT INTO `tautor` VALUES ('000','Desconocido','Desconocido',NULL),('A01','Dante','Alighieri','Italiano'),('A02','Rick','Riordan','Estaunidense'),('A03','Louisa May','Alcott','Estaunidense'),('A04','Alex','Mirez',NULL),('A05','Ariana','Godoy',NULL),('A06','Joana','Marcus',NULL),('A07','America','Rodas',NULL),('A08','Rebecca','Yarros',NULL),('A09','Dale','Carnegie',NULL),('A10','Ana','Frank',NULL),('A11','Jeff','Kinney',NULL),('A12','Franz','Fafka',NULL),('A13','Amalia','Andrade',NULL),('A14','Alice','Oseman',NULL),('A15','Oscar','Wilde',NULL),('A16','Stephen','King',NULL),('A17','Edgar Allan','Poe',NULL),('A18','William Peter','Blatty',NULL);
/*!40000 ALTER TABLE `tautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcliente`
--

DROP TABLE IF EXISTS `tcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcliente` (
  `id` int NOT NULL,
  `dni` char(8) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `dirección` varchar(50) DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `clave` varchar(20) DEFAULT (`dni`),
  PRIMARY KEY (`id`),
  CONSTRAINT `tcliente_chk_1` CHECK ((length(`clave`) >= 8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcliente`
--

LOCK TABLES `tcliente` WRITE;
/*!40000 ALTER TABLE `tcliente` DISABLE KEYS */;
INSERT INTO `tcliente` VALUES (1,'99828727','Cristian','Cueva',NULL,'cuevita@gmail.com',NULL,'99828727');
/*!40000 ALTER TABLE `tcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdetallepedido`
--

DROP TABLE IF EXISTS `tdetallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdetallepedido` (
  `num_pedido` char(5) NOT NULL,
  `libro` char(7) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `subtotal` decimal(7,2) DEFAULT NULL,
  `estadoLi` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_pedido`,`libro`),
  KEY `libro` (`libro`),
  CONSTRAINT `tdetallepedido_ibfk_1` FOREIGN KEY (`num_pedido`) REFERENCES `tpedido` (`num_pedido`),
  CONSTRAINT `tdetallepedido_ibfk_2` FOREIGN KEY (`libro`) REFERENCES `tlibro` (`id`),
  CONSTRAINT `tdetallepedido_chk_1` CHECK ((`estadoLi` in (_utf8mb4'APROBADO',_utf8mb4'RECHAZADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdetallepedido`
--

LOCK TABLES `tdetallepedido` WRITE;
/*!40000 ALTER TABLE `tdetallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdetallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdetalleventa`
--

DROP TABLE IF EXISTS `tdetalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdetalleventa` (
  `idDetalle` char(5) NOT NULL,
  `idLibro` char(7) NOT NULL,
  `idVenta` char(5) NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idDetalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdetalleventa`
--

LOCK TABLES `tdetalleventa` WRITE;
/*!40000 ALTER TABLE `tdetalleventa` DISABLE KEYS */;
INSERT INTO `tdetalleventa` VALUES ('D0001','1000001','V0001',1,64.00),('D0002','1000002','V0002',1,70.00),('D0003','1000013','V0002',4,160.00),('D0004','1000007','V0003',1,87.90);
/*!40000 ALTER TABLE `tdetalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teditorial`
--

DROP TABLE IF EXISTS `teditorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teditorial` (
  `idEditorial` char(5) NOT NULL,
  `nomEditorial` varchar(30) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `nomContacto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teditorial`
--

LOCK TABLES `teditorial` WRITE;
/*!40000 ALTER TABLE `teditorial` DISABLE KEYS */;
INSERT INTO `teditorial` VALUES ('10001','Penguin','Av. Arriola 231','989345632','mbecerra@penguin.com','María Beccerra'),('10002','Grupo Editorial Gato Negro','Av. Las flores 1131','911365692','gnlparriola@penguin.com','Lucas Parriola'),('10003','Grupo Clásico','Av. Grau 48','999444333','lhuaman@clasico.com','Luna Huaman');
/*!40000 ALTER TABLE `teditorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgenero`
--

DROP TABLE IF EXISTS `tgenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tgenero` (
  `codGenero` char(3) NOT NULL,
  `nomGenero` varchar(20) NOT NULL,
  PRIMARY KEY (`codGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgenero`
--

LOCK TABLES `tgenero` WRITE;
/*!40000 ALTER TABLE `tgenero` DISABLE KEYS */;
INSERT INTO `tgenero` VALUES ('C01','Romance'),('C02','Misterio'),('C03','Terror'),('C04','Drama'),('C05','Acción'),('C06','Ciencia Ficción'),('C07','Infantil'),('C08','Adulto'),('C09','Historico'),('C10','Clasico'),('C11','Comedia'),('C12','Fantasia'),('C13','Superación'),('C14','Meditación'),('C15','Narrativa personal');
/*!40000 ALTER TABLE `tgenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlibro`
--

DROP TABLE IF EXISTS `tlibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlibro` (
  `id` char(7) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `autor` char(3) DEFAULT 'NN',
  `isbn` varchar(20) NOT NULL,
  `anioPublicacion` int NOT NULL,
  `genero` char(3) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `stock` int DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(50) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genero` (`genero`),
  KEY `autor` (`autor`),
  CONSTRAINT `tlibro_ibfk_1` FOREIGN KEY (`genero`) REFERENCES `tgenero` (`codGenero`),
  CONSTRAINT `tlibro_ibfk_2` FOREIGN KEY (`autor`) REFERENCES `tautor` (`codAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlibro`
--

LOCK TABLES `tlibro` WRITE;
/*!40000 ALTER TABLE `tlibro` DISABLE KEYS */;
INSERT INTO `tlibro` VALUES ('1000001','La divina comedia','A01','9788497945318',1475,'C10',50.00,30,'La Divina Comedia, escrita por Dante Alighieri en el siglo XIV, es un poema épico que narra el viaje del protagonista, Dante, a través del Infierno, el Purgatorio y el Paraíso. Guiado por el poeta romano Virgilio y su amada Beatriz, Dante experimenta las consecuencias de sus acciones y busca la redención. En el Infierno, encuentra a personajes históricos y mitológicos sufriendo castigos proporcionales a sus pecados. En el Purgatorio, los pecadores buscan la purificación antes de ascender al Paraíso. Finalmente, en el Paraíso, Dante alcanza la visión de Dios. La obra es una alegoría rica en simbolismo, explorando temas teológicos y morales mientras reflexiona sobre la naturaleza humana y la búsqueda espiritual.','divina_comedia.jpg',2),('1000002','Percy Jackson y el ladrón del rayo. Libro 1','A02','9786124497001',2005,'C06',70.00,17,'En \"Percy Jackson y el ladrón del rayo\", Percy descubre que es un semidiós y enfrenta acusaciones injustas sobre el robo del rayo de Zeus. Junto a sus amigos, Grover y Annabeth, emprende un viaje para limpiar su nombre. A lo largo de la historia, enfrenta criaturas mitológicas, resuelve enigmas y descubre sus propios poderes. La trama combina mitología griega con el mundo moderno de manera emocionante y divertida. Percy se sumerge en el inframundo y se enfrenta a desafíos para demostrar su inocencia y evitar una guerra entre los dioses. La novela establece el tono para futuras aventuras de Percy Jackson, fusionando mitología, acción y humor de manera cautivadora.','percy_jackon_ladron_libros_1.jpg',1),('1000009','Superretorcidos. Diario de Greg. 17','A11','9786125054357',2022,'C07',45.00,78,'Greg Heffley está a punto de descubrir que el salto a la fama no es un camino de rosas. Cuando decide irse de gira con el grupo de rock de su hermano Rodrick, los Celebros Retorcidos, Greg no sabe dónde se está metiendo. Pero pronto comprobará que acostarse muy tarde, actuar sin cobrar, pelearse con los colegas y estar en quiebra forma parte de la vida rocanrolera. ¿Podrá Greg ayudar a los Celebros Retorcidos a convertirse en la leyenda que creen ser? ¿O acabarán haciendo el ridículo una y otra vez?','diario_greg.jpg',1),('1000012','Heartstopper','A14','9789877478792',2022,'C04',60.00,45,'¡Bienvenidos al mundo de Heartstopper! ¡Este es el libro que todo fan necesita! Descubre el universo de Nick y Charlie a todo color y material exclusivo de la mano de Alice Oseman. Disfruta de un año entero de momentos de Heartstopper.','heartstopper.jpg',2),('1000013','El Retrato de Dorian Gray','A15','9788491052340',2021,'C10',40.00,89,'\"El retrato de Dorian Gray\" es una novela de Oscar Wilde que narra la historia de Dorian Gray, un joven atractivo que vende su alma para conservar su juventud eterna. Su retrato envejece y refleja sus pecados, mientras él disfruta de una vida inmoral. La obra explora temas como la corrupción, la decadencia y la obsesión con la belleza, cuestionando la moralidad y las consecuencias de una vida sin límites. Wilde utiliza la historia para reflexionar sobre la superficialidad de la sociedad victoriana y la dualidad entre la apariencia y la realidad.','retrato_dorian_gray.jpg',1),('1000014','Cuentos de Oscar Wilde','A15','9788408239420',2021,'C10',50.00,34,'Los cuentos de Oscar Wilde son una colección de relatos ingeniosos y satíricos que exploran la naturaleza humana y la sociedad victoriana. Historias como \"El ruiseñor y la rosa\" y \"El príncipe feliz\" presentan a personajes encantadores enfrentándose a dilemas morales y sacrificios desinteresados. Wilde utiliza su aguda crítica social y humor para reflexionar sobre temas como el amor, la vanidad y la hipocresía. Estos cuentos destacan la maestría de Wilde para combinar la fantasía con la profundidad psicológica, dejando una huella duradera en la literatura.','cuentos_oscar_wilde.jpg',2),('1000015','It','A16','84-9759-379-0',2017,'C03',45.00,34,'¿Quién o Qué Mutila y Mata a los Niños de un Pequeño Pueblo Norteamericano?¿Por Qué Llega Cíclicamente el Horror a Derry en Forma de un Payaso Siniestro que Va Sembrando la Destrucción a Su Paso? Esto Es lo que Se Proponen Averiguar los Protagonistas de Esta Novela. Tras Veintisiete Años de Tranquilidad y Lejanía, una Antigua Promesa Infantil Les Hace Volver al Lugar en el que Vivieron Su Infancia y Juventud como una Terrible Pesadilla. Regresan a Derry para Enfrentarse con Su Pasado y Enterrar Definitivamente la Amenaza que los Amargó Durante Su Niñez. Saben que Pueden Morir, Pero Son Conscientes de que No Conocerán la Paz Hasta que Aquella Cosa Sea Destruida para Siempre. It Es una de las Novelas Más Ambiciosas de Stephen King, con la que Ha Logrado Perfeccionar de un Modo Muy Personal las Claves del Género de Terror. La Crítica Ha Dicho. . . «Insuperable. »La Vanguardia','it.jpg',1),('1000016','Cuentos extraordinarios','A17','9788497944724',1845,'C03',9.00,78,'Escritor romántico y precursor de simbolistas, decadentistas y esteticistas, fue, al tiempo que un gran poeta, un verdadero iniciador. Aún hoy géneros literarios tan consagrados como la narrativa fantástica y de ciencia ficción, la narrativa policíaca o la novela de aventuras llevan su impronta inconfundible. Fascinado por la muerte y por todas las formas del terror, dio lo mejor de su talento en sus cuentos de misterio, manifestando además un vibrante interés por lo ridículo y absurdo.','cuentos_extraordinarios.jpg',1),('1000017','El visitante','A16','9786124463617',2017,'C03',9.00,109,'Un crimen impensable y una investigación a contrarreloj de la mano del maestro de la narrativa de suspense. Un niño de once años ha sido brutalmente asesinado. Un niño de once años ha sido brutalmente violado y asesinado. Todas las pruebas apuntan a uno de los ciudadanos más queridos de Flint City: Terry Maitland, entrenador en la liga infantil, profesor de literatura, marido ejemplar y padre de dos niñas. El detective Ralph Anderson ordena su detención. Maitland tiene una coartada firme que demuestra que estuvo en otra ciudad cuando se cometió el crimen, pero las pruebas de ADN encontradas en el lugar de los hechos confirman que es culpable. Ante la justicia y la opinión pública Terry Maitland es un asesino y el caso está resuelto. Pero el detective Anderson no está satisfecho. Maitland parece un buen tipo, un ciudadano ejemplar, ¿acaso tiene dos caras? Y ¿cómo es posible que estuviera en dos sitios a la vez? La respuesta, como no podría ser de otra forma saliendo de la pluma de Stephen King, te hará desear no haber preguntado.\r\n\r\n','el_visitante.jpg',1),('1000018','El exorcista','A18','9788413145303',2017,'C03',9.00,167,'Si la medicina y la psiquiatría no ayudan, ¿puede el exorcismo ser la respuesta? Ha llegado el momento para el implacable rito que enfrenta a exorcista y demonio en duelo mortal. El exorcista es una de las obras de ficción más sobrecogedoras y terroríficas jamás escritas. Basada en un hecho real, ocurrido en la década de los cuarenta del siglo pasado, la protagonista es una niña de apenas once años que sufre terribles transformaciones, sobre todo en su comportamiento. Ni médicos ni científicos ni psicólogos son capaces de hallar la causa de tal estado y paulatinamente todo se va decantando hacia la hipótesis de que la niña está poseída por el demonio. Publicada en 1971, El exorcista es una de las novelas más sobrecogedoras y terroríficas jamás escritas, y ha dado origen a una saga cinematográfica y una serie de televisión de culto.\r\n','el_exorcista.jpg',1),('1000019','The Happy Prince and Other Stories','A15','9786124463617',1936,'C10',26.90,14,'Disfruta la colección de Oscar Wilde','the_happy_prince_and_other_stories.jpg',1),('1000020','Relatos goticos','A17','9788494411656',2015,'C03',9.00,89,'Con los Cuentos de Terror y Misterio que Componen Esta Obra, Allan Poe Renovó el Relato Gótico Hasta Elevarlo a la Categoría de Obra Maestra. El Dark Romanticismo de Poe Comparte con el Trascendentalismo Estadounidense Su Actitud de Búsqueda Espiritual de la Trascendencia de la Realidad Aparente del Mundo y la Vida, Pero Rechaza Su Excesivo Optimismo, Su Confianza en el Ser Humano, Su Creencia en la Sabia Divinidad de la Naturaleza y Su Fe en la Reforma Social. Por el Contrario, Muestra una Postura Fatalista Ante la Vida y Presenta el Mundo a Través de una Luz Siniestra que lo Vuelve Oscuro, Decadente, Misterioso y Encubridor del Mal Infernal. La Fascinación de Poe por el Terror, lo Macabro y lo Sobrenatural Se Encarna en Individuos Proclives al Pecado y la Autodestrucción, en Imágenes del Mal Antropomórficas, como Diablos, Fantasmas y Vampiros, y en Temas como la Venganza, la Culpa y la Auto Punición, el Sadismo, la Influencia del Alcohol, el Poder Sobrenatural de la Voluntad, o Todos los Relacionados con la Muerte, como la Descomposición de Cadáveres, el Entierro Aún en Vida o la Reanimación de los Muertos.','relatos_goticos.jpg',1);
/*!40000 ALTER TABLE `tlibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpedido`
--

DROP TABLE IF EXISTS `tpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpedido` (
  `num_pedido` char(5) NOT NULL,
  `editorial` char(5) NOT NULL,
  `cantidad` int NOT NULL,
  `total` decimal(7,2) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_pedido`),
  KEY `editorial` (`editorial`),
  CONSTRAINT `tpedido_ibfk_1` FOREIGN KEY (`editorial`) REFERENCES `teditorial` (`idEditorial`),
  CONSTRAINT `tpedido_chk_1` CHECK ((`estado` in (_utf8mb4'PENDIENTE',_utf8mb4'ENVIADO',_utf8mb4'EN ESPERA',_utf8mb4'RECIBIDO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpedido`
--

LOCK TABLES `tpedido` WRITE;
/*!40000 ALTER TABLE `tpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuario`
--

DROP TABLE IF EXISTS `tusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tusuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `contrasena` varchar(20) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `dni` char(8) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `tusuario_chk_1` CHECK ((length(`contrasena`) > 5)),
  CONSTRAINT `tusuario_chk_2` CHECK ((`estado` in (_utf8mb4'ACTIVO',_utf8mb4'INACTIVO')))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuario`
--

LOCK TABLES `tusuario` WRITE;
/*!40000 ALTER TABLE `tusuario` DISABLE KEYS */;
INSERT INTO `tusuario` VALUES (1,'Fiorella','Vivar','992288334','fvivar@ciberbook.com','bookies','ADMINISTRADOR','95637370','ACTIVO'),(2,'Luna','Olivara','923453643','lunaOlivara@gmail.com','libros53','USER','40320276','ACTIVO'),(3,'Luis','Comunica','986437873','luis@gmail.com','book45','USER','50099934','ACTIVO'),(4,'Fiorella','Vivar','992288434','fvivarr@ciberbook.com','bookies','ADMINISTRADOR','95637374','ACTIVO');
/*!40000 ALTER TABLE `tusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tventa`
--

DROP TABLE IF EXISTS `tventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tventa` (
  `idVenta` char(5) NOT NULL,
  `fechaReg` date NOT NULL,
  `cantTotal` int NOT NULL,
  `montoTotal` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tventa`
--

LOCK TABLES `tventa` WRITE;
/*!40000 ALTER TABLE `tventa` DISABLE KEYS */;
INSERT INTO `tventa` VALUES ('V0001','2023-05-12',2,134.00),('V0002','2023-05-20',4,160.00),('V0003','2023-06-24',1,87.90);
/*!40000 ALTER TABLE `tventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-24 22:05:10
