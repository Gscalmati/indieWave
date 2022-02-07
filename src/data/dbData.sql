-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: indiewave_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

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
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Acción'),(2,'Arcade'),(3,'Aventura'),(4,'Deportes'),(5,'Estrategia');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (3,1,'/img/products/Furii-imgs/ImgFurii1643215103613.jpg'),(4,1,'/img/products/Furii-imgs/ImgFurii1643215103739.jpg'),(5,1,'/img/products/Furii-imgs/ImgFurii1643215103851.jpg'),(6,1,'/img/products/Furii-imgs/ImgFurii1643215103860.jpg'),(7,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271266.jpg'),(8,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271271.jpg'),(9,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271274.jpg'),(10,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271280.jpg'),(11,2,'/img/products/Cuphead-imgs/ImgCuphead1643215271316.jpg'),(12,3,'/img/products/Celeste-imgs/ImgCeleste1643215419926.jpg'),(13,3,'/img/products/Celeste-imgs/ImgCeleste1643215419928.jpg'),(14,3,'/img/products/Celeste-imgs/ImgCeleste1643215419929.jpg'),(15,4,'/img/products/StardewValley-imgs/ImgStardewValley1644190121625.jpg'),(16,4,'/img/products/StardewValley-imgs/ImgStardewValley1644190121643.jpg'),(17,4,'/img/products/StardewValley-imgs/ImgStardewValley1644190121644.jpg'),(19,42,'/img/products/Hades-imgs/ImgHades1643763378563.jpg'),(20,42,'/img/products/Hades-imgs/ImgHades1643763378565.jpg'),(21,42,'/img/products/Hades-imgs/ImgHades1643763378590.jpg'),(22,42,'/img/products/Hades-imgs/ImgHades1643763378591.jpg'),(23,36,'/img/products/Hotline miami-imgs/ImgHotline miami1643765494500.jpg'),(24,36,'/img/products/Hotline miami-imgs/ImgHotline miami1643765494501.jpg'),(25,36,'/img/products/Hotline miami-imgs/ImgHotline miami1643765494502.jpg'),(27,26,'/img/products/Among us-imgs/ImgAmong us1643767066942.jpg'),(28,26,'/img/products/Among us-imgs/ImgAmong us1643767066964.jpg'),(30,26,'/img/products/Among us-imgs/ImgAmong us1643767974557.jpg'),(31,26,'/img/products/Among us-imgs/ImgAmong us1643767974560.jpg'),(32,26,'/img/products/Among us-imgs/ImgAmong us1643767974561.jpg'),(33,36,'/img/products/Hotline miami-imgs/ImgHotline miami1643768062065.jpg'),(34,36,'/img/products/Hotline miami-imgs/ImgHotline miami1643768062088.jpg'),(35,42,'/img/products/Hades-imgs/ImgHades1643768180464.jpg'),(36,5,'/img/products/Bloody Spell-imgs/ImgBloody Spell1643946032217.jpg'),(37,5,'/img/products/Bloody Spell-imgs/ImgBloody Spell1643946032219.jpg'),(38,5,'/img/products/Bloody Spell-imgs/ImgBloody Spell1643946032221.jpg'),(39,5,'/img/products/Bloody Spell-imgs/ImgBloody Spell1643946032222.jpg'),(40,5,'/img/products/Bloody Spell-imgs/ImgBloody Spell1643946032230.jpg'),(41,6,'/img/products/The Waylanders-imgs/ImgThe Waylanders1643946475193.jpg'),(42,6,'/img/products/The Waylanders-imgs/ImgThe Waylanders1643946475194.jpg'),(43,6,'/img/products/The Waylanders-imgs/ImgThe Waylanders1643946475212.jpg'),(44,6,'/img/products/The Waylanders-imgs/ImgThe Waylanders1643946475213.jpg'),(45,6,'/img/products/The Waylanders-imgs/ImgThe Waylanders1643946475214.jpg'),(46,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947139746.jpg'),(48,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947243841.jpg'),(49,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947243842.jpg'),(50,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947243844.jpg'),(51,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947243861.jpg'),(52,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947332670.jpg'),(53,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947393953.jpg'),(54,7,'/img/products/Escape Simulator-imgs/ImgEscape Simulator1643947434772.jpg'),(55,8,'/img/products/Project Zomboid-imgs/ImgProject Zomboid1643947678164.jpg'),(56,8,'/img/products/Project Zomboid-imgs/ImgProject Zomboid1643947678165.jpg'),(57,8,'/img/products/Project Zomboid-imgs/ImgProject Zomboid1643947678166.jpg'),(58,8,'/img/products/Project Zomboid-imgs/ImgProject Zomboid1643947678167.jpg'),(59,8,'/img/products/Project Zomboid-imgs/ImgProject Zomboid1643947678170.jpg'),(60,9,'/img/products/Terraria-imgs/ImgTerraria1643948746303.jpg'),(61,9,'/img/products/Terraria-imgs/ImgTerraria1643948746304.jpg'),(62,9,'/img/products/Terraria-imgs/ImgTerraria1643948746305.jpg'),(63,9,'/img/products/Terraria-imgs/ImgTerraria1643948746306.jpg'),(64,9,'/img/products/Terraria-imgs/ImgTerraria1643948746307.jpg'),(65,10,'/img/products/Erena-imgs/ImgErena1643948949144.jpg'),(66,10,'/img/products/Erena-imgs/ImgErena1643948949170.jpg'),(67,10,'/img/products/Erena-imgs/ImgErena1643948949171.jpg'),(68,10,'/img/products/Erena-imgs/ImgErena1643948949172.jpg'),(69,10,'/img/products/Erena-imgs/ImgErena1643948949173.jpg'),(70,1,'/img/products/Furii-imgs/ImgFurii1643949101276.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'Linux'),(2,'macOS'),(3,'Windows');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Furii','Mynte','mtissington0@uiuc.edu','2021-05-25',40,'/img/products/Furii-imgs/LogoFurii1643215103609.jpg','SO: Windows 7, 8, 10\r\nProcesador: Intel Core i3 / AMD Phenom II X4\r\nMemoria: 4 GB de RAM\r\nGráficos: GeForce GTX 650 / AMD R7 250 (1GB VRAM min) (for 720p 60FPS)\r\nAlmacenamiento: 5 GB de espacio disponible\r\nNotas adicionales: Controller','SO: Windows 7, 8, 10\r\nProcesador: Intel Core i3 / AMD Phenom II X4\r\nMemoria: 4 GB de RAM\r\nGráficos: GeForce GTX 650 / AMD R7 250 (1GB VRAM min) (for 720p 60FPS)\r\nAlmacenamiento: 5 GB de espacio disponible\r\nNotas adicionales: Controller','Te capturaron. ¿Ves lo que te han hecho? El carcelero es la clave. Mátalo y serás libre.\r\n\r\nLucha por tu libertad en este juego ultrafluido de lucha frenética con espadas y disparos con dos mandos.\r\n\r\nDiseño de jefes de Takashi Okazaki. Banda sonora original de Carpenter Brut y Danger, entre otros.',1),(2,'Cuphead','Gevee','kotto1@amazonaws.com','2020-03-14',17,'/img/products/Cuphead-imgs/LogoCuphead1643215271246.png','SO: Windows 7\r\nProcesador: Intel Core2 Duo E8400, 3.0GHz or AMD Athlon 64 X2 6000+, 3.0GHz or higher\r\nMemoria: 3 GB de RAM\r\nGráficos: Geforce 9600 GT or AMD HD 3870 512MB or higher\r\nDirectX: Versión 11\r\nAlmacenamiento: 4 GB de espacio disponible','SO: Windows 7\r\nProcesador: Intel Core2 Duo E8400, 3.0GHz or AMD Athlon 64 X2 6000+, 3.0GHz or higher\r\nMemoria: 3 GB de RAM\r\nGráficos: Geforce 9600 GT or AMD HD 3870 512MB or higher\r\nDirectX: Versión 11\r\nAlmacenamiento: 4 GB de espacio disponible','Cuphead es un juego de acción clásico estilo \"dispara y corre\" que se centra en combates contra el jefe. Inspirado en los dibujos animados de los años 30, los aspectos visual y sonoro están diseñados con esmero empleando las mismas técnicas de la época',1),(3,'Celeste','Jabbertype','mgwalter2@histats.com','2021-06-04',37,'/img/products/Celeste-imgs/LogoCeleste1643215419921.jpg','SO: Windows 7 or newer\r\nProcesador: Intel Core i3 M380\r\nMemoria: 2 GB de RAM\r\nGráficos: Intel HD 4000\r\nDirectX: Versión 10\r\nAlmacenamiento: 1200 MB de espacio disponible','SO: Windows 7 or newer\r\nProcesador: Intel Core i3 M380\r\nMemoria: 2 GB de RAM\r\nGráficos: Intel HD 4000\r\nDirectX: Versión 10\r\nAlmacenamiento: 1200 MB de espacio disponible','Ayuda a Madeline a sobrevivir a los demonios de su interior en su viaje hasta la cima de la montaña Celeste, en este ajustadísimo plataforma, obra de los creadores de TowerFall. Enfréntate a cientos de desafíos diseñados a mano, devela retorcidos secretos y, y reconstruye el misterio de la montaña.',3),(4,'Stardew Valley','Yambee','ugeockle3@mapy.cz','2021-10-23',38,'/img/products/StardewValley-imgs/LogoStardewValley1644190121621.png','SO: Windows Vista or greater\r\nProcesador: 2 Ghz\r\nMemoria: 2 GB de RAM\r\nGráficos: 256 mb video memory, shader model 3.0+\r\nDirectX: Versión 10\r\nAlmacenamiento: 500 MB de espacio disponible','SO: Windows Vista or greater\r\nProcesador: 2 Ghz\r\nMemoria: 2 GB de RAM\r\nGráficos: 256 mb video memory, shader model 3.0+\r\nDirectX: Versión 10\r\nAlmacenamiento: 500 MB de espacio disponible','Acabas de heredar la vieja parcela agrícola de tu abuelo de Stardew Valley. Decides partir hacia una nueva vida con unas herramientas usadas y algunas monedas.',3),(5,'Bloody Spell','Bloody Spell','jvasquez4@msu.edu','2020-01-28',49,'/img/products/Bloody Spell-imgs/LogoBloody Spell1643946032215.jpg','SO: Windows 7+\r\nProcesador: Intel i3 Processor\r\nMemoria: 4 GB de RAM\r\nGráficos: Nvidia GeForce GTX 560\r\nDirectX: Versión 10\r\nAlmacenamiento: 20 GB de espacio disponible','SO: Windows 7+\r\nProcesador: Intel i7 Processor\r\nMemoria: 8 GB de RAM\r\nGráficos: Nvidia GeForce GTX 770\r\nDirectX: Versión 11\r\nAlmacenamiento: 20 GB de espacio disponible','This is a martial arts action role-playing game. The core of the game is battle-oriented, and it combines many fighting elements. If you are a player who pursues blood and is brave enough to challenge the limits, it will definitely inspire your adrenaline and bring you the best combat experience.',3),(6,'The Waylanders','The Waylanders','bjellman5@mtv.com','2020-08-15',18,'/img/products/The Waylanders-imgs/LogoThe Waylanders1643946475191.jpg','SO: 64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10\r\nProcesador: Intel CPU Core i5-7600K 3.8Ghz / Ryzen 7 1700\r\nMemoria: 8 GB de RAM\r\nGráficos: Nvidia GTX 1060\r\nAlmacenamiento: 40 GB de espacio disponible','SO: 64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10\r\nProcesador: Intel CPU Core i5-7600K 3.8Ghz / Ryzen 7 1700\r\nMemoria: 8 GB de RAM\r\nGráficos: Nvidia GTX 1060\r\nAlmacenamiento: 40 GB de espacio disponible','Escapa de las cadenas del destino en este RPG ambientado los mitos y leyendas celtas de Galicia e Irlanda. Disfruta de emocionantes aventuras junto a companions mortales y aliados inmortales mientras exploras el mundo de The Waylanders.',1),(7,'Escape Simulator','Escape Simulator','tzuppa6@odnoklassniki.ru','2021-04-03',32,'/img/products/Escape Simulator-imgs/LogoEscape Simulator1643947139745.jpg','SO: Windows 7 (SP1+)\r\nProcesador: X64 architecture with SSE2 instruction set support\r\nMemoria: 2 GB de RAM\r\nGráficos: DX10-capable GPU\r\nAlmacenamiento: 14 GB de espacio disponible','SO: Windows 7 (SP1+)\r\nProcesador: X64 architecture with SSE2 instruction set support\r\nMemoria: 2 GB de RAM\r\nGráficos: DX10-capable GPU\r\nAlmacenamiento: 14 GB de espacio disponible','First-person puzzler you can play solo or in an online co-op (best with 2-3 players, but playable with more). Explore a set of highly interactive escape rooms. Move furniture, pick up and examine everything, smash pots and break locks! Supports community rooms through the level editor.',5),(8,'Project Zomboid','Project Zomboid','mgeffcock7@microsoft.com','2020-06-06',19,'/img/products/Project Zomboid-imgs/LogoProject Zomboid1643947678163.jpg','OS: Windows 10, 64 Bit\r\n64bit OS required\r\nProcessor: Intel 2.77GHz Quad-core\r\nMemory: 8Gb Ram\r\nHard Disk Space: 5gig\r\nVideo Card: Dedicated graphics card with 2 GB of RAM minimum, OpenGL 2.1 and GLSL 1.2 support (generally 2012 or newer)\r\nSound: FMOD compatible sound card','OS: Windows 10, 64 Bit\r\n64bit OS required\r\nProcessor: Intel 2.77GHz Quad-core\r\nMemory: 8Gb Ram\r\nHard Disk Space: 5gig\r\nVideo Card: Dedicated graphics card with 2 GB of RAM minimum, OpenGL 2.1 and GLSL 1.2 support (generally 2012 or newer)\r\nSound: FMOD compatible sound card','Project Zomboid is the ultimate in zombie survival. Alone or in MP: you loot, build, craft, fight, farm and fish in a struggle to survive. A hardcore RPG skillset, a vast map, massively customisable sandbox and a cute tutorial raccoon await the unwary. So how will you die? All it takes is a bite..',3),(9,'Terraria','Terraria','gdallinder8@weibo.com','2021-08-07',41,'/img/products/Terraria-imgs/LogoTerraria1643948746287.jpg','SO: Windows XP / Vista / 7\r\nProcesador: 1.6 GHz\r\nMemoria: 512 MB de RAM\r\nDisco Duro: 200 MB de espacio libre\r\nGráficos: Shader Model 1.1 con 128 MB de VRAM\r\nDirectX®: 9.0c o posterior','OS: Windows 7, 8/8.1, 10\r\nProcessor: Dual Core 3.0 Ghz\r\nMemory: 4GB\r\nHard Disk Space: 200MB\r\nVideo Card: 256mb Video Memory, capable of Shader Model 2.0+\r\nDirectX®: 9.0c or Greater','¡Cava, lucha, explora, construye! Con este juego de aventuras repleto de acción nada es imposible. ¡Pack de Cuatro también disponible!',2),(10,'Erena','Roombo','eellens9@wix.com','2020-03-04',41,'/img/products/Erena-imgs/LogoErena1643948949142.jpg','Requiere un procesador y un sistema operativo de 64 bits\r\nSO: Windows 7 SP1+\r\nProcesador: SSE2 instruction set support\r\nGráficos: Graphics card with DX10 (shader model 4.0) capabilities.\r\nAlmacenamiento: 1 GB de espacio disponible','Requiere un procesador y un sistema operativo de 64 bits','Unpacking es un juego relajante de lógica acerca de la sensación familiar de sacar pertenencias de cajas para colocarlas en un nuevo hogar. Mitad juego de bloques, mitad juego de decoración, podrás crear habitaciones agradables mientras descubres pistas de la vida que estás desempacando.',4),(11,'Chengain','Skynoodle','mkalderona@msn.com','2020-05-15',44,'/img/products/Chengain-imgs/LogoChengain1643770341739.png','lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio','quisque porta volutpat erat quisque erat eros viverra eget congue eget semper','consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede',4),(12,'Siegfried','Ooba','sdicksb@ftc.gov','2020-02-05',20,'/img/products/Siegfried-imgs/LogoSiegfried1643770353613.png','nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec','potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa','praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi',2),(13,'Gates','Eamia','gdiemerc@bigcartel.com','2021-04-18',32,'/img/products/Gates-imgs/LogoGates1643770363331.png','vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet','sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor','pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel',5),(14,'Torrence','Dabfeed','tmcgeaghd@ifeng.com','2021-09-12',10,'/img/products/Torrence-imgs/LogoTorrence1643770375283.png','id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in','est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante','odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam',4),(15,'Cornie','Riffpedia','cklimpte@techcrunch.com','2021-06-23',37,'/img/products/Cornie-imgs/LogoCornie1643770385747.png','justo eu massa donec dapibus duis at velit eu est congue','a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut','elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis',5),(16,'Brennan','Voomm','bstanesbyf@printfriendly.com','2021-03-15',29,'/img/products/Brennan-imgs/LogoBrennan1643770397814.png','id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec','molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci','pede ac diam cras pellentesque volutpat dui maecenas tristique est',4),(17,'Carlynn','Zoomdog','celsomg@mapquest.com','2020-07-10',11,'/img/products/Carlynn-imgs/LogoCarlynn1643770406625.png','sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus','convallis nunc proin at turpis a pede posuere nonummy integer','morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus',3),(18,'Saleem','Devify','sbubearh@ebay.co.uk','2020-11-09',30,'/img/products/Saleem-imgs/LogoSaleem1643770416313.png','natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis','semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis','vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel',4),(19,'Dorax','Avaveo','dplampini@t-online.de','2021-07-09',34,'/img/products/Dorax-imgs/LogoDorax1643770433681.png','vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis','cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue','nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa',2),(20,'Lanette','Twitterlist','ldowningj@microsoft.com','2020-11-17',11,'/img/products/Lanette-imgs/LogoLanette1643762170348.png','platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante','ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi','eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus',5),(21,'Elnora','Wordify','ekleislek@imgur.com','2021-05-05',35,'/img/products/Elnora-imgs/LogoElnora1643948987858.png','potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus','amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum','lectus vestibulum quam sapien varius ut blandit non interdum in',2),(22,'Anaxs','Browsebug','alesterl@oracle.com','2020-11-05',39,'/img/products/Anaxs-imgs/LogoAnaxs1643762254223.png','erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla','faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam','non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce',3),(23,'Ingelbert','Blogtags','ipietsmam@issuu.com','2021-06-18',20,'/img/products/Ingelbert-imgs/LogoIngelbert1643762273737.png','tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue','ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl','pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in',3),(24,'Clevie','Wordpedia','cfobidgen@simplemachines.org','2021-07-14',49,'/img/products/Clevie-imgs/LogoClevie1643762286749.png','ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer','volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie','in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium',4),(25,'Barnett','Babbleset','btometo@addtoany.com','2021-08-25',41,'/img/products/Barnett-imgs/LogoBarnett1643762317366.png','leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede','erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus','sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum',1),(26,'Among us','Centizu','among@us.com','2021-11-06',24,'/img/products/Among us-imgs/LogoAmong us1643767066940.jpg','SO: Windows 7 SP1+\r\nProcesador: SSE2 instruction set support\r\nMemoria: 1 GB de RAM\r\nDirectX: Versión 10\r\nAlmacenamiento: 250 MB de espacio disponible','SO: Windows 7 SP1+\r\nProcesador: SSE2 instruction set support\r\nMemoria: 1 GB de RAM\r\nDirectX: Versión 10\r\nAlmacenamiento: 250 MB de espacio disponible','Un juego de socialización local o en línea de trabajo en equipo y traición para 4 a 15 jugadores...',5),(27,'Nannie','Twimbo','nthowesq@de.vu','2021-05-14',37,'/img/products/Nannie-imgs/LogoNannie1643762349828.png','amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu','risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc','platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem',2),(28,'Vivianna','Thoughtbeat','vvandijkr@yahoo.com','2020-11-21',36,'/img/products/Vivianna-imgs/LogoVivianna1643762363582.png','in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt','nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis','at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis',4),(29,'Maible','Browsebug','mbeausangs@scientificamerican.com','2021-09-28',40,'/img/products/Maible-imgs/LogoMaible1643762373419.png','ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat','eget rutrum at lorem integer tincidunt ante vel ipsum praesent','id mauris vulputate elementum nullam varius nulla facilisi cras non velit',4),(30,'Lynne','Youspan','lhebront@issuu.com','2021-04-19',45,'/img/products/Lynne-imgs/LogoLynne1643762382353.png','et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien','ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae','imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam',2),(31,'Danya','Demivee','dhodgesu@typepad.com','2021-01-31',23,'/img/products/Danya-imgs/LogoDanya1643762402170.png','neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus','odio cras mi pede malesuada in imperdiet et commodo vulputate','dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit',5),(32,'Willis','Centidel','wgoltonv@comsenz.com','2021-11-06',17,'/img/products/Willis-imgs/LogoWillis1643762416114.png','felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus','vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec','dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut',4),(33,'Ashly','Edgewire','aoreganw@bluehost.com','2020-02-18',17,'/img/products/Ashly-imgs/LogoAshly1643762430931.png','sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam','id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed','ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi',1),(34,'Damon','Blogtag','dguiderax@who.int','2020-07-09',17,'/img/products/Damon-imgs/LogoDamon1643762442764.png','id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget','eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a','sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem',4),(35,'Walton','Rhyzio','wtrumbley@alexa.com','2021-02-24',20,'/img/products/Walton-imgs/LogoWalton1643762456889.png','justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst','eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi','in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan',5),(36,'Hotline miami','Aivee','vmumbyz@google.it','2021-11-18',33,'/img/products/Hotline miami-imgs/LogoHotline miami1643766284739.jpg','OS:Microsoft® Windows® XP / Vista / 7\r\nProcessor:1.2GHz processor\r\nMemory:512 MB RAM\r\nGraphics:DirectX 8-compatible graphics card with at least 32MB of video memory\r\nDirectX®:9.0c\r\nHard Drive:250 MB HD space\r\nAdditional:Microsoft Xbox 360 Controller or Direct Input compatible controller, OpenGL 2.x or better highly recommended.','OS:Microsoft® Windows® XP / Vista / 7\r\nProcessor:1.4GHz processor or faster\r\nMemory:1 GB RAM\r\nGraphics:DirectX 8-compatible graphics card with at least 32MB of video memory\r\nDirectX®:9.0c\r\nHard Drive:250 MB HD space\r\nAdditional:Microsoft Xbox 360 Controller or Direct Input compatible controller','Hotline Miami es un juego de acción de alto octanaje que rebosa brutalidad es estado puro, violentos tiroteos y demoledores combates cuerpo a cuerpo.',1),(37,'Kariotta','Chatterbridge','khanretty10@globo.com','2020-11-29',27,'/img/products/Kariotta-imgs/LogoKariotta1643762486816.png','lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed','amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor','pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus',1),(38,'Mariejeanne','Skinte','mritchley11@japanpost.jp','2021-04-28',35,'/img/products/Mariejeanne-imgs/LogoMariejeanne1643762496918.png','sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in','id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia','tempor convallis nulla neque libero convallis eget eleifend luctus ultricies',5),(39,'Delores','Quamba','dcorder12@java.com','2020-11-12',28,'/img/products/Delores-imgs/LogoDelores1643762505618.png','et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere','vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel','leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet',2),(40,'Gretchen','Skyble','ghusk13@scribd.com','2021-10-25',48,'/img/products/Gretchen-imgs/LogoGretchen1643762517234.png','rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper','duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla','est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium',3),(41,'Wild Card','Zava','cbartalucci14@globo.com','2020-11-27',40,'/img/products/Wild Card-imgs/LogoWild Card1643762652564.png','ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue','quam a odio in hac habitasse platea dictumst maecenas ut massa quis','nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus',1),(42,'Hades','Buzzshare','ctoll15@macromedia.com','2021-10-27',14,'/img/products/Hades-imgs/LogoHades1643764416624.png','SO: Windows 7 SP1\r\nProcesador: Dual Core 3.0 GHz+\r\nMemoria: 8 GB de RAM\r\nGráficos: 2GB VRAM / DirectX 10+ support\r\nAlmacenamiento: 20 GB de espacio disponible','SO: Windows 7 SP1\r\nProcesador: Dual Core 2.4 GHz\r\nMemoria: 4 GB de RAM\r\nGráficos: 1GB VRAM / DirectX 10+ support\r\nAlmacenamiento: 15 GB de espacio disponible','Desafía al dios de los muertos y protagoniza una salvaje fuga del Inframundo en este juego de exploración de mazmorras de los creadores de Bastion, Transistor y Pyre.',1),(43,'Janeta','Ainyx','jdurant16@webs.com','2020-06-14',46,'/img/products/Janeta-imgs/LogoJaneta1643770016937.png','rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia','scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor','quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id',4),(44,'Monica','Demimbu','mcornewell17@ucsd.edu','2019-12-09',13,'/img/products/Monica-imgs/LogoMonica1643770033064.png','ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus','at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam','arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque',1),(45,'Phylis','Skimia','pgodwin18@360.cn','2020-11-28',47,'/img/products/Phylis-imgs/LogoPhylis1643770047431.png','etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia','augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit','felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec',4),(46,'Krisha','Plajo','krichmont19@vinaora.com','2020-11-06',44,'/img/products/Krisha-imgs/LogoKrisha1643770058004.png','sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum','pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem','auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum',2),(47,'Codie','Skibox','croelofsen1a@about.com','2020-11-26',26,'/img/products/Codie-imgs/LogoCodie1643770069658.png','tortor quis turpis sed ante vivamus tortor duis mattis egestas metus','aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit','fusce lacus purus aliquet at feugiat non pretium quis lectus',3),(48,'Carma','Eire','cdeakins1b@github.com','2020-12-23',35,'/img/products/Carma-imgs/LogoCarma1643770081370.png','dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat','elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla','blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer',4),(49,'KassadinKasadum','Cogibox','kkinzett1c@blog.com','2020-03-31',18,'/img/products/Kassi-imgs/LogoKassi1643770088658.png','leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique','morbi non quam nec dui luctus rutrum nulla tellus in','libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc',1),(50,'Rocket Punch','Yoveo','dpaxman1d@cdbaby.com','2021-05-02',13,'/img/products/Rocket Punch-imgs/LogoRocket Punch1643770163664.png','magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis','felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod','odio consequat varius integer ac leo pellentesque ultrices mattis odio',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products_platforms`
--

LOCK TABLES `products_platforms` WRITE;
/*!40000 ALTER TABLE `products_platforms` DISABLE KEYS */;
INSERT INTO `products_platforms` VALUES (55,2,3),(56,3,1),(57,3,2),(58,3,3),(61,4,2),(62,4,3),(63,20,1),(65,22,1),(66,23,1),(67,24,1),(68,25,1),(70,27,1),(71,28,1),(72,29,1),(73,30,1),(74,31,1),(75,32,1),(76,33,1),(77,34,1),(78,35,1),(80,37,1),(81,38,1),(82,39,1),(83,40,1),(84,41,1),(103,26,2),(104,26,3),(105,36,3),(106,42,1),(107,42,2),(108,42,3),(109,43,1),(110,44,1),(111,45,1),(112,46,1),(113,47,1),(114,48,1),(116,50,1),(117,11,1),(118,12,1),(119,13,1),(120,14,1),(121,15,1),(122,16,1),(123,17,1),(124,18,1),(125,19,1),(126,49,1),(130,6,1),(131,6,2),(132,6,3),(133,5,1),(134,5,2),(135,5,3),(148,7,1),(149,7,2),(150,7,3),(151,8,1),(152,9,1),(153,10,1),(154,21,1),(155,1,3);
/*!40000 ALTER TABLE `products_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shopping_products`
--

LOCK TABLES `shopping_products` WRITE;
/*!40000 ALTER TABLE `shopping_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (1,21),(2,23),(3,24),(4,26),(5,27),(6,28),(7,29);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'cgeistbeck0','Candide','Glimepiride','ctregent0@prlog.org','/img/users/default.png','MYdjK6',0),(2,'tseefus1','Thebault','Fibrocane Relief','tcheers1@spiegel.de','/img/users/default.png','gHsqDPaUv',0),(3,'dogorman2','Deni','Oxybutynin Chloride','dbulgen2@mapquest.com','/img/users/default.png','mGy1KH',0),(4,'ewofenden3','Eloisa','Muscle Cramp Complex','ekrysztowczyk3@spiegel.de','/img/users/default.png','Z4vhKvdqfXuW',0),(5,'rboase4','Richart','Opana','radshad4@sun.com','/img/users/default.png','DuC8FGBbFV',0),(6,'kthrift5','Kayla','Amoxicillin','kburgen5@addtoany.com','/img/users/default.png','jd0xHN',0),(7,'tmonkhouse6','Tessie','Divalproex Sodium','tgillespie6@friendfeed.com','/img/users/default.png','NN72UM1okqF',0),(8,'manstey7','Maisey','Ceftriaxone','mozintsev7@washington.edu','/img/users/default.png','wBDzsbBdB',0),(9,'jsallenger8','Jacquenette','ISOPROPYL RUBBING ALCOHOL','jbosence8@eepurl.com','/img/users/default.png','0TPoUryn',0),(10,'sharrisson9','Suzy','Lithium Carbonate','sfontes9@guardian.co.uk','/img/users/default.png','qGjApV7',0),(11,'cdiamanta','Chet','Lamivudine','cdenyukina@biglobe.ne.jp','/img/users/default.png','spkPpcWk',0),(12,'brizzellob','Bernete','CIALIS','bklimukb@ocn.ne.jp','/img/users/default.png','3WLwqu',0),(13,'viddyc','Vanessa','Metronidazole','vpriddenc@skype.com','/img/users/default.png','t2PcNkjd',0),(14,'bhawkswelld','Barnaby','MDSOLARSCIENCES','bgleaved@npr.org','/img/users/default.png','VP661r8C',0),(15,'missarde','Michael','Lycoris rubus whitening','mirvinee@dedecms.com','/img/users/default.png','VeCupAcqjfQg',0),(16,'cbartosinskif','Car','Dandelion','cshortcliffef@ovh.net','/img/users/default.png','VehO8D56cYp',0),(17,'sdefraineg','Stephi','Levetiracetam','smalinsong@si.edu','/img/users/default.png','39n42Zox',0),(18,'bbrimilcombeh','Beth','Levomefolate Calcium Acetylcysteine and Mecobalami','bmasselh@about.com','/img/users/default.png','U7jLaP5',0),(19,'sthornei','Salmon','Gabapentin','smoninii@senate.gov','/img/users/default.png','CL3NUW6Q',0),(20,'sdutnellj','Shaine','U-max Beauty','smussillij@apple.com','/img/users/default.png','QdjyEhDhXco',0),(21,'Admin','Admin','Istrador','admin@istrador.com','/img/users/admin@istrador.com.png','$2a$10$J8Hr0QYWyanjYyxWmExW/OYpS.vwzyJ3Mu9MeK9G.vt4RUsV3jRfS',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2022-02-06 22:46:22
