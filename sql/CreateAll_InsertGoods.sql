-- ±âÁ¸ Å×ÀÌºíµé »èÁ¦
drop table cart purge;
drop table notice purge;
drop table qa purge;
drop table orderinfo purge;
drop table goods purge;
drop table member purge;




-- ±âÁ¸ ½ÃÄö½ºµé »èÁ¦
drop sequence cart_seq;
drop sequence orderInfo_seq;
drop sequence QA_seq;
drop sequence notice_seq;

---»óÇ°
   -- vegetable, fruit, seafood, meat, noodle
   create table goods
   ( gCode varchar2(20) PRIMARY KEY, -- »óÇ°ÄÚµå
     gCategory varchar2(20) not null,   -- »óÇ° Ä«Å×°í¸®
     gName varchar2(50) not null,   -- »óÇ° ÀÌ¸§   (º»·¡ ½ÄÀç·á ÀÌ¸§¸¸ Ç¥±â ¿ø»êÁö, »ý»êÀÚ Á¦¿Ü)
     gPrice NUMBER(6) not null,     -- »óÇ° °¡°Ý
     gImage varchar2(20) not null,   -- »óÇ° ÀÌ¹ÌÁö
     gUnit varchar2(20),     -- ÆÇ¸Å´ÜÀ§ (±âÀçµÈ °ÍÀÌ ¾øÀ» °æ¿ì NULL)
     gWeight varchar2(20)   -- Áß·® (±âÀçµÈ °ÍÀÌ ¾øÀ» °æ¿ì NULL)
     );

-- goodsÅ×ÀÌºí¿¡ gStock(Àç°í) Ç×¸ñ Ãß°¡
ALTER TABLE goods
add gStock NUMBER(20);

-- ±âº» Àç°í 1000°³¾¿À¸·Î Ãß°¡
insert into goods 
  values ('M1',	'Meat', '°è¶õ', '7200', 'meat1', '20±¸', '1200g', 1000);
insert into goods 
  values ('M2',	'Meat', 'ÈÆÁ¦¿À¸®', '2682', 'meat2', '1ÆÑ', '150g', 1000);
insert into goods 
  values ('M3',	'Meat', '»ï°ã»ì', '12660', 'meat3', '1ÆÑ', '600g', 1000);
insert into goods 
  values ('M4',	'Meat', '¾Õ´Ù¸® »ì', '6900', 'meat4', '1ÆÑ', '600g', 1000);
insert into goods 
  values ('M5',	'Meat', '¼Ò°í±â ´ÙÁüÀ°', '7500', 'meat5', '1ÆÑ', '200g', 1000);
insert into goods 
  values ('M6',	'Meat', '¸ñ»ì', '12660', 'meat6', '1ÆÑ', '600g', 1000);
insert into goods 
  values ('M7',	'Meat', 'µÞ´Ù¸® »ì', '4500', 'meat7', '1ÆÑ', '600g', 1000);
insert into goods 
  values ('M8',	'Meat', 'Ä¡¸¶»ì', '9730', 'meat8', '1ÆÑ', '300g', 1000);
insert into goods 
  values ('M9',	'Meat', '´ëÆÐ »ï°ã»ì', '11900', 'meat9', '1ÆÑ', '1kg', 1000);
insert into goods 
  values ('M10', 'Meat', '´ßººÀ½ÅÁ¿ë ´ß', '5800', 'meat10', '1ÆÑ', '1kg', 1000);
insert into goods 
  values ('M11', 'Meat', '¼Ò°í±â ±¹°Å¸®¿ë', '8100', 'meat11', '1ÆÑ', '200g', 1000);
insert into goods 
  values ('M12', 'Meat', '´ß ´Ù¸®»ì', '12800', 'meat12', '1ÆÑ', '1kg', 1000);
insert into goods 
  values ('M13', 'Meat', '¸ÞÃß¸® ¾Ë', '4800', 'meat13', '1ÆÑ', '450g', 1000);
insert into goods 
  values ('M14', 'Meat', 'Â÷µ¹¹ÚÀÌ', '9500', 'meat14', '1ÆÑ', '150g', 1000);
insert into goods 
  values ('M15', 'Meat', 'µî½É µ·±î½º', '12900', 'meat15', '1ÆÑ', '1kg', 1000);
insert into goods 
  values ('M16', 'Meat', 'µÅÁö°í±â ´ÙÁüÀ°', '3600', 'meat16', '1ÆÑ', '300g', 1000);
insert into goods 
  values ('M17', 'Meat', '¼Ò°í±â µî½É', '11500', 'meat17', '1ÆÑ', '250g', 1000);
insert into goods 
  values ('M18', 'Meat', 'Ã¤³¡»ì', '16000', 'meat18', '1ÆÑ', '250g', 1000);
insert into goods 
  values ('M19', 'Meat', 'µÅÁö°í±â µî½É', '5400', 'meat19', '1ÆÑ', '300g', 1000);
insert into goods 
  values ('M20', 'Meat', '¿ì»ï°ã', '6930', 'meat20', '1ÆÑ', '500g', 1000);
insert into goods 
  values ('M21', 'Meat', '»ý´ß', '3500', 'meat21', '1ÆÑ', '500g', 1000);
insert into goods 
  values ('M22', 'Meat', '´ß ¾È½É»ì', '6900', 'meat22', '1ÆÑ', '500g', 1000);
insert into goods 
  values ('M23', 'Meat', '´ß °¡½¿»ì', '12900', 'meat23', '1ÆÑ', '2kg', 1000);
insert into goods 
  values ('M24', 'Meat', '¼Ò°í±â ¿ìµÐ»ì', '8910', 'meat24', '1ÆÑ', '200g', 1000);
insert into goods 
  values ('M25', 'Meat', '´ß À­³¯°³', '8600', 'meat25', '1ÆÑ', '500g', 1000);
insert into goods 
  values ('M26', 'Meat', 'Ç×Á¤»ì', '15700', 'meat26', '1ÆÑ', '300g', 1000);
insert into goods 
  values ('M27', 'Meat', '²Éµî½É', '29900', 'meat27', '1ÆÑ', '200g', 1000);
insert into goods 
  values ('M28', 'Meat', '¾ç°¥ºñ', '15000', 'meat28', '1ÆÑ', '300g', 1000);
insert into goods 
  values ('M29', 'Meat', 'ÇÔ¹Ú ½ºÅ×ÀÌÅ©', '13000', 'meat29', '2ÆÑ', '600g', 1000);
insert into goods 
  values ('M30', 'Meat', '¼Ò°í±â ¾È½É', '15900', 'meat30', '1ÆÑ', '200g', 1000);
  
-- ¸é, ¾ç³ä, ¿ÀÀÏ DB
insert into goods values ('N1', 'Noodle', 'Åä¸¶Åä ¼Ò½º', 2500, 'noodle1', '1°³', '500g', 1000);
insert into goods values ('N2', 'Noodle', '¹ÙÁúÆä½ºÅä', 5980, 'noodle2', '1º´', '230g', 1000);
insert into goods values ('N3', 'Noodle', '½ºÆÄ°ÔÆ¼', 2450, 'noodle3', '1ºÀ', '500g', 1000);
insert into goods values ('N4', 'Noodle', '¸¶¿ä³×Áî', 4790, 'noodle4', '1º´', '295ml', 1000);
insert into goods values ('N5', 'Noodle', 'Åä¸¶Åä ÄÉÃ¸', 2580, 'noodle5', '1Åë', '280g', 1000);
insert into goods values ('N6', 'Noodle', '¿À¸®¿£Å» µå·¹½Ì', 3250, 'noodle6', '1º´', '270g', 1000);
insert into goods values ('N7', 'Noodle', '»þºê»þºê À°¼ö', 2650, 'noodle7', '1ÆÑ', '200g', 1000);
insert into goods values ('N8', 'Noodle', 'Ä«·¹ ºÐ¸»', 3280, 'noodle8', '1ºÀ', '100g', 1000);
insert into goods values ('N9', 'Noodle', 'µé±â¸§', 14980, 'noodle9', '1º´', '320ml', 1000);
insert into goods values ('N10', 'Noodle', 'Âü±â¸§', 7980, 'noodle10', '1Äµ', '350ml', 1000);
insert into goods values ('N11', 'Noodle', '¸Þ¹Ð¸é', 4300, 'noodle11', '1ºÀ', '400g', 1000);
insert into goods values ('N12', 'Noodle', '¼Ò¸é', 3150, 'noodle12', '1ºÀ', '900g', 1000);
insert into goods values ('N13', 'Noodle', '¿ìµ¿»ç¸®¸é', 1100, 'noodle13', '1ºÀ', '210g', 1000);
insert into goods values ('N14', 'Noodle', '»ýÄ®±¹¼ö', 2480, 'noodle14', '1ºÀ', '320g', 1000);
insert into goods values ('N15', 'Noodle', '¿Ã¸®ºê ¿ÀÀÏ', 7980, 'noodle15', '1º´', '500ml', 1000);
insert into goods values ('N16', 'Noodle', '°íÃå°¡·ç', 9800, 'noodle16', '1ºÀ', '250g', 1000);
insert into goods values ('N17', 'Noodle', '¼Ò±Ý', 4800, 'noodle17', '1ºÀ', '500g', 1000);
insert into goods values ('N18', 'Noodle', '¼³ÅÁ', 2070, 'noodle18', '1ÆÑ', '1kg', 1000);
insert into goods values ('N19', 'Noodle', '¸êÄ¡À°¼ö', 3500, 'noodle19', '1ÆÑ', '1000ml', 1000);
insert into goods values ('N20', 'Noodle', 'Áø°£Àå', 5000, 'noodle20', '1Åë', '840ml', 1000);
insert into goods values ('N21', 'Noodle', 'µ·±î½º ¼Ò½º', 3280, 'noodle21', '1º´', '455g', 1000);
insert into goods values ('N22', 'Noodle', '±¼¼Ò½º', 3900, 'noodle22', '1º´', '725g', 1000);
insert into goods values ('N23', 'Noodle', '´ç¸é', 3980, 'noodle23', '1ºÀ', '300g', 1000);
insert into goods values ('N24', 'Noodle', '½ÄÃÊ', 2700, 'noodle24', '1º´', '500ml', 1000);
insert into goods values ('N25', 'Noodle', '´ÙÁø¸¶´Ã', 4900, 'noodle25', '1°³', '150g', 1000);
insert into goods values ('N26', 'Noodle', '¶ó¸é»ç¸®', 1580, 'noodle26', '1ºÀ', '110gx5°³ÀÔ', 1000);
insert into goods values ('N27', 'Noodle', 'ºÎÄ§°¡·ç', 2980, 'noodle27', '1ÆÑ', '1kg', 1000);
insert into goods values ('N28', 'Noodle', '°íÃßÀå', 9000, 'noodle28', '1°³', '1kg', 1000);
insert into goods values ('N29', 'Noodle', 'µÈÀå', 2050, 'noodle29', '1°³', '500g', 1000);
insert into goods values ('N30', 'Noodle', '¿Ã¸®°í´ç', 2800, 'noodle30', '1º´', '700g', 1000);
insert into goods values ('N31', 'Noodle', '½Ä¿ëÀ¯', 7510, 'noodle31', '1º´', '1.8L', 1000);
insert into goods values ('N32', 'Noodle', 'ººÀ½ Âü±ú', 3200, 'noodle32', '1º´', '120g', 1000);
insert into goods values ('N33', 'Noodle', '¼øÈÄÃß', 3340, 'noodle33', '1Äµ', '50g', 1000);  



-- Ã¤¼Ò
insert into goods values ('V1',	'Vegetable', '¾ÖÈ£¹Ú', '1480', 'veg1', '1°³', NULL, 1000);
insert into goods values ('V2',	'Vegetable', 'ÆØÀÌ¹ö¼¸', '1160', 'veg2', '1ºÀ', '2ÀÔ', 1000);
insert into goods values ('V3',	'Vegetable', 'ÂüÅ¸¸® ¹ö¼¸', '1050', 'veg3', '1°³', '200g', 1000);
insert into goods values ('V4',	'Vegetable', '¹«', '1450', 'veg4', '1Åë', '800g ÀÌ»ó', 1000);
insert into goods values ('V5',	'Vegetable', '²¢ÀÙ', '1090', 'veg5', '1ºÀ', '3¼Ó', 1000);
insert into goods values ('V6',	'Vegetable', '±ñ´ëÆÄ', '2590', 'veg6', '1ºÀ', '500g ³»¿Ü', 1000);
insert into goods values ('V7',	'Vegetable', '¾çÆÄ', '3600', 'veg7', '1¸Á', '1.8kg', 1000);
insert into goods values ('V8',	'Vegetable', '±ñ¸¶´Ã', '2990', 'veg8', '1ºÀ', '200g', 1000);
insert into goods values ('V9',	'Vegetable', '°¨ÀÚ', '6980', 'veg9', '1ºÀ', '1kg', 1000);
insert into goods values ('V10','Vegetable', '»õ¼ÛÀÌ¹ö¼¸', '2000', 'veg10', '1ºÀ', '400g', 1000);
     
insert into goods values ('V11','Vegetable', '´Ù´Ù±â¿ÀÀÌ', '2800', 'veg11', '1ºÀ', '3°³ÀÔ', 1000);
insert into goods values ('V12','Vegetable', '±¹»ê ºê·ÎÄÝ¸®', '2120', 'veg12', '1ºÀ', '1¼ÛÀÌ', 1000);
insert into goods values ('V13','Vegetable', 'ÆÄÇÁ¸®Ä«', '2480', 'veg13', '1ºÀ', '2ÀÔ', 1000);
insert into goods values ('V14','Vegetable', '¾ç»óÃß', '2590', 'veg14', '1Åë', '200g ÀÌ»ó', 1000);
insert into goods values ('V15','Vegetable', '´ç±Ù', '2990', 'veg15', '1ºÀÁö', '500g(2~4°³ÀÔ)', 1000);
insert into goods values ('V16','Vegetable', '´ëÆÄ', '2690', 'veg16', '1ºÀ', '1´Ü/1kg ÀÌ»ó', 1000);
insert into goods values ('V17','Vegetable', '¾Ë¹è±â ¹èÃß', '3990', 'veg17', '1Åë', NULL, 1000);
insert into goods values ('V18','Vegetable', '¾ç¹èÃß', '3790', 'veg18', '1Åë', '900g ³»¿Ü', 1000);
insert into goods values ('V19','Vegetable', 'ºÎÃß', '2220', 'veg19', '1ºÀ', '200g', 1000);
insert into goods values ('V20','Vegetable', 'Ã»¾ç°íÃß', '2280', 'veg20', '1ºÀ', '200g', 1000);
     
insert into goods values ('V21','Vegetable', 'Ã»»óÃß', '1480', 'veg21', '1ºÀ', '150g', 1000);
insert into goods values ('V22','Vegetable', '¹Ì³ª¸®', '4990', 'veg22', '1ºÀ', '200g', 1000);
insert into goods values ('V23','Vegetable', '½Ã±ÝÄ¡', '2190', 'veg23', '1ºÀÁö', '200g', 1000);
insert into goods values ('V24','Vegetable', '»ø·¯¸®', '2690', 'veg24', '1ºÀ', '500g', 1000);
insert into goods values ('V25','Vegetable', '°¡Áö', '2180', 'veg25', '1ºÀ', '2ÀÔ', 1000);
insert into goods values ('V26','Vegetable', '¹ã°í±¸¸¶', '4780', 'veg26', '1ºÀ', '800g', 1000);
insert into goods values ('V27','Vegetable', '¾ç¼ÛÀÌ¹ö¼¸', '3690', 'veg27', '1ÆÑ', '6~9ÀÔ', 1000);
insert into goods values ('V28','Vegetable', '¼÷ÁÖ³ª¹°', '1990', 'veg28', '1ºÀ', '200g', 1000);
insert into goods values ('V29','Vegetable', '·Î¸ÞÀÎ', '2990', 'veg29', '1ºÀ', '200g', 1000);
insert into goods values ('V30','Vegetable', 'Äá³ª¹°', '2600', 'veg30', '1ÆÑ', '340', 1000);

-- °úÀÏ
INSERT INTO goods VALUES 
('F1','Fruit','¹Ù³ª³ª','2980','fruit1','1ºÀ','1kg', 1000);
INSERT INTO goods VALUES 
('F2', 'Fruit','Âü¿Ü','14900','fruit2','1ºÀ','1.5kg', 1000);
INSERT INTO goods VALUES 
('F3','Fruit','»þÀÎ¸¶Åä','7980','fruit3','1ÆÑ','500g', 1000);
INSERT INTO goods VALUES 
('F4','Fruit','¹æ¿ïÅä¸¶Åä','4179','fruit4','1ÆÑ','500g', 1000);
INSERT INTO goods VALUES 
('F5','Fruit','¾Æº¸Ä«µµ','3240','fruit5','1°³','200g', 1000);
INSERT INTO goods VALUES 
('F6','Fruit','¿À·»Áö','7600','fruit6','1ºÀ','1kg', 1000);
INSERT INTO goods VALUES 
('F7','Fruit','ºí·çº£¸®','8091','fruit7','1ÆÑ','100g', 1000);
INSERT INTO goods VALUES 
('F8','Fruit','Ã»¼Û»ç°ú','7990','fruit8','1ºÀ','1kg', 1000);
INSERT INTO goods VALUES 
('F9','Fruit','¾ÖÇÃÃ»Æ÷µµ','9996','fruit9','1ÆÑ','500g', 1000);
INSERT INTO goods VALUES 
('F10','Fruit','¿Ï¼÷Åä¸¶Åä','8557','fruit10','1ÆÑ','2kg', 1000);
INSERT INTO goods VALUES 
('F11','Fruit','»çÆÄÀÌ¾îÆ÷µµ','8910','fruit11','1ÆÑ','500g', 1000);
INSERT INTO goods VALUES 
('F12','Fruit','½Å°í¹è','7900','fruit12','1ºÀ','1kg', 1000);
INSERT INTO goods VALUES 
('F13','Fruit','³Ãµ¿ºí·çº£¸®','8055','fruit13','1ÆÑ','1kg', 1000);
INSERT INTO goods VALUES 
('F14','Fruit','°ñµåÅ°À§','9900','fruit14','1ºÀ','800g', 1000);
INSERT INTO goods VALUES 
('F15','Fruit','ÄÆÆÃÆÄÀÎ¾ÖÇÃ','9800','fruit15','1ÆÑ','1kg', 1000);
INSERT INTO goods VALUES 
('F16','Fruit','È¥ÇÕÆ÷µµ','11430','fruit16','1ÆÑ','700g', 1000);
INSERT INTO goods VALUES 
('F17','Fruit','¾¾¾ø´ÂÃ»Æ÷µµ','6840','fruit17','1ÆÑ','500g', 1000);
INSERT INTO goods VALUES 
('F18','Fruit','ÀÚ¸ù','10900','fruit18','1ºÀ','1.8kg', 1000);
INSERT INTO goods VALUES 
('F19','Fruit','¼ºÁÖÂü¿Ü','12900','fruit19','1ºÀ','1.1kg', 1000);
INSERT INTO goods VALUES 
('F20','Fruit','ÆÄÀÎ¾ÖÇÃÃ»Å©','5480','fruit20','1ÆÑ','400g', 1000);
INSERT INTO goods VALUES 
('F21','Fruit','Ä«·ªÇâ','14800','fruit21','1ÆÑ','1.4kg', 1000);
INSERT INTO goods VALUES 
('F22','Fruit','¹«Áö°³¸Á°í','10900','fruit22','1ÆÑ','650g', 1000);
INSERT INTO goods VALUES 
('F23','Fruit','³Ãµ¿¾ÖÇÃ¸Á°í','7225','fruit23','1ºÀ','1kg', 1000);
INSERT INTO goods VALUES 
('F24','Fruit','¼¼Áö¸á·Ð','16900','fruit24','1Åë','1.2kg', 1000);
INSERT INTO goods VALUES 
('F25','Fruit','ÄÆÆÃ°úÀÏ','2490','fruit25','1ÆÑ','150g', 1000);
INSERT INTO goods VALUES 
('F26','Fruit','ÆÒ½Ã·¹¸ó','2565','fruit26','1ÆÑ','300g', 1000);
INSERT INTO goods VALUES 
('F27','Fruit','³Ãµ¿µþ±â','7110','fruit27','1ÆÑ','1kg', 1000);
INSERT INTO goods VALUES 
('F28','Fruit','Àû¿ë°ú','3960','fruit28','1ÆÑ','450g', 1000);

-- ÇØ»ê¹°
INSERT INTO GOODS
VALUES ( 'S1', 'Seafood', '°íµî¾î', '3900', 'seafood1', '1ÆÑ', '250g', 1000 );
INSERT INTO GOODS
VALUES ( 'S2', 'Seafood', '°¥Ä¡', '11100', 'seafood2', '1ÆÑ', '350g', 1000 );
INSERT INTO GOODS
VALUES ( 'S3', 'Seafood', 'µ¿ÅÂ', '5900', 'seafood3', '1ÆÑ', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S4', 'Seafood', '»ïÄ¡', '6500', 'seafood4', '1ÆÑ', '450g', 1000 );
INSERT INTO GOODS
VALUES ( 'S5', 'Seafood', 'Àå¾î', '22000', 'seafood5', '1ÆÑ', '240g', 1000 );
INSERT INTO GOODS
VALUES ( 'S6', 'Seafood', '¾Æ±Í', '16900', 'seafood6', '1ÆÑ', '1000g', 1000 );
INSERT INTO GOODS
VALUES ( 'S7', 'Seafood', '´ë±¸', '11997', 'seafood7', '1ÆÑ', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S8', 'Seafood', 'µµ´Ù¸®', '16900', 'seafood8', '1¸¶¸®', '400g', 1000 );
INSERT INTO GOODS
VALUES ( 'S9', 'Seafood', '°¡ÀÚ¹Ì', '6500', 'seafood9', '1ÆÑ', '350g', 1000 );
INSERT INTO GOODS
VALUES ( 'S10', 'Seafood', 'º´¾î', '9990', 'seafood10', '1ÆÑ', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S11', 'Seafood', '¿¬¾î', '22900', 'seafood11', '1ÆÑ', '400g', 1000 );
INSERT INTO GOODS
VALUES ( 'S12', 'Seafood', '¿ÀÂ¡¾î', '12900', 'seafood12', '1ÆÑ', '400g', 1000 );
INSERT INTO GOODS
VALUES ( 'S13', 'Seafood', '³«Áö', '19900', 'seafood13', '1ÆÑ', '240g', 1000 );
INSERT INTO GOODS
VALUES ( 'S14', 'Seafood', 'ÂÞ²Ù¹Ì', '19710', 'seafood14', '1ÆÑ', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S15', 'Seafood', '¹®¾î', '22500', 'seafood15', '1¸¶¸®', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S16', 'Seafood', '¹ÙÁö¶ô', '7500', 'seafood16', '1ÆÑ', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S17', 'Seafood', '±¼', '4500', 'seafood17', '1ÆÑ', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S18', 'Seafood', '²¿¸·', '8900', 'seafood18', '1ÆÑ', '1000g', 1000 );
INSERT INTO GOODS
VALUES ( 'S19', 'Seafood', 'Àüº¹', '25000', 'seafood19', '1ÆÑ', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S20', 'Seafood', '¸Û°Ô', '9160', 'seafood20', '1ÆÑ', '260g', 1000 );
INSERT INTO GOODS
VALUES ( 'S21', 'Seafood', 'ÇØ»ï', '11439', 'seafood21', '1ÆÑ', '300g', 1000 );
INSERT INTO GOODS
VALUES ( 'S22', 'Seafood', '¸íÅÂ¾Ë', '6500', 'seafood22', '1ÆÑ', '250g', 1000 );
INSERT INTO GOODS
VALUES ( 'S23', 'Seafood', '²É°Ô', '59900', 'seafood23', '1ÆÑ', '950g', 1000 );
INSERT INTO GOODS
VALUES ( 'S24', 'Seafood', '»õ¿ì', '9900', 'seafood24', '1ÆÑ', '300g', 1000 );
INSERT INTO GOODS
VALUES ( 'S25', 'Seafood', '»õ¿ì»ì', '6640', 'seafood25', '1ÆÑ', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S26', 'Seafood', '¿ì··', '5600', 'seafood26', '1ÆÑ', '180g', 1000 );
INSERT INTO GOODS
VALUES ( 'S27', 'Seafood', 'È²ÅÂ', '5500', 'seafood27', '1ÆÑ', '280g', 1000 );
INSERT INTO GOODS
VALUES ( 'S28', 'Seafood', '¸êÄ¡', '9900', 'seafood28', '1ÆÑ', '600g', 1000 );
INSERT INTO GOODS
VALUES ( 'S29', 'Seafood', '¹Ì¿ª', '8900', 'seafood29', '1ÆÑ', '130g', 1000 );
INSERT INTO GOODS
VALUES ( 'S30', 'Seafood', '´Ù½Ã¸¶', '6900', 'seafood30', '1ÆÑ', '200g', 1000 );

-- cart Å×ÀÌºí »ý¼º
create table cart
(  num NUMBER(6) PRIMARY KEY,
    userid VARCHAR2(10),
    gCode varchar2(20) not null,
    gName varchar2(50) not null,
    gPrice NUMBER(6) not null,
    gAmount NUMBER(2) not null,
    gImage varchar2(20) not null
);   
  
   
create sequence cart_seq;

-- Member table »ý¼º
create table member
(
  userid varchar2(10) primary key,
  passwd varchar2(10) not null,
  username varchar2(10) not null,
  post varchar2(6) not null,
  addr1 varchar2(500) not null,
  addr2 varchar2(500) not null,
  phone1 varchar2(3) not null,
  phone2 varchar2(4) not null,
  phone3 varchar2(4) not null,
  email1 varchar2(20) not null,
  email2 varchar2(20) not null
);

-- orderInfo Å×ÀÌºí »ý¼º
create table orderInfo
  (  num NUMBER(6) PRIMARY KEY,
     userid VARCHAR2(10),
     gCode varchar2(20) not null,
     gName varchar2(50) not null,
     gPrice NUMBER(6) not null,
     gAmount NUMBER(2) not null,
     gImage varchar2(20) not null,
     orderName VARCHAR2(10) NOT NULL,
     post VARCHAR2(5) NOT NULL,
     addr1 VARCHAR2(500) NOT NULL,
     addr2 VARCHAR2(500) NOT NULL,
     phone VARCHAR2(11) NOT NULL,
     payMethod VARCHAR2(10) NOT NULL,
     orderDay DATE  DEFAULT SYSDATE
  );   
  alter table orderInfo
  add CONSTRAINT orderInfo_userid_fk FOREIGN KEY(userid)
   REFERENCES member(userid) ON DELETE CASCADE;
   
   
  alter table orderInfo
  add CONSTRAINT orderInfo_gCode_fk FOREIGN KEY(gCode)
   REFERENCES goods(gCode) ON DELETE CASCADE; 
   
   create sequence orderInfo_seq;
   
-- µ¥ÀÌÅÍÇü½Ä ¼öÁ¤
ALTER TABLE orderInfo
MODIFY ( paymethod VARCHAR2(30) );


-- Notice(°øÁö»çÇ×) Å×ÀÌºí »ý¼º
create table Notice
(  num NUMBER(6) PRIMARY KEY,
    writeDay DATE  DEFAULT SYSDATE,
    title varchar2(500),
    contents varchar2(3900)
);   
-- °øÁö»çÇ× °Ô½ÃÆÇ ¹øÈ£ ½ÃÄö½º »ý¼º
create sequence notice_seq;

-- QA(1:1¹®ÀÇ) Å×ÀÌºí »ý¼º
create table QA
(  num NUMBER(6) PRIMARY KEY,
    category varchar2(20),
    writeDay DATE  DEFAULT SYSDATE,
    title varchar2(500),
    contents varchar2(3900),
    userid  varchar2(20)
);   
   
alter table QA
add CONSTRAINT QA_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;

-- 1:1¹®ÀÇ °Ô½ÃÆÇ ¹øÈ£ ½ÃÄö½º »ý¼º
create sequence QA_seq;

-- QA(1:1¹®ÀÇ) Å×ÀÌºí ´äº¯ ¼Ó¼º Ãß°¡
ALTER TABLE QA
add answer VARCHAR(3900);


-- cart¿¡ userid FK Ãß°¡
alter table cart
add CONSTRAINT cart_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;
   
alter table cart
add CONSTRAINT cart_gCode_fk FOREIGN KEY(gCode)
REFERENCES goods(gCode) ON DELETE CASCADE;  
