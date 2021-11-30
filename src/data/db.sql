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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (2,'Acción'),(1,'Arcade'),(5,'Aventuras'),(3,'Deportes'),(4,'Estrategia');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (2,'Linux'),(3,'macOS'),(1,'Windows');
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
  `email` varchar(50) DEFAULT NULL,
  `release_date` date NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `logo` varchar(100) NOT NULL,
  `min_requirements` text NOT NULL,
  `rec_requirements` text NOT NULL,
  `description` text NOT NULL,
  `genre_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_product_genre_idx` (`genre_id`),
  CONSTRAINT `fk_product_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Wilow','Fivechat','wclancy0@ycombinator.com','0000-00-00',4,'https://robohash.org/quossaepeautem.png?size=50x50&set=set1','Supplement Right Metacarpocarpal Joint with Synthetic Substitute, Open Approach','Military operations involving intentional restriction of air and airway, military personnel, initial encounter','Driver of snowmobile injured in nontraffic accident',2),(2,'Arlen','Oyoloo','ayarn1@devhub.com','0000-00-00',6,'https://robohash.org/estquiexcepturi.png?size=50x50&set=set1','Reposition Left Occipital Bone, Percutaneous Endoscopic Approach','Corrosions of other specified parts of left eye and adnexa, subsequent encounter','Unspecified injury of unspecified kidney, subsequent encounter',5),(3,'Ammamaria','Photobug','acampes2@army.mil','0000-00-00',8,'https://robohash.org/eosomnisvoluptatem.png?size=50x50&set=set1','Change Cast on Left Finger','Displaced longitudinal fracture of right patella, subsequent encounter for closed fracture with malunion','Crushing injury of unspecified finger(s), subsequent encounter',4),(4,'Ruby','Kwideo','rnorsister3@chronoengine.com','0000-00-00',19,'https://robohash.org/ipsumautnihil.png?size=50x50&set=set1','Transplantation of Endocrine System into Products of Conception, Percutaneous Endoscopic Approach','Displaced intraarticular fracture of left calcaneus','Disorder of muscle tone of newborn, unspecified',2),(5,'Lolly','Reallinks','lloyndon4@live.com','0000-00-00',5,'https://robohash.org/repudiandaeodiovoluptate.png?size=50x50&set=set1','Insertion of Infusion Pump into Left Lower Leg Subcutaneous Tissue and Fascia, Percutaneous Approach','Corrosion of unspecified degree of left forearm','Calcification and ossification of muscles associated with burns, right thigh',2),(6,'Bo','Buzzster','bpopescu5@hibu.com','0000-00-00',30,'https://robohash.org/exvoluptatesnecessitatibus.png?size=50x50&set=set1','Extirpation of Matter from Left Eustachian Tube, Via Natural or Artificial Opening Endoscopic','Acute skin change due to ultraviolet radiation, unspecified','Atherosclerosis of nonbiological bypass graft(s) of the right leg with ulceration of other part of foot',2),(7,'Kennith','Tambee','khunday6@t-online.de','0000-00-00',43,'https://robohash.org/culpaquibusdamlaudantium.png?size=50x50&set=set1','Reposition Thoracic Nerve, Percutaneous Endoscopic Approach','Terrorism involving suicide bomber','Other secondary chronic gout, left knee, with tophus (tophi)',4),(8,'Hollyanne','Kwilith','hklaesson7@digg.com','0000-00-00',9,'https://robohash.org/utiureaspernatur.png?size=50x50&set=set1','Excision of Right Temporomandibular Joint, Open Approach, Diagnostic','Other injury of extensor muscle, fascia and tendon of left middle finger at wrist and hand level, sequela','Other specified injuries of right thigh, initial encounter',2),(9,'Patti','Realcube','plhommeau8@telegraph.co.uk','0000-00-00',45,'https://robohash.org/etmagnamhic.png?size=50x50&set=set1','Destruction of Middle Esophagus, Open Approach','Loose body in unspecified elbow','Fracture of other specified skull and facial bones, unspecified side, initial encounter for closed fracture',2),(10,'Romeo','Lazz','rcolebrook9@mashable.com','0000-00-00',32,'https://robohash.org/assumendaundevoluptatem.png?size=50x50&set=set1','Removal of Nonautologous Tissue Substitute from Left Pelvic Bone, Open Approach','Mild vulvar dysplasia','Encounter for screening for malignant neoplasm of respiratory organs',3),(11,'Kevina','Plajo','kdanovicha@cloudflare.com','0000-00-00',18,'https://robohash.org/enimitaqueveniam.png?size=50x50&set=set1','Excision of Right Parotid Gland, Percutaneous Approach','Unspecified pre-eclampsia','Spermatocele of epididymis',2),(12,'Wylie','Leexo','whucksb@clickbank.net','0000-00-00',14,'https://robohash.org/occaecatiquovel.png?size=50x50&set=set1','Drainage of Right Thyroid Gland Lobe, Open Approach','Frostbite with tissue necrosis of unspecified knee and lower leg, initial encounter','Displaced unspecified condyle fracture of lower end of right femur, subsequent encounter for closed fracture with delayed healing',5),(13,'Shanta','Gigashots','spenningsc@cornell.edu','0000-00-00',6,'https://robohash.org/excepturietet.png?size=50x50&set=set1','Ultrasonography of Left Renal Vein','Laceration of unspecified muscles, fascia and tendons at forearm level, left arm','Pathological fracture in neoplastic disease, right shoulder',4),(14,'Andriana','Zoomlounge','awased@fastcompany.com','0000-00-00',23,'https://robohash.org/amaioreslibero.png?size=50x50&set=set1','Drainage of Right Axillary Lymphatic with Drainage Device, Percutaneous Approach','Underdosing of enzymes','Contusion of left forearm, initial encounter',5),(15,'Glennis','Mybuzz','gkybbyee@amazon.de','0000-00-00',21,'https://robohash.org/optiodolorest.png?size=50x50&set=set1','Occlusion of Right Renal Artery with Intraluminal Device, Percutaneous Approach','Frostbite with tissue necrosis of other part of head, initial encounter','Other fracture of first metacarpal bone, unspecified hand',2),(16,'Dulci','Dabfeed','dironsidef@dailymail.co.uk','0000-00-00',23,'https://robohash.org/molestiaelaboreplaceat.png?size=50x50&set=set1','Alteration of Bilateral Breast with Synthetic Substitute, External Approach','Crushing injury of unspecified right toe(s), subsequent encounter','Fourth degree perineal laceration during delivery',5),(17,'Douglas','Riffpath','drudigerg@merriam-webster.com','0000-00-00',40,'https://robohash.org/architectositexcepturi.png?size=50x50&set=set1','Drainage of Left Lung with Drainage Device, Percutaneous Endoscopic Approach','Complications of reattached (part of) lower extremity','Aneurysmal bone cyst, left ankle and foot',3),(18,'Franciska','Brainbox','fhaylandsh@time.com','0000-00-00',45,'https://robohash.org/iurevoluptateset.png?size=50x50&set=set1','Drainage of Sigmoid Colon, Open Approach, Diagnostic','Poisoning by other laxatives, undetermined','Underdosing of other topical agents',3),(19,'Avram','Reallinks','aseini@time.com','0000-00-00',32,'https://robohash.org/minimaundeenim.png?size=50x50&set=set1','Supplement Left Basilic Vein with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach','Polyhydramnios, third trimester, fetus 4','Struck by other psittacines, sequela',5),(20,'Jodi','Skipfire','jkurthj@altervista.org','0000-00-00',15,'https://robohash.org/modiexperferendis.png?size=50x50&set=set1','Excision of Right Metatarsal, Percutaneous Approach','Personal history of diseases of male genital organs','Corrosion of first degree of unspecified forearm',5),(21,'Lewes','Edgeblab','ltollitk@alexa.com','0000-00-00',40,'https://robohash.org/autemquamsit.png?size=50x50&set=set1','Drainage of Perineum Tendon, Percutaneous Endoscopic Approach','Corrosion of third degree of right hand, unspecified site, sequela','Displaced fracture of medial malleolus of left tibia',3),(22,'Daisy','Cogidoo','dfrohockl@xinhuanet.com','0000-00-00',11,'https://robohash.org/voluptatemsedreprehenderit.png?size=50x50&set=set1','Magnetic Resonance Imaging (MRI) of Left Eye using Other Contrast','Activities involving other sports and athletics played individually','Salter-Harris Type II physeal fracture of lower end of humerus, unspecified arm, sequela',4),(23,'Beale','Zoomzone','blancastlem@cpanel.net','0000-00-00',44,'https://robohash.org/velistesed.png?size=50x50&set=set1','Intraoperative Radiation Therapy (IORT) of Colon','Unspecified fracture of right femur, subsequent encounter for open fracture type I or II with delayed healing','Extreme immaturity of newborn, gestational age 24 completed weeks',1),(24,'Raimund','Camido','rfilyaevn@trellian.com','0000-00-00',31,'https://robohash.org/aututest.png?size=50x50&set=set1','Repair Right 5th Toe, External Approach','Rheumatoid bursitis, unspecified elbow','Toxic effects of chromium and its compounds',1),(25,'Charis','Trilith','cgauchiero@mozilla.com','0000-00-00',3,'https://robohash.org/voluptasistequia.png?size=50x50&set=set1','Drainage of Nasopharynx, Via Natural or Artificial Opening Endoscopic','Hurler-Scheie syndrome','Unspecified open wound of abdominal wall, periumbilic region with penetration into peritoneal cavity, subsequent encounter',1),(26,'Neils','Realbridge','nlawiep@marriott.com','0000-00-00',13,'https://robohash.org/voluptatesnullaatque.png?size=50x50&set=set1','Supplement Left Ventricle with Autologous Tissue Substitute, Percutaneous Endoscopic Approach','Age-related osteoporosis with current pathological fracture, right forearm, subsequent encounter for fracture with malunion','Other disorders of breast and disorders of lactation associated with pregnancy and the puerperium',3),(27,'Melissa','Zoombeat','mquinceyq@mysql.com','0000-00-00',9,'https://robohash.org/doloremqueculpaexpedita.png?size=50x50&set=set1','Dilation of Coronary Artery, One Artery with Two Drug-eluting Intraluminal Devices, Percutaneous Endoscopic Approach','Contusion of front wall of thorax','Abrasion of right upper arm, initial encounter',3),(28,'Arnoldo','Gevee','abasillr@freewebs.com','0000-00-00',35,'https://robohash.org/eadelenitifugiat.png?size=50x50&set=set1','Extirpation of Matter from Pericardial Cavity, Open Approach','Unspecified injury of extensor muscle, fascia and tendon of left thumb at wrist and hand level, sequela','Blister (nonthermal) of anus',5),(29,'Maggi','Tagcat','mmartindales@drupal.org','0000-00-00',42,'https://robohash.org/etoditaccusamus.png?size=50x50&set=set1','Bypass Left External Iliac Artery to Right External Iliac Artery, Open Approach','Abnormal results of other function studies of peripheral nervous system','Other meniscus derangements, other medial meniscus, unspecified knee',2),(30,'Francesca','Realblab','fandreollit@pagesperso-orange.fr','0000-00-00',23,'https://robohash.org/namlaboreperferendis.png?size=50x50&set=set1','Transfer Lower Gingiva, Open Approach','Flail chest','Laceration of muscle(s) and tendon(s) of peroneal muscle group at lower leg level, right leg, initial encounter',3),(31,'Rodie','Dabjam','rbrodbinu@yale.edu','0000-00-00',18,'https://robohash.org/remenimreiciendis.png?size=50x50&set=set1','Systemic Nuclear Medicine Therapy of Multiple Anatomical Regions using Other Radionuclide','Osteitis condensans, right hand','Injury of trochlear nerve',3),(32,'Flora','Chatterpoint','fboldockv@chron.com','0000-00-00',24,'https://robohash.org/veroquomagni.png?size=50x50&set=set1','Introduction of Local Anesthetic into Ear, Via Natural or Artificial Opening','Abrasion, left hip, sequela','Nondisplaced fracture of body of unspecified talus, initial encounter for open fracture',3),(33,'Adrienne','Roodel','ajancyw@hatena.ne.jp','0000-00-00',33,'https://robohash.org/siteumqui.png?size=50x50&set=set1','Supplement Superior Mesenteric Artery with Autologous Tissue Substitute, Open Approach','Toxic effect of petroleum products, undetermined, sequela','Salter-Harris Type IV physeal fracture of right metatarsal, initial encounter for closed fracture',3),(34,'Guilbert','Yata','gshippeyx@mozilla.com','0000-00-00',33,'https://robohash.org/omnisvoluptatumnecessitatibus.png?size=50x50&set=set1','Excision of Right Hip Tendon, Percutaneous Approach, Diagnostic','Unspecified fracture of left forearm, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion','Microgenia',1),(35,'Prescott','Topicstorm','ppiesingy@ucoz.ru','0000-00-00',29,'https://robohash.org/quisquamistequis.png?size=50x50&set=set1','Revision of Extraluminal Device in Lower Intestinal Tract, External Approach','Complication of renal artery following a procedure, not elsewhere classified, sequela','Unspecified injury of flexor muscle, fascia and tendon of left ring finger at forearm level',2),(36,'Helli','Skipfire','hhawez@fda.gov','0000-00-00',25,'https://robohash.org/remvelittotam.png?size=50x50&set=set1','Therapeutic Exercise Treatment of Circulatory System - Upper Back / Upper Extremity using Physical Agents','Food in respiratory tract, part unspecified causing asphyxiation','Other injury of ovary, unspecified, subsequent encounter',3),(37,'Vite','Fadeo','vsaddleton10@businesswire.com','0000-00-00',46,'https://robohash.org/ipsaculpaest.png?size=50x50&set=set1','Release Left Hip Bursa and Ligament, Percutaneous Endoscopic Approach','Nondisplaced fracture of medial phalanx of right little finger','Pedal cycle driver injured in collision with other nonmotor vehicle in traffic accident, initial encounter',3),(38,'Roana','Izio','rmacfayden11@independent.co.uk','0000-00-00',47,'https://robohash.org/debitisinciduntnihil.png?size=50x50&set=set1','Drainage of Right Sternoclavicular Joint, Percutaneous Endoscopic Approach','Unspecified fracture of right talus, subsequent encounter for fracture with routine healing','Infection and inflammatory reaction due to prosthetic device, implant and graft in urinary system',4),(39,'Jaime','Vipe','jgowdridge12@posterous.com','0000-00-00',8,'https://robohash.org/estoptiomagni.png?size=50x50&set=set1','Drainage of Bilateral Breast with Drainage Device, External Approach','Drug or chemical induced diabetes mellitus with neurological complications with diabetic neuropathy, unspecified','Nondisplaced fracture of medial malleolus of unspecified tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing',5),(40,'Eadmund','Yombu','emagor13@sina.com.cn','0000-00-00',31,'https://robohash.org/aspernaturveritatisdolores.png?size=50x50&set=set1','Removal of Autologous Tissue Substitute from Left Eye, Open Approach','Car driver injured in collision with railway train or railway vehicle in nontraffic accident, subsequent encounter','Salter-Harris Type I physeal fracture of phalanx of left toe, initial encounter for closed fracture',4),(41,'Estella','Omba','edupre14@google.com','0000-00-00',18,'https://robohash.org/maioresullamat.png?size=50x50&set=set1','Bypass Bladder to Colocutaneous with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach','Displaced segmental fracture of shaft of humerus, unspecified arm, subsequent encounter for fracture with delayed healing','Unspecified injury of muscle, fascia and tendon of triceps, unspecified arm, sequela',2),(42,'Thadeus','Mynte','tmaciunas15@usatoday.com','0000-00-00',33,'https://robohash.org/nonmolestiaerecusandae.png?size=50x50&set=set1','Planar Nuclear Medicine Imaging of Abdomen using Gallium 67 (Ga-67)','Ulnar collateral ligament sprain of right elbow, sequela','Hypertrophy of bone, humerus',5),(43,'Rhett','Photojam','rvidineev16@com.com','0000-00-00',12,'https://robohash.org/eahicanimi.png?size=50x50&set=set1','Reposition Right Ethmoid Bone with Internal Fixation Device, Percutaneous Approach','Pathological fracture in neoplastic disease, left ulna, subsequent encounter for fracture with routine healing','Malar fracture, right side, initial encounter for open fracture',5),(44,'Jeramie','Gigazoom','jelt17@facebook.com','0000-00-00',33,'https://robohash.org/etcupiditateeius.png?size=50x50&set=set1','Bypass Left Axillary Vein to Upper Vein, Percutaneous Endoscopic Approach','Unspecified fracture of shaft of right femur, initial encounter for open fracture type IIIA, IIIB, or IIIC','Other specified injury of muscle and tendon of head, initial encounter',3),(45,'Rafaello','Brainbox','rtomisch18@japanpost.jp','0000-00-00',11,'https://robohash.org/utestomnis.png?size=50x50&set=set1','Replacement of Right Parietal Bone with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach','Other synovitis and tenosynovitis, unspecified forearm','Malignant carcinoid tumors of other sites',5),(46,'Leoline','Aimbu','lmantram19@mapquest.com','0000-00-00',27,'https://robohash.org/voluptatemisteab.png?size=50x50&set=set1','Insertion of Infusion Device into Superior Vena Cava, Percutaneous Approach','Family history of other disabilities and chronic diseases leading to disablement, not elsewhere classified','Salter-Harris Type IV physeal fracture of upper end of humerus, unspecified arm, subsequent encounter for fracture with nonunion',5),(47,'Harper','Trunyx','hcarress1a@google.com','0000-00-00',38,'https://robohash.org/quaeratexercitationemet.png?size=50x50&set=set1','Replacement of Right External Iliac Vein with Synthetic Substitute, Open Approach','Nondisplaced subtrochanteric fracture of right femur, subsequent encounter for closed fracture with malunion','Person on outside of car injured in collision with sport utility vehicle in traffic accident',5),(48,'Irita','Shuffledrive','ibool1b@tamu.edu','0000-00-00',35,'https://robohash.org/abbeataerepellat.png?size=50x50&set=set1','Removal of Internal Fixation Device from Thoracic Vertebral Joint, Percutaneous Endoscopic Approach','Maternal care for other known or suspected poor fetal growth, second trimester, fetus 3','Congenital central alveolar hypoventilation syndrome',1),(49,'Vasilis','Tazzy','vbalaizot1c@wired.com','0000-00-00',1,'https://robohash.org/nonofficiadelectus.png?size=50x50&set=set1','Insertion of Infusion Device into Spleen, Percutaneous Approach','Corrosion of first degree of unspecified single finger (nail) except thumb','Emotional disorders with onset specific to childhood',2),(50,'Natalie','Tavu','ncarnegy1d@omniture.com','0000-00-00',26,'https://robohash.org/debitissequiex.png?size=50x50&set=set1','Occlusion of Left External Iliac Artery with Intraluminal Device, Percutaneous Endoscopic Approach','Nondisplaced fracture of olecranon process without intraarticular extension of left ulna, subsequent encounter for closed fracture with malunion','Unspecified injury of unspecified tibial artery, left leg',4);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_platforms`
--

LOCK TABLES `products_platforms` WRITE;
/*!40000 ALTER TABLE `products_platforms` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
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
  `profile_pic` varchar(100) DEFAULT NULL,
  `password` varchar(12) NOT NULL,
  `admin` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lklimke0','Lynnette','footlogix','lrotter0@hhs.gov','http://dummyimage.com/165x100.png/cc0000/ffffff','QTf7tT',0),(2,'ikehoe1','Ivie','COUMADIN','iclift1@yellowbook.com','http://dummyimage.com/217x100.png/ff4444/ffffff','ElGyBlrHUy0k',0),(3,'gakehurst2','Gussie','Fluorecein sodium and Proparacaine Hydrochloride','ghadleigh2@artisteer.com','http://dummyimage.com/196x100.png/5fa2dd/ffffff','qZ4y4WLlI',0),(4,'rdulanty3','Riccardo','SPF 30 Sunscreen','rlarciere3@ezinearticles.com','http://dummyimage.com/219x100.png/dddddd/000000','tkXbfGO3E',0),(5,'jlilly4','Jeremie','PREMIER VALUE ORIGINAL','jhallam4@shareasale.com','http://dummyimage.com/214x100.png/cc0000/ffffff','DaoD8RyxWs',0),(6,'bbutfield5','Berrie','Pike','bbes5@foxnews.com','http://dummyimage.com/153x100.png/ff4444/ffffff','eaLmSq',0),(7,'ahuygen6','Angelika','PURELL Advanced Hand Sanitizer Wintergreen Mint','aharry6@ted.com','http://dummyimage.com/209x100.png/ff4444/ffffff','A4cHXh9T9BhQ',0),(8,'rpilbeam7','Robinetta','Valproic Acid','rschaben7@infoseek.co.jp','http://dummyimage.com/211x100.png/dddddd/000000','lx6hMAk5',0),(9,'aaslott8','Archer','Intuniv','adowgill8@pagesperso-orange.fr','http://dummyimage.com/112x100.png/cc0000/ffffff','HG0d3HBRqE',0),(10,'proddy9','Purcell','ESIKA Extreme Moisturizing SPF 16','psedgeworth9@abc.net.au','http://dummyimage.com/133x100.png/ff4444/ffffff','7XOf0L2pRyQ',0),(11,'kmeakea','Keven','Cardene I.V.','kcantua@intel.com','http://dummyimage.com/226x100.png/ff4444/ffffff','WHiowNTP',0),(12,'rmoorwoodb','Roman','topcare day time cold and flu severe','rdelgadob@bloglovin.com','http://dummyimage.com/135x100.png/5fa2dd/ffffff','5zHWCLB',0),(13,'jgebuhrc','Jeri','Chestal Childrens Cough and Cold','jtonguec@mozilla.org','http://dummyimage.com/182x100.png/5fa2dd/ffffff','KAA9n7',0),(14,'lhedded','Lottie','Meclizine Hydrochloride','lfineyd@wordpress.org','http://dummyimage.com/240x100.png/cc0000/ffffff','KHH3ucG9',0),(15,'fconstante','Francklin','Oxygen','faistrope@google.com','http://dummyimage.com/158x100.png/5fa2dd/ffffff','HAIewmLDfJmg',0),(16,'ledmondsonf','Lucius','One Step Hand Sanitizer Aloe','lcorkingf@myspace.com','http://dummyimage.com/172x100.png/dddddd/000000','vndnm78BDr',0),(17,'jcutajarg','Julietta','Date','jcicchellig@thetimes.co.uk','http://dummyimage.com/118x100.png/dddddd/000000','fttJem',0),(18,'handrzejakh','Hazel','Lacrisert','hyoudh@theatlantic.com','http://dummyimage.com/221x100.png/ff4444/ffffff','TefRBlVLjtn',0),(19,'lprescotei','Lurline','Givenchy TEINT COUTURE Long Wearing Fluid Foundati','lprobetsi@amazon.co.jp','http://dummyimage.com/223x100.png/5fa2dd/ffffff','lUZ4weAv2',0),(20,'bunwinj','Bellina','Fluoxetine','bschoberj@seattletimes.com','http://dummyimage.com/194x100.png/5fa2dd/ffffff','G5O7G8Gotj2',0);
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

-- Dump completed on 2021-11-29 23:02:58
