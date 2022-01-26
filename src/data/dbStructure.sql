-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: indiewave
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Acción'),(2,'Arcade'),(3,'Aventura'),(4,'Deportes'),(5,'Estrategia');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_UNIQUE` (`image`),
  KEY `fk_images_products_idx` (`product_id`),
  CONSTRAINT `fk_images_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (3,1,'/img/products/Furii-imgs/ImgFurii1643215103613.jpg'),(4,1,'/img/products/Furii-imgs/ImgFurii1643215103739.jpg'),(5,1,'/img/products/Furii-imgs/ImgFurii1643215103851.jpg'),(6,1,'/img/products/Furii-imgs/ImgFurii1643215103860.jpg'),(7,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271266.jpg'),(8,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271271.jpg'),(9,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271274.jpg'),(10,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271280.jpg'),(11,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271316.jpg'),(12,3,'/img/products/Celeste-imgs/ImgCeleste1643215419926.jpg'),(13,3,'/img/products/Celeste-imgs/ImgCeleste1643215419928.jpg'),(14,3,'/img/products/Celeste-imgs/ImgCeleste1643215419929.jpg'),(15,4,'/img/products/Stardew Valley-imgs/ImgStardew Valley1643215522849.jpg'),(16,4,'/img/products/Stardew Valley-imgs/ImgStardew Valley1643215522850.png'),(17,4,'/img/products/Stardew Valley-imgs/ImgStardew Valley1643215522852.jpg'),(18,4,'/img/products/Stardew Valley-imgs/ImgStardew Valley1643215522874.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'Linux'),(2,'macOS'),(3,'Windows');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `developer` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `release_date` date NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `min_requirements` text NOT NULL,
  `rec_requirements` text NOT NULL,
  `description` text NOT NULL,
  `genre_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_genre_idx` (`genre_id`),
  CONSTRAINT `fk_product_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Furii','Mynte','mtissington0@uiuc.edu','2021-05-25',40,'/img/products/Furii-imgs/LogoFurii1643215103609.jpg','SO: Windows 7, 8, 10\r\nProcesador: Intel Core i3 / AMD Phenom II X4\r\nMemoria: 4 GB de RAM\r\nGráficos: GeForce GTX 650 / AMD R7 250 (1GB VRAM min) (for 720p 60FPS)\r\nAlmacenamiento: 5 GB de espacio disponible\r\nNotas adicionales: Controller','SO: Windows 7, 8, 10\r\nProcesador: Intel Core i3 / AMD Phenom II X4\r\nMemoria: 4 GB de RAM\r\nGráficos: GeForce GTX 650 / AMD R7 250 (1GB VRAM min) (for 720p 60FPS)\r\nAlmacenamiento: 5 GB de espacio disponible\r\nNotas adicionales: Controller','Te capturaron. ¿Ves lo que te han hecho? El carcelero es la clave. Mátalo y serás libre.\r\n\r\nLucha por tu libertad en este juego ultrafluido de lucha frenética con espadas y disparos con dos mandos.\r\n\r\nDiseño de jefes de Takashi Okazaki. Banda sonora original de Carpenter Brut y Danger, entre otros.',1),(2,'Cuphead','Gevee','kotto1@amazonaws.com','2020-03-14',17,'/img/products/Cuphead-imgs/LogoCuphead1643215271246.png','SO: Windows 7\r\nProcesador: Intel Core2 Duo E8400, 3.0GHz or AMD Athlon 64 X2 6000+, 3.0GHz or higher\r\nMemoria: 3 GB de RAM\r\nGráficos: Geforce 9600 GT or AMD HD 3870 512MB or higher\r\nDirectX: Versión 11\r\nAlmacenamiento: 4 GB de espacio disponible','SO: Windows 7\r\nProcesador: Intel Core2 Duo E8400, 3.0GHz or AMD Athlon 64 X2 6000+, 3.0GHz or higher\r\nMemoria: 3 GB de RAM\r\nGráficos: Geforce 9600 GT or AMD HD 3870 512MB or higher\r\nDirectX: Versión 11\r\nAlmacenamiento: 4 GB de espacio disponible','Cuphead es un juego de acción clásico estilo \"dispara y corre\" que se centra en combates contra el jefe. Inspirado en los dibujos animados de los años 30, los aspectos visual y sonoro están diseñados con esmero empleando las mismas técnicas de la época',1),(3,'Celeste','Jabbertype','mgwalter2@histats.com','2021-06-04',37,'/img/products/Celeste-imgs/LogoCeleste1643215419921.jpg','SO: Windows 7 or newer\r\nProcesador: Intel Core i3 M380\r\nMemoria: 2 GB de RAM\r\nGráficos: Intel HD 4000\r\nDirectX: Versión 10\r\nAlmacenamiento: 1200 MB de espacio disponible','SO: Windows 7 or newer\r\nProcesador: Intel Core i3 M380\r\nMemoria: 2 GB de RAM\r\nGráficos: Intel HD 4000\r\nDirectX: Versión 10\r\nAlmacenamiento: 1200 MB de espacio disponible','Ayuda a Madeline a sobrevivir a los demonios de su interior en su viaje hasta la cima de la montaña Celeste, en este ajustadísimo plataforma, obra de los creadores de TowerFall. Enfréntate a cientos de desafíos diseñados a mano, devela retorcidos secretos y, y reconstruye el misterio de la montaña.',3),(4,'Stardew Valley','Yambee','ugeockle3@mapy.cz','2021-10-23',38,'/img/products/Stardew Valley-imgs/LogoStardew Valley1643215549622.png','SO: Windows Vista or greater\r\nProcesador: 2 Ghz\r\nMemoria: 2 GB de RAM\r\nGráficos: 256 mb video memory, shader model 3.0+\r\nDirectX: Versión 10\r\nAlmacenamiento: 500 MB de espacio disponible','SO: Windows Vista or greater\r\nProcesador: 2 Ghz\r\nMemoria: 2 GB de RAM\r\nGráficos: 256 mb video memory, shader model 3.0+\r\nDirectX: Versión 10\r\nAlmacenamiento: 500 MB de espacio disponible','Acabas de heredar la vieja parcela agrícola de tu abuelo de Stardew Valley. Decides partir hacia una nueva vida con unas herramientas usadas y algunas monedas.',3),(5,'Joyan','Twitternation','jvasquez4@msu.edu','2020-01-28',49,NULL,'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis','dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien','et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend',2),(6,'Babette','Quinu','bjellman5@mtv.com','2020-08-15',18,NULL,'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus','rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at','parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean',1),(7,'Tracy','Vitz','tzuppa6@odnoklassniki.ru','2021-04-03',32,NULL,'magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien','mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula','neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan',5),(8,'Magdalene','Babbleblab','mgeffcock7@microsoft.com','2020-06-06',19,NULL,'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo','vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy','nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae',3),(9,'Grata','Rhyloo','gdallinder8@weibo.com','2021-08-07',41,NULL,'volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo','id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate','feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl',2),(10,'Erena','Roombo','eellens9@wix.com','2020-03-04',41,NULL,'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor','odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper','sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim',4),(11,'Madalena','Skynoodle','mkalderona@msn.com','2020-05-15',44,NULL,'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio','quisque porta volutpat erat quisque erat eros viverra eget congue eget semper','consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede',4),(12,'Siegfried','Ooba','sdicksb@ftc.gov','2020-02-05',20,NULL,'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec','potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa','praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi',2),(13,'Gates','Eamia','gdiemerc@bigcartel.com','2021-04-18',32,NULL,'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet','sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor','pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel',5),(14,'Torrence','Dabfeed','tmcgeaghd@ifeng.com','2021-09-12',10,NULL,'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in','est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante','odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam',4),(15,'Cornie','Riffpedia','cklimpte@techcrunch.com','2021-06-23',37,NULL,'justo eu massa donec dapibus duis at velit eu est congue','a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut','elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis',5),(16,'Brennan','Voomm','bstanesbyf@printfriendly.com','2021-03-15',29,NULL,'id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec','molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci','pede ac diam cras pellentesque volutpat dui maecenas tristique est',4),(17,'Carlynn','Zoomdog','celsomg@mapquest.com','2020-07-10',11,NULL,'sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus','convallis nunc proin at turpis a pede posuere nonummy integer','morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus',3),(18,'Saleem','Devify','sbubearh@ebay.co.uk','2020-11-09',30,NULL,'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis','semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis','vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel',4),(19,'Dora','Avaveo','dplampini@t-online.de','2021-07-09',34,NULL,'vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis','cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue','nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa',2),(20,'Lanette','Twitterlist','ldowningj@microsoft.com','2020-11-17',11,NULL,'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante','ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi','eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus',5),(21,'Elnora','Wordify','ekleislek@imgur.com','2021-05-05',35,NULL,'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus','amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum','lectus vestibulum quam sapien varius ut blandit non interdum in',2),(22,'Ana','Browsebug','alesterl@oracle.com','2020-11-05',39,NULL,'erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla','faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam','non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce',3),(23,'Ingelbert','Blogtags','ipietsmam@issuu.com','2021-06-18',20,NULL,'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue','ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl','pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in',3),(24,'Clevie','Wordpedia','cfobidgen@simplemachines.org','2021-07-14',49,NULL,'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer','volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie','in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium',4),(25,'Barnett','Babbleset','btometo@addtoany.com','2021-08-25',41,NULL,'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede','erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus','sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum',1),(26,'Carrie','Centizu','cfawthropp@yandex.ru','2021-11-06',24,NULL,'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet','nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat','hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum',3),(27,'Nannie','Twimbo','nthowesq@de.vu','2021-05-14',37,NULL,'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu','risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc','platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem',2),(28,'Vivianna','Thoughtbeat','vvandijkr@yahoo.com','2020-11-21',36,NULL,'in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt','nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis','at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis',4),(29,'Maible','Browsebug','mbeausangs@scientificamerican.com','2021-09-28',40,NULL,'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat','eget rutrum at lorem integer tincidunt ante vel ipsum praesent','id mauris vulputate elementum nullam varius nulla facilisi cras non velit',4),(30,'Lynne','Youspan','lhebront@issuu.com','2021-04-19',45,NULL,'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien','ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae','imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam',2),(31,'Danya','Demivee','dhodgesu@typepad.com','2021-01-31',23,NULL,'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus','odio cras mi pede malesuada in imperdiet et commodo vulputate','dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit',5),(32,'Willis','Centidel','wgoltonv@comsenz.com','2021-11-06',17,NULL,'felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus','vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec','dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut',4),(33,'Ashly','Edgewire','aoreganw@bluehost.com','2020-02-18',17,NULL,'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam','id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed','ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi',1),(34,'Damon','Blogtag','dguiderax@who.int','2020-07-09',17,NULL,'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget','eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a','sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem',4),(35,'Walton','Rhyzio','wtrumbley@alexa.com','2021-02-24',20,NULL,'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst','eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi','in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan',5),(36,'Vonni','Aivee','vmumbyz@google.it','2021-11-18',33,NULL,'ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut','ut blandit non interdum in ante vestibulum ante ipsum primis in','vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc',1),(37,'Kariotta','Chatterbridge','khanretty10@globo.com','2020-11-29',27,NULL,'lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed','amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor','pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus',1),(38,'Mariejeanne','Skinte','mritchley11@japanpost.jp','2021-04-28',35,NULL,'sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in','id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia','tempor convallis nulla neque libero convallis eget eleifend luctus ultricies',5),(39,'Delores','Quamba','dcorder12@java.com','2020-11-12',28,NULL,'et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere','vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel','leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet',2),(40,'Gretchen','Skyble','ghusk13@scribd.com','2021-10-25',48,NULL,'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper','duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla','est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium',3),(41,'Car','Zava','cbartalucci14@globo.com','2020-11-27',40,NULL,'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue','quam a odio in hac habitasse platea dictumst maecenas ut massa quis','nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus',1),(42,'Clerkclaude','Buzzshare','ctoll15@macromedia.com','2021-10-27',14,NULL,'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam','bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac','nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat',1),(43,'Janeta','Ainyx','jdurant16@webs.com','2020-06-14',46,NULL,'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia','scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor','quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id',4),(44,'Monica','Demimbu','mcornewell17@ucsd.edu','2019-12-09',13,NULL,'ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus','at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam','arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque',1),(45,'Phylis','Skimia','pgodwin18@360.cn','2020-11-28',47,NULL,'etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia','augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit','felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec',4),(46,'Krisha','Plajo','krichmont19@vinaora.com','2020-11-06',44,NULL,'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum','pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem','auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum',2),(47,'Codie','Skibox','croelofsen1a@about.com','2020-11-26',26,NULL,'tortor quis turpis sed ante vivamus tortor duis mattis egestas metus','aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit','fusce lacus purus aliquet at feugiat non pretium quis lectus',3),(48,'Carma','Eire','cdeakins1b@github.com','2020-12-23',35,NULL,'dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat','elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla','blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer',4),(49,'Kassi','Cogibox','kkinzett1c@blog.com','2020-03-31',18,NULL,'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique','morbi non quam nec dui luctus rutrum nulla tellus in','libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc',1),(50,'Dale','Yoveo','dpaxman1d@cdbaby.com','2021-05-02',13,NULL,'magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis','felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod','odio consequat varius integer ac leo pellentesque ultrices mattis odio',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_platforms`
--

DROP TABLE IF EXISTS `products_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `platform_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pp_product_idx` (`product_id`),
  KEY `fk_pp_platform_idx` (`platform_id`),
  CONSTRAINT `fk_pp_platform` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_platforms`
--

LOCK TABLES `products_platforms` WRITE;
/*!40000 ALTER TABLE `products_platforms` DISABLE KEYS */;
INSERT INTO `products_platforms` VALUES (8,5,1),(9,6,1),(10,7,1),(11,8,1),(12,9,1),(13,10,1),(14,11,1),(15,12,1),(16,13,1),(17,14,1),(18,15,1),(19,16,1),(20,17,1),(21,18,1),(22,19,1),(23,20,1),(24,21,1),(25,22,1),(26,23,1),(27,24,1),(28,25,1),(29,26,1),(30,27,1),(31,28,1),(32,29,1),(33,30,1),(34,31,1),(35,32,1),(36,33,1),(37,34,1),(38,35,1),(39,36,1),(40,37,1),(41,38,1),(42,39,1),(43,40,1),(44,41,1),(45,42,1),(46,43,1),(47,44,1),(48,45,1),(49,46,1),(50,47,1),(51,48,1),(52,49,1),(53,50,1),(54,1,3),(55,2,3),(56,3,1),(57,3,2),(58,3,3),(61,4,2),(62,4,3);
/*!40000 ALTER TABLE `products_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_products`
--

DROP TABLE IF EXISTS `shopping_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sp_shoppingcart_idx` (`shopping_cart_id`),
  KEY `fk_sp_product_idx` (`product_id`),
  CONSTRAINT `fk_sp_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sp_shoppingcart` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shoppingcart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_products`
--

LOCK TABLES `shopping_products` WRITE;
/*!40000 ALTER TABLE `shopping_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (1,22),(2,23),(3,24),(4,26),(5,27),(6,28),(7,29);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `profile_pic` varchar(100) NOT NULL DEFAULT '/img/users/default.png',
  `password` varchar(100) NOT NULL,
  `admin` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'cgeistbeck0','Candide','Glimepiride','ctregent0@prlog.org','/img/users/default.png','MYdjK6',0),(2,'tseefus1','Thebault','Fibrocane Relief','tcheers1@spiegel.de','/img/users/default.png','gHsqDPaUv',0),(3,'dogorman2','Deni','Oxybutynin Chloride','dbulgen2@mapquest.com','/img/users/default.png','mGy1KH',0),(4,'ewofenden3','Eloisa','Muscle Cramp Complex','ekrysztowczyk3@spiegel.de','/img/users/default.png','Z4vhKvdqfXuW',0),(5,'rboase4','Richart','Opana','radshad4@sun.com','/img/users/default.png','DuC8FGBbFV',0),(6,'kthrift5','Kayla','Amoxicillin','kburgen5@addtoany.com','/img/users/default.png','jd0xHN',0),(7,'tmonkhouse6','Tessie','Divalproex Sodium','tgillespie6@friendfeed.com','/img/users/default.png','NN72UM1okqF',0),(8,'manstey7','Maisey','Ceftriaxone','mozintsev7@washington.edu','/img/users/default.png','wBDzsbBdB',0),(9,'jsallenger8','Jacquenette','ISOPROPYL RUBBING ALCOHOL','jbosence8@eepurl.com','/img/users/default.png','0TPoUryn',0),(10,'sharrisson9','Suzy','Lithium Carbonate','sfontes9@guardian.co.uk','/img/users/default.png','qGjApV7',0),(11,'cdiamanta','Chet','Lamivudine','cdenyukina@biglobe.ne.jp','/img/users/default.png','spkPpcWk',0),(12,'brizzellob','Bernete','CIALIS','bklimukb@ocn.ne.jp','/img/users/default.png','3WLwqu',0),(13,'viddyc','Vanessa','Metronidazole','vpriddenc@skype.com','/img/users/default.png','t2PcNkjd',0),(14,'bhawkswelld','Barnaby','MDSOLARSCIENCES','bgleaved@npr.org','/img/users/default.png','VP661r8C',0),(15,'missarde','Michael','Lycoris rubus whitening','mirvinee@dedecms.com','/img/users/default.png','VeCupAcqjfQg',0),(16,'cbartosinskif','Car','Dandelion','cshortcliffef@ovh.net','/img/users/default.png','VehO8D56cYp',0),(17,'sdefraineg','Stephi','Levetiracetam','smalinsong@si.edu','/img/users/default.png','39n42Zox',0),(18,'bbrimilcombeh','Beth','Levomefolate Calcium Acetylcysteine and Mecobalami','bmasselh@about.com','/img/users/default.png','U7jLaP5',0),(19,'sthornei','Salmon','Gabapentin','smoninii@senate.gov','/img/users/default.png','CL3NUW6Q',0),(20,'sdutnellj','Shaine','U-max Beauty','smussillij@apple.com','/img/users/default.png','QdjyEhDhXco',0),(21,'Admin','Admin','Istrador','admin@istrador.com','/img/users/admin@istrador.com.png','$2a$10$J8Hr0QYWyanjYyxWmExW/OYpS.vwzyJ3Mu9MeK9G.vt4RUsV3jRfS',1),(23,'Nuevo','Nuevo','Usuario','nuevouser@nuevo.com','/img/users/nuevouser@nuevo.com.png','$2a$10$o6h6D',0),(24,'Prueba','Prueba','Dor','prueba@dor.com','/img/users/prueba@dor.com.jpg','$2a$10$AgFa1',0),(26,'D10Selunico','Diego Armando','Maradona','eldiego@maradona.com','/img/users/default.png','$2a$10$qS8D7',0),(27,'FacuLeche','Facundo','Blanco','facublanco@leche.com','/img/users/default.png','$2a$10$fFPM5',0),(28,'Prueba2','PruebaMistica','Mistica','prueba@store.com','/img/users/default.png','hola1234',0),(29,'Pedrolala','Pedro','Lala','cola@raul.com','/img/users/default.png','$2a$10$OBovH',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_products(library)`
--

DROP TABLE IF EXISTS `users_products(library)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_products(library)` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_up_product_idx` (`product_id`),
  KEY `fk_up_user_idx` (`user_id`),
  CONSTRAINT `fk_up_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_up_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_products(library)`
--

LOCK TABLES `users_products(library)` WRITE;
/*!40000 ALTER TABLE `users_products(library)` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_products(library)` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-26 14:02:19
