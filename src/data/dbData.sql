--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'Linux'),(2,'macOS'),(3,'Windows');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Acción'),(2,'Arcade'),(3,'Aventuras'),(4,'Deportes'),(5,'Estrategia');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (1, 'Missy', 'Mynte', 'mtissington0@uiuc.edu', '2021/05/25', 39.61, 'logo', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer', 'elementum nullam varius nulla facilisi cras non velit nec nisi vulputate', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (2, 'Katinka', 'Gevee', 'kotto1@amazonaws.com', '2020/03/14', 16.69, 'logo', 'morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer', 'non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (3, 'Minetta', 'Jabbertype', 'mgwalter2@histats.com', '2021/06/04', 37.38, 'logo', 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis', 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (4, 'Umberto', 'Yambee', 'ugeockle3@mapy.cz', '2021/10/23', 37.55, 'logo', 'nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', 'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor', 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (5, 'Joyan', 'Twitternation', 'jvasquez4@msu.edu', '2020/01/28', 48.58, 'logo', 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis', 'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 'et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (6, 'Babette', 'Quinu', 'bjellman5@mtv.com', '2020/08/15', 17.78, 'logo', 'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus', 'rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at', 'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (7, 'Tracy', 'Vitz', 'tzuppa6@odnoklassniki.ru', '2021/04/03', 32.27, 'logo', 'magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien', 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula', 'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan', 5);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (8, 'Magdalene', 'Babbleblab', 'mgeffcock7@microsoft.com', '2020/06/06', 18.96, 'logo', 'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo', 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy', 'nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (9, 'Grata', 'Rhyloo', 'gdallinder8@weibo.com', '2021/08/07', 41.3, 'logo', 'volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo', 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 'feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (10, 'Erena', 'Roombo', 'eellens9@wix.com', '2020/03/04', 40.93, 'logo', 'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor', 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper', 'sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (11, 'Madalena', 'Skynoodle', 'mkalderona@msn.com', '2020/05/15', 43.93, 'logo', 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio', 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper', 'consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (12, 'Siegfried', 'Ooba', 'sdicksb@ftc.gov', '2020/02/05', 19.67, 'logo', 'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec', 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa', 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (13, 'Gates', 'Eamia', 'gdiemerc@bigcartel.com', '2021/04/18', 31.99, 'logo', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet', 'sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', 'pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', 5);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (14, 'Torrence', 'Dabfeed', 'tmcgeaghd@ifeng.com', '2021/09/12', 10.2, 'logo', 'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in', 'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (15, 'Cornie', 'Riffpedia', 'cklimpte@techcrunch.com', '2021/06/23', 37.29, 'logo', 'justo eu massa donec dapibus duis at velit eu est congue', 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut', 'elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis', 5);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (16, 'Brennan', 'Voomm', 'bstanesbyf@printfriendly.com', '2021/03/15', 29.29, 'logo', 'id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci', 'pede ac diam cras pellentesque volutpat dui maecenas tristique est', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (17, 'Carlynn', 'Zoomdog', 'celsomg@mapquest.com', '2020/07/10', 11.24, 'logo', 'sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus', 'convallis nunc proin at turpis a pede posuere nonummy integer', 'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (18, 'Saleem', 'Devify', 'sbubearh@ebay.co.uk', '2020/11/09', 29.54, 'logo', 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', 'semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis', 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (19, 'Dora', 'Avaveo', 'dplampini@t-online.de', '2021/07/09', 34.46, 'logo', 'vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue', 'nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (20, 'Lanette', 'Twitterlist', 'ldowningj@microsoft.com', '2020/11/17', 11.08, 'logo', 'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi', 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus', 5);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (21, 'Elnora', 'Wordify', 'ekleislek@imgur.com', '2021/05/05', 34.79, 'logo', 'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum', 'lectus vestibulum quam sapien varius ut blandit non interdum in', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (22, 'Ana', 'Browsebug', 'alesterl@oracle.com', '2020/11/05', 39.22, 'logo', 'erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla', 'faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam', 'non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (23, 'Ingelbert', 'Blogtags', 'ipietsmam@issuu.com', '2021/06/18', 19.59, 'logo', 'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue', 'ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (24, 'Clevie', 'Wordpedia', 'cfobidgen@simplemachines.org', '2021/07/14', 48.87, 'logo', 'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer', 'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', 'in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (25, 'Barnett', 'Babbleset', 'btometo@addtoany.com', '2021/08/25', 40.55, 'logo', 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede', 'erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus', 'sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (26, 'Carrie', 'Centizu', 'cfawthropp@yandex.ru', '2021/11/06', 23.81, 'logo', 'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet', 'nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat', 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (27, 'Nannie', 'Twimbo', 'nthowesq@de.vu', '2021/05/14', 37.01, 'logo', 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', 'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (28, 'Vivianna', 'Thoughtbeat', 'vvandijkr@yahoo.com', '2020/11/21', 35.91, 'logo', 'in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt', 'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis', 'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (29, 'Maible', 'Browsebug', 'mbeausangs@scientificamerican.com', '2021/09/28', 39.94, 'logo', 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat', 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent', 'id mauris vulputate elementum nullam varius nulla facilisi cras non velit', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (30, 'Lynne', 'Youspan', 'lhebront@issuu.com', '2021/04/19', 44.99, 'logo', 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (31, 'Danya', 'Demivee', 'dhodgesu@typepad.com', '2021/01/31', 23.37, 'logo', 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus', 'odio cras mi pede malesuada in imperdiet et commodo vulputate', 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', 5);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (32, 'Willis', 'Centidel', 'wgoltonv@comsenz.com', '2021/11/06', 16.68, 'logo', 'felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec', 'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (33, 'Ashly', 'Edgewire', 'aoreganw@bluehost.com', '2020/02/18', 17.27, 'logo', 'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam', 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed', 'ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (34, 'Damon', 'Blogtag', 'dguiderax@who.int', '2020/07/09', 17.39, 'logo', 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget', 'eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (35, 'Walton', 'Rhyzio', 'wtrumbley@alexa.com', '2021/02/24', 19.67, 'logo', 'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', 'eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan', 5);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (36, 'Vonni', 'Aivee', 'vmumbyz@google.it', '2021/11/18', 33.31, 'logo', 'ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', 'ut blandit non interdum in ante vestibulum ante ipsum primis in', 'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (37, 'Kariotta', 'Chatterbridge', 'khanretty10@globo.com', '2020/11/29', 26.75, 'logo', 'lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed', 'amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', 'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (38, 'Mariejeanne', 'Skinte', 'mritchley11@japanpost.jp', '2021/04/28', 34.6, 'logo', 'sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies', 5);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (39, 'Delores', 'Quamba', 'dcorder12@java.com', '2020/11/12', 27.55, 'logo', 'et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere', 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel', 'leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (40, 'Gretchen', 'Skyble', 'ghusk13@scribd.com', '2021/10/25', 47.74, 'logo', 'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper', 'duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla', 'est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (41, 'Car', 'Zava', 'cbartalucci14@globo.com', '2020/11/27', 40.24, 'logo', 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue', 'quam a odio in hac habitasse platea dictumst maecenas ut massa quis', 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (42, 'Clerkclaude', 'Buzzshare', 'ctoll15@macromedia.com', '2021/10/27', 14.32, 'logo', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac', 'nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (43, 'Janeta', 'Ainyx', 'jdurant16@webs.com', '2020/06/14', 45.84, 'logo', 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia', 'scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', 'quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (44, 'Monica', 'Demimbu', 'mcornewell17@ucsd.edu', '2019/12/09', 13.23, 'logo', 'ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam', 'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (45, 'Phylis', 'Skimia', 'pgodwin18@360.cn', '2020/11/28', 47.31, 'logo', 'etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia', 'augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (46, 'Krisha', 'Plajo', 'krichmont19@vinaora.com', '2020/11/06', 44.32, 'logo', 'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum', 'pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum', 2);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (47, 'Codie', 'Skibox', 'croelofsen1a@about.com', '2020/11/26', 25.62, 'logo', 'tortor quis turpis sed ante vivamus tortor duis mattis egestas metus', 'aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 'fusce lacus purus aliquet at feugiat non pretium quis lectus', 3);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (48, 'Carma', 'Eire', 'cdeakins1b@github.com', '2020/12/23', 35.17, 'logo', 'dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat', 'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla', 'blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer', 4);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (49, 'Kassi', 'Cogibox', 'kkinzett1c@blog.com', '2020/03/31', 17.79, 'logo', 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique', 'morbi non quam nec dui luctus rutrum nulla tellus in', 'libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc', 1);
insert into products (id, name, developer, email, release_date, price, logo, min_requirements, rec_requirements, description, genre_id) values (50, 'Dale', 'Yoveo', 'dpaxman1d@cdbaby.com', '2021/05/02', 12.87, 'logo', 'magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis', 'felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio', 5);

insert into users (id, username, name, surname, email, profile_pic, password, admin) values (1, 'cgeistbeck0', 'Candide', 'Glimepiride', 'ctregent0@prlog.org', 'profile_pic', 'MYdjK6', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (2, 'tseefus1', 'Thebault', 'Fibrocane Relief', 'tcheers1@spiegel.de', 'profile_pic', 'gHsqDPaUv', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (3, 'dogorman2', 'Deni', 'Oxybutynin Chloride', 'dbulgen2@mapquest.com', 'profile_pic', 'mGy1KH', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (4, 'ewofenden3', 'Eloisa', 'Muscle Cramp Complex', 'ekrysztowczyk3@spiegel.de', 'profile_pic', 'Z4vhKvdqfXuW', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (5, 'rboase4', 'Richart', 'Opana', 'radshad4@sun.com', 'profile_pic', 'DuC8FGBbFV', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (6, 'kthrift5', 'Kayla', 'Amoxicillin', 'kburgen5@addtoany.com', 'profile_pic', 'jd0xHN', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (7, 'tmonkhouse6', 'Tessie', 'Divalproex Sodium', 'tgillespie6@friendfeed.com', 'profile_pic', 'NN72UM1okqF', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (8, 'manstey7', 'Maisey', 'Ceftriaxone', 'mozintsev7@washington.edu', 'profile_pic', 'wBDzsbBdB', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (9, 'jsallenger8', 'Jacquenette', 'ISOPROPYL RUBBING ALCOHOL', 'jbosence8@eepurl.com', 'profile_pic', '0TPoUryn', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (10, 'sharrisson9', 'Suzy', 'Lithium Carbonate', 'sfontes9@guardian.co.uk', 'profile_pic', 'qGjApV7', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (11, 'cdiamanta', 'Chet', 'Lamivudine', 'cdenyukina@biglobe.ne.jp', 'profile_pic', 'spkPpcWk', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (12, 'brizzellob', 'Bernete', 'CIALIS', 'bklimukb@ocn.ne.jp', 'profile_pic', '3WLwqu', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (13, 'viddyc', 'Vanessa', 'Metronidazole', 'vpriddenc@skype.com', 'profile_pic', 't2PcNkjd', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (14, 'bhawkswelld', 'Barnaby', 'MDSOLARSCIENCES', 'bgleaved@npr.org', 'profile_pic', 'VP661r8C', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (15, 'missarde', 'Michael', 'Lycoris rubus whitening', 'mirvinee@dedecms.com', 'profile_pic', 'VeCupAcqjfQg', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (16, 'cbartosinskif', 'Car', 'Dandelion', 'cshortcliffef@ovh.net', 'profile_pic', 'VehO8D56cYp', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (17, 'sdefraineg', 'Stephi', 'Levetiracetam', 'smalinsong@si.edu', 'profile_pic', '39n42Zox', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (18, 'bbrimilcombeh', 'Beth', 'Levomefolate Calcium Acetylcysteine and Mecobalamin Algal', 'bmasselh@about.com', 'profile_pic', 'U7jLaP5', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (19, 'sthornei', 'Salmon', 'Gabapentin', 'smoninii@senate.gov', 'profile_pic', 'CL3NUW6Q', 0);
insert into users (id, username, name, surname, email, profile_pic, password, admin) values (20, 'sdutnellj', 'Shaine', 'U-max Beauty', 'smussillij@apple.com', 'profile_pic', 'QdjyEhDhXco', 0);

