-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: course_pick_sys
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `ano` char(10) NOT NULL,
  `password` char(10) DEFAULT NULL,
  `aname` char(10) DEFAULT NULL,
  PRIMARY KEY (`ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('2017','2','路明非');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b107`
--

DROP TABLE IF EXISTS `b107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `b107` (
  `seat_no` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` char(3) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '绌洪棽',
  PRIMARY KEY (`seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b107`
--

LOCK TABLES `b107` WRITE;
/*!40000 ALTER TABLE `b107` DISABLE KEYS */;
INSERT INTO `b107` VALUES ('B107001',NULL),('B107002',NULL),('B107003',NULL),('B107004',NULL),('B107005',NULL),('B107006',NULL),('B107007',NULL),('B107008',NULL),('B107009',NULL),('B107010',NULL),('B107011',NULL),('B107012',NULL),('B107013',NULL),('B107014',NULL),('B107015',NULL),('B107016',NULL),('B107017',NULL),('B107018',NULL),('B107019',NULL),('B107020',NULL),('B107021',NULL),('B107022',NULL),('B107023',NULL),('B107024',NULL),('B107025',NULL),('B107026',NULL),('B107027',NULL),('B107028',NULL),('B107029',NULL),('B107030',NULL),('B107031',NULL),('B107032',NULL),('B107033',NULL),('B107034',NULL),('B107035',NULL),('B107036',NULL),('B107037',NULL),('B107038',NULL),('B107039',NULL),('B107040',NULL),('B107041',NULL),('B107042',NULL),('B107043',NULL),('B107044',NULL),('B107045',NULL),('B107046',NULL),('B107047',NULL),('B107048',NULL),('B107049',NULL),('B107050',NULL);
/*!40000 ALTER TABLE `b107` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c310`
--

DROP TABLE IF EXISTS `c310`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c310` (
  `seat_no` char(7) NOT NULL DEFAULT '',
  `state` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c310`
--

LOCK TABLES `c310` WRITE;
/*!40000 ALTER TABLE `c310` DISABLE KEYS */;
INSERT INTO `c310` VALUES ('C310001',NULL),('C310002',NULL),('C310003',NULL),('C310004',NULL),('C310005',NULL),('C310006',NULL),('C310007',NULL),('C310008',NULL),('C310009',NULL),('C310010',NULL),('C310011',NULL),('C310012',NULL),('C310013',NULL),('C310014',NULL),('C310015',NULL),('C310016',NULL),('C310017',NULL),('C310018',NULL),('C310019',NULL),('C310020',NULL),('C310021',NULL),('C310022',NULL),('C310023',NULL),('C310024',NULL),('C310025',NULL),('C310026',NULL),('C310027',NULL),('C310028',NULL),('C310029',NULL),('C310030',NULL),('C310031',NULL),('C310032',NULL),('C310033',NULL),('C310034',NULL),('C310035',NULL),('C310036',NULL),('C310037',NULL),('C310038',NULL),('C310039',NULL),('C310040',NULL),('C310041',NULL),('C310042',NULL),('C310043',NULL),('C310044',NULL),('C310045',NULL),('C310046',NULL),('C310047',NULL),('C310048',NULL),('C310049',NULL),('C310050',NULL),('C310051',NULL),('C310052',NULL),('C310053',NULL),('C310054',NULL),('C310055',NULL),('C310056',NULL),('C310057',NULL),('C310058',NULL),('C310059',NULL),('C310060',NULL),('C310061',NULL),('C310062',NULL),('C310063',NULL),('C310064',NULL),('C310065',NULL),('C310066',NULL),('C310067',NULL),('C310068',NULL),('C310069',NULL),('C310070',NULL),('C310071',NULL),('C310072',NULL),('C310073',NULL),('C310074',NULL),('C310075',NULL),('C310076',NULL),('C310077',NULL),('C310078',NULL),('C310079',NULL),('C310080',NULL),('C310081',NULL),('C310082',NULL),('C310083',NULL),('C310084',NULL),('C310085',NULL),('C310086',NULL),('C310087',NULL),('C310088',NULL),('C310089',NULL),('C310090',NULL),('C310091',NULL),('C310092',NULL),('C310093',NULL),('C310094',NULL),('C310095',NULL),('C310096',NULL),('C310097',NULL),('C310098',NULL),('C310099',NULL),('C310100',NULL),('C310101',NULL),('C310102',NULL),('C310103',NULL),('C310104',NULL),('C310105',NULL),('C310106',NULL),('C310107',NULL),('C310108',NULL),('C310109',NULL),('C310110',NULL),('C310111',NULL),('C310112',NULL),('C310113',NULL),('C310114',NULL),('C310115',NULL),('C310116',NULL),('C310117',NULL),('C310118',NULL),('C310119',NULL),('C310120',NULL);
/*!40000 ALTER TABLE `c310` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `choice` (
  `sno` char(12) NOT NULL,
  `choose_id` char(16) NOT NULL,
  `cno` char(9) DEFAULT NULL,
  `score` smallint(11) DEFAULT NULL,
  PRIMARY KEY (`sno`,`choose_id`),
  KEY `choose_id` (`choose_id`),
  KEY `cno` (`cno`),
  CONSTRAINT `choice_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `students` (`sno`) ON DELETE CASCADE,
  CONSTRAINT `choice_ibfk_2` FOREIGN KEY (`choose_id`) REFERENCES `teaching` (`choose_id`) ON DELETE CASCADE,
  CONSTRAINT `choice_ibfk_3` FOREIGN KEY (`cno`) REFERENCES `courses` (`cno`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES ('2017010101','2019-160100101-1','160100101',98),('2017010101','2019-160100104-1','160100104',NULL),('201701010102','2019-160100101-1','160100101',70),('201701010102','2019-160100102-1','160100102',80),('201701010102','2019-160100103-1','160100103',60),('201701010102','2019-160100104-1','160100104',NULL),('201701010102','2019-160800101-1','160800101',70),('201701010102','2019-160800102-1','160800102',82),('201701010102','2019-160800103-1','160800103',85),('201701010102','2019-160800105-1','160800105',NULL),('201724010206','2019-160100102-1','160100102',100);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `choice_1` BEFORE INSERT ON `choice` FOR EACH ROW begin
update teaching set scale=scale-1 where new.choose_id like choose_id;
end */;;
DELIMITER ;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `choice_2` AFTER DELETE ON `choice` FOR EACH ROW begin
update teaching set scale=scale+1 where old.choose_id like choose_id;
end */;;
DELIMITER ;

--
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classrooms` (
  `rno` char(4) NOT NULL,
  `seat_num` int(11) NOT NULL,
  `class_time` varchar(255) DEFAULT NULL,
  `kind` char(10) DEFAULT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES ('A101',120,NULL,'多媒体教室'),('A103',150,NULL,'多媒体教室'),('A105',50,NULL,'多媒体教室'),('A107',120,NULL,'多媒体教室'),('A109',150,NULL,'多媒体教室'),('A111',50,NULL,'多媒体教室'),('A113',120,NULL,'多媒体教室'),('A115',150,NULL,'多媒体教室'),('A117',50,NULL,'多媒体教室'),('A119',120,NULL,'多媒体教室'),('A121',150,NULL,'多媒体教室'),('A123',50,NULL,'多媒体教室'),('A125',120,NULL,'多媒体教室'),('A127',150,NULL,'多媒体教室'),('B101',50,NULL,'多媒体教室'),('B103',120,NULL,'多媒体教室'),('B105',150,NULL,'多媒体教室'),('B107',50,NULL,'多媒体教室'),('B109',120,NULL,'多媒体教室'),('B111',150,NULL,'多媒体教室'),('B113',50,NULL,'多媒体教室'),('B115',120,NULL,'多媒体教室'),('B117',150,NULL,'多媒体教室'),('B119',50,NULL,'多媒体教室'),('B121',120,NULL,'多媒体教室'),('B123',150,NULL,'多媒体教室'),('B125',50,NULL,'多媒体教室'),('B127',120,NULL,'多媒体教室'),('C105',150,NULL,'多媒体教室'),('C108',50,NULL,'多媒体教室'),('C111',120,NULL,'多媒体教室'),('C114',150,NULL,'多媒体教室'),('C117',50,NULL,'多媒体教室'),('C120',120,NULL,'多媒体教室'),('C123',150,NULL,'多媒体教室'),('C126',50,NULL,'多媒体教室'),('C129',120,NULL,'多媒体教室'),('C132',150,NULL,'多媒体教室'),('C135',50,NULL,'多媒体教室'),('C138',120,NULL,'多媒体教室'),('C141',150,NULL,'多媒体教室'),('C144',50,NULL,'多媒体教室'),('C205',120,NULL,'多媒体教室'),('C208',150,NULL,'多媒体教室'),('C211',50,NULL,'多媒体教室'),('C214',120,NULL,'多媒体教室'),('C217',150,NULL,'多媒体教室'),('C220',50,NULL,'多媒体教室'),('C223',120,NULL,'多媒体教室'),('C226',150,NULL,'多媒体教室'),('C229',50,NULL,'多媒体教室'),('C232',120,NULL,'多媒体教室'),('C235',150,NULL,'多媒体教室'),('C238',50,NULL,'多媒体教室'),('C301',120,NULL,'多媒体教室'),('C304',150,NULL,'多媒体教室'),('C307',50,NULL,'多媒体教室'),('C310',120,NULL,'多媒体教室'),('C313',150,NULL,'多媒体教室'),('C316',50,NULL,'多媒体教室'),('C319',120,NULL,'多媒体教室'),('C322',150,NULL,'多媒体教室'),('C325',50,NULL,'多媒体教室'),('C328',120,NULL,'多媒体教室'),('C331',150,NULL,'多媒体教室'),('C334',50,NULL,'多媒体教室');
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses` (
  `cno` char(9) NOT NULL,
  `cname` char(15) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `precourse` char(9) DEFAULT NULL,
  PRIMARY KEY (`cno`),
  KEY `precourse` (`precourse`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`precourse`) REFERENCES `courses` (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('160100101','现代汉语（1）',2,NULL),('160100102','现代汉语（2）',3,'160100101'),('160100103','普通逻辑学',3,NULL),('160100104','文学概论（1）',1,NULL),('160100105','文学概论（2）',3,'160100104'),('160200101','社会学',3,NULL),('160200102','政治学',4,NULL),('160200103','经济学原理',3,NULL),('160200104','文化学概论',3,NULL),('160210201','中国近现代社会发展史',3,'160200101'),('160310201','中国古代史（1）',3,NULL),('160310202','中国古代史（2）',3,'160310201'),('160310203','中国历史要籍（1）',3,NULL),('160310204','中国历史要籍（2）',3,'160310203'),('160310205','世界古代中世纪史',3,NULL),('160800101','数学分析（1）',5,NULL),('160800102','高等代数（1）',4,NULL),('160800103','解析几何',4,NULL),('160800104','数学分析（2）',6,'160800101'),('160800105','高等代数（2）',5,'160800102'),('161500001','大学体育（1）',1,NULL),('161500002','大学体育（2）',1,'161500001'),('161500003','大学体育（3）',1,'161500002'),('161500004','大学体育（4）',1,'161500003');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `dname` char(20) NOT NULL,
  `dno` int(11) NOT NULL,
  PRIMARY KEY (`dname`,`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('体育学院',15),('信息科学与工程学院',11),('化学化工与材料科学学院',10),('历史与社会发展学院',3),('商学院',22),('地理与环境学院',14),('心理学院',25),('数学与统计学院',8),('文学院',1),('新闻与传媒学院',12),('法学院',28),('物理与电子科学院',9),('生命科学院',13),('经济学院',27),('美术学院',7),('音乐学院',6),('马克思主义学院',2);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `sno` char(12) NOT NULL,
  `sname` char(10) DEFAULT NULL,
  `sdepartment` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` char(10) DEFAULT '123456',
  `state` char(10) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `department` (`sdepartment`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`sdepartment`) REFERENCES `departments` (`dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('01','张','音乐学院','123456','在校'),('02','奥力给','新闻与传媒学院','123456','在校'),('2017010101','小明','马克思主义学院','123456','在校'),('201701010102','李思怡','新闻与传媒学院','1','在校'),('201701010103','杨岳','新闻与传媒学院','12','在校'),('201701010104','许少琦','新闻与传媒学院','4','在校'),('201701010105','王承坤','新闻与传媒学院','5','在校'),('201701010106','刘佳妮','新闻与传媒学院','6','在校'),('201701010107','吴梦茹','新闻与传媒学院','7','在校'),('201701010108','焦家琪','新闻与传媒学院','8','在校'),('201701010109','李雨欣','新闻与传媒学院','9','在校'),('201701010110','丁天丽','新闻与传媒学院','10','退学'),('201701010111','王晓鑫','新闻与传媒学院','11','退学'),('201701010112','侯洁','新闻与传媒学院','12','在校'),('201701010113','张家绮','新闻与传媒学院',NULL,'在校'),('201701990242','翟梓艺','文学院',NULL,NULL),('201701990243','李雯婷','文学院',NULL,NULL),('201701990244','李可心','文学院',NULL,NULL),('201701990245','姜婷','文学院',NULL,NULL),('201701990246','密晓鑫','文学院',NULL,NULL),('201701990247','宁芳艳','文学院',NULL,NULL),('201702990135','钱瑞艳','马克思主义学院',NULL,'退学'),('201702990136','山昕琳','马克思主义学院',NULL,NULL),('201702990137','程晓娟','马克思主义学院',NULL,NULL),('201703010103','周郁林','历史与社会发展学院',NULL,NULL),('201703010105','周冰帅','历史与社会发展学院',NULL,NULL),('201703010121','黄俊轩','历史与社会发展学院',NULL,NULL),('201703010130','田凯文','历史与社会发展学院',NULL,NULL),('201703010137','刘和','历史与社会发展学院',NULL,NULL),('201703010142','刘培源','历史与社会发展学院',NULL,NULL),('201704','李','马克思主义学院','123456','在校'),('201706010101','杨琳','音乐学院',NULL,NULL),('201706100431','刘翔天','音乐学院',NULL,NULL),('201706100432','赵珂','音乐学院',NULL,NULL),('201706100433','孙鹏瑞','音乐学院',NULL,NULL),('201706100434','王建辉','音乐学院',NULL,NULL),('201706100435','刘政','音乐学院',NULL,NULL),('201707030414','江婀娜','美术学院',NULL,NULL),('201707030415','杨洋','美术学院',NULL,NULL),('201707030416','任昊喆','美术学院',NULL,NULL),('201707030417','王梓又','美术学院',NULL,NULL),('201707030418','陈洋洋','美术学院',NULL,NULL),('201708990148','陈晨','数学与统计学院',NULL,NULL),('201708990149','高敏','数学与统计学院',NULL,NULL),('201708990150','陈传林','数学与统计学院',NULL,NULL),('201710','徐奥话','马克思主义学院','123456','在校'),('201710990152','高阳','化学化工与材料科学学院',NULL,NULL),('201711990139','程培栋','信息科学与工程学院',NULL,NULL),('201711990140','郑彤','信息科学与工程学院',NULL,NULL),('201711990141','郭文','信息科学与工程学院',NULL,NULL),('201711990142','陈妍孜','信息科学与工程学院',NULL,NULL),('201711990143','王晓雨','信息科学与工程学院',NULL,NULL),('201711990145','邓安都','信息科学与工程学院',NULL,NULL),('201712100163','袁亚茹','新闻与传媒学院',NULL,NULL),('201712100165','雷坤超','新闻与传媒学院',NULL,NULL),('201712100166','万琦','新闻与传媒学院',NULL,NULL),('201712100167','周倩','新闻与传媒学院',NULL,NULL),('201712100168','董露露','新闻与传媒学院',NULL,NULL),('201712100169','梁昕玥','新闻与传媒学院',NULL,NULL),('201712100170','李红艳','新闻与传媒学院',NULL,NULL),('201712100171','王博源','新闻与传媒学院',NULL,NULL),('201712100172','蒋博','新闻与传媒学院',NULL,NULL),('201712100173','钱思怡','新闻与传媒学院',NULL,NULL),('201712100174','汪晓菲','新闻与传媒学院',NULL,NULL),('201712100175','朱颖','新闻与传媒学院',NULL,NULL),('201712100176','李春雨','新闻与传媒学院',NULL,NULL),('201712100177','安楠','新闻与传媒学院',NULL,NULL),('201712100178','王艳艳','新闻与传媒学院',NULL,NULL),('201712100180','杨兆颖','新闻与传媒学院',NULL,NULL),('201714010113','郭梦琦','地理与环境学院',NULL,NULL),('201714010114','窦乾荣','地理与环境学院',NULL,NULL),('201714010553','王洁','地理与环境学院',NULL,NULL),('201714010554','林婧','地理与环境学院',NULL,NULL),('201714020101','李亦璇','地理与环境学院',NULL,NULL),('201714020102','李红玉','地理与环境学院',NULL,NULL),('201714020103','杜金晖','地理与环境学院',NULL,NULL),('201714020104','盖昱含','地理与环境学院',NULL,NULL),('201714020105','王芽琦','地理与环境学院',NULL,NULL),('201714020106','李佩瑶','地理与环境学院',NULL,NULL),('201714020107','朱丙连','地理与环境学院',NULL,NULL),('201714020108','郑天昊','地理与环境学院',NULL,NULL),('201714020109','陈慧莹','地理与环境学院',NULL,NULL),('201714020110','刘振新宇','地理与环境学院',NULL,NULL),('201714990150','杨梦琪','地理与环境学院',NULL,NULL),('201715010521','贾传浩','体育学院',NULL,NULL),('201715030112','王翔宇','体育学院',NULL,NULL),('201715040116','法晓锋','体育学院',NULL,NULL),('201715040117','孙德福','体育学院',NULL,NULL),('201715040125','张泽龙','体育学院',NULL,NULL),('201715040215','杨成杰','体育学院',NULL,NULL),('2017240102','王明','马克思主义学院','123456','在校'),('201724010201','刘哲','文学院','123456','在校'),('201724010206','马驰','音乐学院','2',NULL),('201724010207','小明','文学院','123456','在校'),('201724010208','小王','文学院','123456','在校'),('201724010209','小张','文学院','123456','在校'),('201724010249','王彬','文学院','123456','在校'),('201725010440','周梦菲','心理学院',NULL,NULL),('201725010442','朱畅','心理学院',NULL,NULL),('201725010443','朱汉昇','心理学院',NULL,NULL),('201727010424','王菲菲','经济学院',NULL,NULL),('201727010428','孙芮','经济学院',NULL,NULL),('201727010438','赵钰倩','经济学院',NULL,NULL),('201728010134','唐孟岩','法学院',NULL,NULL),('201728010234','唐秀颀','法学院',NULL,NULL),('201728010409','董昌瑶','法学院',NULL,NULL),('201728010412','杨成','法学院',NULL,NULL),('201728010505','王经纬','法学院',NULL,NULL),('201728010626','杨文静','法学院',NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studentview`
--

DROP TABLE IF EXISTS `studentview`;
/*!50001 DROP VIEW IF EXISTS `studentview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `studentview` AS SELECT 
 1 AS `cno`,
 1 AS `cname`,
 1 AS `credit`,
 1 AS `tname`,
 1 AS `tdepartment`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teachers` (
  `tno` char(9) NOT NULL,
  `tname` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` char(5) DEFAULT NULL,
  `tdepartment` char(20) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  PRIMARY KEY (`tno`),
  KEY `tdepartment` (`tdepartment`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`tdepartment`) REFERENCES `departments` (`dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('201701001','史珍香','教授','文学院','2'),('201702002','周伊婉','副教授','文学院','2'),('201703003','史一刚','教授','历史与社会发展学院','3'),('201704004','魏腾','副教授','数学与统计学院','4'),('201705005','夏虎仁','副教授','历史与社会发展学院','5'),('201706006','甄陶艳','讲师','历史与社会发展学院','6'),('201707007','史一坨','讲师','马克思主义学院','7'),('201708008','夏克','讲师','马克思主义学院','8'),('201709009','尚克','副教授','马克思主义学院','9'),('201710010','曹尼玛','教授','数学与统计学院','10'),('201711011','史人','讲师','数学与统计学院',NULL),('201712012','袁某人','讲师','数学与统计学院',NULL);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `teacherview`
--

DROP TABLE IF EXISTS `teacherview`;
/*!50001 DROP VIEW IF EXISTS `teacherview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `teacherview` AS SELECT 
 1 AS `cno`,
 1 AS `cname`,
 1 AS `scale`,
 1 AS `number`,
 1 AS `credit`,
 1 AS `course_room`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teaching`
--

DROP TABLE IF EXISTS `teaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teaching` (
  `choose_id` char(16) NOT NULL,
  `cno` char(9) NOT NULL,
  `teacher` char(9) NOT NULL,
  `course_time` varchar(255) NOT NULL,
  `scale` int(11) NOT NULL,
  `course_room` char(4) NOT NULL,
  PRIMARY KEY (`choose_id`),
  UNIQUE KEY `teacher` (`teacher`,`course_time`),
  UNIQUE KEY `teacher_2` (`teacher`,`course_time`),
  KEY `cno` (`cno`),
  KEY `course_room` (`course_room`),
  CONSTRAINT `teaching_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `courses` (`cno`),
  CONSTRAINT `teaching_ibfk_2` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`tno`),
  CONSTRAINT `teaching_ibfk_3` FOREIGN KEY (`course_room`) REFERENCES `classrooms` (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching`
--

LOCK TABLES `teaching` WRITE;
/*!40000 ALTER TABLE `teaching` DISABLE KEYS */;
INSERT INTO `teaching` VALUES ('2019-160100101-1','160100101','201701001','',97,'A119'),('2019-160100102-1','160100102','201702002','',120,'A127'),('2019-160100103-1','160100103','201703003','',88,'B127'),('2019-160100104-1','160100104','201704004','',45,'C220'),('2019-160800101-1','160800101','201708008','',98,'B127'),('2019-160800102-1','160800102','201709009','',122,'C105'),('2019-160800103-1','160800103','201710010','',33,'C108'),('2019-160800104-1','160800104','201711011','',110,'C111'),('2019-160800105-1','160800105','201712012','',129,'C114'),('2019-160800106-1','161500004','201701001','1',100,'C111');
/*!40000 ALTER TABLE `teaching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `studentview`
--

/*!50001 DROP VIEW IF EXISTS `studentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentview` AS select `courses`.`cno` AS `cno`,`courses`.`cname` AS `cname`,`courses`.`credit` AS `credit`,`teachers`.`tname` AS `tname`,`teachers`.`tdepartment` AS `tdepartment` from ((`courses` join `teaching`) join `teachers`) where ((`courses`.`cno` = `teaching`.`cno`) and (`teaching`.`teacher` = `teachers`.`tno`) and (not(`courses`.`cno` in (select `choice`.`cno` from `choice` where (`choice`.`sno` = '201724010206'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacherview`
--

/*!50001 DROP VIEW IF EXISTS `teacherview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacherview` AS select `courses`.`cno` AS `cno`,`courses`.`cname` AS `cname`,`teaching`.`scale` AS `scale`,count(0) AS `number`,`courses`.`credit` AS `credit`,`teaching`.`course_room` AS `course_room` from ((`teaching` join `courses`) join `choice`) where ((`teaching`.`cno` = `courses`.`cno`) and (`teaching`.`choose_id` = `choice`.`choose_id`) and (`teaching`.`teacher` = '2017101001 ')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-19 14:42:01
