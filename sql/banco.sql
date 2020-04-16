-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: restaurante
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `admicao`
--

DROP TABLE IF EXISTS `admicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admicao` (
  `admDataAdmicao` date DEFAULT NULL,
  `admDataSaida` date DEFAULT NULL,
  `admUniforme` int(11) DEFAULT NULL,
  `admNumCartao` int(11) DEFAULT NULL,
  `admSalario` float DEFAULT NULL,
  `adm_empCodigo` int(11) NOT NULL,
  `adm_funCodigo` int(11) NOT NULL,
  `adm_carCodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`adm_empCodigo`,`adm_funCodigo`),
  KEY `fk_admicao_funcionario1_idx` (`adm_funCodigo`),
  KEY `fk_admicao_cargo` (`adm_carCodigo`),
  CONSTRAINT `fk_admicao_cargo1` FOREIGN KEY (`adm_carCodigo`) REFERENCES `cargo` (`carCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_admicao_empresa1` FOREIGN KEY (`adm_empCodigo`) REFERENCES `empresa` (`empCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_admicao_funcionario1` FOREIGN KEY (`adm_funCodigo`) REFERENCES `funcionario` (`funCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admicao`
--

LOCK TABLES `admicao` WRITE;
/*!40000 ALTER TABLE `admicao` DISABLE KEYS */;
INSERT INTO `admicao` VALUES ('2020-04-03',NULL,0,923448703,1200,2,1,1);
/*!40000 ALTER TABLE `admicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `caiCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `caiData` date DEFAULT NULL,
  `caiIn` time DEFAULT NULL,
  `caiOut` time DEFAULT NULL,
  `caiTrocoIn` float DEFAULT NULL,
  `caiTrocoFin` float DEFAULT NULL,
  `caiStatus` varchar(45) DEFAULT NULL,
  `cai_funCodigo` int(11) NOT NULL,
  `cai_empCodigo` int(11) NOT NULL,
  PRIMARY KEY (`caiCodigo`),
  KEY `fk_caixa_funcionario1_idx` (`cai_funCodigo`),
  KEY `fk_caixa_empresa1_idx` (`cai_empCodigo`),
  CONSTRAINT `fk_caixa_empresa1` FOREIGN KEY (`cai_empCodigo`) REFERENCES `empresa` (`empCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caixa_funcionario1` FOREIGN KEY (`cai_funCodigo`) REFERENCES `funcionario` (`funCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,NULL,NULL,'22:02:17',0,155.7,'fechado',1,2);
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `carCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `carNome` varchar(45) DEFAULT NULL,
  `carAtribuicao` text,
  `carRequisitos` text,
  `carPermicao` text,
  PRIMARY KEY (`carCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'ADM','DONO','PROPRIETARIO','ADM'),(2,'Garcom','servir','maior de 18','GARCOM');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cliCodigo` int(11) NOT NULL,
  `cliNome` varchar(45) NOT NULL,
  `cliEmail` text NOT NULL,
  `cliCPF` varchar(14) NOT NULL,
  `cliCelular` varchar(14) NOT NULL,
  `cliCEP` varchar(45) DEFAULT NULL,
  `cliCidade` varchar(45) DEFAULT NULL,
  `cliEndereco` text,
  `cliNumero` text,
  `cliLatitude` float DEFAULT NULL,
  `cliLongitude` float DEFAULT NULL,
  `cliFoto` longblob,
  `cliSenha` text NOT NULL,
  `cli_endCodigo` int(11) NOT NULL,
  PRIMARY KEY (`cliCodigo`),
  KEY `fk_cliente_endereco1_idx` (`cli_endCodigo`),
  CONSTRAINT `fk_cliente_endereco1` FOREIGN KEY (`cli_endCodigo`) REFERENCES `endereco` (`endCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa`
--

DROP TABLE IF EXISTS `despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa` (
  `disCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `disNome` text,
  `disDescricao` text,
  `disPreco` float DEFAULT NULL,
  PRIMARY KEY (`disCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
INSERT INTO `despesa` VALUES (1,'selcio','Fornecedor',50),(2,'DANIEL','Freelancer',10);
/*!40000 ALTER TABLE `despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa_dia`
--

DROP TABLE IF EXISTS `despesa_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa_dia` (
  `ded_disCodigo` int(11) NOT NULL,
  `ded_caiCodigo` int(11) NOT NULL,
  KEY `fk_despesa_has_caixa_caixa1_idx` (`ded_caiCodigo`),
  KEY `fk_despesa_has_caixa_despesa1_idx` (`ded_disCodigo`),
  CONSTRAINT `fk_despesa_has_caixa_caixa1` FOREIGN KEY (`ded_caiCodigo`) REFERENCES `caixa` (`caiCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_despesa_has_caixa_despesa1` FOREIGN KEY (`ded_disCodigo`) REFERENCES `despesa` (`disCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa_dia`
--

LOCK TABLES `despesa_dia` WRITE;
/*!40000 ALTER TABLE `despesa_dia` DISABLE KEYS */;
INSERT INTO `despesa_dia` VALUES (2,1),(1,1),(1,1);
/*!40000 ALTER TABLE `despesa_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `empCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `empRazaoSocial` text,
  `empNomeFantazia` text,
  `empCNPJ` text,
  `empInsEstadual` text,
  `empEmail` text,
  `empTelefone` varchar(14) DEFAULT NULL,
  `empSenha` text,
  `empLicenca` text,
  `empDataCadastro` date DEFAULT NULL,
  `empExpiraLicenca` date DEFAULT NULL,
  `empLogradouro` text,
  `empNumero` text,
  `empBairro` text,
  `empComplemento` text,
  `empCidade` text,
  `empUF` varchar(2) DEFAULT NULL,
  `empCEP` varchar(9) DEFAULT NULL,
  `empLogo` longblob,
  `empDataFundacao` date DEFAULT NULL,
  `empNomeResp` text,
  `empTipo` text,
  PRIMARY KEY (`empCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (2,'SASistema e Informatica','SASistema e Informatica','111.111.111/1111-11','111111','danielantonio23599@gmai.com','(37)99807-0898','galodoido',NULL,'2020-04-03','2020-05-03','rua antonio marionho da costa','55','serra verde','casa','formiga','mg','35570-730',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `endCodigo` int(11) NOT NULL,
  `endEstado` varchar(45) NOT NULL,
  `endCidade` varchar(45) NOT NULL,
  `endCEP` varchar(45) NOT NULL,
  `endEndereco` text NOT NULL,
  `endNumero` int(11) NOT NULL,
  `endComplemento` text,
  `endLatitude` float DEFAULT NULL,
  `endLongitude` float DEFAULT NULL,
  PRIMARY KEY (`endCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrega` (
  `entCodio` int(11) NOT NULL AUTO_INCREMENT,
  `entTelefone` varchar(45) DEFAULT NULL,
  `entReferencial` text,
  `entTroco` float DEFAULT NULL,
  `ent_venCodigo` int(11) NOT NULL,
  `ent_cliCodigo` int(11) NOT NULL,
  PRIMARY KEY (`entCodio`),
  KEY `fk_entrega_venda1_idx` (`ent_venCodigo`),
  KEY `fk_entrega_cliente1_idx` (`ent_cliCodigo`),
  CONSTRAINT `fk_entrega_cliente1` FOREIGN KEY (`ent_cliCodigo`) REFERENCES `cliente` (`cliCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrega_venda1` FOREIGN KEY (`ent_venCodigo`) REFERENCES `venda` (`venCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exclusao`
--

DROP TABLE IF EXISTS `exclusao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exclusao` (
  `excCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `excMotivo` text NOT NULL,
  `excTime` time NOT NULL,
  `exc_funCodigo` int(11) NOT NULL,
  PRIMARY KEY (`excCodigo`),
  KEY `fk_exclusao_funcionario1_idx` (`exc_funCodigo`),
  CONSTRAINT `fk_exclusao_funcionario1` FOREIGN KEY (`exc_funCodigo`) REFERENCES `funcionario` (`funCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exclusao`
--

LOCK TABLES `exclusao` WRITE;
/*!40000 ALTER TABLE `exclusao` DISABLE KEYS */;
INSERT INTO `exclusao` VALUES (1,'teste','11:28:47',1),(2,'teste','11:28:57',1),(3,'teste','11:29:04',1),(4,'demorou','20:52:58',1),(5,'teste','19:26:04',1),(6,'teste','19:26:10',1),(7,'teste','19:26:17',1);
/*!40000 ALTER TABLE `exclusao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `funCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `funDataNascimento` date DEFAULT NULL,
  `funTelefone` varchar(14) DEFAULT NULL,
  `funNome` varchar(45) DEFAULT NULL,
  `funFoto` blob,
  `funEmail` text,
  `funCPF` varchar(14) DEFAULT NULL,
  `funRG` varchar(14) DEFAULT NULL,
  `funSenha` text,
  `funLogradouro` text,
  `funNumero` text,
  `funBairro` text,
  `funComplemento` text,
  `funCidade` text,
  `funUF` varchar(2) DEFAULT NULL,
  `funCEP` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`funCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'1999-05-23','(37)9980-70898','Daniel','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0‚\0\0\0°\0\0\0LÓ!\0\0\0sBITÛáOà\0\0 \0IDATxœ„½i°dÉuvÎÉ¼K-¯^½­_ï===˜ÆlX ƒ\0‚@	”	\"dÉbØ¢)¡Pˆv„lÙa‡l‡üÃ?´Xv@d8$Y2	R&ÅEÄJr†ƒƒÙÑƒ™žÞ÷~K½Zî–yŽä½YY·àŠ‰žûªî’y–ï¬™_{ùy\0\0\0@D…$\"BDõ¯,D\Z\0ç\'»kÝû×ß$üÆü÷þ‰á™þK÷\0†\"\"	0ºŸ\0\0‘˜-\"¹sÜi\"@\0,@áåî€\0Ý—‚@>\0€™[ƒw,Âî’ú4FcA€ ˆ e!´Ö¶f\'\"ÌLDn°$ÌÌÌõ„ndˆÈb\0\0A±\"@¥Tsô¤dDàÿEO~BøoZÌpŽ²-Nsó{CG„E7÷!\0\0d\rÈœ\"‚ÍÉˆ(–Â‘Â=(­;­f°Âz`Ê}‰N¸Ý—~RNH\0¨!\Z‰Xk-¹óˆš3Y\0€A\0À)€EAnFÆˆB´@¸Fc¬§`‹ áŸ‡Ýß§Å•€%m­r’\0\np‘ôþVV„jq²\"\"\"„‚­«Üô[öBà\'âe(œ5D‰îŽU£ÓJ)D`¥Q˜û^7*ì\'‹ÌL€Pë©§#   \0\0x÷#óRSÎq1Y‹è­ƒå/—)ÛÂ:\"¢%”óDºŒ#S\rDÀ\"€¸\0A\"}(4yè¨üÜ™J)km‹BH€ÈÂ\0ˆÂ\\C½G{MDÌ¨×3XDpB’õWˆì_ÄMVBÁ<Ô0¸\'ÂaŸPÐ–¥%ò\0`¡–ñó`‘ñõ @\05ÖÂ:¦`h®MÂÛþ(8Á=Tü¯ŽÜk4[x\"’W7zm @\'yà( rt¨U	•Ó8LµÝ…-R.1i®U­±ùç†ð^þ3`!€#Uó	6¨»ÄrhÐã0s…¡Òx4Ó¯ñœ¦ù?Ý7­ûø«(œRMH¥p~Wpg…‚à™Ï\"6¸?´Æä‡ÂhH©†µáŸó9·Æíñ£¸Ø\"%¢\0°ÿÓ	Ný%Õ†¡áÓ\\Õ–Yâ?þÑ-‡³ð¢àÑìP	ÿ…]aù¼åù{An¾$DE¤Ø[ˆfòY¼ª\râþþJ©e>µÆöã¿	½¯Ö³\0\0€W\0jTÄFÝCYvç·`a.»ZÊÇ2ÿB{n…uBOá5þÇíÖO\"\rb4äv“QDÔÌðpÐ_ÖýÖ±žù¡\nçéN¦e·ƒKæ´lSã\\ù“—ÎýÙ:ÁMÄãRøÐ–¨yEïèû“•Šœ¸3Z†±% â‚ïˆÊýÉlšË•üå~&¡)£¹ŽBôev‰mmÅòßÿk	‹rº|[ç†sŸ8°®Î€û)„QÈS¹5\0çÜ{å_äÕm¦üôüƒ[»`U¹x\Z_«Ë“÷ZshOð¬nÚ°hf–ïìo‹sTîB\"|Y«N³EÄyƒÎsED¯>.rÂÆ-l³$°Ò-l¡Yx‰¥›ÁÏ‡º€<-¦-ëiˆÁ¯âÜ§À]¢{x­½P…ÒpòËV4¤,âž#S££Þt)¬s¨Â›{v^ž¸¸Zf±¬=­™B -™vÁDˆ–P#G£1?æÖ-H	Oh†îáþ“ÐÆ¶˜zèAxÏÐOoÍüÇ€LHú–Î‰ˆƒGX @tP#X3 >-K\n\'QKõCÒ¹/µÖá…!U14á4<?C*xäpÖˆ×†p(áÄBöx]fv(z­ãÖØ°±„Æ˜ðAeYZk½?-\"ˆ$\"Ö%BoÎ±¦¾yà5á-`§År?¶#µ!a‰È¥GÃ`~Mí9Ž×©‹Ÿ\0ÝšPHdP­¡¸OË÷p¿Zk÷,lM@Î\n\ZMÒZ{–O&“$IªªšN§\0€(‚ÜÄ”@€\"b\\† ÇÞ3F‹Ž­x;|¨/ßÍ	®4™fT‹,õü‡%A©R04é¡z¶†î™¬‡q¬¿Ä³P]xÿ§¿3—eiŒ	}°4MöövED„ïÝ¹½³s¿È²l:ccwïÝgæ<Ï½ÛSP Ì/…²ßÆeYlM*ü)ÔõEÌY\0 CÊ†´k)—“,zÍ~2¡‹ÒšL8Ÿð—\\\n\'æe$d3’ËÆ[kÄÚ²,Eìä`<›Í¾÷ì3«kÃ“>ØétŽ?pŽˆövv®¼ñÆþý;Óéä‰÷¾ûK¿ÿÇßþöwqcmõ¡·?üè;Þuüô™í£ÃáZ=l—²$Z.6À’,†	1/^‡žN*¤˜RŠ™É›CÁ?x¹¹#0¢\nC°e8ÂE¬ôÌ9²¡5Öpˆè“‘Ë\\œK\"‚)ËY6ùw¿ñù·Þx3Jt©l6ëÄñ4Ï	I—e™ç3­Ô£=Ñ¬ŒöÆãqÚï½øü‹ˆ¤xðì7¾õ½²4±¢}èÉgÏ=õÁŸ<óÃ:Wð9”ŽË\n±L‡¡M ÌÌ\0äÃ\0À¼öRCÇúÿ­û.ó¹¥³î2ç‡¤lÑó©½&Í|Íg23ó­×~ðÝo_»|ÅZ;\Z&“IUæ•-ÀVÌl*¡D+é÷’HÅÓ\"ÛÜ\\ÏgÅx<ÖZ+DZ\'ñè`¼6\\æ7.vÓØ\nžäá¿û_ÿºŽ’­£ñÄaÒ\nÊ¡l… )Û07²¸c=W¬×^}ÑŠ–t/ï¡\Zçýñ?µŒMKjÂécn\\¹ò¥ßÿ·Þx³(²ñxÜëõºÝ•½=DÕí¦ÃµÕË—®Ü¾¿7žÌ 1°Zë~¯)“+\"RTf2›öºcm’$Zë$Ž/_¾iAz½NUUÇÖ7ïÝÛû‡ÿøMÆ³÷¾ÿ!AÔd[ÒÙ:çGÙeÔuNø4ª¶ƒE¤]-”å04k¸Eti*\n‡²\'4$­[‰ð«ßÿö7¿úì¥Ë¯Ý¸Õé$kÃÍ#Ç&“ÉÍë×³¢×ní¿páõÙ4×Z+­’$ÉÊb2™BQŒ&“8ŽÓ(ºvww{s­(ŠH©é¬\0€»÷÷´Ž»Ýôø©ã·nÝ™N3¥Ôùw>ò«ÿØßûµ¿÷ÙÏý•cÇO8}ª¥Ç‡,úÐ!?B‘?ÊB=hƒ¯_x%¼còÔ™HŸ(öwwø3;éÙ°l«ýÆËÅ›¯½ò~ïw/¾ùV–e§ÏœšLesó8#0È½[7oÞ¹)Œûã{{£Ê˜õµaž+++wïíÄ±f†HiÒ*Ë2a³6ÊJ¯¿0Š¢(Š¢Ê\Zk$‰µ)++¬µ~è¡‡Ýþ\'?õ—^üÞw776~ñWþF¯×kfTO¼¥!oZö $‘4^\\h5Cél¸5Šn½ý±Žéçñ·Çn¯JaÜç9K\Zï\Z…\\™L&ÏüÑï}û¹o¶ƒÞ`mcs<.Æ“<î%Ï~çùHáJ¿³»³ŸåSBM¤×—Ÿ©Œ¹}çä•Ëº«³,Óš\0â{{£~¯Cª\0!ce–M’$É²Ì˜¨“¤,\"^ºtåg>þS©¯ëÛŸýÅOß¾qûÌƒg´Ž-\n·fÝ¢{h{[óõâè\'Þ\"BÀÚ9­ô²FD€0TžqžùËùáeÁ_ÖëP^üÍ¿ûÏ¾üÂK••ne6É,B¤“ñ,&Ç×W8sêÞ½;`ªY„…e¥Ôl7«%H)LPDJË¨Õ$›u“´ªŠA³<ŸÎòÕA¯œNã8Ž¢hšç³¢p®u©Ìó8VwnÝ8}úøå·Þ8óÈã¼í¬ˆÅÅÑ4iïç¸9‡&vŽ<‹œp·©–J`.6Æ&ù†Çžÿ!{—™òÀ‹(>þøúåË_ýƒ§Ý•Áz¥€¸»»{áÂ“$yð¡s¿ó÷ww&³éþÁä`–&»{#‡Š¥µÌ\\U•ÖqYÙ¢4ÆÊx–1ÒîxTš*I:D0›eI·[3žMËªb‘Â˜N§S–e’$7nÜ\\[öz½ƒýq6·ÿPjÍN+¾nrþäåT‚û,Wît¯ƒc¨Û­–|²ðv(Mh”üÝ<ý—NmÝ¿ø…ßÊrV€¦*&ãò­‹¯ÜºñÐéÓ\Zì×Ÿ¿uKŒ1£ý±s%*¶ÈâÌIÇ€˜ç9!€ ƒ@QšH“™Ngˆ \"ãÉ$Žãƒñl8ŒFc¥p<N´Æ`k{ýî­»oÛY¶€HhØ,ˆs8GÿocÿHBÄ‡b†W Ÿè®sLKæÁØíËŸCÙ³|‰g{eîóý¯óõ?XßÚf©n^½uíú½¢œž>²©I^¿téÎí{ž=U”\\äi•¦iY–ÌÌ\0Œ$	\0tµîv /Šñ,kZÂÀ\ZADAÐZk‘±Ê˜ÍfDukOV–zu<?ûì7’$ÉŠbûäq\"²VT›iÍ4$Ñ2Ë½ÅÍM±v[u‹¬!ÿ[€è¾	MPxš4žÀ2V†ƒö#žN§_ûÃ/=}²“n]»¼7šž{èìd²¿º²òåg¾yòÄñcGÕþhªµžÍfV˜™³²°–µ\"R\ZÐE¤EkÝK“YQZ+\0  ,B€¦b\0d¥Ð€åˆ”1Æ*>±½%,“ÉdkcXœ8\"UuêÌÍt—_XêV:”¸¡R …ÞÎ6ˆH]Š	\ZrÏ·ˆ)ý |ŒX7X¶\"¼+lýóÿát{«q”\\¿|tôÔû?pÿÞneà›Ï¿üŽw<ÑKf6Uupp µÖZ3³1¶2ŽkB–²,‹¢kmEˆàÀ@@H\"£Óc\00óÎîè`<¢ä•W.éwüÄ{¢(rÖÛåW Ðìe\nû²ÀµêÒáù‹_ÎU§aõÿ†=d0¯gÕšïiMDÆ˜0Éº<²pÐ\"\"ÿÛ÷÷)N²¢˜LfI¯ßï^¿ðZVäY–=ò¶Çû÷¯\\¿–ç³Ê˜²,gyVæE>Ë#R(îv’N\ZGšˆ(Š¢n7‘Hkd‘\0 \0@DŠX¨&Oc­­Ø’V·ïï\\¹ôÖpuý™/=ãi§T´ìP,“ÈÛÌÎO_ù_}À»Tu¯)Ú´ì\0¸+pæs.ÍÙª\"´¤ ¼–4Ô¹€c¯~ç;?xí•~ü“—/_M»ýƒ8N×××€«rw´ÏÌÆŠFdæ8Ñll¢#­”Ö\Z‰jTT˜ª(K\"ªª*I’<Ï­ÑZk­ÍòR+eØ\Zcˆ\\Å‚‰´«L bUUcc¬){I|æ¡~ùoþªÖšH¨Í-Ê„Sn&Ë®)Â‘Q˜m‹¡W²(ñ¶áŸED½,°áõ­g/,´\r¡&zƒÌ°p2°<óÕ/ƒ½½Q%ÝÎ íNu¥ij™ßºxñ`<½?Ú‹t$¦J%±–ÓHb7í$Iâ”Ài¡R\n€&Ó,™¹b«T¤µ>˜M³¬¨ŒÉLe‘ž·1ˆ€‹®Ó4~æËÏ|üSŸAD\0nÒæ§	há>€sgÀBSgFËšz˜af¬{¤ö”èÿ¯§Ñ)—ÃÍðdÿÿñ\'7º‡BnaDÝ±sõÍ·õõ+W<ÿ¶ï~çûëÃµìÖøÜ£vËroo·×ÖlUˆUq§q(\ZT¯×s\n+¥”\"¢8Šªª¶§66\\~B)eŒ1¦æ²²“¼Í&?¸v»´Æ °± ’$‰Ž¨ª*7è½Ñø¿ù_þ3kMÖZ\"(ÌeXL‚…‚+\"\02¯³Ø–]<BDQ¹¦Á7/¼\njžæÅÅ°0ÄúP¨C¥ñiÂ¥4~\Z‚p÷Æ­ÿõïÿWý~÷ä¹‡wîÝâôÒ¥Këƒ•k×nŠŽ¢ë×¯wÒØ³Òï\r{+DÐO;qkŠ”R¤•B åJ¶\"\"Q@E‚ \0@À³µÖZ®ªjwoôÂ[Wîí\r³W¯eÖH++ýXÑÖÖÆÿ?ÿ£“gNk­¸‡}D°ÔËÓÌ¼qËI|#ˆG\\jðqðØ0†QÕŠáÉw¨µ˜áÁÇsÂé 	‚oûi\Zñ‰eBJº‡ÏŸ\'¢2Ïâ8f“½½Ñ£œíïïîîîîí%Zu¢¨Ó_9º¹Ñï÷’€¢ˆP#‰ÖÚ¤I)RJ RJkÊG²,66Öno¾qùúóo^™\"\nbaLÔéŒÇ“#[ëUeÿíÿñOÿÎÿø?i{ýv ÂQˆO\0@!²£MCUgßQ”Ò®Æ¾\0Ë\0\"À›\ro¢[ÔµïÐ¬õòiªVw~]h$€ï~íËY–ÇI•2ÅôõW.œä¡—^zicuX–9˜RS:ì¯œ9{z8X[(fÆ†ßq¬‰H!8=pOTQä\0D£`Arø©µbî2s§›t:4Âg_¹X˜Ê¥p¬µ¤pgw?£[·odÓI·Ûw‚î<Þ0¯×¢c ñ¶¡›\n][‡‡ï¹´ê–5n=Œ‚Õá˜ZðµèGÍyV¯)kdçÞÝõÍ8ŽoÝ»_{âÄ±«W¯+”[·nÄ€«ƒ~·óðÛÏw»ÝÙtLZ+¥’(UJ9ëG„\"â:Î]§¡‹ÎˆtÓ¢£¢(FE(àN‘Ô¤IÜ)MqoúÒ¥ëllÇ¦(Ó4ÝÝÝ#ƒ•W.¯®­GQ\"Âî½BÈ|©Ú¡é&Ö¹¡\"ä´D‚„vhG¨»ùæºìo}hKH}Ï[¯§ÍµµŸçO#DÆz¥\0@YV7®]»½[·ï®­¯2Ât:¶Uybcs¥“ž:sòèööl2G\0°¾¾±2F±BDëhkØï‰+…>n·‚ M\r0“Ö.©”BE[››Ûº½?Ú›®‰ÆZ³Òï]EQ–eUUNÃ\0@„]\":´·-<Á¦Ehnü%Xf´S/ÇT§µ\ro­5à@IšÀ/tÈ°ù@€<-´˜äó€!daˆºî\n\"üú7¾óÔûßóƒ—^±\\õ’#|àèÑw¾çÉ,Ë&ãý•••Ó=4®&ØÊpU\Zcò<¯ò˜«ª \"T‘ffk­ˆ@ÓåÏˆJ´ž»:„1Qštl¯¿³vg÷r·ÛclUUÓ,O¢è¹/ýá;â)?ÞÃéŽõÊ3°ÎIõ«1œçêe×µð8æª¾bï\"ghX>Ï±+K¦LÇÅ|FÈƒÖLºÝÎh|ðÔ“¿øýF£	lúŸþ™=õá”e©I1H”$@Z33Z¶‘µ¥²V´R¥ReV 03«(VJ¡fe•\rDdF¥Tp&$QÂ)\\í¯œÞ^óÆíB¤,K­£ªª\0 ²öÒå«EQ\0@§\06L7$\"fp‹1Ñ¡VÃ‡ÞÎûd\'¥¼´kÑ«TÞ\"7¶p¦Õ‚°LÓV±4-¦\'%¨ü¹ó;IzâÄ‰<Ï7ÖV·×‡çÏ=ðî÷àÜ©S¤ Ûí²©É˜RÇi¬5(ˆÊ<³ZWyáîMD¶ÒÆAD’H*m„c¨ýBff\"U7ûØ¦ã¶ÛI†kýÍÕ+·w”RÌöøÖÆ ßëõz[U^¬¬¬8j†^I3Y‹¨°FÿZêk‘å\ZgÄÙjçâ.[ÜFXçV÷Ñî!-âL}²ª¥=¡N,š\n¯¤õAUU÷ïß×Zß¹u{}8<²µ¡”~èôéN7–ª*l¤me’$!·¤[)\"Ðq„ê•9a2fQ¤AÍ»r´X\0`q‹›ÀøÂ†ˆÔJÑ ×?¶6¼qw/+ò$Š‹Êj­÷÷÷{ü]E™ê†F‘Á¡Xô­Ê\"s:,Än-0h$ÂÒ@¸’hdBqv¾k1T·Öå>rÔ3³,»yíêñãÇûýþñãÇßùä;ƒAEJ!içò([™|–UEiÊ²´Æ©¬µV©A)T\n5Q’$¤5iM:&\"Pà”R¨”ÖšˆHà(ŠÒ4íõz½$F’4MÝÞºz#Š¢ŸþÌ§¿ø;ÿ¾%¼-ûWÿ	à‰àœâ¡ß¨Â[ÍÏ¯Ñ	š*\'BX}[–ôeµZ¶äáˆCÒ‡MtEÇNžVJíïîš¢|ðH23\nL&S”£ÑHDâ´§‰ŠM\ZÅl,€â*«¬s“H±î¡šÈZ+¨H€Ù†\nÍDDl-EqÚíÚn\'‰€&e–¦iUUJ©~øƒƒÁðÉ§Ÿ.fYÚëÂb“¤ûØjWß<ú†Œîï¹*©Õt¾žÌÝÇ…V^^R{!\nµp‚5ªd–í°¿C˜áðvûý»wïFQGÑ¹sçÖ××]üÎÞþõk7ÿâOŸí\rz«««×n\\?}|{¸±IDýÁÊÆú3\'JgÓY¤‰ª²‚ÊÚ8Ž]¤êuÔŠ e·ÞÖX D@EŠQL¤uÇJ©­µa¿ìŠŽß¼}ãö¹óh>w¦bÛY¬14q€wÉÍÌÍJÜöN.‘ƒµûJÄº8Ñ-:B	%\0®ež·3»Ðn¡JòÑ¦£/+AØ?[ƒ›å²,»ÝnYi\Z?òø#\0`­½øæ¥ÂØ»·ï=ubgoÿOŸýVaª×/^aæýÉÔ®õzŸøÈSÃõ¤›v’$Ö±FÔi\\U2”¶ªªJ±\"b\rÂb¬E€Š-¢VqÅÔ³·+½Î´(GûãÍÍõÏ?¥Él<[í¤ÌÖ;jÔÌà:‰ÇXSÞ‚\0±g#,Bˆû¿ˆ%Â&”«ïù@{ÏÉ\'iCG(Ä5,\'}«8ä™g@ó“ºôæëÝþàîÅ·®_¼ø«ÿÅæÊË÷w÷w÷Ço^x½ßï\rú+ƒ~Œ9ØÛÇ/¿ñV§›hkª*‡—^zyccãÈêpkkk8\\K{I•³ˆXkÇ£ƒÊšÑþA’$»{÷†ë›Q»t“X6¦Š½Òí!¢R*I—\ZMg4~îoÿÚé³¸‰¸·s|nÆMžÄ£´‹Ýê}d¿©J3eDT\"¦1BSkIƒöKE`Ê[&×÷t„gb°ÄóÃ{Ü!·D„Ù|ïÙgØB\'ƒÞÃ=@³¬ºyõÖÆÖ‘“§ÏdÓƒ=…p|{£Ê²ƒýÑO>ýž,›ŽFãK×n¬¯¯[[@uÐt“~Ç­Û+ó¢ªªéxtogïîîîÎîÁ…k7&yAQ¼1\\]t‡++yžÝ\\ëuâsœê&éúÆÀy6Í<uü>÷¹–1ÛVA„Å[2#„\0|Á\". ·úOÇ¡÷ê´\'bØ…×.ãäk\Zm÷‚þg½FcÓ çÏtüpÎÉ7Ÿ»ðîÇADÔZ9q¢ÛëMFŠde¥—$‰R8›Œ:ííÞ¯ff5Á÷¿óí[ÇO¶ZÇEJQšvÀ”UU©ˆŒ‘¢ÈÆÓf.ËÒ\Zc­ÍMVUÕÕ›U¥«nÜº;ôÞºrû=ïxx8¢­ú.ãXDz½Ö)Š\ZðC)ôMˆÀá~-ÄÀÂˆ\0\"¶Ù¾©Õ¡D\0.«ê2ìnFÍ¶Iµ‰^î¨!\"‡köÅu;,¶´†n«ÿsÙt{[½so°ÚO\"ýèãkŠ·67×E¤Ø/)î6n—ÅÅ@‘u»]“e{³éì`t§*×¶­;><²Çq5›eÓƒñþž1ÆV\0§D èäÆ°§£(f¥µe…³ÊÜÙ½_ÅßºúÔ“ÝZÛgÖÚ¢(‚L*ÁÜôúoÑYÄ	œm\nŸsGQ@¤1æíú\"ÒlðÂDPï…ÚˆjÛJk:6@TWéÜòÄ…fïz„ˆ(¶vB`QÄ\Z\nÒn÷Á·=xüìiD€8ŽE`6ˆ`Üí=}úÚ…Wû«ƒÊpÅRºO–Gi’ÏŠ½]v6ŸØØÚžííH9ËF\ZˆÈš’P€-\noVâ8Ž;i°EQÔ©½ÒýYvíÚÝ›÷î¼yñêÃ§Ïüé·ŸßÞ\ZcŒRQÀŒ°½Å¥ZÃíÔr—1¡’pB3|˜o4âvòò]›è…ÜQ€õÐ¬=ÛÑÕ¯!0¿s\"dÛN+y+@T ”zóÂ…Éx´½u$Š\"Ã•Žˆ…¨·>LÓnžë\'ÈgãÑÞèîÍÛ·o^ÃUiŠ¢ÒšT§gÇ{;ƒ~C!VŒ-fã,+&ã\\£(€¤ß[]]W\\™¨²RUÕfœ @qÐ__ð·¾oU©ã(°gÒäé¼Bøã:ý\0 DZt°–UÁ“ÂS£q|ë¯Eì<n˜¡˜Ý€æ8#ÂžuÞ=­eÐ-¬DE.Å„u\n\Z±e ´ÂiÚ®¯OÆãn7U\n´\0‰µišÚXí^»tÿö­o~ó…7nÝùæK/\':yÇÏþÊ+òù·<•˜ò±M&“z½\"›™¢D\0a¶Öšª(Š\"ÏJ e+;™N‰mÇ,2›Ívoß>ýÐƒ~3¬ªj{k³Ûï××\"EJ£ÖÔë­2³Ký+f ®ó6\0l\njÞöÖ€ÑòCÒ|\\áa6\"²¸ðÍ¢ïS\n›^}ïÖ=6ó-’¼“\n‹Uã1ºm\'šUÝ\\g;‰ˆ”(¥œ…DMŠ\0­­Š|výõW¯¼uåÿäúì/ÿÇO?ù¾Aïå?úíµµŸøÀSëGŽýÙ÷^?rd³Ê²$I\"­¹¨¸¨À\0‘f±I’¤ý¾¼ppigç[^îÅ—ïïô6¶¬àËW˜Yiàµµ5…´²²:è÷]ÎU³\"Ì;Žª´`ÖÿéÀÐµ	ÏYt;•w|BŠ9µ¿gFs\r.7ù¼ªCºP¤ùøOê­&\\ÞÊ1 @¦7nä“ñêÊ0ŽcËŒ(,bª€7Oœ;ùÈO<}°·Å	‰\0\0 \0IDAT¿{÷Î\'Ÿ~ïä‰·WE6ÛÛµ;wNéŸ?÷áÍãG×ÙXÛSUU™cÐpB:M\"é…›\'ápðúë&Wn|ç‡—EGVWöýuìšS‘(RqëXÝZ{åâÕãGŽˆePN\\æ¶:À[Wº©WßHí‘·ùÑBiOh\"`ö±´i¶ñh-v½ØÞ²PMslôÖÆ9[!\"yþ9ØqKì™CAK¢,W†l¬€&ª„˜\0“H¡()-pÙíD´±Ú`ïŽìÞ>P‘ÊÙÖ7ûëë››Gƒµ(Š¸2\\4 @Í¬ÑQ¬‘ Å\'9=žU¤€ØD‘Ö?ÿáìvû+ß|üÔåüäÓÝÞ\n!j­•Š6ÖÖE®DIâ—I?×ÉDp›ò5:?_k-‘ò®J…–õ†¨.BÔâÜn/2Ž\ZÔÄÖàL‚#\0\0›ú86j±TVÃù­•†ÀC­ÄnÙÏ¦çÎ\0ˆI–5Ai˜ˆÐðt2\Zïí–yQL\'³ý=k$îöV·­®¯={j¥Óívz\nˆ…ÙX®Œˆ cE½^oœÏÎ;{ïö3|îCœ%EZŠé0Ö{ò‰»wîïÜ¾Û{hE‘³ÛÛÛÛqÿÔÏÚ%:-sK’²:‚„fpNgËqúÖ\"ßPÃWm ÁfÖ\r—\\Žžs7ÇviÄ<Ìc‹7ÅSÑòSç¬B`°üð±­—_}m°6\0\0…\0uý’H,‘Ö:éô’$YY[Ûˆ€¤U¿ßïw»:Žt33X`ƒ–Ù\0¢êõzF8^ßXËfùhggsc}°6H:)iTq¤£H©(Š¡±Üëõz½Î‡>ñÓM­¸¶ÃD.ÄÅ\n\rÍ5&Ôo~Cê‡HÕäYkº»d`ã’Õ<ÓµL#úÂ^àÏbÃ!häbŽ€ˆˆ˜©3~ï D`àñÞêh$Œý~ßŠ ££»XëšµÖQw»R™‚+ÓR—ÒI»Ý´›ÄqÒIR\04Eiª²ÈfBÈ@†-Eº©Ê”±²y¤ã4ZŽgÓIwÐO’¤ÛëEQä¨¬•€Á` µît:N§ÝŒ<©‹øÎIuDðNjP!ÉbF?Î\Z7a²ëR’A\"ÀÖº–P\'ï5þQ¬IÚRÆ†YVX!9³ÜÚÙ5#ò½›Ù›WÓ´Ûétˆ-R‘¥ŠH[²JEql­µ1\"ÆµX)Ä(Š”ŠÒ4%¥,%\Zc…4i•$IQföºUVv:d„›”¡Šâ4‘\\oÙ|·n\ZEJGûƒáš°\0\"!‚×	7ßCÖ¦·ªÅžô‹š_=5¸áhW\"º\r×ø§¬µ\"6ì¯Pá-–íÁ|e@s¡„›M~ðb1+6ú}­c²\n5ƒ(ŠP)­cçàÆqœ¦4Ž“(Š]eHE\Z-0&q”²Ö\n‘Žã˜”BÅÝn7M»Ýn·×ïôú¤“ö:ÝnÚqK@Ø	¹K+lªoþö¿	\"\0hàÂÔY×–yx‰ÅOMñüBt¸fU}ÍÃæÎ¬3ßáÙÞÇr£l™lr{¹HùîN©ÏþÔW×–\0j¯@Y¤ˆ\"D„H)\'DÇZ•Rq£ˆafÃ X–&JÒÞê°ª*ÂÈššÏ¤ëôãX4)ë(‰â4I:Q’FIL¤cRJ©¤“*¥¬DÜÝÝ‰\'/¼tp÷N8þº½ÎÇÍ\'Rg`î;yÔ¥Åˆ.…·PÊ®«Ród¸m¨W§+¸áÜóé9Ççÿ®?õ,-?ñõ&Þ¶N¤°µvšEQtìÜYt¹I!·Á»¶ˆE;&™²°U‰\"UU•eÙét€í­k—ó,Ë‹iže£{û£]·\\^ÉõÜ+P‘&­´&TÔü*Ô¸Ún‹ƒñ,©ìÁÕûw^ü~C\Zqj]ãB”\ZZôž%ì†…	>oqÔËÎ1MhNnk­kQkÅW«¥i\Zlš$ÝW½„ü—`ñ¡ˆ˜²:û©Ÿë÷{×®\\qÅ±º{Ð`½šA‰t¬ãHEdŒ)²i9›f£\"C¥p´[Åìà ›NÊé´ÌÊ|<íïÆ*AD6Å1X”RÊùGJ9_Ûc*F®Gøæ¥ëïÚ>®T4¾¯¦a¶®9Ó‰©ƒ¬·!¶O (jvAmïþ$M‚ÏIé\"H8ãaÁo•î¬Ë§º2@\rô~¨GÊM§0!rã)æù–¡CU3C »µ}î½Oþà¹?7«k\"ÖZIâN<’Xk5b$Êæ%3‹±&?80ÆˆÒ}<2®_xõŸÿÆ*Eÿùßø«ùÁhÿ`\\yQ•\0#XÛØ*ó™5¢cÝˆ*\"bka´,,3Q„/]øá>þÑƒIYMfžî>òWõf•!¸Ïµ?p^¹	§æ†ù*™,ÊZ>WöñðÒÜ×p¼ÉRR¯$cÇï7©ó\ZXC—9Ì;¹aßõ¾ûW/gãÉðÌYk-\0c´ÖUU±0)„ªâ\n˜ˆJËå,Ë¦3kmw}#;˜£ýçÿð‹û7oÚH¯ll™ñý[÷î^¿të7¾òL¤ÔßþÔGÕÛIEÚZÐÕq,! ¢R®íµ²XX!Š€BBÙ~ðäøÕ+•~8æeIj¹¤\"¤|æ8·B+GçoÞ®Äx(›··	‡À,Ž·qÜÃX„ÀG%e“li×§ÂY‰ˆŽx°¼øª­ŒOxcM)ÈEQDQ¤@ºnFÒOw«\"/¦EUv»]­5[‹Jÿø\'üèGO¿í16e>ÍóÒœ>sô/¿÷‰¯Ý¾vkûÄ¶Š’¤ÓµU…Jë8ÒHìÊ[D\\D¬„#@7¶_ùùOFqZ¥JAÀ`Ïb—sIIOÙ@þ(€—g«Klþ}­ÊsCz)JèdB¾aÐ…P?¸öÙ‘¦úKa\"°ÖYô^¸¼˜\rG3wàˆÈFÉ´(ÏüÄ{³,Ã&Ì!€¬I™zG”šqežÍf“(M’ÕµÞ`UÇ‰1¼vòôpmc|p0º{kVVJEyY>ùä»ÞþðùÙxç`–mm¬hBcŒ*\rI¤” (bæ\nDšÔ\Z±Å¬¯bfV]|àC#ð¾\"(v¡¤ØÛU IwÏóÞ‹zãŒ°_£†\r¦AzµPÌÆ×¢]ÁyÁÇ @E–‘ˆUJ5A¹“i8GÌ6ØZÕÒá\Z<Žœ{D¡ô†0±¥µ…[ð\0†-¡\rå,/òiU™l²:ZÙ<\Z§)ƒTiMQVû£ÑÞîîx–!\"D±%è®õ;ÃN7íè8rM…):1³AªªD„”ª¸\"!sû—\"¤ª,7y¨·µbBÝ)(Á¢ï?§KÄaP#ò«µÜ¿]js¤ðeÔyòMsÓ–‰M@Ü´1ù4ºkŽó½b._(.áQ¤ñ›U].Wèõ‘‰F³Ùz¯‡ˆUeµF)4½ï‚•µ¶(3²R…èhxâ¨s5‹ŠôÎÎ^YÍR•L²Ù¬È‘´©JDbánÚR¤µˆHUZ@6Š’X£©Ä£H!\"3¦Z•y\'Éæ»ÞÝ0À‡ÐõkPÃ²\Z4²6¹ÌC‡…äM1xrîÔ!º_\"uN)¬H¸SëÈ[Hü‰`ào5EêJ?çgå\\)ê¯ °!¢ÊQŠ˜EÄ­àÌóØÚÿ{«ÓÙ¬ªleEk¦éto,qã±µf<m¬IÓd<O§Ój¸:ôgy)BRÀœç¹Š´ÍgJ)!4b4i\" »{aÇÜ-t’žýéOVw¡ˆâÉ\ZÐÝ}ÐlÿvÍ!¬:`hÜôa™ßµ\'ôts™x\"Õ‰¦/8¿¾éå¯]7×¶îŽý¸…HyoŠQTµØ¹·õrrò˜RJ)U…ÖÚƒ(¶2Š¨àR\"•çùh4;’€¤“\0#Ûqe–$î(E+ÝN\'Ž&½t<Ífy™Æ\Z(2E)ˆ–+·¿ÑnÅ	äUyäØÑÞÆVVe·\\m\'¿íõd:ÿ²ÙÜ‘Ø‰¦Ð$a˜ûGdaÝ@0[\"MT§×ƒÌÔ!oÂ&¤f§}®;d½7ÆMA»6Pˆ(¼¾YìíÓ¸ê÷û`Å¸ÝhŠ­\0dY1ÏâNd²bmsc¥¿Úíö35F¶Åþ¨‹”©äôúf”Ä\\MŠ’n¬£ÒTY–eY6›æÃµ–•åŠÙ67I)U˜B©¨ª*[äÆ˜ÝÛwžüÜ_‡z}7igoxés©ÕA¼*èÚ\rt»~3°H½Ú9ôJ[7i`DöùÔïÕs–Ö9d5Íùæw€¶Ì T]<rö\0q¾ÿ›SChò/í’°àÆÛÎß»tqÐ ŠÖÚ\ZC\n\r—Îÿ0ÆÌf“ÕA6>ß¼vâÄ‰8ŽÁØjo´÷ÖÕ;—®# wÖÕîôîåki·“žÚLÒX)•—³± ·îÜSm¯¯Æ±6EI)B\nYÆyqêø)«õÓ§»ÃõÅWËØ`Ó·HÍ³Ž sÄf¥*°ï(j<¨…\rñœããyàáuËÚ\n=š{]\rÆ5qyÍc£JÎh\"ëˆNDM Xoã5Ýå?œªqÓJÕm6ít’ªªâ(*MÍvçÆ˜¢(&÷w/¿òâ‹×ûéšeW^|=/‹ÂTÛ§N$Itë­+ƒÕþµ+—‘à·Ö·×<zV+5žN¸2DP–åÝÑÉc[€lÊ*·%	¡VªÌ³¾îŸÿ¹ÏFu®÷ÿã?-—T\0È­çqq•qgßÎ„H\0¶	&>­’ªÛÍ™ñâ›?ôh¸ÍµP¸J³ñIŽ&3UÂF¿ø‚}jË®Ç˜™‘ezûšÖä¶]\0ä\"›‚;G{»/<÷Ì½›w?öÉO«³›£þæ‘8ŽïÝ¸qå…—vîÞÙììEÁ@@„“<ëõ:o×yR˜¢7XµÄ³éøáÏ’F•¤ÂHDFÀ2äwîè¯ÿ§ƒ£GCÒ„:f~BizîÀ÷îµÎoU ¨ø°h¸é…Õácþ4µ·Æicïo¹ÎÀv¹Ewó[yïÍ{PbQÎw4Ph@¥D¤¬rDŒãØ\Z£4u{ñN<pî‘w¼{ãè‘ÕþêðÈ‘ƒ;Ù4ÓZ¯Ÿ8¦ãd“Ë³Ö\ZcÛ2/(‰W³ÙìW~¸Ÿ—…T>~.éèN\Z¹!³*•$^õìû?ºyôhè¯6R§–ë±c³–ß	x*³ë¨ôï\"…&ãÔôý)\0WH^H+y¼ð¯YÝøBý3\rõëäR3TçÒIÃF_õ^X4ºq^ ‘eF\0 qÆ¯bK¤Ë2 c+ÐÚZ«I)keýèÑápH¤²ªL”NÖ;¶Pe•¥iT¤º(¬Òh¹Ò  Ñ,¬	;øï8o5îŒö)QÃõA’$\"b,WPƒÖ27¶·?\ZÏI·ƒ\0npÛÑ—\\óo³KðÜx`Tù¬†òÒÐ—Î¨1æódÇ1íýþ·ÆŽ7Ù$§ M-ÉeR=Ï–áfë\0œCÀ>ƒ	ÇOMîÜÈ§³•AÏZ‹ÂZëñÁA\'Žg³ÙÊÊŠ\"çÈâÔ–€\\V™%c”ÏöËiVUUV*r;š`Îe§×S]ŒµÚînæU©Iu’ŽŠ´5\\–Y/]™d³lV†£…ÆóY€ˆvé§ëÀ€n³ˆÚõð¹Uë®hì\"xå(¼PÌ‡&I…ˆºµ&Ç}œ\'r>ÜBÊOD\\fÛwùA‡3ô>4±)Ú&\"¨bRQ%ZÅƒ[êŒˆy^Ä+}Œ¢½ƒQ7NDDªób2ží_¼yñÂ+{ãÉx:9³}t¨Se1Q±N•ê»ºs£\"“çe1Ëg½H£¢N¿çvòxÛÓiQÜ‹‹‹™ÄogXSˆ~Ë`ŸÌðÓ÷Ž¸hÊ\'ûšgêÕ¾WÕy&\0Ñ»ê·1›Æá©™„(Ìóê©+m9W.\\ÙLUês‚LÙ¬4i¬¦³±ÖdÊJ+%Œ†-©(«ŒFÊò\\Å¦*Œ)‹2#­zý®Jã#ëkI\ZWWª(Šuœ*ÆJnl^Î’$ÉËr0æeA:Âƒñx¸¾ñî§ž…ciÎÿ¦†‚;¶T¼™ÈÂ+¬˜M£\rM¹€¨Îa4ÏuY‡Þ¬=[\Z²Ô­ä®òsÈºZUU*¹ù_å0åhJ 2Ožož<sùåç·Ö×\nFQ‘ç“Ùt0(•W…‰z][(’eS‡¼¤¢ÁúÚ	Ô£Ñ(Ïó4‰z½ŽŽºJ)¶8ÍòÜT•5BÈ„UeÇÓ\0tzñlZô+Ð[E»‘\'I…›dÈ¢Émg[ƒjžò–ÙÝÍ_ö!*—êðuOñ÷Z(n4·P‰i±bÊ.ÕÚœ†s¯@‚q#zÜœÆKÓ™Çße™µR•e–çDçeœt“nDIgZæ(3¥JRÕétV›kÃµþúF?íhV¢£Ô*]€­LD‹L‹¼?\\\0 ½¿¿¯\"}çÎŸúÌ‡¢q3AêÆ•™PuÂ:JK±-™ÇTo	ŠÆÌ{Zk¼kG>a\'Az–›¨¸qO!Ð\0§¡>ünRèõ™ÁjŽú)ëÇOÝ»z‘¢(‰,ŠB©È\Zc*!À8NÅ\ZÁhR–•1\\ôûƒ,s*…¥X…QV™ªªØ\n#ˆa.Š*)Ñ±•¨ªìÏþ\'ÿ%–\0–@©É^°“*k­CçÚiÓwaw™GËèF€Zõ=Û¤NúŠÅ|Wfò\Zòp‘7Ðœc¤~	šö2âU;ÔV§JÁÐ¿¡¶@Ç¤Õh4®ª\"›ÎÜ—I¯ˆ“ñþÞAV™¤Ó¯ØÆÝ®µveuXY¡8E¬iÊpo´W\n€Ž(ÒUeQEº(§••\"¯Ê¼RÞö‰¡·>\"aàÌ5Önøö™ +×ú	š”ÔÞ¼êéê4Î¸øí4\Z:3úVò¹K<Ûg&Ü‰H©ÈHÉü*Çg›ˆ\0H€êu‰A¼=¿…ðôéÓ³I\0ãéÄZ;ÉfÓ\"ï®66l?ŠJÏ²‚­\\}ë­É,Ûßß·Âˆª°fr0­Ê²že“n¯gA¢4 ²`@UTÆˆÙ>õ×þf0ævÅ×}Â×º\Z] â5ÂnÄ†ÏoS§CÄƒ‡qÇ—ŒÇÓÞÖ*Ä¯\r\r’Î79iðJD \\á9J5qæðÕêÞ°\0\0„Âï{ï;¿ø•¯hý©$êt,s„”¦i‘«Š”Î²±L&I’¹-m!³\n\0ÊJ&Ól:‹’´(²HÅyfíd<ûðÞç6Ï*-~\nîc>sã¬‡Cpkn®Ý¯Û5½óÉl•Š‚J5*¥æ[¥‡ðRshÏKƒŒó”aè¤:?ƒET³[µø]µ–ÇÍ‚\"¢µþøG?úå¯}fd¡ìFiBˆwnÝ¶ÖNö÷V}®–Y™eùd6Ë²Y§Ó™N§+«åh2fæªÈMa\rÌÇúÉ\'\0Ä-ù\r}\n>\rüÎõfYÈ È¿ZŸMP\n®×û,5%®y³D€o8_	\Z>,TØpÄRGvÖË‹C¯Po¤é;kNº4D¤É‡{Ru‰µÖùÈ‡¿ñõoë8ÚßÛIÒnUU†-!îŒ„¤˜ä¦Ì÷wvËªÊË¬(ª¢¬²|6-óHÇ\"’$ÉÞþ>+¦^§{ls­Ùç£ö ½Ô·œ?~ß} ¼À†ÁÑ¯õ5c.x2†=sM¶Ü:G É	òY–¬h¨+¡ 4bÎMÀÒä‘\0‘ÕÛ€ºšµ©®zæ ÌDˆ˜Fñ{Ÿ|çË/¿rñnmí¯¬ŽÇãl6aæÝÝýýý}›—¶œeUY•REÅ6Ž53çeÅÌ“É¤(*\"êÇÑñíÕÍõa¬tà+S#¶\0s?²–’PÅÁ]šÏS<ÄX„Otfq‘šO3‹[OÎÍûˆ•‡Ùš—”sã<õ%pË¤NfÌƒFL°q+Gæ‘ [VJ¡ÌÂ{’o”SJD:ÎO<þÀ™“¿÷rýê••Õál6+²|<=˜ŽgEQTyUZS£ˆ2®:EŠ\"R³Ù,Š¢ÊTZäÔé­#››J)·\0ƒ™Q4®sàzÒÐŒÍ¬É¿Ì;á–òØø€žû·vÚÑÚzÖaÔ<HtãKÍc™h†Ú°€0*	ÖV\0õ«‹}ÁVÄ¸Ò{Í`8ÖùÐ—P;é&Z­}î—þòóÏ¿ðì×¿ÓëuööFÖÚÑÁdÿ`)\r\0Y–;‹2Ó*Š¢,Ë\08Vzµ›¼ç‰‡Ž9¢µŠu4×ã:Sm¼ÌiJ(<gXüš~æ¥f\0hE—#h›­jß­^¹Žˆâ– º³!°?á8¨y¯•µÖï†Øð‰›L‘Ó?ðk+\0\0P‰W€_Þîn)bWSÐu‡‹P÷ßóž÷<zþáû÷ï~å+öú¥kI’ôÒDŒ5Æ°5‘Ž³,³‘žL&\'6‡\nðüG·Ž¬÷{ƒX»¤ID°ñ•ü£=õQHˆ}5ÔýëÞnH\"sõõtoåCCòôµ–]œ‹s¹º6ém57Ñaº{Yð½½]dw_³1þ4‡·\\{ÐnEª@Ð—f­U‹’{i†Š$McäîÖÖÖ_ú…Ÿ™Œ§{»7®^½{çÞx<µ¶‘^ÿ˜\"v’8Ž;Ýn«(RQ¹í¢2X+>ûæ6¹÷\Z	‹ZÍËŸÜT•âbóï¡ÉzØhYlwN«g)¤ª_‰ã\'ëÒB:ü;4AÇ÷>`ÿgrk>ùŽMwiò\'Šêjˆ¯@³\0 LFãha;ò:Ù‚š´ÒÄmå¥”Jc-Æt“8ŸUU\0+BB\'n£¾úN«\0Q@`ïÞ½Õ\rB†z?R`¬¹Œ…x7¦»\n­­Â^!\0p\\\n­C$Ì|ø$R48VÑ|ÖŽ^…=\'ü±«†ÖGí\"ànà&à+PÍƒÁÿæÿþùoëÓñ¤ÛM¯^¿úò;ž\"âþq±éDtÜ{ÞW77`¬Fe©Ë²D­´Ö‚LDJ)­Ü6Ò$\"Š”G*ªØüü\'>ùs?ÿé` ˜;iúÈcoðáó\'8hA\\y¼½Q©ý\\Z¢J­\'KˆõK{\Z–´ÖúûXk‰`Áa\rï»(ìaÙVDÈ-%óŽ“ÛýÕ¥:š1Õõ—Æp·ýWŸÿ—Ï=÷çei&“Iaª}ä\'¿öÕ/îîïû™Ô>‘åÊÍGTd­ã´Û_)¦³ì`b¢4AŽ¢€\"¸µ*N>˜­RÚ£Ÿ8{ê+_ûòÚÆÖÙÇÞ±{ýÕ¯~ík«ƒÁ™3§.]º¤Iýú?øoÏ>t¶¹®ð€.ÿß4dÌKþµ:-›R¼{×ŽGšÐ\rYÂöàe”!à8î…Ö\"À.hr&Èl||öÃA‰°‹ÝŸùó¯¿zõÆ×ž{îàÖ-´æ¿ðK_ýý/Ü¾uãÎ;¿óOÿ¡¿ÖyÖ®³‡Y5×9±š¹JkÍl¬µBH:\"ª—½ÕM„¤•X†y‚š>ùÇ_ù·_6¯|÷›O|ècxñõ¢(/]º’$ÑÁÁ¯ÿ¿›$‰RêC|úWíoÕ®Ýœvç$ráç|Q÷âªPo|\\ÒrÃ§…ÚCPˆøˆèìd|­Œ\n\0\0P3”¹’:uwÿý/üÑw_üÞóÏ˜1Ë2ÇÝì`ÿÓŸùì¿û×ŸÿÐÃ\'O?ú(‹Áº\Zå@‰çQ.cóE‘M§£ýé4aŒ5\"BÂÈç8Ý‚T·û­Œ ˆðÚÚêÆ 7NK–Ë/~w0`§³[÷î§i\ZwÒ½ý}DüâW¿öå?ý³­õõÕág~ù—Þ÷Á§DÜnKJ©H„Cp®• úeØe?Ì|„°Ç€ºÞÐÊ|ycâ\\\"k¾þ¿5OlUæyŽ@+ÛÃ*?XYé¿ùÆEðö·?|ýÆè×zÃ£ÿä_üŽRtôÈöÆÚÚÁþÞx:SHHð¡~ôÊÅ77ßû¾^¤Þõð‰HiÖª4z& ì–ÖYk‘Å˜Ò˜²(ŠÙø@ÜK4€Äñ p.\Zo]„¡©s\rº½jV¬mm]¹víúÍÛƒÁ@)•¤Éd6^éõ‡Ãáþþ~žçI’ŒÇã¢(þ¯ñùÿçßüëÕ•ÁSO¿ÿŸú”KB6‚2·‘ âú0¨»´ÒÐl†n~î½wšÆ ñ‚W4Y¯~éÿþÎÿ!\0TQ”TùÉîíí¾ñÃ+\'Nl_½xåZ¸µµ~÷înfº¿û…/?ñÄãßúös×o\\.ËÒ-Õ:^®½öƒWÖÖÖöîÝí%Q§—!Ì›G}* –Y\\£¦ŒkàHz}óª4é~DlÖ—ÏSî\"ŒŠòª4¦\\]]­¬][[ÛÝÝÕD¤TQ++«³ÙD¡^YY1ÆcfEžçyžÇ}ÃÖÈo}áw¿ð»ÿïjeuuõ¯|ö—Î?þ(s¾Œƒ–Q/IÖÚÆ[ƒflí<E¸Œ\\Ãâ>·ž^¾¼]xá+`«2ŠUU¢ûi\'ÞÛÝ¼yû‰w=qÿþ¾9¬–\Z_ÿáõóçÏÿÅs:Ž§Ó©+¤h­WzÝ³gÏ}ï{ß€³gÏv¢¸Èíhï`ëH\'°OàkÁ­T„yˆ^gÕµÖÆ”n#1iID®yÇoø\0ÂUµ·7 kÅ¢Íg3·ænww·ÓëáÙÇè½~Uä:ŽŠªc”Rä ›Îª¢›v\"RDtýúõöÿ‰€]]ž{èáOÿâ/7Öy1Ìó0$\0\0 \0IDATªª;pTs+Èð†\0 Ž¢ç?ëDäæ}Q\n¢vVz[Ç°»úÛü]Säyýæo™éå›V!úÈG>òío}cgçž1ÆŠ Aš¦q;vâµ×^ÙÜ<²?\Z	(Á¬(¯¾öüpíãJi&Rîµ~	¶ˆ©˜Ä¢€aŽã¸¬ò(JÂ®ÅFk‘Y¬5D¤”¶Ö0Hžç÷îîN‹0J»=‡`kkkwïßŸ|ã«½^o_dãü;¦÷n¦H¤’áç(í\0ðÎk/£\0Pû£áp¸ºÒÏó¼¾|ù­ßü??Ÿ¦é/ÿµ¿º¶¹VSÓ6zì8\0(í:$\0ÀBm$Z¹,w¬½N9´òèæ˜¹¿³ÿÅÿð¥o}ë{{{Q¤Ä¨í\'ƒÁî(Ïn_eáæ¶\"ØÝÝÕš¦Ói7íŸ8ùÀ7nÜº^U¶0%‹Qé4îäe1ÍfïúÃÏ<ógLŠPOgÙõk—VßxåôC)UóÀƒÄP±X±¦±lLi­u=\n\nÉ\n4Ë”5Æmßàå†™\r—DXUÕîhÿÎÞ´«™\'³™sj‹ª:ÖïïìíÕïµöÒ·žuðDÑxÇ¡¹Özeu¸õÿµõæ1¶¥Ç}XU}Ë9wéî·Ì{³pF$‡â\"Y)EvdÉ4!±%(Év\09Z,XäÄŽåXHbp‰œÄ	œ\"GmE°G‘C†##²(qQ(‰¤HJrHŽ†ó¶~ýºû.gù¾¯ªòGóÝûh73oî»}ï9ç«åWU¿ªú¦oE×7o^¿öy¿ôÑ¹\"åüü¢mãþþÏ¶mûöw½ó½ïû#ü4Í€ˆ@Òðm äš_ \'5Ñ]mÎ±½³[úü—ü¥ÿóòúŠˆ”%FróÖƒ‡÷6Û«ý~/…Ë6_î7o¼ñúÝgîTÇõ©ßù­\'WW9g@!\"Oä=-—í£GNOO///rK–v}2¦rqqùÚç>èž{ée›‡ŠˆÌfÙYUs‹VK±]\0`4\0cMÁQAU\0wý~³Ýov±Yf…ífsëÆ\r»ÝncÇÑ\0~£=Dï½aGUM)=¸÷ÆþúJ·«UJÉÇ¸Z,TuÇç^|iýöoxý7?|ïüüÃþp×uwïÞýÿò_2Õ,GËoŒîï`^ŠeéîÂê@…Ù«I\r=†qüÛÿÃß»yóôÞƒû¥===½Þn=¾‘¶mE$Æ¸p®ëûËËKçÜn·‹±ýú¯ÿÚ~üc¯¿ñFµlˆèÆí[íê•W_)\"…“»õ‚Œº}zòä±ÿÂçrßÝ~Ó[×\'\'õQ2çœS)¥äqál,Z“5Û³\n(ˆ^,Q5«BÎSJÝ¾{x~©íJ;ICjš&ó49¤ÇIø€½÷§§§\00åœsÎ\"²lÛgnÝÊ9ÃP×\rmhÇ’W‹Åƒ¯¼þ¥Ï¿òÌ3Ï<û\rïyü»ŸL)=xô™{÷î=÷ÜsÕ=˜\rœdÅÒSh°‹•XŠ2\0¸þá%BgXÖ,òOÿwçµ/q³Ù\\\\ž£)o6[³W–Þ*¥Ä&–ÂW×—9ïÂK/½ôáßøè£óª Z‰Ðùàœ1ÄÂ¥iÚw~ý7|îs¿KD·ï<×¬ÖÔ_¬Û›\0\"9%î÷,›Æ£—Â¥$.¥ä1ç\\òXR.)—R&$«@Iç8£”’RbÉ™yÇ¾ï/®·›A?ýû|)¥QTmyŒs.zÏ\"¥ð8Ž€ˆ6{L˜E5çì¼/3ThÛ¦ëÂeÓŽC*…oÜ8óä^å³1úóóÇªú‘|ì{¿÷O°$Ô¹êY‘Žª²\nª Îõ8CDXtÊÜ¥”¾üÅ/Þ»ÿ•Ý~“ÆÒ§±‡ëíæ<IJÉÎYx\'\'\'ßøžoú­O}òÉ“\'¥ÑBès>s.L\0™Æq|ðà½\'¢x]¢9föÝãó‡¿ôê½/¾²¹º,%)ç”ÇÄ¹”1å1SÍR„ jÑ“0gfÎedæ¡OiSJÝ®ëzùèîû1¥„ˆlgpÐæL9L-ƒIG‰çÌ,\0©ï}Œ‘ˆöCošÄEû¾_.—)V]­V·oÞúéÿæoÝ{ã¾ysºõß\"‚¢\"ÖåªZTŠŠû?ö@íxàá£\'ÿð?ÿ¿ñÛC\ZÊ˜0½X5(æ\\bÛ:¢qs (\"ÝÐ7mûùW¾°Ûí2OiCðDÎ‘Dˆà}pÎÝºùÌÅåùv»EÄÂ|óÖñí£>€#§\"yèsN<ô’G@é»}\Z‡¡ï8)EsNSœ=1~dŠ5\0sfqU!¾ÈôÁÿž@)¥i\Z›Ys:½æìuk¤1QË9›÷±…|JÉÆ&ÄØ ‚*Bl\\x¹ZœŸŸ#‘#*\\úaüèGcáý‹/½h-ÎpÎ\\Tò4ö¼#\"þìÿöî?x¯®7írÑ´$af.ê<‚wœ‹÷UM ÇœÉûÍf£ŠÛíöúú:sAD$´Ý‘Ó\"fõÞ+Ë7^¿÷ºy°›7N·Ûëãïì—ï½NCu(ä(í÷W)¥±1ÖÌ	S)¦Fªªˆè}0ÌMˆœò8Ž’r³\\°cú…éþùcû.«@Ø#(¥èüSsÆ†§¼ó¤÷ªªšÇ€½sÁÒV–H·Óíº®mã0cÎ‹ÅbÌÙ’@mùWþÕÓwÿ±ïÖ£ž­¯ÊdÀî¹?ÿ£?\0ü¥_þý×ßúa‡}·_.Ëåªï÷ûÝND|pÌ›¦ä2æ,ÌmÓ„ONÎ†adÎWWWÌŒ¨€\\ð>(0\"9ç€BÁç›ûî™$>sç¹7¾ò•“Ó3UüüùøüY{ºˆàÐ¨Œ}§Ìy²éæ˜¹ADGÞ‘Íhbe‡.DçÉ¿q=þÌ¿ø«ÍVç­â1F$e)\\	8ëff$%²©óà½÷!˜Ÿà-ÑÙ)\Z(pÎ«ª4Mcá\n‹¦4:ç„‘*îß{øÚ«_ú¦wcåjÔ(m\n¡EUTÝüÈ]>¹úÄ\'?MÎíöÛq¾üÚ_<¾ûü‹ï¿±ßíÐö(õý\0ˆÎ¹à}*Å–’¨ÂõõUádÛ½£=X<A^œ÷1çâã‹‡Ã8\ZÎÇþùç_<?Ô´‹]¿ûÝ7®^y<žµÍ3+ïCPå’¥–\\Ja-¬‚HbŒ1„ãr±ðÑ‘‚n›üßù¥_ýÈg¾`sèMî¼÷!„¾lË[\rkm_t×u èÈ«ˆXÕ¨’È&ÓGPò”KŽ±ED\"$çKÎ\0 ¢œRÎãzµjš\'ŒÇ¢ê¼ë†îÓŸúÌ{¾õÝzÔÉyl£ìbÜzqûŸüô£ós[ÞÞíwOŸïö»gï¾pïÞë*¢\nÞ;aµ²\"±Èb±X,]×=yrQ„EQðsÞŠlEØ£[.DôÜ›^ºÿà^ÎÙjd¥”ç_x±Ûï^ûý/Þ¹ûl?ô›Ýþ®í÷îò÷Ÿ¼ë¹[‹à@AO(‹ƒFErä¼÷±ñ€@€¯Ü»üoþŸÿ?ÿÔnßé5Èú®lÇžs.ç\\q‹Ù–q{âfú›v!\\J|€Îù‚ù¹R\n€’3ÒqÔ}×áQ~\"•BˆD4ã0¦Oê3ßöo½ÇÖÏÉ®§~üùÅãG ‚0Ö!%t”sÍÆfPUä(Z1g&¢Õb1Žãv»Òˆˆ6Ú6#¢£HTXµ”²\\-íæS\ZìlÛ³ª^]]¶m»\\._ùÜ§_~ë;û¾WÂ£ËÍOÿ³ÅÖ‹öÖÂËËwÞ|ç4T-@˜‹°Œ½Àrurÿ‰ü¯üåç—¢Å¦Æ™¬˜Ý;¶øˆhß^3<6!¢žŠÎ55;Èû BD)¥96f€@äK)±iTTs)„À¬¥”TŠº-æ<ƒ\0Œã8Ãÿü?ý½üsæÆ­›øèÓ,=ÿå/¿\ZB†Ñ7-¢c.¦ûý>çÑî*¥4c!\"›ày}}Ý\r½]=*8šÎ „Ë¨‚c\Zlç¼©ÞãÇ§hŽ¼9º\'çÏ>û<\"â—_{õ¥ß€6æÇ{/ª—»ÍÅF>ÿÜP¦Í°ãƒ!¥dþ›¦1Ÿi¢m#W-³÷›ç„§Sú4oÊ©‰äƒ~a†£ThÛÎûã»aˆ!àô+¥\".H)¡ªs‹l©kDGáj·ýG?÷OþÔŸúÞ_z“=³ã¤,¥”w»}&ò9÷ï}…fævŒ1ç\\ñ¯©.‹ëýÎØ×S\"v\Z\'èL\0¹h.#¡.Ú—ÅÐvÝNDÔyÔ)M¯‹åRUA48êºîêê#rvö*˜sf[\\KÞíûn¿ßïû]7ô©d{ÑÞl ¾m[ÂÑu]M”Ù¯WÑ›+9®žJýßÊz¶\'E3¼±_Ï9[K`.¥‰±”¢sÐc‚•%Û7Æ¶ÍÌ)¥aqÇ2–÷ýÓú‹÷¾roúLÓBq7ÎnÞ¼ycFUÜw›óóûÌb¯®/\rkYD„ÂCX.—>¬UY3² `£^J)…(9çš™¹mÛgï>wÿÁ}fvŽš¸°\\|)›Øl·fÒ›·n®WkšY ÂŒdëÛ\n\0¤40—Â%çìl]4¡ˆ4m³\\,·äœ-M$\"Xžª,«W¬`QŽ8^€¼+…‹‘S˜(Š:eCÅûà}¨iDï}~³¹žÂòÐpÎ¢:\"ˆmÛúÐs\nƒcæO~êÓÏ={çöí[Sg\0¸gnßÝívwï>Û®O¾ðÊgöûsnuræ·Ûóf¥.\\¹ã¾ï†aÐ©å„&£äœM-¥¤<hŒœG¢‚ˆ^<¹\0€àcí}SÕ’yzZÒ˜SU ÄclbôÞ/Ú…í‰fæR²ˆ4!6më[,—¨`«¨!Ä¾ïÌ~¢#GS¶ØVÇ€ý(ï&†¦ÌÜ;çœóªºX,˜‹ˆ°d@U°	­äC´ó^­V\"Â%___ÙY†œ÷}ß«ª÷ñÆ›]×§”XE˜÷]ßõ]Ó¶¯~á‹o{ù-ëÓP@›ld.èþÃ\"b¬œóóoúš¾ïC–Ã!¢1\'%¢årÙu]½«à¼€Ý•i(‚#ô¤¤ÌRŠ\0õi¬O¡Ê—ÉæÙ[ËåRlõÀv{½¹¾N)u]·Ýn7›«4Œ¨€\nèÉ¥”ºÝ¾ëºÍÕuÎÙ¡_ŸžÝ¼ys³»Î9+yWÇ†›9Â§WyáL­¨>Ù2&ã8á2w!Ô£²ÌÍA™T÷û=\rÃP„Yç‰³\"†š¦Ùl6C\Z·ûÝ8ŽjL†óóó‡çç?ó÷?0ôãlñÍI6$c8¡i±YÈ4îBm5É”{éûŠ+<9\"2\"˜åŠ\'J©ä=€\".—ËcÕ®\'Q„‰h½^QOÎ!ã(RÆ±ú}ŒžÌ9uCßu;V™„1Æ¸\\®ïÞ}áÎg‰èáÃûyL\0àÉÙÒl˜9,<oÑ=~ôMé<TËÄÙ{/ ªœsÞl·.D˜«\00WblæjÓ41F„yð¯jf1ŽÌÞrHã0t& ý¾³AUFyJEþîÿò3¬6û‡éòê|»»öÞ_^^ÛNUY‹s‹d²å\r\n\0°>=ÒXÅÇòÄuôGe;%PJ\\Ì\"Çw»ÍWQ\nSJ\0JæR<¹årYI•K)O®.7»í8öýØ1gò¼m»lËÛÏ<÷æ¯y9w~~ÿñ£‡öiÆÑ7—Pyµškp3YÖ­Ð•(„Ð4\r*ô}ÏœS*üef@aæ\"ll¸ªÖm\0¥¤\"œY˜õôôtÇ”†)û\"(óÈ¿®ë¶Ûý0tO.ÿÿýßµ\'æ–Ë¥åôEd·»¶xýääfÉi·»f–\\\n[$\\¸Ã``ÀÜrõÒÎy?1«\'TîÈf\"Z­Ö§ÃóèÈ[`Å¥ è8æår%\"Ì…%(³0—14ù½C>:çoÜ¸±\\®í\"†pñäüüüaÅþ&ðÇÁsMédñ]EŸæ\0D,¸›€†e“„™íBUT@¦IÄDŽNNn¨ª:GÌ\\¤C?ƒõˆˆÞ¹qì‡¡Ï¥\0@ŒÍ¢]2—bJ‰µ:D@¢\"|þàâüw*0s×í®¯žÄM.6W·oÝ™+Bè½Â05õäðh]AÁà•SSJ±ÜÀ~¿¯ŽQx¢ešOšÒ¿sÏº£P”&D³ì\0Bã½?99[­N†žŸ?¼ºzR³cf3«é8Œ¨Ÿé\rt`Ð˜svxTpœõclW«Uô!„Àœ·Û­÷Ñ{J:O•NcŸSrnbŒÕº™…‡M\\è˜Ë˜“ÝiÓ4³ìRs¥${>i>þ‰ß>øÐùàcŒˆh•tûk$Ún6…S…ÌÎ¡ëg€„ˆŽœIY\'[ÌÌ\nìÈW†ëb±ð>ì÷»\Zâ.—Ë”’a*Ï›·nçÂóœ\'P¬Ä9wzz¶\\.Eàììl»Ýn·×ã8¤4€Æ£ñ¦õ9äææ\0äœCð@$*Â¥†um»hÛ¶v!xòD˜R>9;MãX3£1´ª\Zb3‡ÖšK\Z†~¶\nŽÐ‰ò0tv¿m»lâ\"¥”s@ÎÇØNŠXJÓ4ÿíOQŒq·ÙšjËÜ•6ôûÝ~3:SDEtC\Z+#Êî¶J¢ÖFû_V¡e4…~\0\0`eÞúÌÜ¶DDt!çŽØGËfi«õúúrûÅ¢1z\0ˆN„I›wp4y¡\nœ‰¹f£MùL\ZbŒÊe¾A,¥X± I‡Ì©m–v¿3´“[3	&ãië£ÇQDú¾7]¡iâ\0\0§â`)…ù@FÎ9çL\0š¸ßï-7`Z–sÇþð ÁÕd€É¸ª\nhõÒnî9UU‡`Ý8¥de÷ãÐIžfVAßwÞûv¹˜zÍÅú)AâœcÎ9›Í†™õˆ¤lÏzZYOä½·¯Ö¹ø¥G=/¤Fä\\’˜âzï™³‰—YKÓ¾þ•×blU•äœK)æº´ \".šB>PÍm€«Øi9wXR8Ž}JÃ˜“¤RrÎT™ ã8\Z:´ÛSU#ìBKÊÇ,3‚©©:½šö°(FgÖø8Ž¬Óš8L0\\/î÷{\0ä\\Ú¶YÉÍ¶\\.÷ûý0t&k†&”¥*Aõ½v#Ç”ˆ	\ZÍ›’ª7yåÕ¡Î²8öc¢fÉ+rÑzUµ,ž!ï§í²Õt#jßïM,µœ·»Î9‡BhL‚§€TòD5ƒ9âÐ9!,G	ñ*û©Ža‚á4Ñ™,à´Gãæ°‹Å¢ï{ÑÒ¶-ÍüA=b+ëQÎ½Ûo½÷©d“æIÉæXw³Ùˆ‹WjËdß~]æ™º5AtrrRƒJ«ÍõaUÏQÃœ_²ªO³ßïm2…½!„`ƒ`cŒ‚Íª<åàe.5ÇØš¬T[J!gïÐ4‹9FÅ)µžYJIÔu]“-sÖÚJ~ÔñY„kÈSp.áÚûMMLÑlu§HÕ,›!(»=\0Ð\"l}%ÛíÖÇÐ¶Ë:¾{¿ßæ<æœmíÆ¬àSV®š‚ú|íïv;³Ôútÿd½;x:¥GéUKÆ™õ·n^(dÈu:?†EìÃOOOÍçÅí\né<»ÈnyJm.Û…§€è<90«\nš™/õ²ÜL…«8çJ\0€¨ \0\0yg‡l™»™\"•ÞuMKádz;`ÛÌÌfa@˜9‹HJ#\"XDV™wÑa½3A0£R“})…çžæ°—i|•ç\\Û¶\"‡×,ÙSô~ÚÈV·âÙ£¸xrÞÄÅÔ88~L‰‡>¥q¬*õàÁ½ÙdÅØ6ª°Z,‡±›2•\"!3\0°X,TY\0„lÖ‰Ìs9*r¨7@O·¬˜ÄÕã‚IöÝÜð”R²ùÂ«ÕJÇ\\ækTQv…•Ì¬ÊëÕJ@a¿ß²–‰¥2£L‰„Õ·ÛwÕË3UëÁ;RSV+KÀÓ]ï=â¬Xè™¹iªÛ.s±%•ˆ¸½¾\"\"tB@µQY¥”â´Ù¶­Õ<*L‘”’øÑ‡C‹àŠp*y×í¯¯¯w»³R\r>áªJ3q¼Cà( ²›4d¶ÂÞyüžR&7“¹\0€\n²äjÍDÄ2q™Ëõf#yLFù2A¶%ö	…“‘©¾Ê»Ôë´êˆé´ùÃ*^4—w–PÄæÂTú»yža´šO0¡\"xÑÒÉM¬*[eChBŒ¦1™‹÷~½^{ïAµö×›Ëëëë®ëRJp{»2=š¡U«ƒÕ»Óé0X…ÜÜãÊ*Þ<ªÍ\\Uœ¸@}y\0g½=vds7Û«¦iò8€‚ªšÇ*ÂNš¦)û2ÙÂYKìV´Û.¥ º¦Ì±L=beÂŠO\0à}tnH)µm›s^Æ¶ò„h¶¡#DDç	Õ{ï»®ãœ™Ù$Œˆ,‰côÞ«bÓD”Rß÷4÷ì8ç¬’?Cmð„6ºšˆ\ZvëÄ±U­`Ãl‘Q¹\0\0*´±V!D$ï@4sq)	ð±YP™ÊZèˆ\0hða†“Õz’DVœ\rŽ÷€R\Zí\ZBÂ‡q•òåŽö@Ù¸Ó*=ˆHX§²–=/\0ÊyÔ™\"æÜäÕY…ˆèÐm/?2bù@ÌB€|Ôßéæ¾O{h¨V++»ÝfE±KÓ4Ê2ƒ£`*¦ý±UC,G“fêýÔû<(gû3Ïü\\?“ÅÍÅè§D<!Õ	^SØ¥PŸ \'‡Ž|Öºl×œWOhÖˆJ–\nX+¢«\nQ%h\n;æ\0è€èœs\"cŒ±5‹Tý\r« ©öäì²ëo7Wm³´/ÊiJæœKI†/pŠüMÃ¼÷>i¿Û9¢¶mÛfyzrãôä†s®ßwûý>ú°^­\0\0†®§\ZIUy§£ÄäWÇ\nµŸk&y¸™\rg÷ir4µ¢#:ôÊ²^®¦92€¢FBª-’¾µ´m;ßÔ-–DdƒéS\rÅaÆšµöiQR…ž©Liv@\0çQiæ-¨ª…«%\'ã#sQXUk|Zâzuº^23€æœ4ÆXä¸”BÎ…&.º®Ë9ßœ¬ÏVË“õz-Zº®ëûÐ-–kï£¥-Ìúc›uìjê©Tõ”ot¥©Ó&;fîEK)fÑ–IÉU5x‚£¡jöïa<9qbVç<£ª†è‚Ÿ¸GR5Þj©—]+“ÿˆN§¡sFòÂRJÛNÕézƒõÆEäd½ÎyYŽbïÃ˜0‡rÎšR²ã?6×·nßÞlvˆ¸Z­ìbpÈs\r-ì»¬B>¦4EB‹Åâéˆ¦vB<U­­«ªZªÇ;&DišæDáDÖ0W,ª%g–¤(\")á?Àöl±ú‡¡¨\r‰à&^ÕÁüŠºæœx.÷[êÉrb†;aš½u°ºmÛŠ¨÷^DcŒÌEæ&`çÇ”Æé\ZÔÖÛíilÛ¥UãsN–¨¶ãú@NNNT‘–Ëeð¾¦=XrôsaÇãr¹´‹D\0ËÅºŠŽæG+áÒÍ;«ªrTC!\"‰AAŸ5yGU”D„€‘jsŠŠ@¶¨ÆQô\0›Ø¤œìDEAë‡ØÌÎPUÅ’†UÜÑ¹€HÌÅ°à²¶[6ÉnÖ9™¸?9§	w‘Kã`Âk¿Sí³ŸžÝ,œ‘æüö”,°Ì¿s!4*¸Z¯lg\\ˆg–\"¢mÓ¡ËbõRŠ]ƒ=µ’Ó0{à§æð[Æc7@DuƒfR:ÚK€ï}ïûþÒô“¹ œ.€™ÁY¹KÅ{ïpv-\n½àhìÍ\\ÆP‹ŽQƒ÷~\ZQ?/W¬zŒóUmš0g‹§­­—@¶ßRUtSIçs~RØÍ3\nåHþ\0ÀŒÁr½B¤ÐDñ1¨j.c½rƒvfÇŒË¿qrj¹±pÊ¾ï«¢Üj7u¶VˆF·5 ª¢¬føHDæ¬~ñÿúÅ¶m¦þ•÷Oþñ[Ïœ¾ñ•ªŠsU\0È;.EAšØæœTUµ\0  ˆˆÎXNuª;ÖšWÍüØßªª÷ž¹äœÉªLCa­^ë¦…Î9—s!BfvDöTlx/–R„Uçã¯7¾ZŸx€	JNã8ÔüŠ!7DjÚ\"yr9\'éö#ï]ð>ÄEµ0§”@TW«U»h\'\'Dä‰ñ\0ì.\Zþ\0¨b€rÚMÓ+ž3Wwýÿƒýš7½°lÚÉ7€êÙÙé÷½ÿý¬U¨QJùëÿéO¾÷Çêd=ËõœkC©.\n\0ì‰[¢½˜s¶.<{LMTÙâ€:ib‚F\nÌ<[qs^D«·› 3´µ´\n>«#â“‹sD()ç1U¡®FÉb‘è#*Ø/e899iÛv½^[¶UD1Æ°X,°Ã°ÝnÝ4-Äy9ÂgS´IBl\0U§Ö\Z\0œ½4NÖª:äã ïÓŸüô¾ï6Ûylï|Êå“ŸøïøCßö«¿úaªÃ•~íCN¹<¹xâsÎ«âöŸÿä¯ü¿\"rbc*`sk’±/â™]Š‡¢WÌ#¶òiôj­\0ˆÐû\0sBÓ*ˆ˜sª	Ua™Ñ\\MTÀÉÙMrnL#—ÜuûÃ³BôÞ¯–§ˆhÚfEå¦iIU	y&ÓÔuõNRuª5¿qŒˆ˜%33¶Ë…-“?~€ºðTñÄ>\'•òÆoÔO.¥xrïüºw½qÿ±]ªZîL^ý\r{OÎ#sþÐ‡>Œˆ.ø*¥Èw¿ï»ÌšXç¼fæñŠeî\0²Œ2\0q.«™óà#æiÐãÉ\0\0•IDAT\'Ììc©KC-à <SLirÎ}ß;<´ÏÊ¡ŒáÉ;E4¶X,Zkó’Üõ;œ›bœ\'«¶ZÍŸˆÎÎÎD63¸&P\"bÑÚfiwÛefõËSm–B.4QÇ¦q\'g¢È\nŠdã»,ÿÅ*Š`T³éu•/½úÅð³€9E#…É»¯}ÇÛßý­ï±7À»ßýî×^}ÝN…q¹\\.špÿÞ¥ylmïýù_ýÑÅŸûßÿyxU¶î6DüÎïøvÑUÌÍÌ‹ÅÂ¹ Šµ8Xb)¥Öµ&CD‡¿Å^blÂÄŠ«¦[U­ðN€Éá”fÆ±”|C¢F1Æ1—Ñ°Üb±hÛ¶ëºÃÄ3îÕÌ‰ÅFh2âeLªÚïvÎ¹ÕÙME§ª©(¨÷Ï~ñîíßìÞú\rî-ïZ~Ý·4·î:$[±x I°ŠýSÃlýò_ýÌï|ÊR¥Èoþæo¾üu/¯×keA%Üív‹Õê[¿í›UUY¼÷–EoÛåÏÿø[ÿõß&ò83tÌÎ¼çÝßâ(”,Â€àœÇ7¿õmÃ~øÇÿäZ‡¶!µÊÑDÎ„9e[5àn@×ísNS™ä¨yÍçüœë¶±ìœ³š¶µÃ0ŽcðÍj¹D\0‹ÝÆœ\\5mrXîgíÔ¢…‹ó¡mNƒ¡*Âi`rÉã°ÙÈö	o.[‚ýÅcåBÍ¢Ë£óQEðìï‘ÜíëÍ˜ED˜j©F@ç(Æð¹ßýÜqáÌ$ë·?ñ‰y2ÉTAû®?ú‡ÿê_ùë«Åêñ“‹ù#\0~üÇ~è3Ÿýü—_{fþŽ°þäòy\'Ÿ{åKŸùì§§Ä´ž%†‰ü[a±¦säÝlWÓ6Îù”ælè¶BµÕò´iZ3Ëûý\0í`œ£ÅbÑûÝvïœ[¯×æ¨Í-µ‹E7S²¾šnNDè06ËÅr5Œ½2[Ó“*ƒŠwÁùÀ¥´í\"¥Ü¬–±iË8¸Û®.úÕ›Œ\n…¡”q»õ±)q±ÊÂ‹gže%$V€\\\n :ç¨+\0‹ ¡‚‚Íî²Š\n\"þÚ¯þz)åÑãGnÎ·33çì}óë¿þëô½ßõ•7îéœÀÿÐ¯~ìmo{ËÿÄþÂ/üßzDÏ!¢RrÑì[L)ð_¥GDÎyt‡z!„Ú¦i‰¼‘Z‹%\04M#\"}ßo·»Û·o[>ÜMŒ«ÕÊ¥”°mÛy^òTÉ1IDH~uz>ÝNÒX·‰ãqq(.W®m7î€†P6›r^ß¼9Ý>Yt»}ºº,CgH\0šõ*¥´l[4ôý8ö7ï¾0\\]sÓ¶Ì<:â2ñ`ª¯! :ç8ÃfŠdc\'Q¡ jÂŽç,š&ˆ±f‰Àr•22£¬	©›y8ä7É·m»\\®K)%»Ý¦>‡ãÉúæéé™™ k‘!—®ïû¾¿qãFÎy±Xìv;KbÂ¬Þ{×4åéD›ª’«[·\nÀ¸ï¸d<BAvHdfA9óÐWes.Ã°Ç<´\'§šf½rÑmïß+ÝN¤papÞ{çA5´«ðÂ›Fu¥Û—¡W¤xó™\Znb¼ûBÙï]Û( #TôÞ-–ë”3\0ª9ÇÂH>ú@Î 9WfÎ@ÅÄUËEØûÐ4ÑRpd\\ \"Ï\\€	Eõ”W´à\0	½s!FŒ¯&GL	C7Mœ¦‰˜’äœ/¯.àÆ}ßÇKaï-5˜…Ü´YÒ½pëf7æ:÷DÍI8ç‡Â,,¢mÊS£RÍ#$õäÉ!8ïE˜\0UÊ~—¯ÎËÅÃþáCâ¢œ•ÕbÙåéY<;ƒ\'g!§äÑ/_üš¡×/½‰DöO.Ên‹ª>„4ŽqÑæ1;–rrrŠˆíú¤;À5mX,ÃÍÛ«·¾#‰ÒAh\ZÛè=-SV@BªcÊE ²Ø¶\"ë\rŠMfYÝ¾£ä™‹‹Q]ÛÆÅ\ZUBRJ)ÅbïêDtµ\\Y²r½^çœ¯®.ONN,¬	!:7åÄt®xÑb±@D÷§¿û=¯?¾ê‡©€S[Ú}ÛÆvèNÎÎ†Í5‚Z©¨z-Dôä‘¸°ŠÐQÓ4!ï]¢ÓÙäR\0T„hévãÕ“¼¹\Zž\\ÈÕè÷mÛºY¤9»•Ÿ\\°síj‰šÆœ“w¾ä1†@äú®SU.L@¹Œè< ¶§ëîâ¢{xoéHDÈ{EÊ…O^xñìkßÕ]mðxâ ª1å,\n!6EA‰Úåºˆ‘Ø.bÛŒãˆˆ)g-VyÅ¸Xa;É¸Xñ8†àKN|Ô<Îçh½^m7›ívc<99I)™».¥ˆ¨5öš1Œ!03¸ûëÞüÜÉòKçW9—\nÎ\0àöí[9•|u	Ê5»RƒXWS¶un¾Ì)«há\"sPîÉÅ¶‰1ÖfUOnnÆQ\0Eå2ìÇËÇ4îùâ¦1o·À‰SAUŒÎKIÂÅ¹imlÛ<€¤%»]…RBáÂbf·¤aûðÁâ™»íÍ›´>Å›Ïà7‰÷ì#9	¡0cð¥|N¹”Ä)£‚Cb.ä|A8ç®#æà]Ó®œÌE8§\ZjÌv)Ü¸qs·Ûív;ïýjµJ)¡-dGš†&cÎÅ{o¸ã4Ò_ù‘ïqßô–çÇR–­ðd«*¢€éììl{}YÆë0B UXß¸5ìw«³i˜Ú~ÈöØnr;›Ø’é9ËÔŠbuM tH!N¯èClâÜ¨9³HPaá™W”eZ°iƒß†‚¨¨\"©”âBÌ}çœkï<[¶×*Ì…=Q³\\û.m7’rCÐœõî—~Ä¡§79eï]óÜ›bãnP<‘\n+3ç‘Ó(¥‚ª¨¨HŽ‹ÓÔ÷¥¤’³ÊÇ…ˆ«Õ\n€6›Íz½^¯OXy‡E»˜‹¸ˆ\\J!xÿ±ïß÷}ï{Ï–K÷oynÈ¹ëÇÝP†”T	q¹ZZo—Mc2ÍÁç4¨H1•dy¥)eÃ—F´˜£Ëð¨b%Ñ0;ïÜ	[ÿseSÑr±PÐ¦i¼CT$Ä‚jñÞÙdëRC@QAvDÊRòè¹ä¼»Vaô\"eÜ÷>„<¦õó/ÐÉI³Zz$ÍcS»Z¦í&¨–¡ëÏ–ý$ë\\¾†¹Daf‡ˆ‚£Õ­Ûeè…åu\0àæÍ[]×#â7»®c‘Åb‰€•êiéÆú\'ÿâ÷¿øü]ªÊ~†Ý®ßuiß\rÌŒÎ[VëPqSë\r±˜ªîw€	k;¯RÜbQºaqr2ì¶yªµ\08$qbñ¤Afœ»qD„\0]0ó\núq\0Ñ!–ED EGž™­…ºàýös……æáÍ Ê¥8§€U…ûqìQÿ…Ï*ÂV„\0”TóeŽRžö²	W¢±8¤º‰è8®BNýöÁÎBúã7<së3§”îÜ¹c]OFb3§XJ‰±QÖEÓüÙçÛßóžoŽ„\"‰TÑ…÷}ºÚvÙVß@Qu¶Ô’É+X5+¯qÍpsB€2ôª,5É,\"‹ÕrèzÍBŸšÔDêadfb²‹nB´QŠ`­Â¬ÎÙ¶Îi\'Í!“HèœóäØ±Z{>¢å5IaéVòÞÓÒýØIï:²‘–b›}4Z¾:Åiü˜H]|N€j%EGWWW\'ë3fÇq½^«ª#B\"26[Ó4íÇàù;ÏXÙ’P¹7Ý>ÙuùÑ¶ëúlÅbµ\\®¸pJ	ðàL-„G#	Ðtf‚\0”œÔªª\0Ð®NÒ0ž¾ãÃãÕå­;eèÉ;„ÉÛ“ÖœrÊ9KaD\"}NÌ6TŒ…ƒÌì¼‹1\ZÚ6>ù.82Ûª\0Vð±m»’§Ò3\0ˆ«£9\"›]©\02Ë¸Î<=*9\0€5¸•’™ÙA2çá¥Èz}’RòÞyœ29DÄUˆó¯ýð³·o;›¥ „Ê\\ÜÝÓÅ“Mw¹ëŠN‡vrrúƒßÿÇ~ë“¿—s¶@¦º ˜NâÐ:Eù8MõC”ižÖ¬Åybÿø‘\rìðÞç¾SUG®”‚Ž¸”åÙ)§d’ˆ)\'e™øÛeé–bAT”¹ZVMž¦í¬âˆì€ÍXòÃ‚æµ˜gÉSðÑ8! \0l·–AÛ\ns«Q\"¢ƒ§ÌLsòÃ¦_Æ¼¥”¶]€q\np*ß^-ÿæOýù³ÓSšw+~D@ç»Ä=sE$D\\­NÞÿÇ¿ƒˆ<Ï´§\n€\0…æ@ŒP…		‘|5\\,<M‘G0Û\r%e@°\\éþòrÆJˆ!ÎEDÁ!)€°ŠCRA±J8±ê¼ªôó¨žÉ[ U¶€™AcêÕâ`M	\nÒYò¨ßæà{µADú~ï\\\0°Y ñ™»·ßúò›ÿ¿}Ü9º}çV·‹…i¤ª’\'wº^ÿ¿úçNKT°ÕØ`ôÙbsüÀïSÙîç’ÿö÷|Ýüæw\09ôÁOg \nsÛÐáâ&Ttè£2ÃEŽTÙ¦ûØ‹RØ2øÌì¤Ì8QaèŽ\0¥”šGóÛhHEQE˜GÏ	¹YeeÞÁAS¾zÊ[„°ÙlˆÈÎfbƒLñ@˜!«*!©­³J!f$æ<¨Öñ§~ê?þ½øœÇ¦i¾ðÊ«?÷ÿH)D‚k|øù—v6\n,¶µ#R%ñ2¤ÿ‘÷# 8@\"RàbÅ*eÁ:ãÀÄr‡Ä ¨SÆvY!¡\"€’Í\ZEO8§ò\'›‹@uÁÌDs§RÄÎÕPŠ¹–)V€‰°¬\"D^fâÌ¬‚Ó1˜æy»=;;ŒÉg(ˆ\n90‹mIG&¾×,òZ3{O¥jêÙ””=z‘Bä›f o{ûËïûÎ?ø+þhÓ,AuÙ´öO~çbÑ8“8KÈ™ëAÄ@”éûþÌ÷ \" ¨(³”)ÉO3Vu*¢Á\\8´RŸÙÅJ†Ô¹«@TUÑMÍ)\"DM\':\râ$epÃlÖ3+¨TJ+\08ôVÆ²8£Ê‡ª\Z`5i­š‡ÓNÀ§wñ\0GGý èØN·Ú¥Šíòä(ë\0ùÈGtêd3¹ßõGþÍØ€UCï|ÇËNU\n‹²(ÃL?P\0¶ÓF!fe&WÙŸí°¦|K’\0D	&–†CRž±„ÉdI\'²ž= {Å*á²}_ ÎHA6Câ«BSè¤6ts®Í ~r!ÎY%\0¤pmPÄ	øôõÉÚ…Õ³¬UX¨k%çÄþä$fý°ÇeÍRÎ¹_ùWá¹Ûwú(àþ÷ß¯RNWËúÓ‚¥Œe,šŠÍ°‡#\"§ ÞÛÄÅÃ÷¡€â8ô‡îá@Y\0-ö1NUÝÂ«ÇÍvÑèæNUD:ú\n*:@@(ÂÊ\"RBdEt\0*hçvH5’Ÿ©´•‡GÓrpœWXˆ9!ÏóùSDl´	ê\\š}ÊÁæÈüsEòØÕc°{Tàa˜q.Þ©(èÏ?[JÙwÛ&:ÈŽ@@#2²N†I¹( v¢kµùÝ¶«œjE°ñ˜O]Š³R‰Ï™ZÔ_GTisÑ$wBP„\"S¹I\nK™hÇÅÈãHJê¨³§KcdÜ}™ˆ„³1œê6“ˆ(é<’§ªTý³½öïŠGì§^ÌSîÝ8ŽYòd$EE\'^óÛÞúç´ÛmrÇqdfÎ©ÈÔ¶¬ª\"\nê&6ŸÙY\"Òi¨ê£G* Sëˆ%Oª¬ÍVu\ZU„3y›û!\'þÖ„¬QUæ•êÕþ¨‘¨‰AyÒyz!\"šÈë,˜xD35\'¬jåÄßÝ€±CPMVkÎ’uI(€Ší‚{Êÿ©A\r´¾îmsvCDhZªúþ÷Ï?÷¹ëínµX8‡E	:EEpN	¢‡bQó‡Udì¬¼qŽz€ÌUŽU•Ó	E™©ê…µT2iý´¯•ÜÑšïúQõ0´nˆÃ#\n©B5;““„Ãã¨hùY–‰¨îÛãyÕæË¡*WJ™\\±TÉ‚êœ~­£ä`è{çÜïýî«Ì\\Šð<\0ÓÞðò;ß)è÷»Þz)&Õ,j²TU„Í²L˜G\nÛÀmPä\"»®cfTŒ0»oÿÌÞ—Ï\"kAÄÚ3ƒ4y{C “ €ÚP†ƒÖÏÝ+x”M;HèjóXAëSÆ¹÷¢Î³K­¶ªoÿ7!QNbn‡QÕaí¦QÅ××[5d(bFIUQTDNo?{¹ÙC\ZsJ%g.\nSÌÄ0]ƒsÎçÂäPŒÃ\n*:–™MwX¯ã`‹D-­¤ v«ÞHc\nÎ¨	,pÇ#¨S(@äl”GÕªãÉ±HNG+txq~ÛÄ0ƒ&Ó\"ÀäðA›f+î4½¹¬¦êÎ¬À§ÄQT¼ó%³÷tñä‰Š8ï\':>‹ŠÎKã@Ém÷û‚só¦d- @–0f`bP›\\ÍÅXª*\n™µš UU˜bà* “\\X°F“NL=@P˜d(*U¹ž‰Ìz‚sðå¦	jXeŽ\Z=UµRùá¨óù)ÃQD§=àOûóc23UÏOç¬¾]!‚Ìlæ#]œ÷ä>Çh„Šðøñ“ƒ]Ueà¢\"\"ëgîîº¾ïÆ¾ïsKIsC–ÉZ:Û!\\„APÅãL¦|ún¥*öÄÍò‚ 8(»=q8lJ”éÀæn2›àPŠEÔV˜}ø!n2;‹3î<£ÒÇ\'ql¦¦P`¾ìšørÎ©íI<zóAö•&¯v¤gvCÓ\"Gãm^]mtîL9˜»9µQ«Û®³Ù0:w©Z¿PÑÂ¢„@BÈÌ¤\0,2Ã)U­1žÎŽº:ÌƒNÔz›‚½Ÿæ˜vöð“»ž39õ)L“5çÜl½ùIHEíœazjõ,«º82U3`fî¤ö\0L¶ŽÅø–˜ÔÅ\"éqGA½ø¯2†ÓßŠÖÉ=SBÕŠ.Àbä¨õ3Ïu}ŸR\Z‡\\J‘RrÎešõ\"B¬ÀÌE%‹ˆs$2Íæ‰1ÚðÂê¨í$ô¨CÔŒ€µr’ìnW?\'œOÉ/ÌùƒÃÍÏqûdôæš\'¿²|,ÁA]ìŒk<Op€˜µÕÖ—árÖI?“ÈJý7þˆ¢ÂbÙXê°”bãïjºAË‘<) ø°Ý÷Ã0pQV‹ŠfÕ!Ûën·T€™¥ëï=°¬ë	Éè‘¢TÙ|êQÎù0­th8Ì9±q7x”ÁÓÖ š¬ÉßØ3­OX_Ÿ,>¬Lîªì›ŽÖ7WqžÎIÐô±h.£jÿŒ	­“êTû€’§;\Zºþ—þù¿„iM ˜6˜Y.%©*³.oÜÚuû>ã8æaÌ<ýäœsÉÉtéªJ\n¢zqy™Æb<\\°ý\rUaç8Å¬Zê¥úU\00>6ÔhCgâÿdÇê2h„`í‡GPIf“¨‡çbFì×ÚaL>¦Ú+œÉØ5Adê‹2=nUEšÿp*Õ*KIÓì=(>Ðbµ´7|ê“ŸÅ©¡±hÉ¦U9¸°¬nÝíºÝ~Ø³äiø™‚\"Rþ\'uedç”]\0\0\0\0IEND®B`‚','danielantonio23599@gmai.com','143.167.366-80','mg21041921','27E1DE39FC9142B33B10A9F5D6167B36','rua antonio marionho da costa','55','serra verde','casa','formiga','mg','35570-730');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `pedCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `pedTime` time NOT NULL,
  `pedQTD` float DEFAULT NULL,
  `pedObs` text,
  `pedStatus` text,
  `pedTimeF` time DEFAULT NULL,
  `ped_excCodigo` int(11) DEFAULT NULL,
  `ped_venCodigo` int(11) NOT NULL,
  `ped_proCodigo` int(11) NOT NULL,
  PRIMARY KEY (`pedCodigo`),
  KEY `fk_pedido_exclusao1_idx` (`ped_excCodigo`),
  KEY `fk_pedido_venda1_idx` (`ped_venCodigo`),
  KEY `fk_pedido_produto1_idx` (`ped_proCodigo`),
  CONSTRAINT `fk_pedido_exclusao1` FOREIGN KEY (`ped_excCodigo`) REFERENCES `exclusao` (`excCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_produto1` FOREIGN KEY (`ped_proCodigo`) REFERENCES `produto` (`proCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_venda1` FOREIGN KEY (`ped_venCodigo`) REFERENCES `venda` (`venCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'00:00:00',0.5,'','Pendente',NULL,NULL,1,1),(2,'00:00:00',0.5,'','Pendente',NULL,NULL,1,2),(3,'00:00:00',3,NULL,'Pendente',NULL,NULL,1,2),(6,'20:04:00',1,'','Pendente',NULL,4,1,2),(7,'20:09:00',1,'','Pendente',NULL,3,1,2),(8,'20:12:00',1,'','Pendente',NULL,2,1,2),(9,'20:17:00',1,'','Pendente',NULL,1,1,2),(10,'11:37:02',1,NULL,'Pendente',NULL,5,2,2),(11,'12:39:00',1,'','Pendente',NULL,6,2,2),(12,'19:14:00',1,'','Pendente',NULL,7,2,2),(13,'19:14:00',1,'','Pendente',NULL,NULL,2,2),(14,'19:15:00',1,'','Pendente',NULL,NULL,2,1),(15,'17:25:43',1,NULL,'Pendente',NULL,NULL,2,2),(16,'17:31:29',1,NULL,'Pendente',NULL,NULL,3,2),(17,'18:04:40',1,NULL,'Pendente',NULL,NULL,4,2),(18,'11:59:01',1,NULL,'Pendente',NULL,NULL,4,2),(19,'10:56:15',1,NULL,'Pendente',NULL,NULL,5,2),(20,'11:31:52',1,NULL,'Pendente',NULL,NULL,6,2),(21,'11:51:51',1,NULL,'Pendente',NULL,NULL,7,2),(22,'20:52:12',1,NULL,'Pendente',NULL,NULL,8,2),(23,'21:54:30',1,NULL,'Pendente',NULL,NULL,10,3);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponto`
--

DROP TABLE IF EXISTS `ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponto` (
  `ponCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `ponData` date NOT NULL,
  `ponIN` time DEFAULT NULL,
  `ponOUT` time DEFAULT NULL,
  `pon_funCodigo` int(11) NOT NULL,
  PRIMARY KEY (`ponCodigo`),
  KEY `fk_ponto_funcionario1_idx` (`pon_funCodigo`),
  CONSTRAINT `fk_ponto_funcionario1` FOREIGN KEY (`pon_funCodigo`) REFERENCES `funcionario` (`funCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponto`
--

LOCK TABLES `ponto` WRITE;
/*!40000 ALTER TABLE `ponto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `proCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `proNome` text NOT NULL,
  `proPreco` float NOT NULL,
  `proCusto` float DEFAULT NULL,
  `proQuantidade` int(11) DEFAULT NULL,
  `proArmonizacao` text,
  `proFoto` longblob,
  `proPreparo` text COMMENT 'tempo',
  `proDescricao` text,
  `proTipo` varchar(7) DEFAULT NULL,
  `proQR` text,
  `proNCM` int(11) DEFAULT NULL,
  `proTributacao` float DEFAULT NULL,
  `pro_empCodigo` int(11) NOT NULL,
  PRIMARY KEY (`proCodigo`),
  KEY `fk_produto_empresa1_idx` (`pro_empCodigo`),
  CONSTRAINT `fk_produto_empresa1` FOREIGN KEY (`pro_empCodigo`) REFERENCES `empresa` (`empCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Calabresa',12,0,0,'sucos','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0)\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ñ¶ê~´ÂÞàR;|Õ6jN‡#®iL…¹Å:o»@4Òj\"ÇuÍ!Üy`)7ŠaÚ,%Þ(ßPš(°®M¼Q¼T4QaÜŸ}…AFO­“ï °¨2hÉ¢ÁrmÔÒrj<ŸzJ,+’fLÍ§`“™¤ÏLSô£ãFâh°¦äb¢É¢‹É2(È¨óEæ9¤\'4”S\0¢Š(\0¢Š(ßÁM¥ÏËI@_´8AT*ý¨ýØ©–ÃŽã®ÿ\0ÕÖu_º?»5Bˆl9nzgÁ\rmKÆÉªlÿ\0FÓT»±þû+*æ\n÷/_ý–Å°y<uúÖÁÝt‡P]I—=ë¼ÎHÁ*	ŸÀgñ¨¼i¨¬ƒ`?*žqø×\"{ø:whæ.o\n8“ï)ëY3ê)Â¼¤ùqô4I0ž\"#¨®oSÔžÝZÞUFR§ËÞˆô¦Ôu:©&á“p# æ³šIb›Ë~„ã5Ééþ%ŸO”;âî­ÛéÍurÜE©i+wnG˜ >Ñ×ÜUN“Žæp©lkiv$àö\rwV–bÞÑYÆdó\\ß…£	æ(Ü¬ÜlWSâ+´´²òW‚úŠqZ7­ŽRbo5uÈOþµC#¨byÁ©ÖD‚ÑÍ\'JÎš`½é’ÇI ÍRžänÕ×x#œŒW;«ë+m|Ùr0£Þˆ§\'deRJ*ìƒVÕ\'*æôÌM#JììrIÍ4ÊóHÒ9Ë1Í#ýÓ]Ð¦ yó¨äAEVæAEPEPEPEPˆ¿ÕŠ(‹ýX¢±ùÖšzS›ï­% #ƒÍK!R½j\01Js@7Þ4´¤RHbbŒRšJ&)§Q@\rÇ½iÔQp´\nLSèÅÌRb¤£\\è§¤#ÀJ)G4»h„f“m?Œ@ÛFÑNÆ(¦â“i©1IŠ.6ÑŠ~3F8ëEÄGE;m&)€”QE\0QE\0QE\0¡m,V}]ƒ\"1S=ŠŽát~CZ^ðÛø¯ÅVZJ±D•‰‘ñ¨$þ˜ük.ç%+Ý¾	øytŸ\r\\xŠ|uÝÂåQƒùŸåQ)rÄ¨ÇšV=U¹‡OÓEµ²¬QÇDEà(\0W™jr´ò1bX æ·5ÍA¤™“vq\\ÍÔáPœ×™9s3Û£Hœž¡ptÍD oÝH7mÏ\0æ°õË¤šÙSËšßÕtñ{¸|‡\0ì®Jínv„e$væ¶¢•Ó2­\'c1°*ÕŽ­udû`vØÝS±¨f¶qÎ1ÏÖ»O†Þ—[ÔÓQ¹ýÙ²sÿ\0-œô8®É8òêyÑss÷t={ÁúCXhÖ‘L0ê››Ø’I¬/êl¿rìÈþ•×j·Ë§X²)Ä¯Æ¥yÍÌ ±Éäšà{ŠîÊw—R3ívŽ\0Íe]^È	&¡¨Ål¬ò0\0W¨jòÞ;%\"=½j©Òujñ¦­ÔÖÔµñ1Bw?BAàW54ÒNåäbÇÞ™EwÓ§-6u%7©$})Ï÷)©Ò•ÏËUÔ‚*(¢¨AEPEPEPEPˆ¿ÕŠ(‹ýX¢°ùÖ’•Ì~´•7ƒ´‚”Ó´bŒQR0¦âE\03ÔbŸE\03ŒsO¢€E§w£+@¥Å.åõ£zúÐi’)ìëŠ;4!\0 SÃzÓ±F3EÀMÂ“p¤(i»\r=\0yaMÍ4ÆhÙF€;4Sv\n]¼b˜E&ÊM¼Ð©Í-€fÚm=³Ú›‚iˆ1IJš6š`%»M&\r\0b)‚®=*¾)â3ŠLh|²†õNˆðIà- Úql–ã‘úþ¹¯”Ìf½ëá©%÷/´Æ;”£`ÿ\0eÉ?Ï5Ïˆ^íÑÑ†~þ¤:«Hó³+wô®zWšâé`$s¶{WA}Ë3Å´–c€RjªøbC:I¨J W!\nuÂ“ÔJóSG³QÙz®£ …[$\0+Kydw”9½«¯Ôt\\‹9ÅÎÖÇÈ‡}I¬Ë‹(-øÚznëVçÊìsróìÊ>ð¼¾%ÔÄ\0lµ‹\r<˜è¹è=ëÖ£{mÊ+DÁ\nì@x¦èööþðu¢®k”Ÿï2ðËêÓý²Ff\0àðG£l#¸ÝgV{¹‰pº\\äÓ7$œÑ<†69#¶z¯øÕ¦Ž#¾FÚ‰ßÞ£rÝ’ÔçüAlÂ>Vù³òŠç+g\\ÖN¢V(ÿ\0Ô¡È>µ^•µ3É¯%)·¢Š+Sè@41S(¢ÀQE\0QE\0QE\0QE\0QE\0X‹ýX¢ˆ¿ÕŠ);˜ñÞ’”Ÿ˜ýiO5:)r)1HE0\"ŒŠM´›)P,zBàPS4yb\r2ûSL‡ÒŸåŠ]‚ž€Gæ7¥˜ö©6Švßj.!Ã\Z<³Sm¥ÛJáb”›	«;hÚh¸X¯åf”&ÚŸa£a¢áb 2y§bž#4¾Y v#âŽ*_(ö DiéM51ˆÒygÐSâŠ›Ë>” ¢â±›sSˆ#EÂÄ}©6Š³äŸzo•Ò‹…Šû}èÙV’ÚG`ˆ…˜ô\0d×Q¡ü5ñN½2­¾•<·ü·º¢ó#ŸÃ4s”ã|º]•ïz/ìÿ\0o\Z‡×µfr?åþúeþ•ÙhÞðNž¾‹opÑ±S%äBF$wù‡ò¬åYGr£M½”öqÀ¦”5õìžð|Í¹¼9¦dvÙGòñáÚ7þÝ%ó¹­c8üÅOÖ\"?dÏ’-´ÛËÆÛmk<íéeéZqøSÄ.¿&ƒª7ÒÎOþ&¾°YtÛ³emmì\"T~•ÕŽã \nzl×=L}8›C&|£?†uÈGï4]F?÷ídÒ½à¤×:n½{¦]ÚÏ_D\n™#*7&OSìM{\'Û]ÉÌŒ>¦£%‹CzŽ+f’µc„”]îp~+×SEÖ&µ±¶2\\¨d’:cÚ¸ùüA{<»œ*©9;;þuín’JL±Ã&GÌ^0Äþ•øoD¼\'ÍÑ¬žX[€1Y)Ó“:9åÑâÓk,Ñ6ŒÕ+9Íö©k¯ò<ª­ô$g†kØï~xbé†~ÑlXð\"¸ÛÏ°9ªüÒ­nãž×Q¿- LU†º¦’\'Û«ë\ràTweE@±ªž€t®Vò9,cbôÏ¿ã^‹?„\'’0>ÓáÐG‡¨øY’9+‹6ƒ9ÿ\0Aªk¨*‰»_CÍu¤†&”à`u®\nöö[¶Á8AÐW}â_ø»Í\n–hGO³¾üýEqš­§ó{¦^[Y d¨®šŠW{œ˜š’“²ØËÁô£¥ÛF9®«œ„X4•1Z@‚‹€À¹…H©öŒR2ñJáb\n*B£4iÜC(§8£o4îh§m4m ÑKŒ\nJ\0(¥4»hh¿ÕŠ)cŒQH	Þ?ZpU³§Í¸ü‡¯¥Hºt¿Ý?•eÎ»šr²†Ú]µ¥ý™6>á¦ýÁû´¹â>Fg…â—i­°°ì*wØ[ºš^Ñ‘™›(òýkSìÝ4¿aoîš=¢FdùgÒ/Úµ¾ÀÃªš>ÂÞ”½¢FdùgÒåûV¯ØqGØ¿Ù£Ú!ò3/Ê9¥\ZÕû	=œ,[û´½¢FdM(ˆúV±²aü4ÓjAû´{DŒÌòÍ\'–}+Sì§Óô£ìÞÔ{DŒÌiBœt­#kíGÙ½¨öˆ9·Ú—gµiQè)M§¥/h‡ÈÌ­¦“­3fsMû<Óöˆ\\ŒÎž”à=«DX:R3è(öˆ9H aZ:W‡õMfQ›§\\Ýà˜£,Ôôì?¾é—zTZæ³¹iNa·ncÆrsŸlW­ÚÚÚXB ±µ†Þ%à$Q…ðsuº¥|	Ö§d}JöÎÚ#Õc,î?@?Zítÿ\0‚±‘e¹’öñ—ªË\"„?€QüëÐ¾ÔÑÄÊªÜäšË¹ÖQ7Ý:Vs­NVi\ns›Ñ³ðï‡ô¬-\ZÂ-Ð7çŒÕ¹.±À<öÏ¶¸²¸o1Â¡GZa¼yYŠ>ßMÇ¥rO]Ç\r%¹µ-ÇÊ~|öâ !vœ\0“Òª4é@\\žìZUœ\\Ù”·¹ûÌTøWñ<Í›*vC­îÄ×,ˆrª9üëžñ†¥p—ÖQ+lràWœÖÕµÅž–\nÜHži¡íø×!¯È×úÄÛß[UÜ’Ã=N3\\ò­û»7«:ðôÓ«{h†ë\Z›Ç¥Ç.RI¥Ûž„\0?úõ­¢Ú¾Ûx¤bNÞõúšÎšÆ–${È\0Cæ7¡\'gÓŠêaš0ÚÄ²2ýé?CX«J×{\ZÕ—,9b†<\'X×qÝß°§oX¸‘×\n	$žƒÞ©¯/Syx#A‚$R\08ýj$RÜÙî²ŒPüøö£ÚAJÞf|­«³zÂK{ØüËy’TþòœÔZ‡öƒ#Åh/î¿sùU›M>ËG°k{!Ž1ó6[?Z†êo°ÄÒK$…ÊìG=þµÕ8¸«7o3–2¼ï{\\óíBÓP:äê7r?–Cƒæsyî9®–\rt	c´“QC>Ü¨2òÃ§\'¡5Ïë±ÜêRt@EåY¾ñÈ×;y~öˆ‘ªÛ¼‰ŒœØí“œÖtk6ì™éÏí\"›ÜõÄ¼,Ÿ;qŽ\r@÷l8;†zs\\~™©]´	qt;p¡W êIâµ¦—š»ãæÎEwª‰žk¤âÍã6vw=ñýj¡[ˆÙ$,G#.søU\rë\"ü’¸ÇR:TÐ¸•¤\'iÁÁéWÎÌùÏëŸ\r<?­&ÿ\0³›z‡´D\\ÿ\0¼1Íy†½ð³XÓ7ÍbRúØ}Ñ|Ïûçþ¯}8vç°8Ífê¶Öù\'…Î0 pkhâ\\7fOÍÐùrky`•¢–7ŽD8dq‚¡ª=¸=+è\rJÏÃºÈeÔ,¡yàÌ,Š=›­qZÏÃHß¢Ý†\\å\\¸ÉÌ3Óƒù×M<T$a<4ây¶ÚFZ¿u§]XÍå]ÛÉöYŒûQPø®„î`ÑSË£gÖ¬ytÝ‡4î+Ê‘IƒVŠâ›éNáb½.*m£Ò”\\,@E&ÑS˜Ç¥_\\V —\'—IåšwÉ‚Š|q’‚Š.=Ôø6&ÏËŽ}*<$©Ûí^™öeçŠ†[d\0æ¼‹ž‰åíáånßåCxqJýÜþUèc	#šìJ¹‡¡ç\'Ã`ŸºGáAðà^ ×¡Éd:•¨\ZÞ1€Ãù˜Xá‡ãÆvœÔ_ðzþB»¦¶<\ZhµZ9˜Y3x{üàTð¨9?Ê»iQcàŠªì™éC“)ÈAÿ\0ë\naÐ×¨®»llÄm¥û:cG3TqÇGÚ~ïéM:iþé®Á­è(K5#æŽf§Úv8ÛúS?³•»cð®Åì”IÊñP=’<}(æbå96Ó@ÎFtÃžŸ¥uŸd\0ò3M{P{bŸ3TrgLb;ÔgM#Öº³n:N[TeæŽv¨ä¿³ñÜþTõ°Èà×PÖ±°À§8‚`G8rœ±Ó˜.qLûž•Ó½ªc\nß…#Z`gúQÎ§(ÖÌ½©†®’hT!yªMl1ó\njl9dð=µÜ¾ÑÝ5\r‘D§r\"ýáýÒsÚºNíím”ÂÀ;0äúw¬/mƒÁ6{\\ ÜÌÙüy«\ZŽ©¾†Ð=ÃÈ¢@ê¤&ß÷±ŠÆ½_f›]‰§i¤Î{S×îçiŒSHÄ ‚ªrN;çÞ©[ß™áYf`Þx\\×\\ú|Y—¿TX~ò!–täVmÕ¶“ˆ’ÖÚ-„¬\\á~€×•^2·5Ijz”ëS·,bVÒá³½bÉ|’°Ö®_\"Ø²²¹w#€üMW¾tÒcY\rÄ¾[0d(Ï_Â¹©|_4\rpÂÖ	¬‰Ú%ó\n<ŸAÖ”c9ÆÉX%)^:£J}wS7e[X0ÏïÃ¨¦Áy®Ü]¤2Û‹hÔà\0¯Z–ÚÇHÔàÁdË3¦ã”œûg§¥bÜYê¶y°éhˆ‡$É†é×ô©Šÿ\0‡:\"¡/u+?3¥¾Ð§kW˜ß…Á.fBŽýúW+$Ú=“<rÞAŸóÑcgÇÓ¬Ÿj·+ä@‘—Æ<°=ù4¶\Z4ú¥É›Z³‰£’aôiÊ4Ó»Ð¨*´âý£+Cqáøæ_<îÉ”H­døõ®‹Gû[HÏP‡ìÇï¸8ú*&“KÒ‡‘mYFI8Q’ÿ\0RÀâ­ÄþºœHMÃt;Í6éÊ~â±IÉÇ[¿¸v­%üŽÝÄq1¾L\r¿^¹ÍRmit¥a<è.‚Û>oÌSnÍöœî`³g\'%ã“<ºj…µü7’?›,S§£!R\nÁ©^ì¨Erê®m7\\ºò\ZéM!åYT–\0tçúT:·‰.î‚1$2RÁþT-ÈõÅCcŸåÀƒ8²µÍxš[«Ä[Ë0Ÿ6RHÜÃ\'šÞŸ<ý×ª!IÔ½¬t^$ŽH® DžIHæCÀSÔkœŠÚÒçPG–eM§,ûøíšÉ½¸»¿’7iÛ÷Ÿ*Èz“è};óV`Ò®áCL§Æè1çröúq[ª)>hèti(·©.·yö»Ñm®‘…\n#ˆáXŠÐ¶»¶²k{t—…Ûå3\\ÏÛ.-\'Ô1?6Þ™ÏF«…oDëså8eù“åÏ8ÿ\0ëÕ»§© ¹yQØÛêe˜3¯Ôw«W8ºyº¨vûÃøŽ;ŒV-®¡cod—	\'šß\Z©95®Úê&Í¬jóÈN»\0y¬Üä¬Î_dïdŠw¶÷)ªïí)NÜü¡p9	Ï5—ïpÄNWÜ9Ç<U[SV¹’KË×0!ÂÆ\0*‡YºŸ±[(k€»œžÃÓùUJòv¹\\–—/RÄÑ3€ê;ñŽÆ¤E‰I\'ŽÃ­s:n¡2êKi&vÌá0££]…ýÝž`×wrn—n!»8ýzÞ•	\\Ã5\rÌø¾x`ÒR+ØUî%…ï(ÇÞÏlWœ•õ­û™ué®ç$É#ëÓÛè*™B\rzô¡É=Y¹Êä%})6\Z±H:Ö×2±X©=©­;U£·4zô¢áb˜Qž•\'—ž‚§ÂŽ¢“€h¸X®c Ñ°Ôäf+ÞÅb».)»=jÉLu¤*(¸XHÐybŠš4]‚Š\\Ã±õNòTâ£ópÃó«’*)âª²eúñ^{…ŽÅ!N:SBV\0ÆhÚ\0ã­‚æ hØŽ*³Û—<Š¿‡¨Üc’hhi”>ÈíŠc[ÄƒVOÍÞšÊÀg56*æ|–û‰Èª­`Î+M—\'†æ¢xØrM+™œ-‚·#ãžjÄ±ü¹šS)Hc%õDéSl n¡@èÆÐ¬ÊnŠ{ÔOjšÐ’(BóÍFLj0(Ð\ngQü4}—xÎÚºÒÆ¥Gö¥€h²‹Ù=*¶Öµ<øöóP5Ì ò)h;¿fÚOjGP£jÌÒ£7Ui=:ÒºíºTû(ªïÔõ¯ éSjú‚ZEßæ‘ÿ\0¸¹äþ´ãï;!=ÙŸ“]]¤+¸òOEÉö®›Eðe¥Èk‹ÿ\01¡Sœ}ÀG¹ëéÒº™-tÝ\nÜ‹XöÌ§ivÉÉÇ\'ëÇnjhšÏOžÞ)ÊêOLÍ),ªOV œ`Ó=«oegfdê]]jº­¦eŽÍg¦Hö(çi!A\\õ?áWo4ø.Ò;ˆPFÓ‚8ô¨,$–]:5Ö¤·cù¢TPEƒŽÜV§x®\'¢O:\0\0_$õúb±«Ê›pŒ¤¥q;‚Œ³ÛÇƒü!²Myß‰´½BáÙí´_³À™Ë	WžFx®ã[Ö ÓÌ·©k\n¨Ý\"Ä\\Œà1Ï\'Þ¨Zx›MÔï\"kIg˜\"·˜ÂÝ€œœzv¬eF.ÉôêtQ¯*O#‡Ó´KöÝmp×ûîdr:?*ÕZÚÛ››™ÖXÓ—ÄnçÇJ·sâj\"¸¸±xÂó‘´„ÈÉ#üš[jL.ì®e0| O÷²[=òzôÍsû5vnñS“¾ÆUåÕ¬5í–ûYFUmü²ÌwÝž‡¯¨Å3KÔµvâ$’	Ôªík‡MêyþéÆ?úÕÔiž°µ²[’L¿uŠž¹V«â=CMÔü¡t’Fî\0ž™ÅDœ¢”\\tf°å©u\r_vojV‰i=®Œ—\'vVG®3Xwšî£5”±Á`ÃæîQ^õ,þ*Y­”K6ÖsÁAÓëYÍ®IŒ>ØXýì`dÖrå”¯aÓRŠ÷•ÙaâKÛižÞçO3Z¹Ë©Ê¥]»ðÁ¼o6Æé#†^v:óôõ®ŠÁwi“¶B\\b¹ˆ5ý(\\½¤Éä‚r	\\ý1Åtr¥nD5Znî*Æ¥…ž©	ûÕºMl:H²a—½G«isIûÈ[wsùÔZÏ‰¯´BÀ¯«}Ýzqóø§S¸º.&tz•?WæÕIÕo˜é“ÃÚ¼R\\©ÌÉóF¸þ5bÒY/Q­õk9Pí<³Œõ©<;©ê7YûLžbÉ<`U½^Áuh\0³”Ç<gvÎ³å»°åQórÏï9[­2Ü\\8Žõ¼°rNG·µ%Æ¯oÃC6š!J¼ƒŒàw8«Ñø6é•¦¹rŽç?­gj~ºyÂRäutüs]J\Z{ïCH×ƒ•“¹jÑgŒ½ò¦È!äF;‡§µwvÚ$WÉit·aáx”¸@fÇ­xüÖ³¤É	PÌŽN™\"µôMSUÑMÍÅ¾RÙ˜4±ç¡çùÔºkWqÕö›Á¿‰­- ŒÉ%©tøNük\nXÌhŽ_oÜÁ9=)š¿ˆuËFhF\"uû¼qÒ³,neˆ¬¸Ý ä“Ò¹ýŠQ´v9({Û5Ö©k¥Ù¤…73V1Æyæ¹u¹Šy\'½»>P˜XäãØõíÕª&B››ƒÎíÅV3ýkâyne2Îåœ÷5ÙG\rîÙœU11…ù5e¶Ö’Ûtzt~YÏ3¸ÇèÝþus4—f‘¤sÕ˜äÔáóŠi€7Jô\"£6r”ÝäÊeA¦•ã¥\\Á)< sŠÓ˜Ï”¡HPUÓnpOz¡8éT¤O)WÊÒ6š³³h(j|Âå)0$ô¦íÁ«mâ£d\ríO˜\\¤Q¿!ˆ”ÆŽj®+ú	ö¦àŠ DèAÅ&6\n)}dÖ§–ÝúTmÏ\"®³`žj³¹îx¬\\R4M²¡pOµ0»œb¦v\rÔQªüÜàŠÍ®Æ‰‘ù²·­W/.ã¸núUöTg0?tŠ–»2ž	ç¥5“#™F*gó\nœ/ëŠ ñ³g;±šÍ–µ%Ê{8ªÒNK`!À§ˆ\0èÄTmnÂ’jYIIrùåÆ¸ÁÂ‚jÃFûNS8¨ÚlÊ£ŠJV#–tÓNæ=\r r#÷ö¤ó%,0ãEÇaJ78)ŽÓš˜¼‘ŒºÓ73ØÁ§p±Ó«Ï­f\'œqVaÇL~•`«Sp±˜-NN3Ud²bÇ®+gÍLtTO\"3u=¨Ü{ÏhÉ$T&Üõ ñ[€1Å3•ùŠ‚=è°mæ1Úå]w‡µ|?g+=»É%Ä^cÈÂƒŒŒ2HõÁäb±‚îRP/>•ÔéÖ\"ëI°v@í€±•ïRÇŽcŒÚ®—75âgZÖI™ÚÎµi¢h—7Ò$o«ÝnTÍóJyÏ=†n¸­¿Ï¯¢Á,à±ES!\0\0Í±rF;uüs\\ÿ\0€//¼UwwwqA,¬TÊ<ƒÀP>½k¢ÓÖ]^ÚÆÜÉnó1\rÆæ$ž{qŒt÷®ˆÉ§®ÄTQ²QwdÞ\"³¹û#ÝYù¥ÕÃE\ZÃã°$}*¾£_é²•¸o9&]ó>NL‡ãjÑÕµÄ°ÓË`†Â sÂ’zŸ§_Â§†Y\r„O<ÇvÝÛ‰\0°ëÏùíXÔ6îž¡MFÖÑ•5mÏÄ.mîÜ=¬#q\nø\nHã¡ç¦y¬™îSE´†ÛbÈ3Ì‘¨Pßá×·½bk\ZÀ&[mÖöùó\'(ø<•ç=âj€ÖßÌ/q†%ÚÇ·Žq’Ùö ñê+š­G5h#¢ž¦¹iV°-w]®âÂ$pÇ íôý+>ËÅ76Ö;X÷<•u_”ØçÓð§jZšÜió5»WfÍ‘>	G­ZÑ®m­´4ÛÂ®£îŒqÉÇZæ‹²ÜÝ(¥¬n]õlƒ-Ô‹„¨ˆ $6ì–Éç=±\\ååŸŸyÜÃ2,ŽdÚHäñÅuvÚµ­ý¶\\ª¸ê›‡ÌêZøK×µHšHT˜ŒûsW:nv”]Ñ9:m«YšGMˆÁ(ŠxÛr•q×5æ:œS[O(“ª±®·C¼¹›[Êø>YqƒÁÆ>µ³©èšmÜÄÌÊ·ÌeW×ÿ\0¯UNœ ö7§^0z»ÜÀð\"ù³¹t~TóŽ†¶u\nYÜÜ¿–vy¼È1œãÁíøUŸI§˜¥OynQ·.	ÇóuÒåo„„Çä/UÜAjÖÉn·2©RN£qÐ©¨ør\rFÆ8|Ý›ÈØÎ?Ç¥R·ðŒ0¬L»ºœœƒ[wº”æK‰Ñ?t``ŸjççñZ3·7F:QQÆú\n›«k&f¾ðþ¨b‰Lðäf0;|WGf£íi\0Ä® •cÐšåˆãÔ/CÈ‘G­i5ˆO‰]èxÜØíõ®is)m±×R7Jë}Î¦;&—r§·Ò©j0Gokqw‚áP¹Lõöªú>¢·°‚¸WTv«z´›´Û‚A\0)-ž;f»¢ý¤.Ï:ÞÎv8ÛmF§k˜­GŸæmòØ÷õÍ6öèJd7(Ál´hAf5Ž±¶æ(ÛÇoi¢2§=NjUÔÞx…tšæä4ƒËFÀèXÿ\0J…äwvÝúSñê*67´iÆ;J¬å»\"*«É¨ÝýªÁBÃŠ`ƒwR+U#8Ï4Ý¤t«F&R{Š…£ ÓR\'”ÕúŠ\'8ïW¶| gŠŒ\"î9\\Âå)Ã€ÔÒ1š±$yn˜ÅG±¿»UrlA°œõ )éŠ°»±Û4m4î+â˜cR­NÑ¶x¤öÀÍ;ŠÅ6Ú™åûñW\nníÒ¢dãÞ©H—·–=iz°Q»sM*ØíUrl,h6Žh§\'ÝRõ´«÷rj«)‘W%Œ9ªr;7\\S¢E!û™4Ï0€FÌPÄŒ‘º˜.Â±–ŒÕf\'#i÷TÁ=1ôâ¬	Ñ˜£ð¦ýšYÈÆ¿ÞnKE\"¼ŽÊ‡ŸÀÕ6‘ó÷VžoìKH<ó(\\üê2	öõ©,\"]NÝeNí;»zçö›´Y»§(+ÉŸÍûÀ-5du ZÙ}) |;~íW,ýyôQÞ©ÜCf„#Àc{úzÒ“QÝŽ)ËdfÉ3íÆqPeo”®+ZÒßGÔnžÝ/g¨É_—Ÿ¥^þÂ±9žãóQý))Eê˜šqvhæ’ÜJÓ?z¬[#Û=«ªMÈ°Ä÷÷Ðÿ\0\n—þ[y$Î$õÉþUi_b\\ÒÜå”I3*¬}¹5`YÜF¤MÆ$°Æ+|ÛÁ`Ál Ý·?¼+“Ÿ­`^]_Z±2©• ’®aZ¼)£z4¥Sa‘°H?û¤\Zt…Jí\0óTlõ˜´Ë¦w°‰íåoŸ*>B}ÒºÅº´ku¸û¸‰ðC˜Æjib!8ÜªÔ\'N[hs[…ëëMxÑ~èËWJ·úg›åªYy‡ø@\\þU1šÖ?ííUÆæŒZ{j}Ìœ\'Øäš%[â Ï4¢1±=€¯@ŠæÀÛ¼Á-ÙS¨E²µKØmãY­‚;Lz(\0ø¢¥jp3b§J\\¶9VýÈ;Tü¼Ûó®ªÒöÒì»‰b/Á\'{nÈW«M2Ã¶¨ä¦á]w„.¤ŸÁvR=À.\'tÜíŒ\rÇ¦}5–\Z»¬™ÑŠÃ*PSO©Ðh²^Ï£Ë6§HX„øOnkÊQŠæã|>\\…!àTàl¯À§a«}¦ö[hÕÊG3.ÒÙôöéNº²IÌ‘A*Þbýìtú×¢šqV{sMIÝZç9¬i·š„˜@J™=pzãÆ§Ôe¹ŽÒ\r:!v9rKlÆ8÷ÿ\0ëZIyï¦Ë…I“u@9\'XSMe­—šÉ˜;/ïðÀz{W›8¨Ý§{”äådöG›x‹SŠ4û³	7(7\ræ7½óÍU³7z½Ù]‘…ë€\0äŸ”}k²“G°·¸Wk6špÌß×ëÚªhZh·´¸‘£›ýåÃqÿ\0×©{ÃMÏB2‚WHçî5×HÅ¤ \"codÖ£ÀG‡î$œÎàîF2ëÍ`jzl–º«ÈÊ\n\0è+n	Ì–Pïß•$óëš!»rì,E”TÝ+M’ÎÑZâR÷LÛÜ‡ÈÂ¬ËoÊ©ÏriDÁHã<sºšòn?+cèkªÝ9ÉÉê-‹›+è¥\n:í\'ÐµÔêÊ‹k-ÆÐ]mÊ‚=\rrØ7${s]]ËyþG-ÏåOt-š04»¯.ò\'\\`¤ÖºYÓb;4œŽT±®B22•8`pkgÄwMAFì¹ão§”Ö¦‘ØåîÝ®¯\ZæåŒŽßÀ>èú\nƒlq	Ônª:\ZF¸!Žp=3SGš£÷‹Ÿ­l”mbå}È¼¸‰òÂŸQÅDÑÆA_-H	«O^WœzTRn\0a0O¨§d‰s›ÝšþÅªµ³Ÿ•Ô”úŒqùWSâR!ðíé^¬˜Ï×Šât™šbÍñß($zŠê|aûÍ›-(8SÛ§øÖJÌÎm¹+žx$tÜ0ißhÂãÏsQ<XêH¦€T•È?Z’‰<Ò:àÔ#=ñQm`sJÒpØõô›Ü.{RqÊ‘I—eÚi»æ‹Å2¶0Ýj&c×§»ã8¨·|½H§`¸ß7:œv Ì¬8È4Ÿte†}Å3‡n)ˆ_9rsH_­5â+’~•-ß4Ä?vÖÎA¥R§©Á¨øÇzE hƒP¸;ºT‚@=)K)=©Ü\\¥ly§¼Ot¶E@À©#œU\'rZ°óíÒ£xûö§ ŒqK¸¥Rd´*GòäÆÑE+ŽÇÕ2[¦ý†Y\nØ÷8¦júÂi+‹if,Ø>XÉ©a»k•£¨m¬0@?Zr­ì%N\\¼Ã³%þ)cQéN]2ØÉ.Oû+V|¢o8ÝíYðjIv.RØmh¸ó˜dôÁëS*–Ý‹{2e¶ÓÄ…@°oJÄ×l¯ï§e¶ócµP\0PûTþdxoSÔ­LWÚŽT¶ÕèEk¾má\"YË\r¥Ýüë’TëâW,¢ãÄèJt%Í]þ›ËlÑü±²îpÙÛ[~Ýh‚Ý‹œ¶æ|÷8Í]µð„–·2,’‹~óµvî=ùÍo[éVÖñ–Ž ;îÎyüëÎÃàkF£¾‰¸Œm9G•jdêšœr=ì‘pÇËzsÚ¸­J{««íåÆŸôÏ¯ç^‡<mq$lë‚7Ê¬>þÕJwÓåS´Â):DÍ€*ñ«94ä—‘lD)­\"qN!ºW{J:î´ýA~ÆÏ{e\'œ½c*ÏÖmQVu!ùwÙŸ|v¦$°]‰áØ¬aÁ‘Ë2Ÿ¥gB“¥+ÞïðEmº.‹ËImŒ«ž›0~Yªòê)pßg‰Þ2Tÿ\0…ËˆaÂdwùOëT„Ww	 –à¶9;p?•]ZÕ\ZåŠÔÆ†ò\'¹ÔàŠ4‰DÌŠÃ%#%‰÷¨5@×‰bµÜ€ääã{Soô÷²ˆµº¸þLœôÏ½RMbòG†âÜ1–6Vè1ÔŠÂ¬›¼*i¡½8-%LÎ—M¶{93$>{IòÄòaqêGZÑC2ØAjc´*€q8_Î—O·º•Iˆ‘;UýOkPÓäÂ”Œ+0èdÇõ®eí9-tNkšÒfOöM¡½yä‘?!\'qükK[ÒßVÑ¢´Gh•q’,Ý=i.<ôÒUm%…¥Ý|väî\'Ö¨½„—¯·W6ÈØ\ncÝ“œyMkÔ†ÝQ<üÍIËb– >1EžåØ»æ€ÔV«ZÞ9á†Cd\0GÓ&­>Ÿh#LßÄ¸ÿ\0ÙŽJ§¨­Ž©¶KàhˆÌ~qm¹÷\\ÞôÝ%(Þ£Ôw9ßô,I¤i×ö³yrÆeÀÜÑŸ»ôÀ­=Dµ>µ·„b!|‘Ë\rÇ9þU—¦Ç{4ÃO°·XtÙG2þïŽGlÿ\0õë§{»kkË-2ß\0Û±O@kÓÂÑ„cÏ-žž®çz³o‘tÔ¥£é\rg©_]Îró¹òÁ9Ú€ð*MjæhH–@€©<p9äã ¯<r†È8Rs\\WŠçxWšxÒ4MË½‡ÍŒ zœu÷®Ê±öPåHÆœ½¬ù¤ÎCÄúýì7ÇO²dƒNžÕduÎ·¼Ý9#rpjÿ\0†íÍ­˜[x”nÎI?A\\\\V’ë>\"žIeEó\\¹ÈÉå³Åz*ìÓ4ô]¤…\0q^}FœÓèNv…%N:¶(·ò²þc2÷ÜjhmD6­±8ŽO\'Ö©Awö‹‹¨\',lŒ‡`míëÎjK}^ÞâGŠG,ùþŸ…T£N6Šêr®ykØç/lÅÜ¥ïƒ’ËÐUÛO‘˜‚FßjÕÔ§ò.—ËÜ¹5TÝî$g¹ÍqûGEòÇ¡èÆ’«)ÇM¸@3*œñÉ4ÄÓ®#“q*Ã°Ík¸Ë€X¾µ×YìÈ±æ´úÜÅõ8™²ZÜ™‰ò€;]u i´(•“kÂ•?JçÎNâ>^œ\Zëô¸ƒi*y;†LWN»ªÚhåÄáÕ$Ï;|ý¶HXmÚÅsÏ5³¯Ü™¾Îà©ù2=9ÿ\0õUûë)…æÄäH2§µgê0ÇÏ—ÀTU^FqÆj{MÝlTisEYœ´¨ÎÜ`Ö¤…¼µ€\'ÒµšÒ\0øØ{äŠ­qkndù¯ãZGKÃO¡]nÊñŽþ”¯y‡$téÅKöe#ƒUv¶”±Û5¢«ÔÉÐšè,7­ä±~úžžõ×x­ˆ¶p#ýØ¯øW!R‹¨‰ˆŒ:çœñšì<UÍ ™Hï~‡ükx;Å˜M4ÕÎ.DºÈ=ª#mŒ0\'Ú£0Œa›šfÆ\0í$â¤dÏþº…¢làGžTœ\ZzNÁVÁô4À·¯ \Zc±ÛÍXi÷¸}i¥†ßs@ŠŸ9~ŠjP\ZA±•qRå@^}A¦¼{Ë!QT&@Öò&pÙ_@j³!SŽA«‡|`üÄ{Ô%™†p\r0r)æÖ@@#ëMY)z{ÔrøÃé@µ¹ÔcëÒ™öy\0Î=sR™B©;‡ÍÔQÈ$•4Ä1âd ‘Ÿ¥ V+ž*Ed«1Å82ªü‡8 D*ã‘ƒšBqÉYó—fc\'¾j7l\0\0Îj™T¶§+©wJ“ËVùŠ€jc ü§ƒTI*+l4Q˜#\Z)úìƒ hÈØy±JbŠ(L‘Fdd*žI_ëS‚L§îí·\\Ömô7²ßB`ºöã‡ÀÉcž˜Çë]rVW±ËXÛYï$GškGVgÀÁë‘üªà:ygž¯ÅLˆà|òäöüª”žpºfžeÀcgN}sP×*Ô¤ùž…‰eeR#q¸cƒUÄ·fã\"U0‘ýÎsëNºµK»&¶WtB8u?×9¬»Ák|÷ës8¸`Hòd1ÀÕçæMlTylî#^ë­v?Ñ šÛÌÃí!{“šÓ[È¤FÍ¼‘ì=È\0ÕGñŒyÝ&õ\'qô¸¬Cã=2)\'óïZRjÂ°dþrúšŽw9®[þÍ95X™¬¤c#B~e`Ê?ÉéW\Z[LQCwˆÂ(ur#Æp]]I•´ S ˆ˜¨8ü9â¬Ú_êC5ÔÅ®üÊ0 qŒŽI=+Õ•îÒ#NE²ÐëRÅá®›sŒœñYçÃ:p¹{˜Ñ–wvyL×=k¨jqOwŸhyÎQ˜giÇ<Œ“ÓƒW¯.n\ZÛtÐH$|ùŠ’ciôäþŽzN\ZÄj)i#f×G´¶×xaÇ.IþuFK{‹›©Ë\\=½ªcË‘\\\rÃñ× ç­fµìmm\rÕÄßf1îÚZ2Çž<äöçBkè­ä”#ÜßFê6D2ð9ääœŸ^•ŒåIBñŽ†‘…G-^¦µõ­ÕãóµÞEù£càp3È=3ùÔú•„_diæDc\Zf ¬È àÕí:Ü:\'„°,¹ÜëÈÿ\0=(·!¥`~x› • cŸåVéS’Õ-HS’ë±˜«rúxF‹ìòEûÄq`øAÆJ‹G’U¸3^iâ	$Só­ÉŸ#=0\0\0Uí:Êëí÷\0]C$[›(Ü€ž¡qjcB²8ÚÊG¹¢ãv¶	O[\'¹›0Žä:Åsæ1óÆ±.€¼Xícžà˜„xÜÀòÜðF3]\"iÖk·Ñy``(ÀÆ1Yš†‘:Þ	¬b‰	\\4Œw2žØÍcZŒ£ïZæ”¦›µì`}’H!W–íí-â£/œž¸ÿ\0\Zu•À–éâ[u¸˜2ù,‘ü­Ï\'ÐvëWuFº±³ÿ\0‰†°Ò‚G\rl»O<çŠe‡‰-§¿ŠÞ	¬íŒ\'v?—Jäç„j­§Î\r­N÷ìÅDn§Ë8ÄqŠæt-6éüSw«Ýˆ\"Ø±àc\'ûàÖºðUbŽ+&+Èe¿Ø’©aÈ€2kÜ­ª×äytç.Y$Kª	®m£X	Q!Ã¸?u;Ÿé^oã‰ï3	ý\n GÇxÈOÓ·ë^ƒ«_˜ìdŠØeÊü¼v#­ykOu>¢öXt•ÉsŒmÉÁÖ¸s\ZÎ-F³·EI9Kds\Zïi«–t\'{¿\'5è\r0š¸|¸ÍO¦xvßLjò\\ïÉçŸò+\"LÙj7É–GÝ,ŒÇA8ÇéúV>În\rÉntT9Ï÷jÖ9ÏxËtÖp¹@ÀAÉ=jß„mnVÚúæe\\ªÇÎzŸç\\eíå¼šœ²Ù¦È:/©÷æ½CM´ý*ÖÂSþ¼£ÉÏ_§òª§G©­i%K–\'=­M$z›BG(ª2;ägúÖoÚ_g=óI®_ƒ­Þg9ß·ò\0JÌ7‡ñ®YÒ¼›±ßE¥M#WíCvÝÃÞŸçñòžõ€gÄ›¶Ò›–cê=){G$n} ®xú×£èÀÿ\0bZ·]ÑüÆkÈìâkëë{mÇ2È«Ç`M{U­°ŠÙ\"‚¬h{\0+¯K’ìòó	ß–%¸ÏË ÇQ\\«6ýVää}üdûW¢Ê¡.íìÄä×’êÍ-ž­s‡æxõçúÔU¦å¨°’´¬NÒ1È\rùR†,óô¬¦¾Pq»š>ÙŒækbÎþdj	õ§6Õ\0çn{VP½VèÆƒtx\0“G²bæ64ù‘õb,~g¢»ÍQ3á©@@ÛbÎ>•Àøv_7VRÀm‡Oÿ\0]w#Tô·21,§é]å\Zqi»\\àÄÅÎ¢ilyù!É&£<òj†3œKƒÛŠ™î‘™Š“´¥W’~I\0c®}+5)§£6p„·C%²–T¬¤½ª°Î¼¼d(ïS¿0|ä²ŽÞ•?ždA\Z¡ÛœVª¬–æ2ÃG¡ð2±Îp{ÓKyg†Íj<hsæ*óï’j,­s¸ÆÝºšÖ5“ÜÆT$¶3üÜ·50”Æ\ncY7;69äâ¡XÝ˜…‹²	­T“ØÅÓ’èNÌ›y_Ä\ZˆÉ·€*<å`ô!ºŠ°Ú}ÈˆHb“n:í4É±ZGÝÐR€\rÒš( æ‘”.1v†ãçLTGcpË·ÜSƒÈJl™d8H—r\01‰ô4ÜŽÿ\0žiÜãæ˜Nx U’+7`iÂWFjiíš,\"Vvn¬I§y™á…F§o>”×\n\0¸›6IECLc4R°\\ßÛßÊÃì—BA1Œ1Ç¦\rZˆ—Î%˜YTŽ~•Iµ?²é¢âô„uLÈˆ2ww‰¯Á¯khÞ4‚%]¯ž;zWJ©k_WÐÁÂ\\·¶ˆÐYã(eYIEÉ`ÃZâ5»³Ã§\\\\JÐºª|ã#¿jíæ\")ùysƒÍF–èw=ºˆ·rp0åÖ¢­?h¹^ÅÒ¨©¾e¿Cœ‚îM\nEÑ­!Žr6ÌíÎ~f\'\nqÆp;â Ö5&ÖÒòÆÊè›eÃEÜÍ»±88ÆCõ«Zð[«7dÔRÒ(x–]ê=1îyãƒïXV\Zí”Ö³Ñ%Ôr0²¹Éèyèz­s¶¢½›z\Z¨¹{ö(Ï O®ß$—†hä‰qó P08\nÙÃ}{w¨ãðÍ´z½ÌPÝýžT€b8cgÞ¹äžI$ñžkêëâˆ-îí\"†ÓìçÍ03ùŽÌÈlu§=*ž•â+™/.>Õ¦C€-ÀÌQ À9nœ“ÇµdãìiÍ6¼‹Z~ˆˆìnlB©ÿ\0–Ì¸gaÈm½³“þ«¡Ó.‹Nd)qk\nC´ÛËÕ-œ—\rŽN8ÇÔÖl\Zº5“Þ%ÜS¢NÑÅ\'({ç©ôúÓç¸¸—UK˜L‘©€F±©>Z19ù—¦áÐÕ)¨lCƒ{›FÞÆççš8Û9”ýà}qþzT¦ÊÎXÔyk O¸Y‹b¢Ó.î§•Äö‘¤HÅ7wl‡ÿ\0^¬Kq\0b‘¤ÖñŒZ»2nIÙes¦Ó`;«ÓÜSX÷º7ˆn&[”G1È}²Ã¯øWZ²ÆAf™J¨ÜÍŸ•G©5JÏ]]FêXm­$ò£Æfp\0>˜õ®iÑ§eí~ÇD*Í>d¯c›²Ñ<M‰4¯g#ää”ØŒV¼‡W‰Uå‚ÞNÌ±°RElO3ˆÊ£€}»VcÇ¨ùÉäJzðHŒéRƒåM•íg=ZC]AâÝklÖÓ0Û¹‚Œzæ•!ÕÞö&}ARÁt0-ëót…*È± Þ1à„$øÕØ¥‹åŠ\\g;ˆùÓƒ‹“JL—t¶EµxX¹r„:GEÁÚ*²]²L±=¤¤ÏN\nþ<Ñsq@Aî¼ô®ž{£]NXÕÞC_¥ÇÜhþSùŠ©fÿ\0ghå}FÈe²Í°#[è–z„[nwLç£¼~ Vl~Ó–ã{OrT„bJñå†«)ónzP«EC•»|ƒÄÚö©sn±èÌÃIÌ[§LŽ;úÔÞÑ/í|ëýDHŠÑì‰$àœžIº~µ®Úwö]°}>Î7`sûÖù¿J¸×rÉm\ZÈDnÀï\nÙÛ^…8ÉTö•ÚØædèû*i$úõ ¾žg·†eûDä€:ò¥bÅjaædA)?1¯Ö¯Xhñi÷j7s—‘ò#2ã<ñžô]’)H\"bp­ Úüj\\y¤ªTV})ÙrÁÝ÷—“ÄÑ¤V¦UfÇpA<·>•ÂxûV6öæÆÑˆžãýo´|Œ~?ã^ƒ5’¬IûÆyˆl§é\\†¡á[95W¼Õµ8£VH‹`ç°>ßJÒu,h(ójs>ð“ÊÉ«j0bÑ9†7ãÍnF~€óï]¥õÛGz¡âvglŠ¤ŒŒpqÒ Õõøm®U x¤‰SKÜŒ•“¹w¨ÛA¶Îéæó<¨IC×`“é\\ÞÛ™¿#yR¨ýæŽT{†Õ®üÕt‘¤br=þ•EŒ„òp=H®ÖO]ßÉ1¹‚t‘°VCÁ_®y§Zx	‘•®.ZE€\0¨5q­êtûHÆ\'#¦A%î«k•–yrÝ=Oµj+UšäZÿ\0gÜ<à[iÚyõÆ1[Úv—.‘,âÞÞÝ¥QòÍ3–?AÇòªÚ¾ VûJÜB»s˜Ä˜Søuªç„º™J¬Û¼MÏøf}:Q<ÀÇpWïºªqŸ­um|ðÙÈÉ$Š\n‚‘®E5=bö0ˆJ…ù¶ÉƒúÕ+h.eŽXÖWGÜL˜›vN9ÏzÍJ0»¹ŒÔê;Èë´V	QÎáçXà’;×3âË:úF¸k˜aœu—vwtÀ\"£Hî ÓœÌÐ¬ŠøI$ãßÞ¹KW¬¶â7#ÜòÓÿ\0ÕB»ŠQ4¥*£2[;…æ&×>¥A$W¦÷‚@§»SõÎ2)þ$È¢ê{èÙ¡žæq´Œ«¹îéžz×LSêt4ÐÀÓ2ïQ‘íƒAûPò‘ë´âš—²™?wµC»Œâ¯™.Ä;³2€éÕN:});®‚æ{3{Â—V6vóMx²$Îy`pµL—VqÜ¼^H!S—O)ˆ#=•Í¶¯%ŒhŸ$²pÁ»ïïDww\Z‘—Í–BÆH	]ä\0äœÖ‹›¼„®µLØ¾Õ4Ær\"¶›##å8þuE w$™‰ü‡ÏÜ\\¶ß”ä¼äJ±û[|ƒkå@ ò¸÷­}ŠJÈ\\½Mõ³`Fû€ôT Ûã\r +ŒnÝž\nç^êöí€i\Zì!M5ÒKVÚ³¹ú7Éõ`—3±n]JXehç‹nÞÒ¦k¨–=Í*œôÎ+&Gó–$“êsüé’1°0:V¾Í2ù9u5ÖþÑZ5òüÅlr~ï©µ´ÍFTËL¯T\n_zçmc0Âf‘#1œsŸoÊœ×Láì_EàVr¦žˆ¥es¦¶ûGÚ\Z[]êìÌ9õ«µùÚxÆq’3Ÿ¥méš7Ø¬£•˜±+9B=:}*kËÉÂ\r8\\,ŽÞ£Þ¸ýµ¥Ê™ƒŠzØåÚ#r¿½E˜ùh„?*ÅÔl.-˜°Ìÿ\0x/O¯¥v«jÛa¿†…dûñ‘Óë[BÊˆ™g#jŽEvQ¨ÞŒæ«§txë8$Q6}Çµw\Z÷…<…{‹8Ù×<Ä½Šã•€ð{óŠèR!Bb˜“iÈ‘äV9ÙÏÖŸ4ÊÜQô\\µh®/gIÉ¥#€sP™ÐpXÆ˜nPw$}*­ ´d³cŒR}j·Ú=)¦èÁýiò0¼Q¡`ƒhª‰vvŠ*y^\'Ø6º¦lK´o<P°\"­C<â!äŒÿ\0sn}«–±Õ­ôx|Í~üÉu•\ZŒ$`ôÀg®MlÚxƒD¹»Åq\0šF¦^˜+ëWJ|Ö»WüN)ÂÚØæ¼Um«Ã¨‹+»©¢ÎZ\"­´e²ŸÊ¬k\Zî¥=‚IegwS$¡G~yô®šáNéÌs,®ç³\rÉÇN9æ¹è×TÖ4èn­.–ÆæÙ¤SçB°ÏðŽqŒb¦P’“å{•E¥u±Æêv×ios=ú\\´—XÇ8+üE3¸mçš—OÓõ;M.ÈiÖ‹Å˜s*Å	Y%g,£<À ŸéŠî.³5(äW6·W‘\0‹q<jQÉäí#¯qéUÿ\0·´­i$¹¿œŒH¨äŽàÖ2§=^‡D\':ŠÑÙe¦øÊ;XEÝÎ›…›,ÈîzuÍo]Ø-ÄB¯+Í˜.ôj9@ÎOà{\näuˆvðÜý¦ÆÒáæ_¼d`?þº‰¾$jY\"-EôÛ.`ð¸ç;³P«RÚæßRÄüN6;)t;QI<VQ¬C÷J«€‡±Áã©«c!±’+k¸Ráâ\'UÉQŽéšò»êÑÞ}’ú4½;öüÀ±c‘ÀýkÐt‰¡ÔâûXY¢’Ùqå?ÊvŽ~ï§?¥T%/uâ0Õi%ÎÍÚê[‹­B#jª<k°ã’}êä‚™6¤läý~•ÏÏhšï‡^Ùà@ÁD6Î¿>9ÜÜVu®‡we¨h\'¾WDEŽáe%[Œ·§¥M5etgE¦Û³;D‚`£`nLSž‚XU¡UÏú¶Û××jœM}q¥‡r¦è7åIç×©Ñå‚0ÒÏ\nƒ¸–“ûv«“_Êd“¾ãáÑ#YÌ“08àÊNjçîãB¤±¨c™ÔeXþ+\'VÖM²;\n\nàäYÊ¥*QºE¨Î¤­sNK¨`Rv€£œ(¬Ö×¡™º\"ÏÝr\0Rk<B³ÛË,6×l;Di$ã©ö¬¥¼žîò9.ôé¶±¦çß­p×ÆÎËì¥ƒÝË¡³uªë¶;·¥µÄòÏnA#ßšd\ZÎµ|þ[é(ˆ‰oÎ¦›@}J4ÿ\0Hš(™1ƒò¶;UGH¯&µŽý§XV}Î	Î9ì8¬à«Ô|ºÙŽR£_K¢ÎŸº2ù^$\n ©>€úÖÒ }§#Ö ó­ì\"Ú|›eá†ßÆ¡ºÖìm ŽY®G\'Ý?ÞÇ§­zãN‚³gœª=jââ¸Ê{îéUmµ\r$T¹‰ŸaŸÖ²µ+K-vÝX]K\ZrNßÃ¢uºf`à}8¬e‰©Íx«£hP§Ëï;3²7!”2F’c¡=«>þX§\\Kl²À7Ulÿ\0Ð£=ÌnÜ`tî=+ŸÆµCo,Q\0_jºeAëÉäUÏœ90ÃIÉòkbíæ¤š~6–g!\"…q÷¹Ç•JÐÉâMVK[ÈÜ&ô>¼8Æ*kÀLÿ\0h¸òÍ¶K,Š¿2ðzPXøÂÚ8Ý%‡ìèñ€Û×c¶8vyàW4=œŸï†ï™+ÁjE.h·+<ï$\'a”ùë’:ã¥W’ëRðü[RÜ<e5?ˆÇnµ6§âí>[9¥‰$€m=3ÐõëUïõ¯-„ðy&Ýbó7™sè@ç&±œ/.h\ZBr·,ÌMjöð±¹r!†g\"KrÈíŠ„X¼!îmïäBÃ\'%†yà€>†£µ·:½È[4žed•n2ªÇ?Ã·°ÉÎMhÜi¢@óÜ]Â[v&Ê…ð;UM(G˜Ò;ò\\Ô°²{Åû@¿·žAü ü­ùŒÖ6»£ë(Í$m\ZEœ0ãô¨í¯Å­•ÔÚJ²yDC(<·íž\Zd\Z>½}i%íÕð…F\"®9ä÷5šŒRæ¾¦‰J3×b…ž~×*VæÂRNãËÁúö®ªÏO¿‚6ym4´F?0CŒôïX–ÐA1žòé‘Ò7 ý9â‹›Û«•hí6¼+ü,Ù\"m}:2“XƒR‚âEa£$•~.{óÞªZøj[¹&i­í!,A@±~ìùn Öæ…w~®VîHÙD”ð=…iÝ\\]\nšYÚ~ñ^RúÌ¢ùc`Œ4êy+hsËvmàFWo˜+ö\0dóTåÓ€ÜBJýãÑyô¯`Š=6Rë,~LØÀ$\0À£šÏºðå„öm¼± Îã9=²EuC&“h¾znVjÇ•Go$2n aÓœÕË&ÖX§iT–,”ôíù×I?ƒ¦wÚ’Ã¸u³RÃá;qn|û˜ÖEÏÊ\\MjñPù”áO¹ÊCh×Óùa?v<Ò½WÝöYd‰eeQ	^µ×Ç Mo,pÊñôý²{Ö\rÖ‰p%Gã‹qÀYX}jéÕRô%Âß+;ÛË†‘fyìÊ¨U¯âzš¨ö£,0Xcëš¶ {iÕXæEŽÆÞ3J±Iwp!T\\ä·Ê1ŒóÉ­9¬†š‘Gq¹„J®ì°Î9ÏËŽ•;Û¼¶P\\°>^â„óÆkªZÛ•…n¾˜ÝøœU—ÐmÒÕ– \'‰ƒŽÇ®1SÍutCR§+IXäÓk-b‘™º\\·áW,á{‚±Â‘&Þ8ù¿[º~–\"c<ePd³.sô÷ Â ºwµk‘%7ùt¨uSÑÍfa]Z]Dþ[——6å…K¥Û,—È³‘d,vóŸJ¹s­jv²nm4BŸpîˆ¨ÿ\0õÔV·’^È–¦Î6’i\0VO\0})¾nRâÜ‘Ý­ø¶€GlÑI\ZŒÛ¿ÄÓ_WXÙìsèä\00Üö=¿\Z·¦xr->ÕW4ÿ\0y‹¤gýŸñ¨5(ÑdÉÆ eóŸQÚ¼·M÷3÷e¢&›RŒ|ï~.DL\Z¿g}o\'#+ŽŸI†yY¢màöaÂÕ½>yôù„`ù±Ž\0~IÑ.ŒÆpŽ®P³\rŠ	ï\\\'Š¼:²F×vª¾pûÊ¿Çùw®Ø\\¤È\n\r„Veâ™$#å*xÍvFMnqµmùYù<ZÏ½™ÃG* àc½nø†Çû?Xuä“÷‹éÉ<VLˆ²`àÇ_Zî§mÈ©wõG-óyõ§‰<±ÅNÊU°x Ú·æ9w!òz·çNëî~¦¥ô§Žq‘Å.f!ÑÛ©ŒaE4j»&Š›°±îóê\"ûQFðßË1Ä)t¸XÎyzý+¹Òl&û4rÞ[XÑB«ZÅÂØg¦*þ‘£i¦Óí!‰¤ä²œ“šÖÀŠTpü¾ó.¾#ŸÝKc&æÛÎÅÏïYíòBFøqÜw5çšÏ‰õ»Ù\Z\\Ö\\Ä,eÁôüó^©.ÈÔ’H^rzÇG¿ŠI\Z\0ab6¿˜7cp}éW¦å¢v=XÃÞqOÔñ}V÷_ÓìmášÆêâW)Œ§-Ôœ¼×1_ÞÝ¬R#ÆÒ	¶NzW»O ÍöÉäŸV¹‹Ì!¾P00?\Z£­Çwag¦‰·—’¶óq#d.9èx5Äè´®ÿ\0àžÅ,w+J“g˜ØxsQ{Áo¬C=”.þ@ÜFîÀžkJóÃ×z2Ã~\"fe¹Eù±Ôn=€ªÖ> ×õë§X¥¸»\\I$¯„wÀül‚Šlîõ”ß°«B\",³¾†¹êY-#¡×Ï9ÙûDßkÕ¼wr^RÒÚIÊË•XT±ßÔÕÕ~\r4kw—qY“!E·d*ò.>éÁô©´]+íyöÚ‡‘°s\"A÷}kËáßíIRæ÷SYžÝØæÏÓTœœt[œøŠ°r´Úvòüñ¶¨ë¼Wf,«¶!Ž¤íý\rnXÚê_Ojo÷ÛÅóG:œ;FìGn1YÐXÚZÅr[<€¥™[+&Gé]$&ÿ\05K\0Æqƒq]4¢Ý¢Ï*¬¢›qêOök‚…„Ñ“ÜžF>•ShºŒ–pÄõùN=ªÛÞÃo †gÃ7Ýb8ük\"î;{žXò¡ÏÌˆIÇ•µU\ZwlmÝô:}¾à•×8¬³â/?5ÄRpA ÕmkOƒVµW’c ;[Á8Ï¹–Û¢ÀûdeLªK\'®Ò¼Ú¶Né´£Í¹Ô%çÚ.Š&øC}×…0÷íZv±¥¼¤]\\î\\nÆG½sp\\ÎÀ[Ù¹‡V9]B‡ÇBsÒ¥Ôtå–šê@—6ï‚ßþºÇ‘¿y+²´‹åoCjoZ›´ÓìÉyÞA.>QÎ3×¥jéúlZmì÷ìäO0Øø?!¡ÇâkŸÓ´ó§ †5[Ë™J¹“uqÒ´®oå´F[ˆÓÆÐ{WU&ãïOuøÔKá†ß™rêâÂèI»Ë¸d6î@ú×)©½Ü­QÃfÉ8MŒUWÐ~ñZ·\Z³4h —ÊÉÁF\nÁ½½š÷Y6·Dùg÷O·¸ÉÈÍ[žW”M)Ú-&h[kvñÉöyîÔ<o\0*ûV®¥«[hv±ÝÍ4M¶Õb8?JŸJÒlÚé^äÅ$»tJýÎ9¯7ø‰¢êúp„IMnÌwK’	ÿ\0wµmG5Ožk_ÈÒ.•JŠ	Ûõ:«ÿ\0èžVR1+ì Ï5…ÿ\0	N‡1]ÚtŠÌDjQ‚}kÌ¤YŒAbG@:ŠÚÒ¼5«>‘ö´”-·œ\ZBÄp1œóÍKÂªšÉÕ‚J)ëÖçk/Š-ÒÝ­Š\\íÉM…A~:àç¥PºÕtË•_ÜÜÍ‘°ª•ö>õBl­\ZéàO´Ëäyk+¸;[¡ Vm­Ìh)ÆäV2Êª9=±íõ©Ti¦cìÜ—ºtk¦\rVDH!6öàp²yžçõ«7>Y:Äˆã¸ê=ëSÃSYZ«›«’`pË$9Ø\\ž©¨½ÍåÃ[“=¤oÁ\0¨Çn´ëÓåŠqz‘‡„¥7².6•dL°Ç\'ÚcPˆ°¸Ç^sTTëöz|V‘iòGµ‹yˆ»¯sYzoˆî­/Æ!0q³5ëmosgîeIÙ2Ñdœ~Õú÷e©u©û5ª8‹{ýJP!‘vC I&C¸0=A¢¬jhŸPÙhÃÉ+€ZLü¾§×Ft­VÅ.å~ÎX fúV5þ ÄYa¹Xó÷™N+šnV¼¢:.*Znr–Úl·÷‚Ü+³<ƒ*£ ~]«¦‹Á3#(7@%3ŸåYöúuµÀ¸Óu¢²‚ rÞÂ®ÞxÅôå·	+66ØÎ=zSë­ÙÓRudíHÕ›ÃÚ-„‚{‹¶yQ#ªËbçU³Š0”ÿ\0,H8®I„úž›w›$ÐÝ/)&Uƒuÿ\0ž•KIðV¯ó>Òc\'‚þ¹¥7NQ½ìû*Zþò[w3éFí]Ü¾îªÀ6*Âè‹<^v•0\\õIÔàþB¦´Ð¡´hã¸½U•ºzœV}·‰íçÕp‰v“ŒƒŸÇŒ9¢ïËt9.eû·°©¥]Zƒ-æœÔçÍ²Î#Kscoqpñ†Ÿ´¦éšÒ‡Gµšá§7³	zår?J£¨ìÜ©Ö<à8Ï=³ÇJÝÕR[Á>m£nct–µGVV»N1Ÿjó=bÅb¸g9ûN~•èVzM®¨“	. šaÎèÔ¡?—Ÿð‰ÞÂÖ³ #(3ù÷§‡›¦ôm›ÆqÔÙåâ	à•~IÈÎ6•\"­%Ì‹¹X•\'†ÇúÖÆ§sw%ÇÙïC¦fõ;~UnÏÂðÎ7<ÀÄG\\cõÍvJºJó:aË{™Ë§E4äcûÛzšª÷^A[Baûì2Äÿ\0JÞÕ<<,#†ÛMY.šrY•G?/ÿ\0®¹÷\rnÅ.#hä;H&ˆë¯CZrEï=D’öhÛc»¸ëÔàÒéú™µóàlgø€ö4™¶h$ÜØq,cóÍTò’] gqêqÀ5¬mØÊ¥%bmGX’’2þX$áŽr}Oj¹á¶ŠMnÊGuLH8\'ŒúÕ+m6áîD*á]þP\0É>Ø®¢ãÃ–öQ$ÏºÝ£wn9,Ã©áJr‚VG;ºÑìu÷ÒÊ&!h˜mùA SÚ¡‰þÑ*ÀÑ;ü¹9ªö÷Ú}ôb$–W}¡™¹\\žù÷¤‚Cçú+HHà†lŠânòØç”l‹²YG	5 dÉª«FáÊ¨ôa[+=ÄH¾hY÷À©¾Ò$_?Jé„Ë)³-„A3Øú\ZƒËWù«N•¦òÂìv„Çj‚Y-íÁo/9ì\rn¢ÌœºŽ,Ñì•Â~ú\"œs·œþµÀë^—¯J×©,rØs^fWk‘œãŠé¤î¬$Kµd\01ëéUÞ#`òB*ÄgŠ(u*Ý\rZ—)3¤§ªÜ£ø\Zp•Kålr¬qŽþ´¡?1­.rXXÛ(©cEØ:~TQt>©Ò4)OÙâòäQƒµØZÝµ†Þ˜Ûe˜’H,O?yºôÚnðfÚyäw5¯á?Ê\'û5Ì›£”üŽ{jä¡Œ‚j-Xê­„›NIÜÔ»×u+;ÕZ4ï+ÈÊ¬$<cØ®ÆÎQ©,xÎ	¯1ñ7Œ.¬oî!ówÄOÈé€cý9¬‰üau¤rÛë²±o½ˆ|¼ý*V5S›M6Ž¥–N¼\"ãe÷žÜcP|ë\\Ö·¯K§]ˆ£µs&þ^Xž8»Ü¾n­9Çû?ýjëü7=†µ2Hš«µÒ‚6˜ÏÈ?ŠµŒu_,\"Ñ2Ç†\\Õ]×Ì£w¨½õÄßeËÄ’©!Hî1Shþ³×Ã›ûA¡J’{õïZ·÷\Z6‡{¼·îòžUIÀ=În}ŸLK/íØãfíüœŒfœb›|Ý	W®K«ìÉì4ö†ÐZ[„ˆh\'Ži×:Q)\Z„Œ”?y‡AK§^Û_@¯oqŸA·«79\\ô­¢ ãtpÉÉKSœŠk;MEáUHÃi­ý>]nXu9-cMà\0ŽÕzVŽópAÆÛYº•âG™#!ÇAÁ®*³qûVw: ”žˆ¹höíyåÍ–’NXœã§íN¼½°ÒŸrA+œ\rs\Zn³z……êï+´ŸÊ§¹ñ&š“ýžú<‘Ó ‘ü«?­§u4ú³Sµ´ò8½kRÔ/¦’þ4ak+àr0qÇNµ»£kÖèÖím†p7²œ…\'Öµ[Gðî«ûÍ±¨Sœ`?d_iºM•ÊËf@xÎâ›Ž«’WM;®tåVš7µ+GÔd†+€XPúÕhôyÎ“yo¨H%ƒÌf–uê€u«[Ãúc[ZÍ­H…^XŽÛpÙ\n:õ¬[}n=Fî]&UŠà¶õ@ð{Wt¢éÅN{¾ÇW;j;\"Ö™} iú“¦ß¡~›˜±9õ ÖOˆµ«ÛHáòÝn\ZAÊ›BþubM6ÏÃhå,2ç¡É;ô©?¶ ž¡GÌ„×$«_KY1„bù­tbÃy<{\"º÷Nw2±úVÒÄ·Ÿ+&v…=?*È¹ðÕŒ‹û‰žÐðÄŠÜ±’úÞØùá\08ÍM9&ìäMEm‘yl˜Æw÷\'¥u<?ÙRC§\n:‘Ž•SIŽêîWÞ‚Þ<|˜mÆ¼óX°Ô4­Mîïæ‘¤2ôÇJîƒ”#xìÌéÓUefìÑ^øËc\nÃ-Ã’\'ù¸\'§5kPžíD¶·°@°d«Æ­ž•NÛÄ15ãµÄBIãû„qÏj¡5ã:ClZâF.ÏŸÆ¸ïË7©éº“ÛC©\ZNh¨”I¥ƒqm„„ã8Çõªú®Š–º:Íiu™y€G~k#K¼ÿ\0CšKL¬\n¨<q^‘¢é­sáÄK†	\0ãæéí]4©*·¾ç-Iºõ(xSK¶¼ðì“Æ›îd\\=‰®Qðõå…Ë‰”Þ[\'üó}¹ôÏ~\rzÕåþ¢0‘îã·u\n£úW=¨ßéz®”÷@y72™À98>•­XSQJêèš«s¹Yò³Ç£Óµ#8û<°<À:õ_\né·FÆHnæcæ€eŒlŸð¯:–kÔ¸mèÅýáŽŸJët\ZÛEfúmÔ\nmœrNr{úW=9^IÌíÄÒ«(Þ:•õÿ\0ÛHÍ¦Y*¥šáINŠrsŽ?ZåÚ@æDI!èM\ZÀ·{ÙZÂ#»àmÎP‚ó¸ãJV—½s¶•5N	DÑ´°>j¾òÌ[ /Qï]œ^µ½¶Yçyd€OÍÏó¬7O¹·¶–íåkk,†\'¿*²x˜iîÒß*$·Zã¨êIþì‰Fu>w\Z>”-fÁ¬©cŸçZ×úX™r—Þás\\<¼S¸[1¾aþ:|EŸ8{`G¦ìJt©.VªÇS’®ÍÍ¢½³³[\\_D×Kë³ü«Ÿ³ûnÛ9dµºsƒù×Xš×üSÐß^âiz&sßššN…ª±žt+\'|d[¼$¢½×¡Í\nöOžåß?Å¹„¤‚ò2Õ‡«ø^ÒþãÏµ˜¬¥²TœsøÖ‘³Ñà@ µw\0d|ÍQÜª\\Å\0\\â¸9ãM»;³h9&œt*iºTÚ4Å™—,90§Üø†+dhA3ÜãŒV.«­›61´‰3¯\nJàÖž<—¢15‚)\nœ0Áª÷£ûÄhàç¬ÕËÚ{Ç«ÆÆ[0ˆ½ÉÝš.´v½o*Ñ@ëIöï.aµA{g Ö`ñC\\_ËÇæÄÐÒ¢\rÔnr³”_¹¡¶Úv‘¥Ûeœ…Ç-“‘ùW)¨ørßU»ûmµÛŒn˜tÇz¡«kSù±!6ÂB7)äU­Sgäº§<W ¥d­¢2öSŠç½Ù“ªé6ñ8’8€¦?”§LþuŸek/Û¡µ·‡Ì™Ü`}Â»\rKDyX:©\0”$`ÔÚ47\Z|ñbÞ8¶XÃ9Á©uì¬Íá6£~¦¼^‹E¶‚dÂ]¶ÝçûÄõª\Z¾¶ö³ín0PŒƒ]>£p?h—•X÷~5ÂÚi²jº›3³qcùÖŠs½ÅJ\\Ñr¨o[ZÚ_ÁÊE1Ad_á5~(m ùQUXu&²5f=Kû5³yrÆrkÏ]›TŒ´À	Tg#ø…tFñWhå9I]lu²Hs(ÇÒ³MòÃ&Òå³ß¥PYË©ÏáPH9ÏãZ)_TeËmë»ælŒ*±¿q	C+0=V¨ÜÎë)Hþµ\Z•˜›µ¤dÐ¥C¨Þ¤:eÌ…s#‹õ5ÃcÔ×Gâ‘aHŽ	ÕÎäâ»(ü73hQÈÅYÆªzÔ±¶G=kI!&Y¼‡Ì´Y\0É×¶j¤rJ‚jü8uhÏÝeïYhH9§MécŸJýÍ8÷ùc¯åE2+cNh¢ÌÊçSwª›²é´˜óšu”­kµÇ žEWx\r¼Ì61äö¥¸¼¢Å$\\w¯)¤ôGÐÅ$«ýA®,Ä¯Œí\\ÔÀÍÊv­øŽŽÊÛ§jç}¼¹S•ÏµM%«:pò’‹Hµ¥Ç)»GoÛÈ\' ¯XÐ&ŸNÒ¢k+suvO˜ÀíŒãšå|?ãKkXR)ía/°r?:õÍ/Äúí°1ÝÛè]Aü³^…Å½ìÏ+:ÉûÐÐá\'‰´’é;õ[“ƒÎvåé[Òjè#P˜µÌà…tb½8úVÿ\0ö–ˆ\'•í>Ï5Ö9í,}:W:4¶ÕožëS›øÎØ”ð«ž:÷§*n)ònÎ_mÏoh¬ÿ\0]5Ô*&o˜8úW  ù=k\nËMÓá\nÖëŒq‘Zþo•	ÁÅta):På‘Å‰š©>h”5+uÞ==k_/Ê#?2ö­W¼žx¶Ž‚¹«Õy*J>õ†&1W’F”[Ù³?Q»™$Ú ßþ0yj¿l±X¸¸$d’¸ ~4‹	N\\‚}EXûTv±<ÝHy‘ƒi¹u;•N[rœØÞÃ¨ˆäR»Îzô]ÃbÇKoµÛ‰\'“–rzT<A{uwsÝ‚¡#‚H9®õf¶o²’#ŠëÁa}ÞyuØŒn.MòvÜóýJÖý\"[X.^HØHç+Y³xZ;’åŒ@0“œŽØÍu(ñ^™¥Èm¤ˆ³íÉÂŒcšä$ñ¾€M§Û²Äçyøæ¢t­).kþ†´eQÅ>[#BËPšI³ÌËùBâ¦º×-R_\'%Xô`\rr±ø°G}$wwQ¬\01X·ž*Žîw)P±Ö¸gJ¯/{tèsÔ;˜¥k†Ú\'óýÜU¡[²²](s´Šò¿íkÖâ9™ÑN){z¸÷\0±Åe#Z·©Üð}t=¡5˜\'bV~WŒéV®­ ×tg´»]ê¹(yÈ<â¼ŸJñEöžÁ”¤±÷9þuéZˆ#Ô3´l`2sÅváêTƒjz£ËÅàÝuÐàu^[ßd¥âeå˜´þuVOk0n\nü‘ŒŒW´³yéÆÜšÄÖ¬¯>Æâ·ÊÙ\n+z”×Ä…KVVŒ­ó<\ZXîPk[—;ÃãqíÍuqê:®l–ÑßIöb¸!@éZéðæàÞÅw:ÎDSïžâ¶5\r+OŽ1X\0qŽ+\Z­ÛCº5é)-š8¸LW@f ÿ\0i÷K-äDKx~_ºŠ0*ö§¤Ãml\'ŠyIþè>õ’-nLáI9ëŠæ½–šÔ½gÌä-¹µ‘¼¿9ƒçA]VŸ¦X¬ÎñMŽø®2%O9DÙÙŸ›EvÚ]ÆŠ`ÄGËÜâ´TùÓ9±ñTšI²×ü#ZMÊ–6éó‘ýk\ZÒIc‚Å’DÊòÄó[S\\iñ2\'™µ	ëšÏW°K‰dZdç%Wv+	s¤ Î8Jé¶ÙSÄñ\\Íá;g…?t®L@Áÿ\0\Zã´øViÓ‘šëgÕí%¶šÍŽðG–Â¸•K«yåŽ8¤À\' =+¥k-ÏGS•5#]&†)L€\'\\c¥P¹{f›÷XÜyyªqÚÞ^JU#eõ,­{1lvEM7s·\"“Œa­õ:~iZ#‰¸FÚ…ÆcOº˜éùWU«ëV²xn#cpž`ê¸ç­SÓ|*÷eäÔdòS\n:ŸÌV¯áøáºÿ\0FIœg·\"®•]Þç›‰…4“Õ}Ç}§ëöWöF³ ¹mØzæ©]XÁ4þfY6ƒŸ›Œ×,þyDsÛÈñÊ;g§éZöš°ö¯Ì6‚IàTÎ“ºÜåŒcS*hšD:—‰È¿H£‚úàûWoqs%¥¬¢Ýéž˜ª~ÐF$iXM+ŒdžJÖdhò¨Q_”b“„ÜRHUkÁÏs”·¶ÖZñ¥¹Ôž°N*{‹X|Õ{x@qÔŠÞŽÜ3îúš ï´áHü(öÚ™<EÙ‡w¦®$Œrj¯ö,ˆ›o~kbi_žø¨EÜ™Æ?f–íeÐM?NHlZ˜ž	ê*Æ›¤H×÷íHðÌ[ëP‹–#ž1VbÔvNG¥\'‡Œî¼Õ×s¦½¶†þ@UxÎsœþ•žºcnKäVcÍnïæît~Ø<T³_	¢DVß·®Oz%¿.¤ÅÛKègë\Z-¦«sæî*ÝÉ5E´•ÓSAàšØŽkt4„în1N»c,Cb¡^¸ïSå£5siXÉcP8Á5ë³(~bOJlFY5Î¸zûU]gW´²R^EVì3Ít(6¬Œy¬õ*]!E~OjÂ¿ÕRÐ4q|Òž¿ìÕ+ýz[±¶,ªúžµ“É9\'\'Öº)aí¬‚S¾Â»4Œ]ÎI9&›|Sú”‡ƒÐWUÌÙ*H×4Ün<qR*â†ô%n\\…Õ¶\0 VHa¸ö«Ó“©øøÔÓ¤·f8—ªF„EL`æŠ‚?õcš*ìs\\ö–Ñƒ9ó×Óá²Í”}yÑ	\"V\'Šž;¨úœ^_°‰èûi-Žqü1qrª®0p*+Eh§tž¤uþU×ÅzŽø\\b­­ÌDã\"šÃÁlV;gyáË+H¤ÿ\0D¸i8Ûµ3T­ôã¢ˆæ˜ÿ\0tŠõ²ÐH~dFü1£³$3CG}¢‰ÐmèÍ–>\\¶f6‚º^	•„’]Ê0Ç J¹{ã2Þ0«xÞÊ\0üê®¡¤Å~å¡¹h˜ŒeN+\ZãÂW²B\"7+\"/*[­T«T‚´L£\nU4Þ§Kg¬Ý]§›¬\0t\'“Z÷7÷HÒd,`œšàŸFÕì¡	e²“Tî5/Clmâ3$~«šÎ¹\'i—õ8ËàhìnµÉ´ûÁ˜ÎÎdC’=ñšÂºšY”‹yåVÞnj–—giÔæb9i2O5%®¡itìXâSéYÕÄJ~ëØµB0wŽ¤?Ú×6Èg,Þ¹&³çÔ5)ßd’üçšÔžÄ»oÈ5¯áí×«+aV#œŽçšç¥	ÎJ&²©Næ±³à=*}#K“í¹W™·ykÛ­\Z·‰­49æI`ïÏ*øÖþ£s,clQ®½s:¾†u3#€dnkÔ«QÁ(C¡ÁIFsç©ÔóýwÄVº…ËJbr:e½+NãS‚/Û(d1œyˆŽœÔÖ~73(’F’XuÚ&Çû0ÚˆãEŽ\0«šƒæR–Çuz°,RØò-KV´3¦¬g’€f©G&œöû\Z6GÎxÙk¾Žä*Âàuý+—›Ã·–òå³)þè&¥Éw;°ó¥$“Ð©ö0“£ƒ\Z}¶—w{+$hÎÀv«§L¹*Æàú…5©¤®«¥;KA–³U}Y×QÉG÷r3´Ýÿ\0´>Í*;H;GŠôK,´Ù™•ÕNÝ§šä#Õ.’îG‚Ùšáñ’½uÚ ¾ž›RÃ„ì+¢j{Xò±pªýé²å†¡5®šÓNÛAÚ½N?Æ±lü_¬]jn Xí!N={äÕíFæ5VX“=~•ÍÝ5ÕÂlDŒöŒ«r®H˜Bœ]Û[4ºÌ’¿$•>õBr²O_zÏ²K¢_¯JÑþÏžfœD¤µ&J1eV€>U›åô5\nÀ¨6®ž¢¶“Nþù¢M:02XUºMô!TK©‹&gs†ìnø#ü+\'VIìb6ö.ßïªó]bÙD‡$ýi^ÆÃýE\n+Ý5X‡öÎIÓKåÌäGÜÈ9®ãOŠÎÚÅ¡WMî9\'qIöpÃl`~#ÚD˜ c£MÆ\\ÈU+ó«¶>\ZŠÛU{Öa6ã§9úVÛéÖ¯!³ fû¢œŒˆ1š{Ý\"ÿ\08õ«äOs7ZWÜ¢4kpäˆ”ÔV!°†Üf(c_}¢£“R´‘Ý´ÉÀ¬Õ\\§ZvÜ’KV˜ó)\0ú\Z±Ÿn‹óa½@g@ã\r“J×*wZ*PZ™:“dÒ,1òV£k  *\ZÍ¸¼SÕ³øÕW¿DC´óC”PÔ[6MñŒ`0ÏÖ«Ë¨Èq“X§QßÆ9úS>ÒîüÑíìÍ7»f9,qõ¨Œ¬H!ª ,äzRœ€y¢ábcx¬JœqÖ˜e@20MRu98ëLÁÆh¸ùKrÎ tÇ­U3äü­ÅW¸23Ö €H&\0ž+7\"Ôm,‘Ÿ¦)¶†s+fæ¦>T3°P›]µ´f#æ#û¼ÓŠ“kd[”Ü´…\r®kJÖÞáíÒ»Fª9f¼úÿ\0ÆWâàp€åÔóúÕÏkºš¹¹)÷\"%EtGíy¹·¤N›[ñ4Vq¼vŒ¯;w ~F¸I¤–æS,ò4Ž¼sNÚs“’hÀ®˜EAY\rÆîìnÌRŒgšx¦ƒÒª÷d+M8Æ1ÖúÒíÍ\rT9©Uqó‚…N2xµÄÿ\0À‡Ž”+ÉØPWdsJdàü£…¨rsÚ—i4 n­•’8\'\')\\±>Xãô¢¥ˆ¢•ÅcÕSYbÙc\rLuœž9ÕÅ-éÉùøÏJ³\r×pù®4z¨ìâÖi×“ïVaÕÔóæ~µÃµËsGÚØw4®ÇÈ™è)¬©8~µ!×!Ë-œ÷ÍyÇÛäï}jEÔ°9?K›²=)ocþ¬%ëœ|ÜWž[ê¯ÇÎkbÛT#¤ãÒŸ9:é/%•OçT¥óYp9ö¬øuXÝ€ÝZ	>ñsšR‚žá8ìsÚÄ÷ÿ\0eh°‰OOZã¡»’Þ÷sq^‘{š2$QŠäî4io/ÒÞÍv<ŸJæåå|¯S¾•dâîYCx°ïixo¸½ëÒ<-`övÒ;nnH?A¤ønÚÎÚåD²(à·j½s¨Çn¥C°®ºt¹38+US÷biÜ¬R3‚j!4QÅ°@ë—›[,ÇqõªÏªn.jå8·s%	Xéå½…€F=«.kÅ$•n+õ5Î3‘UäÔsÂšÉÉ\ZÆ×’árM\'ÚûŠqÓ5ƒöÌ¶I©Ž«c¦Mch½Í½î†£Í“Ä+ùT2ÜLAQÚ}«95 Ç1R6°ÄH	¥Ëƒæ’Üž7‘%ýÝºƒêV®¼×>gèkß\\¿ñúTRÝÊF\Zfüê-–Ü¤mD­$§t£¶iÍk‰	®q®d‹ç7çO—»„ùÕ.^Ä¾nçAîŸ>õpÝÓurcP¸A’ÄšckR·Êç¤f–Ä87¹Òý½Ü’[Æ¹8ù¤ýk˜mFS÷IªòÞO!ûä~4s‚¦v1]Â×4éõHðvãŠâEÔàýóJn&aÄÑíÙBê£<Ó$Õ7†é\\Øš]¼ñïJ®ùêMK¨R¤o.¢ÌpOÙfçq~>µ’±ÖÞ0å‰ª)S4’åyïïS}µpy¬Gwp*Kei2_4¹ßAºk©¢×„·¡’êB:óMHInE8ÀwsRÜ˜íV-!êMFÊÝrqW| ‚8 F»ˆaE˜îŠ • Õ¨³{\Z˜$C‚£ëIû¨Ïš´ˆl³€¨0Ü÷¨¤mÀâ‚è\'V{¨¢^§v„¬Ç«¿ZYaüë\nçUHÉf—h¬{¿`•„oóíZB3žÈ%dusÜÄs0¬;ïZÚ–þòNÛy®FãQ½¼bd™À?Â\r@œžk¢dµ‘ÍìhÜë7·Òýòˆ„O†é£`$½}ë8SÁæµ”SV*>é¶·V·| œ÷Éã²”þäÉä\ZÉÞqÁ¦ïlõ5š¥m™|ëv_’ÄUžÝýÚbÜHÞ&¬ÅrÇïò=ê­(Šñ‘PÆÃ$ŒT{œb¶â[yˆ0jàÓ­”d€EK®£º§s›H¡§ì‚\\âµ/nmlÓŠ_·µsó\\¼òcô¬9§¯C*’4:yóò¯J¬1œÒí\'Ú“âº\"’GJŽlx Ôˆ¡i©ÎzÔØ#‚´™)#\\Æ(¢=ÁZ*J¹˜5FCÖ­A¬m#æ\"±ŸýcýM2·t`ÉúÌã¹ÖE­.\0Ü\r[TG5Å§Z¹AXÏuS®åÐêþÕî*dž3‘\\ätU¸þè®iRGLfÙÐ,«ÙªO=±÷«UÐ}+.D‡{šq^È‡†­{\rnDa–â¹uëøU„ûÿ\0M¬6“;ÄÔšñD`ýî+¤±:~‘šXy­É=ëƒÑ>÷áZÿ\0ëk8JÏ™“8_Ý:ß\\ˆþï­c\\jFrXµbŽ¦”«4åQ½Â4ã‹OyèÕ½=3T©¤^µ‹“6PE¹\'$u¦‰XµýÚhê(»*,‰Xš…¤;ŽiÉ÷ÿ\0M›ïR¸XMÞ¦”NÉßŠˆô¦?OÂ†	>Öãø³QI3ÈpN*ª}óJ~é v/A#‚w\n¶×`&Ý¸5ŸSô©Ÿ¯çJádÜ±àj³ïc–ó÷¿RŽ‚‹…‘[ˆÆ*uŒ÷§CÒ¤4îØˆëMIQ%Éº\Z¦ý)îãvÂýÑJ·1*ŒXÒýÑõ¨ÅW³¸lt\"æ#Éjxºˆ\næéWïQìQ-RÏo€XÎ—ûBÕÃÎ¹I¾àª­÷Mh©\"5ghº­¸ç\"˜ÚÜ<ŠãOÜJ§7ÝZ¸ÑL–ìv’ëöëüB©MâhyÖ¸Y¿­R“­tGÔÍÔ·C¼—Å0€Âª?Š£+óóí\\jôüjÂ}ÚÓêÐBU7fñUÔ‡ä­Q›V¾¹Î_h=…U^”ñÞŸ$Èµ÷dE]ÎdrÇÞœ\n“ü)?ŠÇÊ˜¸£ø©iÄÆ)h4´\n÷\0	§&¤^”áÖ¥²’aÏ5\"ÆAæž:TWwð©»l«Y7qÀÙÎãéP\\ë2ŒnÚ£Ò©7ÞZ…þñúVÑ¥ÙÉV´–Ãä‘çl·>æ€˜¤^•(ûµ®Ú#·-Ä\nXS’.Õ,}êS÷…KcHˆDjE\\)ã½}ú–Ê±4kò\n*AÒŠŽb¹QÿÙ','00:20:00','Pizza de 8 pedacos','Cozinha',NULL,NULL,NULL,2),(2,'Frango',16,0,0,'sucos','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0W\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0åflƒYsŒæ´eïT%jó‘ô-ã½Åw~vo“<b¸ø-ÚI@UÉ5è~ÒÞÒw°­\"rÕ}™ËMu©T|´ÖLÁ2œ‚©Ê½jü‹U$Z†ifÎ™SY7	×ŠÜ™x5•pœšÉ›#uäŠÏ+bx†IÇ5Ÿ:TÌê\\Îk5-œõÑÞE•<VnvœZó´Ž¼8TmK¡PYþ¶jD¶Eê9«ô§|®pÃlôãBšÙ\n‘ÆO\0V±KŽ:b·B2ô9•¬Œ°ojºß9óH§†zlcQEèQE\0QE\0)¤¢Š\0(¢Š\0)sIE¸¤ÒQE\n(¢€\n(¢€Ä€û×Rš„kóÈÊ/+E[+XV¦§kž®[‰•ku6N¬ãîŸÒ “Q™Û;±Yù¥ÝëXªQ]Iã*KvYk‡~®k\"è“;f¯éTn¿×\ZÚšIž~>nTõîAEVçãÐSi{P49FE4©Š›iÈ\nç¦áŠ›Ø´”‘­}[E“I6ÛåŽ_>! 1çž•½¦|-ñN¯gÝ­€H7)‘öœ}\rB­”¯£)Ðšv±ÅQ]µàèÒ_é’¤KÖEù—óÏb®2RÕ39BQÜJ+KIÐ5-jå ±µygæÁÚ>¦¯]ø3Y±¾ŽÒxdíS»ŒÔ:ô£.W%rÕ\Z’\\Ê.Ç?EKsÚÜËo&7Äå â¤û×Øþ×ä·‘œoíWÌ´wÜŽY;«lV¢Š*‰Tƒ¥$É•	\0ŒqGj—©¤n·&…ö¸5lNzÍù€ÝƒZ¬;Ô¸\\é§ŠtÕO7=éDÇÖ³Vb*e›5›¦tÇ™{ÍUO2Š\\†ßX=›þ[§?6ÑN‹Á®[.V»9u(žER›X;ÖVHÍÎ£+i¾¶´`îˆN=+jUQU\0}+š¹ñ$qƒ†5C¿þÐ³’RIù±ÍRkc9ÂV»6GJcSÀ¦µQ’+8ªÒjÜ*´‚¡–Š2Ž\rfNkZQÍgN95›6LÈ:ÖlëÖµæÍfÎ95%™7•5‘\"|Äb¶æk.UNœ({agÉYve_,ö§(ÉÁ¥YT OjÅÌúHQæØ‰!ÏB?YzÜ?¹\rŽÕµåó)ªZ¾d²lŽ@§J~ú2ÇP¾Q}Ž6ŠsŒ1¦×°|VaEP  Q@ Š( Š( Š( Š( Š(\'\0Q]Í¯ÂÝnê\'Û,S@³)Ü{€@é×šé¼+ðTÔ‡Ú5ËÈì­ÏÝŽ#¾Cõãõ®xbèÍ¸ÆWhÞXj°IÉZçŽ¢­+WÐ±þÏzQ±“R½•»¨Çé\\¹ðg^±¸‘´À—¶ eHl?ÓJ´ofkF\rlÏ:ÝNºëo…Þ.¸ûº<ËÎ>vUþµ³iðgÅ’c}¥¼õÒaý3RêG¡×þÓ±çŠ	è\rU¼FWäW¶iÿ\0õ¶•MíöŸ]ü¢Îß‘P+¹Ó>xOMT’öØj¯VŸ•?ðŸ¥J«g{\n¿³”9Tµ>P¢¾Ä>ðt\\/†t“õ³ü*H¼9á¨Ïî¼?¥§ÒÒ1ý(xÈ#‰a¤|r›¢“ô ·”ŒœŸe5ö¬v:5¤@:Í@Ò°¯õ;4Ã\rŒ\n°[ËQšÃ™Ò ¯-Í¨`¥UÙ-\nkŠP6p\\n/jôÿ\0h×\Zö“w¦ëºLJð¢¬S¼CvÁõ¯S3ÒmXÙÇg%ÔÑÑ\"ûOò‹{â\rrýœYÁafª9Ú7>>¤W\'±4Òº¾ú^ëñ:ðô}Œ›IÛÍ«~EM7áÖž5Í.âúTž;(ð!t1ÎA>µêpˆ‚T(à\08¯œø›zÌ5\0ÏÔ\0\0ý1O·ñ¿‰tÐÂXà™Tå·ÆGò5–½J~íMŠ¯EOXž±gä-‘££eÈ?…yô¿ô…ñöÄ1Æ?éÙ£VqŒâŸeñjÜFÿ\0O’\'=^Gàpka<Y£šÒ23Ü•Ñ[F0nOGò1¥J«i%±\"h²Y\0±Am tv‘ôâ¹äðD×ZÍÅûÈ÷såFìwž¸®»NŽæýD¦LF}MiÆjÜ6}}ëž–œ×4ofo<Dàùt¹á:¯Â¸.æ¸\r¬ÆBÅä=NyéšÞ´O\"%ö\0òŽøä×¡ëÂ)¡ÞWœu¬Ñ—ñÀ–€¬iÔ÷¬qÈ›’Z®÷7¢éKß²MîpšÂmLO|†ý± ý+ oxNWdþÄ·‹±\"0?•tÚMÔ\0ý¨3\rÙù4\\ÃªÈ±Ê­ÝŠÕJx™%);>ÂŒh§híä`ßøÃz­Ð¹žÕ‚Àè\0þºÇ¸øMáÙGŽ6QŒ…SÀ®Î×O†Ñ$gps’M2KÇ·YZE1ÔTªÕ!7o™N”´WõG\"ß\rôq¡ý‰¡Œ “z¹péÆk\"o†ºm¼eãµ…Ôwjí&Ô-Ré²#õú~5ªk–q®Å™Õ›ž{Ö¯?±\'÷T©«ë÷tžÓOÊ,¢E¥µøym;°^•Óèú­µÄ«æÄç\'º¸ZÞêX¤ÿ\0ÅJÄâw•«F‚zA}ÇÂ±‡ê…è¡nbîÄwÅ¾¿/ç‘—»ü‘<®]YÏsùÕ)µ\'a×õ¬–›5Kšú+˜{4Z–éŸ½z7óý’¹îs^Vd¯XðXÆ‹õPjàõ0Ä¤ u5ÔŒx¨˜ÖÇšˆ^«½Næ«ÈjYh­)ªM^”ÕûÖr5Flã­f\\MjOÞ³çŒ‘º ³*aÖ³.—¿½jÎ0MfÜ\r4 H‹F®R‚«ÔçYM\"¶ÕlP—vûÌk7BýO¢¥Œ\\‰¥©¼.OÞªºÜ/g\"õ%N9¬°	¤uÌmô§\Z);ÜÖ¦6s¦ãmÎ~N\\šeM(Ãš„×¨¶>¢´˜QEÈ\n(¢€\nxŠC”#ÁÁlp\r6½cá<ïHÔíŠG<2:‰â`r ƒ‚?ZæÅâ>¯IÔjö:0Ô=µNKØó-7J½ÕîE½»Í\'}£õ®úÏàö£*º¾HOuX·Z÷èZn…d–6Vë\nžœ·¹­f¶Èíí^]luzŸÂ÷WÞÎúXj4ô¨¹ŸÜxŸÛgîõbý¨8þuÏêß5Ý;-\n­Úc9Œ`þUô]ý£º²¡Ç••ƒ>DpcoA\\‘Ì1•Ÿ¼¾GgÔð•#‡ï>]¸Ó¯m’{Y£eàîCUÊ°êü+ë(|è‘Ò@$hÎ>eëTîfHœ¼ÚzºŽ¡@5Öó–’÷/óÿ\0€re&ô‘á^ð*ø¿K»{]EbÔ`9[wN~¹õö«~ð”ñxÀ[kYŽÊÈÝ7^²Úþ›§Î\'þÇufùCÆk®Ó¯´¯[GäKÈ 7ÊrÊ}½KÆÔÄBP‹·6Þ_=\r	FRMÛúó-èÚj˜£•Ô* Ú‘ÐVœÌP€¢¥¶Ú‘„;xÍHÈ®+L>4i(Då«UÎw‘‰.®*Ãiõ5¶¦¨9ÁçÖ¡Ö<<54s\\wkŸŸKŸMZG—Ž[Jã¯Z½	sZë¹ÙJ\Z±²zöªúÎ¢}[è?\Zá´Ùnî¤•K(H›‰§_j\rh¬À4‘¨$¸SX¼Ò£Iµ¹ªË ¥c¬—VëÏëT&ÔÉÎN?\Zål5qª\\ˆ-òìz‘Ð}MuÖV°Û8ýÑ’`>ö8¬V\"½irìi*è®ìj$PB7#%‰À\rËÌ‡\0’ª3•­C·ZXYT­Gwj×ù[¼°ÝN:\n¹áêIhÙ”jÅKS;Ùu¤›‚ÙàšÅ×<»Y#1©\'’Ì}«±¸·h­’Âá@>•ÊxÆßÊ°·™$\r·*Ê°®w‡µï«êÎ¸V[ÇDgéÑÆÖLaÉ;ºã<óš¶³$SHŽª¾WÏÞÏL~UÉéÚ±Óß%<Ä?ÂN+7QÔšUÂñ|Ýk²VIòësµmZßÍØ9Àù˜•}¯,¯,1¦##i9äŠæÛ,,ˆVëÏZ¬nq“Þºye#d‹×3$éTàÔ¥ÓïRæó¡äg††©Ë;Š§!cžkhPV³ØÊSwº>Ÿð^·±áË;¸ÓË)IÎ$ùŠèåQ,~â¼3áF´-,/­eqû·F±×‚ó¯aÓõ8®âVFëWN¢‹tŸC*´¤×´FN½ÂÙösÏ™á½DD[¯f»w‰gCÞ¹\rsÃ.ÒµÕ‹ˆæä²ã‡ÿ\0\nÊ½)Æ^Ò\Zù\ZQ©	/g3 “UF^ƒó¨QRz~µæxŠV.Ž’#!Ã\\kB×UyÝR0Y› MqO0šz¦uÇ\0­¡èKvØS˜[Ì»dXÄV%ª¸‰LÍµ‰ûžÕmŠ…ùXþ&·Ž.ñ»0tz2ËØé‹/mÑÎÔ\"ÙD³ÕET²FÌì2:íäTp3Ï	•UÁûÜk5‹‹•¢‘j‹µÛfÕºi¬—k\ZÓ\n9©Àµ_»¥rfæH*¦àÝdÒ¬ÛÜÜ]\rÑ&WÔœQÂ2Ñ-}XFµ¾‡G˜?çšÑXa§Ç, úfŠÓë~D}[ÌùÜZ®}Åg¨¨Úoö…{*‘RÅ$h5×¸¯nðxÿ\0‰™õ‰Oè+çÆ˜z×¿ø6Pþ± õ+ü©¸rØÅÖö©£¨\'ŠaÁ¦¦³QsqéÍVÔÌÕZF©e¤A%T˜u«25A&1Ö³‘¬Q›:Hª’p¤UÛ‡9\"³..AÁ¬Þ¦‰.@<ÖUÑ\0c½[ž˜óT&`ùõ§{\rFæTÃ2S¸©Ú%›iâ[Lÿ\0òÉÿ\0ïš¾dz8X¿fF\0êáHÌ Õ”ÓnXýÒ¿Zš=3-‰˜ê):‘[³­S›Ñ#•»Œ¬¤Áª„Ww/‡­§‰ÙÛ Ï5Õèß,¯´å¹¾¼¼ŽGG\Z¨Ç× ÖŸ]¥ï=ŒË*F|ËfxÎ(Åz‡‰þ>“GšâëiâdÜÃÜ`V~—ð¯[½ Íeq\nzD+ý*£¡(ó)‹/¬Ý¬yøôÕ˜ôûÉ¶˜‡û§aÃ}+Ýô±=¸’âéÑ±Ñ@Ïê+¥O	iÖ^Dï²Çå£9ýqëÅrâs7J*qƒi›ÒÀRnÓž¾GÏÖž	Ö..–Ý­&I	À=Ïµ}á\rßÃzGØ­`»ÇÔÕˆ­m£o25\"R¡I¦´¨ÀlRylu¯#˜Ô©ËÍ·—s¾ZPMCñ/-ÏŸp™T‘•ç­[7/¬¸SÜVDË3áÂ\0#¨†¯%Ã´.¤dm¬¡ˆ´/=Ùr¢¤ýÝ‘«qpÏ ÀSÁ÷¨­¥D\n€G¿j,{›òçœw¦†‡y$ zÓo^fÈIZÉÜÊóÆaÎÝà€àgU,~Åh\"YdšáW%Ø±ü+I£SŽv\' àÔM=´/#ã%0šç®ÓV›*ß\n9Ç¼RÆ«F.œ¶Œ\\Ö¥†“m*Öñ¼bO˜6zÒ_êí1Grï6îx§C©%«,D¨Œ¨§Ò¹á:qvnèéš©(Þ*Æž›y5¹d•Em™nãÖ¶Ò`d/ ðk‘ûa¹Ë<B6cò½O‹\\™If…Ñ3Â2‘šô(ã£MrËc’¶ÍÝ-NÎÚåfß´çTw,™ê;Õ=:îÛnÔçóZŠsÎ+Ø¡SÚÓWiúUHºsÐå¯ôC$©²qœŒv>µOðüž[ùüÆb~TP¾‡Ö¶Ò0YÈ¬«Ýd !Y@Ç­sË†£\'RgB¯^ªP‰n7L„GQÆ«ü*\r©Á\nó®Bó[?1Ü0:žÂ«A}%Ô¡#ù‰ïÛó®YæÑ‹å¥¦9t¤¹ª3³:°<\0µ_êáU¬4ø/>éåU‡±öKp›DcŠí£*õUÛGOcMÙ#ú(.£*Üsž+6[V–ÊkF™¼†L.ÕËVÎ§f\"Bñƒœô¬kkœÈFy‘YÔ§+IY¾§E9¾[ÅèxÖ¡ðLÉ$.›x;”Î±ær‚+èÙ´ûkèÊÍ\Z°n¹\0æ¼³ÆuH§7š4+u	ÉxcY~ƒ½U:n.Ý*‘–½N§\'Ž\rFÒ+RÏÂÚõÝòY2æb2ÓFUTz’jÆ£àjÂ[„[i.J$8­oír,Ú¹ÎÉæFû$B‡Ã\Z`ùŽ+WWÓukQì§2£Ý\n†;y?•li>¾ž$š}úI)Àd\0úäqøÓuc)=ÁSr•–Æ]ˆÛ\r‡2“÷{Ÿ¥w‘j‹á}6Öåæ}Òóô\\Œôª¶žÖ4‹è®­ày’.‡xž:¿jèÎ’÷Ñ–Ôtk—wìÑ1;q^uwÍ5m·;©´¡c±ð×ˆíu{Hå†xŸ*ÊÙ®¶Êµäúw‡Ã{®4‹E¥q“Ã°gœcèZ4ú…Å¤oqg$Te\\`×fåîY¿‘çâpê>úh’óJŽe;r¬{Šçš×Sµ½­â‘e=ëµTõÀúÒ4~ûåZÖÁÆ®»3:X¹SÑêŽ:D1‰&-–\nv¨­ÄÞ|F{y<·8, œB1À÷®ÄÇiÏÊ?*‚[›p0?p<¶1wsù+ä¬¢bj+dbTaQ{×#6·yi4®–Í…%£ Â»÷¸ˆ‚>\\VV¥¦éÚœ/Äc\rŒ•8<ÔÕÁ©Kž/Sj•Ë8èp0k—SjË4€y¸88Çí]\rž£-«c\r¼n+îzâ¤¹Ð#\Z…­Ä{@M˜ÃcÔ\Z»6ÈXH`ÞAÂƒŠà¯J¥7ÍµŽÕZEd®P7s;3\rØ$ž½¤›öÀA<áP(®{Mý ö‘þSÀ~\"øA|7¯fìSÑƒÎÓŽEqÿ\0dcë^ãÍn=l†0VýßÄªJû…[M*–M^FJÙ×5ì~½ØC¸f5Œ×™ùcµt~Ô\r­Ñ…›\nÃŠ‰ÔmPÀF	òž²³äPÒÖ4wãz”ÞüUš™Œ°í3IæµZI½Åg½çûUZKÜ½C•^–ãoqTfº\'<ŠÏžøsóVl÷Çœ5Cfª“/\\ÜŽrÂ²n.€Ï\"«MrîO5U·1äÔ¹©1ÒÌ\\ñMHäÒ­=#šàì·‰¤o@*¶æ±§fOl@sœUÂ@ÆCåRØx[Q™”Íûœó´|ÄþUÝhŠÆè\\Me$…FT¿Lý3\\5qTâô×ÐôéÕöT½í.-+TCC§]ºžâÇò©ãðýÛ°[ˆž#Œíe9ÅzEÕýäÓl6 ÈÇ`bbMÈcr>\\·¥yòÌ´Ž‚úÄÔo%ò2<?àý.ÄÇ}rÓI:0xÑˆ‘Ó#µ¿{©ÜG¸Ç¶´à†\'Rìë´p½R½e’u†<>FHt¬«TªáyKåÜó•ER¥ä¯ú|+#ßG,ó…m«Ç_ZéÙ×?¤µŒ«U\'8SÞ¶£¹SÁ=+ÛËça÷<œbrªådxs…ùEc]EæÝ4£ïwSÒº<Å\"c\"³®­7È0ÀðEuÖ¥x¥º0£RÍôfyÓÖxX!tsíD:]ÜÏþ‘°Œm2ÞËhs(ÀÆjf×#Ûò‘šâ•,3wž<õíh«ˆ|?È$–Y2§ dQ¶™h²¯Éîª7:ã—‚qÀ¬›¿ÇÐEcžášÂ¦\'	v16§C-ÙÕ®‰åÙ¹¤—EŒ°dbéƒX¶þ\"Rƒñô©Î¿‘þ¶¶UðMlŒÝR{–\'ÑK0GCQÃáýÓHÒM•“ƒŠ§\'ˆ£&QùR¯ˆ£ãŠÎø&ïoÄÓ—•®jIá:L1ÁÅW—ÂºKg(sê$ªo¯©ëj¯.Ö~”å[¶Šü0Åÿ\03,·„l6…ŽkˆÀéµÇõa|+°˜Þîà§×ü*Šë‰ÿ\0=?J³¼Š8–¦2À·v‘RXË|L×²Ðí,pÀ³0èÒ6MMs{\nvO¹®zã_Ü1æ~•‡y­o2€1ELÆ…òPÜM<\rj²æªÍ­GX,H	Åsw7ï5ÂÀ„4ÒGl÷>Õ}® ÊÀL’8*ÿ\0„bšu¸Ô%(»d(.XkÉ¨êÖ÷êmØõcJ!sfËN”ùî)b–ŸqØw}`D”v`ÀëÍR’c®Î¸ó/\0ýjÝ½Â4Fq\"äéŠÊ3‹|¶þ¿®†9ß¼È..g´¼Am·,ÛœHUNõÓi7ÂõYƒ†Ú\0lz×râDy:†lnQßÒŸà%Ö£w¥–ÄBã° ~¦º²Ú’UôÒ&X¼:tyº£¼½„I\ryÎ¹+h×ÂM§Ë‘ˆ$ô·çý+ÒÕ·&\"°µí\rZÊH%BU‡Py±¯¡ÅRö‘¼w<¼-U	Z[:~¹ËÃ¯ç[°Þ£÷y±Öô‹—†XX•`8Ç9è}ÅtçQŸN1‹£°9Â7®+ÍX©Sv–§¥,,g¬Nûe½ÇúÅSïNþÅ³›–fÇ n+–´×€Ä‚´£Ö8dü«hãh=dsKU|,ÛþÄÒÕƒ<(ì¼‚üâ¬¡Å÷U+œ—TeÉf#ëLK¹¦n>àêÝ…\'™QO–R~©Q«ÊGF÷p àjŒßCíùÖŠÇtª[=	ÝÅdÞ6¢–rý‰™rWÌÃçš‰f2Rµ‹†\n2[Ô`^Ãó¤}n5(‰®6Þyî­Á2âf@BíÀÏÖ¥þÏºx0Ó/8Æ52©´QQ¦Ÿ¼Î‚o…ï¬éü@ÅKŸº;öÇëñ][ÞÚ%´ÒÆrÊT©*|j­Ç‰,ìä{˜ }Ó\"P\0Tãh\rëÁ95Îñµç¼’:cƒ¥4ŽšoÇÙ×óªMâ2òmzpkÍõKÛä—íã0¹#r8c¸AÇz± Isr“ý™å†-¯7=üö«•:®<îfœ”âícÓí®.nWrÄÄz…5;I$cç§Übµ¼5¨éº¦ž%²pñ«$£.u\"µ®,á\n²­vC5©Ýžtñ	JÎ68ñwƒ÷†+NÆò7 >ÓÇz´¾°ÎæFÏðïÀÖ¬&…§Ç÷caÿ\0müjéÓ®¾+}äN­µË	{l\r«ÓÖŠgöU—÷þþ7øÑ]7«åý|ŽÝyŸ-M—0(E,AíM\Z-àÁ0‘ŸSZÚ6äÅA\\Öâ8™w(8ÿ\0j¥Öq|¨û<¢¥3—‡Aw\0³…\'µh[épÙÈ\ZE$âÍl5¹_~¹ª÷‚›r{šÊUg-=aéSÕ+ƒÞù8ùÁÒí0Gß®rù¦UÌmòz\nÊ]Jh$‘é[Ó„š<\\d©Bz-Ùµÿ\0V–ôŸâ®m5uaËõ§EOñUrÏ±ËÏMìjËrÇ½Vi	ïTRé§G³¹à*Œ“]\rŸ…õ	£\\2A£›ùVu&©«ÍØ¨.wî«™;…lŸÌ|?oªGpæÈQá#<2O¾?QWáÒ-áuŽLó“É$Ÿa]ÆàûÇ±aª0¾\nÚd¼÷#¡úWñ-¯Ý¢êF4’u¼ŽCðÓêríŠÖK¶$¢øÀ¯HÐüœAïQ‘*.ßtv¾Eµ²[ÛÆ#Ž0\"ôP;T¬ì@çÖs”e¬ÿ\0#Š¦.§ÃËù•ã‚ÂÁvÃ\n©èx$þµóÊ2«ÎN@¤ºº©æINHÈ5Z+ˆ¯QÓÍ•dó\0{W-Y)~éiøÂ2øÞ¿‰U­J…B·%Šò~”è,àó˜,ÌìyíVâKkksºÝö(ùwòXûRÆ-ÙŒ¨®ŽÜÇ?•r:O§ânêÊÏr(Ñã(\'ktr+hbŽO“õç9©ã²Æœ\08õ×1Á¶w0=	«§CØ§)ì`ê9»D2¿gY·ìÛ’Å‡ô§ÛêaR„•#9ÅfIªEa®«+\"?àŸÐÖ…Ò¢Ê³Cß†àÖ´äÔ\\ öÜ%O¤–æÅ½Øl\rÕ}0®	no­eg’U•^BUq°uÁ=ëz×WrªžL­\'Ê\nàg¹5ß…Ì½ÙÕðM.h›2ÚÇ)É\0ÖkøjÝˆòšDÇ`ÙÏçZ)85f+€¤äu¯AÂoj¥Z8»Ý6{äóC2¬‹žŸ­qZìÿ\0dœ97eÉAÎ95í“Ä³‚¸}oÀV—×¢ãÊ8#æA#\rßNkÍÄej“ç§v»–0RÒ¦Œó(õ;¹µ+k{U&FPì@É®ÂæÉ×h´r²°ŽÉ…\'’:t\'ð®¦ÛÂoAÁAÁeÎI—_Æ´dðÌ2ÆDÓ’Ù;XTtÇóüë`kUiªvK¹¬ñô—Ú<:jö]ù<© ñÞk®^K+A±K¨É=+¹×þ\Z\\I{ú=í¤H£˜eVU\'×#?Ê¸­RíT’\rf †c•	!Àä9ÅoSÊŸ¸mK\nŽÉ…Æ±}!p\0ëP¦§}tåVrã·Ž+WHÒf×tÇ¸†ÒIZ\"ß;&#ÏeÏ­Yðž€$Õdûl&Ž2\Z58‘XrÂ*Î:i]§°ÎÑéby$•½[°?ÝãSZ^OstÖöò	$¹@S“ý;X\\Ïäùn¶°¾6D2ÄÈQëõ«Ö¥é÷»ì¡d.1½äÜ\nŸCÍq>F¹¤¾ãFÝ´W\"¶³Õ.Fn¦[0I)¸þ•~x­Q6²,ð0!ÉÆGÒ§»¾4ga€x u¦\'ìé,j\Z9IÙÇSšæö’Þ1µˆ¼œŠúv‡¤˜gºµÅÄ³bFÂ\08æ¢ðý–ª¢âév9.Žä\'•#\0Ÿþ·µt6ðìù(BKïÀúµNÞdgle< 70\\`ÿ\0õëÐ•’¼Õî¿­ÎYUz¥ß©‘},í§o9\'ëYë5ôÖS ,dÇlô®¢4¶h˜•Ìg’_Q¹fÒgK l *®Iü1\\ªœ/«»×ÜTkÛÝQês‘Zj‘ysÜmX˜Ð™9SøqÓÞ¯iI¥¶­öËDXoÆVFPFáÜÐóŽ}ºÔíáíoP€ýžnTÜ>Ð=»ŸÒ£²ø}â%ŸuÆ£cÑþEV»ðØ\\C÷á/¸šØŠ´æ¯äwÖÒ†EÉíV+:ÇH–É6½ëLqÝ@Å_Ù ès^õ/iËï«3À©ÉÍî»˜ú¶‡ ªYHtåX1ü«„ñ.“s-¿Ùä°—ÍsˆfpØ“œcž{×ªmníI$1•9÷ŠÂ¾5_:Ñ£¢†6T×+Õw†l×J$ÒÅ6w#»ãëïMŠÐZ$I4…t­!Û\0W GgfÑhcÙŸº\0ü*§Ø3íX\0ÎL×l®¤Úq’_.§T3®¤™ÀMp×’²©$éÛ\'­hÚ	-ôé%¹Ï”£åç“é]tºf¿s[®î Õk»ˆ^‡1¶27Óž ÖQÊgM¶ä^c	¥‘„nZx¥6çx+Œã·ÒªêZ¬6–® MîLc8>‡¸«š‡†tË­.ãNØëopÁ¥_5òÄGÍÝ@ïTåHtki&º—nÊå@½É÷5l=Znû¯/êÿ\0tªS“ý;•´«ß¶Yƒrr€` ôÏ|V©¼”,fÚ?2,Ùþu‡¤Iïe¿)(‹<HÊÀåLc××¥]—W0ƒq<’·	ƒ–\0}…sÚÑ½íé¹ÑR*S²Eé´HogY¦ m3)çòéY\ZäFÝ¼È¼»Pä ð}ÿ\0:Ý¼¹KŠÛ.RUbÒŒ\0¤c‚sžsÆcÒ²î’ÆM1­¡•Ë*…þlüè®¢½ÔìúëýÃ™Ðœž¯UÐó[Èl…ÔPº-üÑ»+ƒ»8$Šôm..+‚Â×ËŠO¼S8÷ÉÏ¥Cy¢ë:¾Ÿ\"Yé‚2[tMpª›N:ã©üx®4QlÄ^U¤D(8Œœnþ.Ý+«ØÖ©M>WémÇ[Nöm_Ôæ,mçÑ®Úk[ß³Úœ¼–åÖ>¹ëŸ÷M]—ÄšºjQËo$wÁH’ÌF1þò¹<èsžzT·Z\rÒE!š:À‡9=zsúU(tÉ`·B\0Ç)\'pç­rª¸ºÞºò)ÇWWf\\ÓuíJ‹j—ñÎÿ\0¹bªŒ¼ŸãƒŽ¯Ö´fñ%½º+Kr€²†\n9;sŒàvÉô¬cd÷z‚Ã>É¢\n€ägî?–zV_ˆí-t™­®\'–àLfD± &?Õ’1ò’ç#ƒíZSÄb\'«lÎT(¶’Geý±ÿ\0M(®kL’3¦À×ª~ÒË¹ÄI•óŒ“š*lZvþ¿1{\n=3Ó¡\rUáÏCœ\n°f0K†À“Ôt5JÚ_*!»h8ûÄóV–u”m’B¢½©-OªÃµ\Zq‰v¯5Œx!»ç¥6á#“*pµgHZn8AÐîæ¬Á|’(YNð²i.ÌÙM\\¥6žÉÔµeÜéÿ\0t(=öŠêÙ\n¼ø˜Õcöu“ƒŸPƒQ©(lrâ(Ð·¼qã@šg¾sÀ=«F<R£ÞÎdˆÜ‘]#_Ôl@¸ô+Tñ$1†N^B8#µj«×›´µ,}é#jÝ/A€-µ„jzù„ÙúÕÍ#S¿ñ]ãYiVìî>üòq|waŸåYþ\nð£âémõ}R_\'IYy…‹œ1´ôÎ}kÛm,¬4«_³iÖÐZÀ½#…/¹À®zÔiGYk/Sæ5µ%eèQðï‡`ÑlâkŸ\"âÿ\0’÷;žËž@Ç®ó+69ª¯&ãòµDòyeKò¹Á=ÅsÊ®šlr¸Êræ“»¨¤‰­ÈÃzÓ±³Œ¢½Û3H1Âœ\n£œuÆÜäwÍmAn\Zg\'{Ÿj¼%Ê«•¯ù×¨ã®[ØKöèqÓ¨¬ùôM=Èku{yFÈ«ÓBÑŽ5DÜsÖ»jr7iÅ}Æ¹÷Œ™^ëL¼XB[ìe9\'\'Šeµ—ÙbT–|’Û¾ŸiEtPä\Zœ_·­s}Sß6©ýæ®µT¹m¡Éë—7Û6[AvóGþUÏX[êÆS%Õ¥Ë $á£`zW¨}¼ã­4ß7÷Íg,¾“ÕÍ¿‘½<táU÷ž~`³w_Es#ÈX±,ÀžåWm5]>æÛìÊT8Pàôë×½v_k\'«\Zih¤ûè­õ\0ÒX¯iþ,c—ÅÇþ€·±‘3&ò~R£)õç§ÿ\0^«¼ÿ\0½ó|©”1”‘Ç¿­u)™àÛÅÏ¤b±u\ZxoH™ í3#mt¶Œ§Ð“úÕK\0ÜušKÐÍb•ô‹eME5K†´“J¹\nÐÉæ¼lN%^›¡óêtp$Ò(-\'³k4]¹OÔ˜³ü]ZÑ¾\"øY¹û*Èö““„KµTÞ}Œûfº°ô ´ö—9ªÎm|:dÞ£…#ÉŽI¤{¤\\àò:â³.oAççÆk¢­hÓV¹:R›Ø³-øŒuõ¬ÙõCŸ¼OãY“Ý´¢]‡„]Ç\'ëþ“Çr±9cëÒ¼\\Nc4Ôa­ÏV†\n6»:k{‰®¤	I­ì±4A.ãŠhóŽ»†~†£ÓDVð*¨Ç&´<ð{×£‡…£zŽìá¯7Íh+\"°Ã¨·µ…m£WÞ©È3ß uÎk?û.á.\ZM±ln»~ñý+`L§½<85Ó*tênc\Z“†Ç\r¬x*K­ÓXê9‹ïÙ2eAëÆ0GëXá«2æÚ|Ã÷£@.?*õ’‹ Ú\nªû`.c›oó®ZÙu9¯wC¶†eV]O:¸Ú/e³$\'…‚5Ý+õÀè=ò+ªÓ´‰ ˆ´+kp\"lÑr?ZÜ‰4øY¤‰V7ln(0[3U&ÕcÀ23Ñ«\Zyu\nZÎWò¾ƒ©­WH+àÒm!%œyŽWkÜz}*u±±Çÿ\0ß±T£½ŠNVL\n$ÕbˆˆÃnc]êT µŠHâp«\'»¹ --KxGü\0T\"…E_`+(ê%‡ÞÀ¬Ý[\\–ÚÒE´]×liNœóœr8ÿ\0\'¥ÆP£gdÃU›å:c*/N*»GÞÏÒ¸›MvG¾–V¹‘£‘T*nÈ\\g=ùý=*ÙÕD…„d¿{9ãß¥s,Öœ£Ì´:?³§i·ßÝàUf¾ÿ\0hþuŠ÷21U]åßiÛÇË‘ŸÆ¨Ç­,Ê.‰i÷žsd çF0:~+	f)èµf±Â%¹µ/‰m£¬-ÄÉU6ÆôcÛ¯éT´ýpË™f‘Ø÷«’ñôk$G\n·Í±Qw©ÏRzgßë\\µ–¦4ûcsHC¥ºúð®hâkTŸ?E¢_©Û<Ùí)~¬¹Šp½QÈc^w­¨IdÎÊÉ2J8AëóÚ¢³ñr\\@$Ë\0{‚>£±®•‹{´Îw„Ö×=M@rK\Z¬÷Àÿ\0®N×U“P™a·ò6pô? ®§KÑf¼·Iä*0È9üëN´­MJP¤¯7b.ÉîiÐÝlH<U»ŸÈŠv0?^+™¥±¼1J\nžÞõS”é?}\n‹Ýfûi×˜h­äþòtüGCYÒø\'QžøÎ5(r|¶Ýž0~õOm¨íAÉéSX…ÀfÇÖ“†\Z^ô£¯ÜTjb!¤%ú‹ÂÖqý¥{-áØ?CŸÖ´„¶yû-¤1Ôª\0Ms·\ZÀ^²Î³&Ö³÷K~&³xª4©Å/Ì¯aV·ñ$ßå÷lš±òÑ¿:€êÄŸ¾ßrp]Éw.Å“‰\' Ö¹‘nD*Å¤c¶¹e™M½´p1;ÔƒI5!{{ó¢’}G?rG:ÜKÈ(›äÛÎ~¿?jÎ×®dkãƒQ–Öafhåp#ès€z€;ZÞí•E£3–¬ØcÃ¾dsžÛx#ŒýkŸ×´-VúáY6˜£cnÇ© ãž1ÿ\0ë«+â( ³IÓ\n^¯ŸLŸNkTñ¯vG<¶¶Å–\"IÇ«õ\'éS/ªÊ7Š·¡TÝxJï_SvÛL¸ŠÚ8ó\"mÆøQ\\AÔõlŸøœj…äŸüUÓ¢•µþ¾crªÝô<þ;Ã*¨äÕ˜®L‡#sþ8¹ø.8À<w­+(ZY¶c©í^Ìà¢µ;èâdícv)ƒ\'UNÝ2E(pâFbz¯j’ÊÐH¥Pl«ã­Y¸ŠUUY˜Ž£+Ï©V7åG¤§9Fû%t\n¬}Îi—R}†ìSoÖ©ê7ñXG½Ø»Šx®>óQ›P“.p@:\nèÃaåSÞ{N7\n>ìu—©¡¨ë’^þî(§ŽI¯Vøwð¸Z,:ßˆ#at­¾ÞÑ±…î½O·j¡ð‹Àq\\¨ñ«eGÅ¡ ó\'àq¡¯^•QXœóŽÔbñ\nšötöêy	Ê¬¹¦õòqÀãªKL¤o*	åàñR	È4±ƒ“À W’Ý÷:#îì@¶ìŠÃ zdäÓ#‚hÓcÉ¼ãŽ¿‡j¶®Ò¨t·nã5‹å”i0Q‰Èb±œRIÅ¤ÞŒ–ÈÅäRÁWwNÿ\0OóÒ¶­.üòÀ1Þ±î¡Áä‰Q†KŸ—ÐTö8‚+#åcÏNü~•èaêJ¢ô_©ÍZ*k›©½Ã­gÝé;o‰ü·õ þ©tTž*ÚOšôù©ÕV’8­:nèÁšÊþDbEõCÏäj!çyLì¥Xl`A5Ó‡†U‘H VO\n¥ðÈÕbšø‘ÉÎÄÐ×n¸;~CüYèkCT²°É,Q+€‡÷{zAþÅ]jÖ×? >J“3€§ü+ËÄN¦òËsÒ¡×WŠÐèþÝî?:öŽÅ,z\nä&žXaób‘&ŒuÚà0ü*ºë¥6®>ñçxè?­g\\ÛÕ\ZO’¹WÄÞ$¸Õî\ZÈ–Ð¹X9Ã#\'×ùVU¨¹ºù1¨ÜÀ üNãYÓMåI&»œãÛ=é°êMo)‘+cyèzVé9;³ŸH«#Òl£·Ó!Â¨,ê¥ÎztÞÕÁø¢t¼iã‘›.È;{ãß5©j÷î<ùK*}Õ\'¯Ö²çºy$%ß$õÏµv(ó$‘ƒ•Žÿ\0Á¿?³\Z-3Vw{Vl$ÙÎÌö>ßJôK×µºyWx’N{óú×Í³\\^ÙàÛhõ\r!$šsë|Ò0\nrOn WaN*JÚ¾¦¸gÛ“µ‹Ék=êfx¦‚VØy*sž>§YôKÍ;X…àd{9	,ìáL\'“‚3óÏ¿A]dÐIÌ1¨%‰lãëëLÔ/‚Ÿ³¡9Ïr;ŸzómBnJÏ¡Ô±”—.·Om_u—o“q?äU‹mInˆHŽæ9Ï§_äj¥…Ü­lRYH‘N\nñ„ù¾½Çó­™6 ß•;3È^GùúVØg9+©hsÖ´[RZŒóZ6Pädö&§[Ñ@ãnîr×úÂ3ÒR9à{tëùT>©++]GŒe‹rBúàU,lÔùiêWÔ½Îzš#½Ž`qžõc!×kŠå¬µKd¾>ù#B2HÉÁÿ\0¯]S+ÛÃb•EsÌ¯AÁ”u\r!äÃA/–{ü¹¼óV½šÆôCyÇ(±<QÖ½i}EA¨év·ö²Cp£e ŽãŽ ö>õœ¾ýè»3\\69Ñ|³WGÇªß\\Í²ÊÜJÁrA)ü±MŠóS›THe‚æá‹È\\	ìAÁvø\nËJ,Öo0V;¥\rÆA‘ÇzzzúÔÂÕ”´0#GÂ\\‘•õúñ^|5JR³§õ±ëÃNJñ0Ž«xcóD/qaet!q…ü{ãÞ¦»‚ïQ$H¨ìà©i\0\0psùf™,92ÂgbT(\rSÆ1ž½«N9^;clî o‘¸Ý+{ñÀ•Ä¤§%Ìõ^º›J\\¶pHÏ›MŽÞ2†s&_5WiSÔœdäžõ¨ÚŒv¶ˆ\"22ÃÕUùûÌGsÏÓš†%3iØX—qî#å\\TVzKÅ2]¥â¯©‹p öäÖÔe7+-2›Œ—ï«ñÿ\0!4»=¼·ó\\eöF;dŒœþª÷#QÛO,9,[ŽFî8ãùö®¥®”0ßvDCª‚>†³®µøÄŠ‘ä*“Îþ×#?•v*tU›Ÿù·ßs59JM¨Àü{MðxIZmNddc\"Eåñë“ŸÃµkÏ$–A\"Ñô<§F\r²?%AÇœsŽ{­,Úïî–^\nŽ8<ñ×#5Ô59,–é,À„à«¼Ê»³Óük¡NŸÃÉ’©-gc˜Õì<Ko+økIù‡7”g<ç9Ï¾k†“íÐ@ð^Ãt²ò\ZO(ƒÉ<ü£ÿ\0\nõ/íû›™ÄX	gÙ÷a˜ûdu5÷ïu}mo{¦I™–ß98þî_Ò¯ÚG§ëùŽ*këäWð³Ã¤h¶³Ý·rëƒ³æ+€z\06Ú½OÕb‘FRà•lóé\\ÅÞsv³^*‡Ú¬ÄÒ…YŽA=TãCTf7ZE±Í¼rHub¾A#``ŒŸA~Ø¬EJ/™lÈ•(VÑ½ONKÅ•3³¯¿Z†âÎÈÚ9¢GCÕXdW9¦êjR(ÝÐÌP1œr:ò+e5ŽŸ­zpÆB¬}óÌž\ZTåî™w›6·“@3÷£ØwýjøB‹}ýNOø`S[Ë¨+p?H·J{Ôòa¤öµÄ.§!?€f •Õsè×wô®3XÒu6Alð0y²±\\E‡E>§=1×W´G+obH+Û²ÅÃ‘D°f¯fkOVÓÕMÃé1˜ÙY‹\0Ø à„óZÚvœ±ÝKqúL©µÈ—\"zŒg§Þþ]OEqá(\ZàÍùyM…Jçcž*³h‘Ûß­ëÃût+RsÈÇ^ƒµyKZ“nKæzÆÒ¨½Æbêoö;ÕO1n!\0õbsƒÏáTÚÅ\'Y.¦¶Ž8ãÉYV`p2pJr>™ö«×6÷sL³™—%™±´Ns×¯*Ž¡ñ5Ì„ï\0#¨<|Ügó®[ò»ZÉ›­#£Ô£`-îuT’hÉ‡ìÏ`8ýyüMo¨ukÛ‹6U{$‹÷k·`@Èïž¸ük‘CÆIÇjéôø¡´±YC–pbãîÇüñ]˜W&ùVÝÈå­o‹©ÈÝÂ »šŸ‘Êóìh­Ia¿¼žY¢´VÌdVÂò•îsÚŠn„¯¢\Zš¶§žè^A\ZM¨;$vd\0>µ²Ö:|rùq±e^¤0æ£Ùupœ¹\0ôpMWš) CczVÓ©R¬ï)|~aF)B:dd\0¬eBÔsÅsº®­’,“ŒÓÞªêš±µFHäRpG\\W,Ò4²c’Ç$×£…Á}©ž>?3iû:cî\'’âRò1fÏ\\×_ð÷ÀÍãFVž-6Û{¡Ã19Â®~œúWJú»AÒ-<#áÈ4ëpØ@X‡`ÌÌyn@ç¾+§[ØÓÓCÅ§9w4	1F±D»#@T\0\0à\n«öÈ¤vS*§\ró¥S’[ëÿ\0æ4=”c?MŒƒ ÿ\0¾…|Ë”¦îMS„¾õr\"N.m¼¸NpÀ±¾aŽ=Jº‘)96Ò*ÆF1†.=@÷éGöu²6Ñ Ÿ¼Øì\r¾ ²	]mãépU¸+‘cÚ­_Ð™rtÔ³‹™ÒO.\"±¾[ž­ž¼u÷¥¶‚Ki×ÍûÄaPsÜÖ¦’¢eròÕŽÜt=Ïó­UXãSßŒ×m¾5\\k·fqTÅ87ôÐÎÒ»KmæFP\nœ0Î{õ¨P\"Ã¶ic·Á!IœÜœVü÷‘ À û“U¶÷?+ª0> \ZÞ®\Z/E/¼P­+ky¡Š/2+•}¤zÿ\0*–ùöàŸáa‚>¹«’ø^Êê2Ìªü•Àþ`ÕÈôKtbZYq½ŸnáÁ?@=+á1ZÚËæi,M[r¤:%vÍjE(p5±Ó£Âˆ£é“’?SÇo\0•\\×m\nUã¤ä™ÇVtßÂš	K	S\\F±á…¾º,m‘ó¹¢Rž:‘ëý+»&à¿>çÓqô+ùÖ˜Š¬­\'`¡^t]à8²ð6k Í–W~|Äî‘P´ŠåBä8µaø‡ÃW6z,ÛÚ]­F¤§Ï±²Ù`\0Î›ëÏ~À#ó¨þØ	þúŠäxH_ãgRÅÔëæ¿¶ï¬T•8`;\Z­$‘(oâ\'¥}©hZ´Ô4Ûi˜ÿ\0ËB ?ýô0ZågøCáë†w‚öþÇ*‚Te_ÍrïªÑa¢¾/¬2<.V\\ž1øÕ91üY\'®{Wªj?õ¿8?U°¸‰‰æ`ñ2úpùŠæ|GðÇÄ:EÌii¦ÞßBÉ“$H\r¸ñ…ç¦ß¯è:#V‘›œ_SŽF\0÷¯Qðˆ\'´Eµ2\'’Ì÷èO^½?*óöð·‰bË?‡µd_W²•Gêµ¹£´d¬Ñ\\RO”7<­sã©·LéÂrÊV=µõLáã9À•aj0Ïs^|aã]ÈŠŽ¤õëî+/LÔ­¤µE¼T\0B•ç8õ­›©–[Qs+r»vlqü äŒägó t¯›®¹žºXõ!dÓH«k5ãÜËqmbpó#RAr	ÁÁäçòük¡ŠøÜiÍo|Ù ñõîy¬‹-Z$ÑÒ [||Æ%91’ÙÁî=+^ž“G2;\0-Ü’;S‹³åƒÓ©yÞQµ¶ùw3mtÛÕÔP%±<6å;vç&µ.txe|- •ËïmÄ(=o~‚ž÷—ïtÆ+y\nœò7½:ýxªqm²¦Êb¾ñ…ŠŒšÚš‚÷b›]ìg)Ô›æm+.ã…«Ú@cˆýåPŠ²*«þÑS†<Ó8õæ¬i7Ú’MömBÔ ’½X{‘÷Ns×®:Vµ”Z‰vY-ÙtbØVþµmô‘(Ä²qÐÞ½\n8:ŸÄ§ž‡LLRäŸžà“ŒO#¨«0ãšÎ¶Ð-¬,\';^LôÍX[yü²Jï‡¶Š÷‘É?dþh…YP“ÏÒ±u8 ïàðGµa„§Þ4\"q†G×šéœ=¤,Ö¦0Ÿ³úAÓ¢kµº’ÝT€<r0^ÀqœgÛ8­#beÛÙV\"yhÔ<zÖôVÖV¿êÕ7w$òie¾TÈ]µæfÓZÎ_×cµã\'+r£\ZóD[¨@šæä¨ê7\0Oä+ôH´Úh¯<ù%q¹nfHð=Çÿ\0JêÞøyÜE0Û\"£ç3Í9áhI4‹§^´t{v8»õ+,Ž7–?\"¶ìÃ=Ísq}¢æäÂ¶­<‚B¦TíÇcšôù´ë+¬—Ž2O\\ =óYòEs¥FÏ„w$¶UàæQ×òÍyßQ•\'Íºòÿ\0#Ò§ŽN<©kç Ý\ZÈ[†–(\ršHÛü¹OÜÎ2£œòŒŒÕï™Ú@©+ÕÛ;¾«ž½?•`Ëe­Ü2£!\'÷ ®	è9õ9«ºV£5ÜRŸ¼\\†±ã ¡TM¨ë÷T£5y²X-,m~Ó*ãtç3\r»‹žä‘ØúU¦‚Ò[ZÛ¡HYbEF:tÕÍkW2[Hø’Yy6Áïÿ\0×éYšf¥«ÜÉåZYÝLŒØcLBžÀžƒŸZªUdïÛ±ouÎå÷u´ÓJ‚-°D˜Â\0y>§9 ZÏchc³UòUc×ùS´¿j—F«öû3r^6Ã62qíéß§ÑG§ÙYÆ»0¡jÞ–´ãï{«ÖÇ-\\E(JÑ×úîr—(÷6‘ïóL’nÂªå²=áš³aÍlò¼[9È€Œí#±ý+qÖÀ9a#inøúÕi ´švGM¯ÏëR²÷ÍÌ›õ­s+Y¢žQ®fT…pûÃi\Z!¹lŽ|ÃÐáQ.—,žMË‰$?;¸‘œ‘ŽµZ]:ùn]âhd‰¹	œË>”\ZÐWä¿£¸ïNnÜÖ.¾«£Á³*´ªJ– Ç\\sî*üwÀŽ¢¸=Y5ëÉä·iM¿ëšÈ…CÏÜˆäg?\\Ó­õëfŽ;³m\"2äÊ„„„¹=1ùU¬MH;$Ç<-7ÛW;”¹Vî*|$ë†ÆzWq¬6E[™bÇ ñ×Ï­miº´‘ŠTqœ§85Ù‡ÇÂ£ågl¢¹–ÃïtÇEf·ù[¨ã#5ÀxšÚæ$•Ú9‰s3¯q‚N}+Õ}Ëƒ‚*›[ø^ãWÆXdO…v¥f<>2Tn¤®x3^+£©=ÅhAâŠÄFëºD (^ëÞ»\rKáNž|çÓînme\'(ù‘\'¶8oü{ŠóÃúÎ†Ò}¶É¼„çíQ\rÑ‘êXtú6\rsýRtž‡BÄÂ¡nç]çfŠfXÈGšGocEsQÛj“Æ²Aau$L2®³=ˆU{\nŒ¯iLÊë%°ÇOþ½ejs‹+Cpû˜Ø9à¶3Wa3´Y˜¹À?r:õÿ\0Ûn¶ÄH¶S„QØ÷þµxL?4®Ïg2Æ(G–™ÓÎîØÉbx¨öV<°«ÉÁ¨Â4®V K“ì+ÚMXùÉBÚ½Î—áß‡‰ü_mk,R5œYšr¼p9\0žÙ8}#q	•Éê~µÊü+ð—ü#^\Zk‹Ä1ßß•’U\';Pg`úüÄŸ¯µvŽåa/%› #?OJñqÒö³²ÙI¸z”áÕäWD£;v³~Rù @íäRq¹F¯å×ðÍ6VØ»rÄdf¸ù}š-ËêArÓ2A\Z©Ë‡æƒƒïÏÒ¡”¼ðŸ\'ù,Ücß=)dI‹~óHQ×ÙéYÚÕñK3kn¡cb1îF??þ¸®WY7.méÕú™½*nMF$³kSiÍ-®ž¦XíOïCóà:óÀö¨ãñAºA`dÏ\"±u‰å±³ŽÕ<³u10?òÐäg$t\0q×·Ý;QZÎ‘[Åj™Q$ˆÄ³¾ÜžNOÇ$Ö‹V};—‘×õZrŠj7}ÿ\0SBmmÜò@«våØr+Ž»ÔUfviŽXñ×ðÉ«zv­}×éŠšxš—æžÅO”l‘é6úŸ—©úÔsê¹lo\\ã8Ïjçì’âè$ÎJ[ðKw#Ú¥¾µŽeÂ@nW žAç8È:÷®ÉcåË¢gõh)\Zo$õ<w¤½\\äòOj¡fXƒ†l˜‰ÆÜñIÁÇ¿åDz’íÎá\\ÿ\0_Q“RfëÏÒ:F»ÇqUÞôâ°¥Ôv¨$à0àÒXÈoïR3ƒ×…Í%+¶5„åNRÙ?l$ÒÂµ¹k¤ÙQån>¤š/4;V¶&ÂGU\'Â½‡¯ËÍ¡Âñy­©„5¼*ÄzûB¹­X\\iSíH˜„~Íÿ\0×ª‘jèqóWÖÜ]¤¬Î¿«©+­Žé5ê*tÔHþ!ù×¤¬8z°/ÉÆ$­£Ž]”°žGbºˆï´Ò½Ô3ãÍŽ7ÿ\0xgù×\"5ýê•5ýêÕcíÔÍà¼Ž‚M/B¸—Í—K²i3þBgóÅLºfŽS`µTv\\ÏÐÖjûÔ‰¨Ê5F˜˜Ä\\ Q…}Þ¸É8¿¥)c);s¤þAõj‹i5ó7ãÐô(ó¶Âß““¸nÉÆ9ÏZ»Ù[®Ø`‚0;F *á ñëâ´•ó®ð¿hg(ÉF8\nXídmúô5nÒÂ8µË­ZI?ÒîaH¢¢’p\0õ\'©­–.Ú6ùÊ„äµ•þg`oQzQ6¤£¸üë\råÚ›QÚW’F?ÃéUd™Ñ•ä 9Ç>§OzÎYŒº88½Íù5SØ­T}UñþUÊI¨Ü-éˆ˜š-¹,ïÜI\0Æ8õÍFuEƒ\"Žq×½rO2}ÎÈ`#ØêN¢qO]Dâr/©mb	ÚG\\ŒP·ì\'éYh¤kõ-Ù56úÓ$ÔXŽXW&š‰Ä*V¿fèÔåš«nÈX\rv:	/Ç?0ªÏx[¡¬«]÷—+\n“Ôú\nìl´ÛXIMÏýãÍ<,ëbÝÖ‹ÌšêžG«9×•»Ôh*z×dööò¦×‰XzUCÓ³öaŸgaüw¼%Tô’g*ÅÓ{¦sñ^c¸«ðÝäu¡ý…§ŽŸûøßãPÍ¢GÖhÏ¦r?ZÕQ«K­JDª–÷±ncŽXˆå$PÊ~ ñVL±\nTG…=”àVZÁu!;©ÍYY.@û¯ùU©§¤ã‘ƒû2,HŠc7Ø i:ïu3S½äp¦ÔÚ\0èAYrÉs‚|¹ÑsYWw“Fè¤_r‡ü*jb•%î«wQûÒ¹³qª™kçSëó\nÅŸQ$¿ŠÌ\ZŒwy13HçÑN=ÎzWW1œÝ ›=:X(Å]›©ßxS’õq\\Òj0³f*Ù#Ò¯Ep‡£q\\ËV/Þ:[CuoÈïVáÔ¨®lÎCV”È‘‰TœGzë§ŽlÂxduß:Š›íÿ\0x)ú×7øBÅ€\0Ö¦$vÃ¤·9e†±¡{¢iz’þú\"­ŒÊ‘øgñºg†­4øÕ-î®i\'28$äçž*ª^Þ­Gzs÷ª“¢÷Š&J²\\ªNÆÂZÈŸuÇãS,rŽ¥:Ê\Z‹ÿ\0ô¦¶¦À}úéU©Gds:5æê»ª1ã™ýj¼²Z)%Ø>xÇjç¦ÔÏwüë>}PóóÖUsAO\'»:¿íX—åUP£€3EpçR9?5Åý²tÿ\0f£É5à´´vgÛæa;þŸÎ¸·•›ï/c[Þ/i#žÚÕ¸Ân=1ÏOÓ€Î=§qæ½Œ49i¯3|UES&úNå°?ˆÖ¾‹¦5íä6ñƒæÌË÷,@©ª¶¯4¥¶ñœW ü=Ñd›ÅÖ2ÉÀZSóc•SŽŸíb®½Uò¦M\nmÞ¬‘ï²0úTMpFC¹HÜGÊ\Zv%\'¯ËU.mçfWˆ‚U[÷mÀcÛ\'è;×‡)J÷G:K©VãUh¿u².9DŒôäÏ\"§·Õc4>ïVZ†ÖÒW2-Ô‘Èààùp¼j>™\'?PjÑ·Ñ ŽGR	Éü1\\ÍU¾ú\rÒjÖÔ‘î¢‘DB<¼‚Í‘Ï£ÜW+«jé\Z‹2ç9==2sVµÇ´–Í.5%¹òmÝž;xÙT3ÃÁ=Ha\\,:|zÄs›w!*Îå’3ýj$¢ýûúèw`0ËYOe÷\ZM®Ø¬sÝ]Þ™.åv¤|*útÁý*­¼æk6ûiæ^\\\"5Vit“œŽ8üúU}H°ûL¶ÓÇ3\\`†xl7qíëëZºjRÌ¥­¼lm¶¡wFaƒÏÔ·æ?\råN\n7½ÿ\0«“J-û5v\\Ñ<wÏö†»r\"_Ì[x¤ÉgÎrÄp;œ/æ+a4º°†ÑNœ¸‘êÇŸñ¬uñ-æ¿{™€<„á]BàrI>ØÍuv°C¥Ú€AidÚY‘‰ç\\ÿ\0.½*•e.œ±óÜóªÆ¥7ûÉ{Ï¢stöQFc\0!éÓ9>õy<°Ú¤²¿Ù÷ä\'˜¤=ñÇòæ»m5Ï–æØ8îàn½ióé——â‘-®`a’R@ÏÐ)ÍOÔçUÝ§nš_Í\\)ée~ºÿ\0_‰Ä&¡4ï,sl@êb…zŒŽµ«c¥é/jî\"’YOÊ$ùy8Ïÿ\0\\gŽÕÐ^i7—1þ÷É$dØ`âµ›µÎa)’ÚKÂJqåç gj¯`pMRÁÔ„µNÞhrÅÆkÜÑù3=lç’O-lL*ly‚2Nìäð=«ædÐ5Xï ‘¼°™šBÿ\0/<‚3óŒØZº¿ˆmç–[K2yV0ÑÆFØÒL\r€žüœ’3ŒV>›bó¿öÄ²n“÷`+î@¸°q•$Ž¼ô¦sƒå„ï}\ráÎãv·;Ïø‚×V´Ž{iÖTlá—üñ]:0–>NOzó´”ÒõWÖ,$(³\'ÏOïˆ n=y\0vÇ^k·Òu$¼·ŽE»†pÃò5ëàq‰¾Fyx¼5½ø‘ëú¾¯dÖÓ©+ÈÊpQ°@#Üdõ¯ÔVÐuy´ë¸ZI\"<0D‹žœú~‘_Gd0çšÅ×¼+§kñ§ÚUãš#º)âb¯õúEtÖÃÆ¦©†ÅºZKcÈ4›éoãf  ;”Œòq‘ÆyûÖ²ÌÌÒÇþò‡WÂë×q†»Hü%s2Cç[Íw(BqÐ’“É¬ý]òÚ9¿s\0à2Ä³gç\nxükÄ«…’nN\r/ëð=jxªsÑ5sŸ]j0@‘Ê’qÈ5v-NUo;†äZÇ¶ð–µy¬G%œ2ê±0,ìJN{Ç\0zžkwKøs®Û2}²ÞÆ|H	—ín\n¦9\n¾Y^¼çƒÛ SþÏs4Ø©âéAÚL•5F@då†åu¿N+GM¹²\\Í&ýƒ0ƒÑ·g“ß Tíáic1âÈ¦Åû¹C\03Ï$–\'8ªºX²’ÜËm¹•Ú,³ä«–äŽ	ãôìx§Bt•äšõE*ÔªéÐ²Ï}=­Ô§N±mORì»C1Àä›ö¬(µÙ`d›ÌUùÂ.Á¸z\01ÏŸAœñLÔüW©,(²/”sÀ\\0@ç‚9Æ;×9µkö{ˆäGß.Â€:çü+obçi$ô±¥*n1|öÔïg×Ò8×uä^päˆ“•Èü?É¬‹ÍxÊY6ãŒò\\3\\5Þ¬1’B¤œ¸~~\'ò¦A¨ùŠ£ÏR€g“ŸÇ½mõ)Is6Â.”]–çsiª$>tïrñ]Mˆ„ˆ7M¿{¦3œö®‚Æ÷M2ß•Iñµ˜ð1Ünàc?ÄÙé÷VBú(â¹\"gÃ1å#\0ñÞ«ø‚í´k[h>Ï3NrdÚ„‚1ÁÝ³J9:‰CRgìÚ|ÎÇ¢ê÷6ë¤L²Ø9Q±Iv~a€0=N0nqÊ_¨Žwb\Z8€g!¤-¹F9ç‘É®¿L{fÔ.4¦”mÂ–El†^q×úgïÅsZÃÜÚx„i‘<o$jT(\\Ç\'9ã$ƒ‘×ž;æ®­)5ÎÌhTJN( ··1(3FË[Ÿ@2J·oý§v#0ÚËn@ón–«ŸcÉü­›M>Õ®šécX­!$\"î!Ì¼Ç0Ú1Îztâ¶b·›P5­´¦!ûå!Xñ“Î8þx®OdäÒŒnß©­LO*ìSÑà:^nn.’HŠä61¸ûÚºK-R;¸•ãpsØTV~\nýªõíbq½ýr@\0sŽ\0­ˆmltøQcTF»T“œîkØÁá1^÷»Ç×þäbq4ªk¼Š×7Ñéö†æòU†q½ý{\0:“íY’x×@‚?2[÷Eõû,§ÿ\0d®j÷ZxŽX–RÚm·úˆÈ-Œ÷þ,{cÔÒ^ÚÃ(1Ñ€àñ]J­ÛpÕy™*\nÞþçYaãOêˆ ÖaóE•Z,ý7[Fkl¸FAÎs^¬ø~„Ën¡[wÜÎx¬«kš*mo	…Oú™†õã°Ï }ªX¦šD¼2Ý3èSyn½\nþUjPŽ„~Uæzo£ÕT¦Æ†åT‰ˆ;½vžâ­o†îk9ã¹4z\ZGÍªÔïMü]±L7±ŸJâWYÏsS&­žæ¥cc.¥<#]†öËMÔ’æÚ7\rÔƒùŽk*÷B€i÷i¥-ä‘p²GâzãùTK¨’:šP#¹¥\'J¢÷‘qöÙœ\ræ‰®ZÜ	.íÆÁÇš$V_Lç·â+kÂvq]êo+™È·ÞW«óøo|×J—‹(Øà2ž Ž\r^°ŽFØ$g%•0¹?Zçž6œ6ìu¼l¹e¹Ík1iÚNÒ-.#$ÃºHÇ\0u9lŽ™pÛ^ÏWC$‹*ûÌ)$ØãùVä±D^[I&áÔ8t8ÈéÖœ/b™Ã´ X““Ó¶zä©F6ýæŸ‡èÄKNUÄç®l5a•€6‹„uà``žüð*µËÝéÑ+]ÆñèHÿ\0\nÕ¹×m&„âÝ·;Ü­?íìË¾Ÿ”tl«1l¯ŒséXªt¤ß#û¯þ_©·=T—<¯¼Æ¶ÔšgTŒ³»*¨É?OZ×û6¡	åibŒ\r¾YUÃÜñž?\n‘dH®ãºT€N«åÆð©ô\0úzS5;Ëé|¸JåÈù±ŒWûºqmÍÜ†å9$’H\rÄ¢ác;pÀásó1äAßê?ë½XFÅwàúQß\\\\[ZþøFv¸ã\0â¹mFqyž	Ynb_Þ†ÆÖ\\à\0üÿ\0:Ê3©UÚö:!J)]›2êå‰ê¿\rÕëŽ}NDbˆoN(þÓ/ã$ô#µjðrz³DàŽ¤ê°‚G˜?*+‡“Qa#•Ï#u¯öz\'ÚÄ¡â˜	Ô­ÛrºìrA\0{ŽÃð®lÆòNŠÞb»ßÃö=”Š„M¾p¿yœäóžp8®3M„Ët¯÷v‚IÏœcù×ÐR©ßÈò±ýëvu\ZfžŠT6	 rFr{×§x:(¡ÔÈŠ·•‚v‘ŽG­yÎœ—Û¡ÙÐ7v~žæ/Ú$ùTpàá‰í8íí^5KÊ²»>‚T’ÂJÝWØqxªò¼ã5r<ª÷k²6gäz/S[Ö…•Ï—„½ëjñ[±Þ¬ÝëYWþ\'Œ£­²I»|í€8õ«\Z…Ÿ˜»“9è+ž¸²”1Ú¼×&ôg·‡¡FIK©UâŸX%nn˜Ë·®ï—Ûêy©âµ´Ðâ@é‰æ3MÔœ`“×ÿ\0­T¥Ón†Äã8êsù“Û¨È\\ÿ\0‡¯ª\\Š6Üï³—ºž‹cRy.„ƒHŠ<,ŽT6;òÇ©ë[ÑÈl2A8ÇoaY–ÛMµb…þQó´„m9Ï@:tõ­ä¼Öçµ´Z(‘„\Z¨%Nr¼çßÓ54éÊRå_Va]r&íki^¶»¼ó­âÙ\"´Ã `öÈ99àãŽ½k´ŠÂÊÒ4\r\Z1^ŒÃ\'>ÙéøU½·Óm–ŽŒÝr}I¬k­}rpÇ¯­zqt0±¼¬åýlxu=¾*WÖÇW%ü+Úª\rm&a ‚A¨Á#úW\"5Ôó”4ŒKÏ_j±g½£‹Xß®HÎ9è+	f²oÜZöz‚¼Žu\0\0U;Tp\0à\n•/T‘žk‘‹í‘Ãû•˜ðŽåv|ÝÉÇü*c~ ¹û;È<Ü\n9©Ôã˜¦ìÆði­©ôý+Q”Ksam4£€ÒÄ¬GÐ‘Kÿ\0î“¸•´EÎxòÏÁ¬ ?|õ«Ë­1#sï]qÅáæ½ô™Ï,5x¿u´kÀ€\Z@9\0’qúÔ‰§ZDs\Zm>¢¹M~ëRšÓ6wÏi*/˜°’2;ƒéÜf³_Ç†ÄÙÛ_Ct.¥Uà¢FÍÆHfesÆ:ð*a‹Â¹¸Æ*èO\rˆåærº=Ê#îÈ@ŽOï/ë\\ì:æNC±úš¸šÚã‘ù\Zê…zRWF2ÃÕFÈ‰ýV-Tåˆ?JÅ}pÆg\\k˜}¿:™âèÁ0µdt²ßAqè*©ÔÌ²Läð\0®>m]¤<1º@¶ûLœ³—>•ÉO0xŠœØèž\rQ‡4qÌ»›¡’5u+$aÔõž÷`žM*\\)>µÝx=9R’ÖÅeÑ´YÔ£é–mï[¡þ”Æð—†[ïèZ[}l£ÿ\0âkRHã‘r )Ç85‘¨5Ì1¶ÒÏŽ€µrµ(Ý!EÊ£·3Dñhš\r·ú\'OÝ·Aý*Ðk(F8W•yôÞ*‰.¤x ÔøÊÒÕ—7ÉÆ÷làŸèk‡ûM7h£±åòµäÏJûd# ü–—íúÊ¸ñ:†WbÈ>µ ×Ç÷š§ûV¨g3¹7P÷Gýò)¦æØõŒø®-uÀˆþu(ÕýØûI¥ý©èÙò;¹¶Â(#ý‘Cj/#ôÉÍ~ðà9ûÃ#4¶òÜ^†0ò®N(þÔMòÇq}A[™ìo\\j£Esž\"Õ$:=Ø‰Ø9Lg88<Ò™}Ô³´ˆvÎªÜ¨¬ýjÊxt™NÝ‡P<ÿ\0*ã­Œ­6Õ´:©a©E&™Çhz’XÝÈ[y,›FÞ¤äV×ö‚´ŒÞiù~ðÈÂŸJàçã”º’¹<zUf¼”ËGç“ÏZé¥t¬DÚ¹×jÚ¨9	!\n¸<u$ÿ\0JÁ»hÞ4(ŒÎFæn¼œv¬©/Ü¡VbI äšï&UùetÎ3µ±œUò9=HæE™K\r¹§ ô Öž—¯:¶¹fv,IŒ“ìßã\\¹™²X±üM!¸\rÀÈ=\\°êqå‘1ªá.hž™ex÷S‘~bq]¦™á©®4’ªóÐ\nòïên¢‘K(Y”ä3ž{äú×¹i7±K\0ÚÃ àâ¸©a)F«Cª¾&R§ÍL€xX*|³sî+#TÑ.­\"ioAÔÇÉ…vÉ8\"œX7jôž“»¡æ¬MDýíO*Š|7N+fÊï§\'¥u×\Zés%¬%Û«í¿1Ís×ž¸³µ¬¡“?qÏ#è{Ö>Â­%}Ñº¯J¦Fh[\\†>•mmíf;ž™½Y5ÌAtÑ9Ž@ÊëÁµiCÆ2:j´%¤‚TdµEù¼\'¥\\àµª©ìcv_åU¿áÓÂ…I®•G83¨5n-D÷X\Z—ùÍiË†–ñDsâ£¢“(Éá8dŒ!º”lþ”Â-åÑ^Ì31Ü[ëW¿´¿ÎhþÒ¤èá%¼Eíq+©ÊkÞÕõLˆuÑ@\0\"6ÿ\0/FÉ?ÂFÏåêöNtúö5êÍ©{â¡mLçï·çMB„U¢‹U±ÎO@øwŸ¥„Ôà´¼¿rLŽÿ\0¼Däí	¹F8Æ}N{b›ÃùmÞùak.àü¬èÄ¢%/ÝÇL}¥uŸÚí·çKý¥þÑ¬çF”ÝÇ\Zµ‘„¾Ó¶(}/N,\0ì8É%rIê}è­ßíýãEO°¥Ý‹ž©ã7iÙ\\i„@sØåÀf0ù³žJãèkÎ4x3NbT;Xw_Q^£1\\0Y$G÷[\'Ž}½k“Ô´é-o¥ºb|»‚¤M¤£˜\0þ>õX|Eàà{X¬ªÆ¯ÞhéÞRX¡30ÝÉPËÏçZv·¿e¾´¸XÛ÷R,‡§!zô>™¬ë$Û¡‚ÙÎÖïVNb…v™	‹Ïn¼W\'iß©îÓ‚•.Wµn´—+“íÅ\\’1\"c8÷Åxk[KëRY”MÂ¸Ï^:×YÖH÷ÍzéÆQ>µ)Ó›‹Ý¢È\n‘ÛÒª6ŸrT~U¤»I\'×µ+FL\0kžtÕ“\Z®:#,ØÁ·¾:W7«é2Om\"Ç&0@`>n~¹éÍvN„zSWÀÈçó®j”\"ô:¨bçJ\\Èó[;q£ÌÒË	™vàÂÌW<õÈÏN{…hê\'½:a\Z]¼\n±.ápG¨îsœð­u7vQÈ°	ô5Ÿ¶Å;Ôr¦áQNs¦ù$ôþ¾g£,M:þüã©çSjÞ#ºžHŽ–Í*Åœûã g¨é]§†aŒé´ðï¸¸È™fL• í* çëº¦“Íh¤Šúrª+ÁñŒžœ\nÏ{øì­™†Ö…/NO÷Npúõ^DýÕoÌ¹)U*:Kõ·ûUŠFWjÿ\09Æ=9àvÇÏjWWG\nŽü!ˆNc\\Œ^$H5FÁ<¨\nÁ[ƒŒ\\æ¥­Ïs~—WÄ¤kÑc ²úã<f¡áªV–º(Æ‚»w=6«¡qË%Ê®àe‘¶AèÙQŽ¦µå{iäf…îØd•õÇ«Éô¯¥¸3ÏoåÚFêvÆß0Ý=þ¸¯H‡U¶º±‘ãºiápYC€öëÅrâhU¥Y_1K’R¼7#yÐÜÄ<ˆÉ2íèyî\\ßÖ­ÞD°ß«ZNÖÏŽUq¾9ãŽßZä¯Eô«ÊºÏ.LŠ‘UïVt]~(n£{‘¸ghmØÀöÅDi>UgsyÑ[Ç¶ÝÎù-ü©D:|Àd‘ó¿ççž8h¦¾Œ2<ªÎ2±ÆX(àg<óÈ?¯jìü×Õ&X•A¶-óãåü*Åó¦§ƒ ¶@wû’™­©»?h•’ûÙÁá+=dÏ(ƒ_šÎT·rî©>s_ÿ\0\'­hGâáÀÉ?Jê\"Ò´K»§½ºŽÖ<E`ÃÁ\' àýîã?•fê¾¶Ôæ{ˆ¡·²\nl†+Øþµ¬jÑ•®šîmÍwfŠ1x¢)Ë/›‚½A8ÿ\0=*9¼El£x,çjŒõ5%Î©i¼6+W\0qœ§\0plöÞ´¬ôK\rò\r2;™Fžo1Qz’ŽN9#+&ðíÝ³gxÆéé«d\0ð3Ó5èöÚ¢}•yÀ¦k¸ðìVÓÝjÙö÷D¬QCw;yöúÖ¬²é±I-®ä!ç%±Ú2Üezu§N´Wð®a[–¢W5î5O/ï|¼g“NÓõ‘,Â-¯’7giÆÓÐç§5˜º˜Œy{P<Ÿ<ªÄ¹Éààð=1MÔõ™lô+«ƒnóà†hÃàí$Iç ÉÇ|bŠuçíæùÁ2•%Ëg¹µ¼B7NÆ¯Y“iä\ZóÍÄvÍtšt’¨“axØ·Þ^¿ þUÜÙ\\‡‰\Z6VB2¤‚zú.%TŠ¹äâðÎ”Ž7Æ_Æ«\'ö…„‹\ròŽw–lzÙôãéäí‘ê‘YÜ£Cqo0óµ†yàò3b9¯¥YŒœšÏ¾ÒíoÕÄAü¶ßwFõµ:øu;¸n^(.YêU¾¸žåVÚGò	ó¼õ\0v¦C­Ï#6Ø‚Œœdãòê“x\r£K³»óßdùKg\' Œž}j{\nKclc‚ÒÐ;\0$mª7ã8,1É¼W—*2Šw¤zkMí#Ì´{ëýFñ“O°ži€Z\'a9ÆOðô<ûW{öMZî8îîáŽÎñoU`Á€ÇÏÇ~¼w«ðÅ©é–ûd³’e !è=;Ötþ$ž+¥ß@;)ü«’¤’V”\Zò×õ4^Ò¤¯4ºšÒYÛÜ,EÝJ!ÜNz§u÷§¶«§E¨¶—±‡1‰1€qéÆ2*¹º­£iãœ‹¦´˜ÈãvËß“Uu/¶²a\rmäÉ[¡)HöôþTèÂ£Ò0zõ·õ¡Ë\'§-¼Î…|·<hr0:þtìÚMÅ:…gw7<zµg¥]AkrJ¥Õ@,«ŒÓ.t›‰GËr¨0xò³Î1ë^œpõ¢¯Ëù™Åíi·noÌðoiÍ¥jÓÛîÜªÜQØÖƒräuô¯n×~míŠU?{È\'+Ž˜ÝëÏã\\çÂe6·–s}Yÿ\0#ZS¥4µEÎ­9=æNÄuÏŽd cµv·?\r¼[âV³X¦CýEbÞx?Ä–ß@¿»!,?ñÜÖé>¨ÉµÑœËïZŒ1PX÷íW§ÓõK	´ûÈqÇï eÏæ*“¡æ~£ÐŒÙkJÔd±Ô ¹ŒüÑH{àô¯qðÖ«kygZË\n\\™-ËaÎP;ýkçñ´0ù‡ç^±ðÿ\0[km0Dci\"ó>òœŒ×2)Zv:pÍ»ÄõmP2‚WÖ´á¼r‰aü’ÝÇ,±M.7CŽ0:zàUÛd’Ü˜ˆ•QsûÂrHõÉLàí-gBZ\\st#­Zf\\ÍsÖ·Šp¥·ž}«Z92z41*Hó«Qqe[GK¨H\'ä0ê\rqW¶×ÚcÝ´é’7F9™éèÂUÁëüë3QµLgùv¬ñx(U\\ëFm…ÅÊ›å–¨áVòæ/õ–òp2?JÛ·‹ý\rn&¨eÝ´EV²Óí´ù%h‘˜\0ÅØ±#žçëV\ZæÚ8Ê¬¤õÆ\rx\\µ(»T‰éÎJ*ïÜÂþTˆÒ…nH«¶QOtKÙvî\'¿Ò³!¼EýâÄÍ±IR_$cÚ´ì5„¹fcÃ«m cZáæ¥/z_ ­(û¨¶úkÙœÂõ®_QÔÖíáß»iûÂ»1ç9éÇý“2Î×fós˜¶aÖ»+A»rhsÑš×œçµïúÓ†¤zµªhV×é$¶bá‡´gÜt®:çEñ=œÎ«b’ÆªXH&\07¶~zW/-^C©{6ucQëúÑ\\ŠYx©Ð2è“FGï¹+w_z*ÔŠ±êlèYìðAë™4Ë»q×´›r g•RÊÌUžÝÇ$|‹–ÇåVc†È2…V‰Èê[šÑEAÝ/ëï=ù.efþð³8G”Å“#ÇiúÔ_å`¦QØ¢WžOJzÄ‘™w©êŽ~Sõ§´pF¢M¡¢á	…>ýøR©ûÈªU9##K—³t¸„FX±¯»s^¤xŽ+„`œçƒÉù\nàU]•‘lŒ*u•ËÚLa›(r6îà°ïÞ¶ÃU·ºy¹–O÷ˆöè&\\\r¤Ï\\Õ¸˜mýÍyþ—­Ê»wŸ”ã Œ×ck|—îÜ=0+Ð„Ó>n­\'M—pªÿ\0g\nÙRw¤štråyõ©wdS”Œ.âs\ZÆ†÷—ðÝÇ4ðÉZ9Ü9ÉPpOnjÛ ‘@š!ÏSŒVÙ\0‚xª³D¬xþuÃVƒèÎ¨WÙ3\Zm\"’m¸è8ÿ\0\n­u¡ÚÞÁä]Ä$:.ÜúóŸÆµÝ\"NMF]³‚¼{÷¬4ŽçDjÍlÎP²¾ÑaacSÃ2•eŒ…,99ÇOJÃ\\j±’ÞØLe%‰¡ÎÞ1ŽyçŸ ¯Q‘VQ†EcŽY3ˆà”M,¿gu;‹Ýœ çéÀô©©‰”6;#]Ê-5©ÀÙ|4k{èæ™ hcq!H_q|s´Œ1]8Š4ó-›A¿q+ìóR7`8wL(çÞ›m©ÝIyƒÇl\\Œ¼ ¿^Ð1Ï×½kM&¢ñìò«\'ÞÝp§fÁ×îóœtëÏjåXŠ•¤¹÷ù0•à´ýQqa{¦XÌë1Dy·fxIuÏR9{ú×9{¤jsë0L!¿xgÇïc·f1ž:ôã8ç#ŒúVªëÞ,×tû¸&ÐÅ·ÈvLèÐ dd9Éä/OZÔðØ½›Jó%K–]»Ì‘ï^y$\\{VÎWn[¿£ˆ”—b	<:@Ñ®¬‚b>ëŒGäk¢[9#·VšQÆŠ‹#ÿ\0(\0Ž3‘‘ŸÒ›’x÷y‰*Ž±ïù”góŠ¡¯M©ÇÛÁbífC#ºŽ¿qTû÷®oi)%jö¸Jmï#ûCÐ¤œîûKn¶Ô\"gž“Æj…íÚÇ0XÕòHPdrsŽI©’}COŽGŽÙšåT–G—<ã#\'¿µ2Ú÷QÕîm¬µ)Ä&Rc^Wƒòå‰\0äÜf´ŒdâÜÝìmíT^„ú}Ž­Ë)¶a€Ä¯ÁöSšì­,3;’Š…€ËnIºõæ²>ÉÐA:œÑßZDîÝ	aÓç\\tÈÏõ«v‹©îŠ-JXQ@žÚ=¾BI»â±Ÿ³›æÿ\0€DêNZ2æ¨÷0Á#´kº¬ü¡=¸Ï^ÃÚ©\\±qe»%Ä›Š>ÝÊ¸\0ðO­&»·Š&ò®I“]Ø~}ºZªc‰bŠkí lõÀ>çß­e>Hê•È‡5­kš7˜bØ“\0wmPXžqéZépZ26öûXäùO=‡çUÞöXcIRáLc/ò“éŠÍ»Õb»¸ÝÌ±o_•÷cg?‡­6©+-[ù/ó&QW~ŸyÓÙ}†+BÑF±2íù†T¨[ÿ\0´íå6âˆY‚C+Iå*²î?‹g§UÌùw\Z}úÝ[ˆ®à9\"@7qÓ±ä{Š¿¢JšÎ¡¬Âl’YÂ?Ê\0úþµtÝE5ÊõfµiAÁ¿²F‚A,aÔåO úÕÑÄ79\0ûÖl÷‰hWhÚ0¥`ÞëX$—}kèÞ&4–¯SÁŽ\ZU›<úœ1¾	úÖTúÂ÷‡ç\\uÖ»’pÊ\ZË“Wv=kŽ¦b¤uÃÊwë«FOÞ[‡Qˆù‡ç^d5Yê*í¶²ÊyaÖ¦8årå„=J;Ër£æQõ¥“QúÅü\ryüzÞGÞZŠ}sh?2×KÌRG:À6ÎâMf1œøš®ÚÐÏ£ñ¯;›Ä,XŒ­D5·nC-sË17Y‘é#WÏñÎ¦MQO]¦¼ÞaØIì*ü:£°8çœvªŽ=w°>G|5ˆû«ùÐo¡ô÷ÕpãXÇñÎí¡ýáùÖ«ÔÍàŸc¸±–©Rê8ÝÆ¸1¬´*ÄzÈîëùÕ,\\IxFw>d8ÿ\0X?:a¸·ÇŸÆ¸ã­(}:¯&º£ø‡çMã »°r;csoýïÖ£k¨\0àþµÆ&¶§’ãó¦I®ðãó¥õÈØ¯ª4v‹q°ÇãWV%ëæWi«oaóÎ· Õhù‡JÒ•xËs:”$¶7YQW,üZË¹¿†2@eëY÷úÉXˆ,¢¸½O_!Ø^¦ZñZ ¥‡oVtÚ†¯m°«#Ð‘Y6Dßclät$}+€Ô5©d`\nÝÑ<Q•m³bo|Ï\\5cN³ýçN½NêjtÕ JÒêÐÚÊ#°¹Eï„ŸlsÒ¢Òõ‘mºÈ%WíE(AçÛ»§xŠMlLdòã…\nõ$~|V”pYÆw‡ç±Èm¦¼ú‘£hÊ¬íï/¸Äƒ^ò¶,ÔÚK’«Ÿ¯åW—YºÔn~Ì‘\\E!êZ3°cÑº\Z×\Z&•ù©¼œ°cëì*¥í®ÔC¬`ÈûšÍÂT£e¯Ì•RIh¬TŸ\\K[ÜfWFÚ_nÐO\\fšÞ/ƒÉFI@W ŒzT2Úiº…„i©”y†àpýHÈç“ïYöú‹\0xáµkÆ=ÝË?Ô¾°­ñ?‘¢¥¼N¦\rr) IJÛ†r±?1EX³,á\nÍ\n…\0GÀÛíŠ+¡V“[ÿ\0_yÈÔµ¿¯¸ñ+	–Hå@Aü’9=yäVÄd\"µºyÛ¾óR>ªŒ¶íå® !aŒg$“éÀôªñ^ÝYFÏ\0lílÎyïþk¡§=c¹ôï–:3B&xØ™Æ¤p ^:ŸJd·M¤«+y(Ì¿©ôõÅI¦÷ýL«ƒÎåMŸO¸PNg¸’©gË-õD¶·Q]’6Úvn\0)?ûÛ1 \nöåï\r‚;ç¦+)¾ÐŠT®æ…ç\0~ú\nš×Scòn7É•_3ƒ€Gnž”Ý?µ9¥v¦¨ÐÑu‡½µØH¥)\'½Çõü+·Ó5g· “‘‘Áÿ\0\Zà&±µÔU^Í”L‡*²[Øÿ\0ãúÔÚ~³=Œ‚ËVS\rÉl.åÆþ8ö¶Œ¯ªÜòñ8hôÕ»³™\'hQÔƒV£Õc²)# Íy¢ê$FJ?=Æi‰¬É‚$û¾¢´U›<éaQê‰Ÿ—Œõ¢[¤²¹QÔãùWZøŠVd\r)9àœqÿ\0Uo&±or1)\rÏLÿ\0õ«9É´OÕÒgCÁ›÷’«ü#‘Û5>è]NÂ¥²rõ¬C*ÊKÅ+SŒç¾\rGÕÌs÷\nÑy-‘ëø×3“Ž’W+Øskmy\n	#<ú”Â¼àóõ© ‘Zßïnã½LÑeF°«Tïª1riÙ•Bª¬K»—†TŠ<‘µW;Q{c \0*²!Êò[×­5¡$–\0ÑË$ÉîgÄ°5¤s?î]“;ðc+‘ýÖÎ×¥N…DëÍˆ<ôÈïß¦*W€°ee[‚È#Þ™°Ç…j\0¥N«B´}H¯-¢¹ŽHcšò)M’\0À“œäqž¦Å§ˆìÄ2Ì!•A¶Z—ì±D®‡^ONÝ*mÚ§ð8©Q¿Ä†åm+,e•–é\"‘‰ mˆ§œ±9üª†«¤[êvÿ\0fiä·Eÿ\0ž.ãùã­ipq˜—¯\'=ãKå–u\0ˆŽNOô=(ù8»¦sk¥Xè×&[Kh¼ùUæÆY‚Œÿ\0õº×;«xÔA{öa\Z«¨‘Î\0?‡éÏ5è7:|E„VgƒÛÄë^y½£F“7ÍÈ9Áô®_b•Fë|>¿Ÿ¡èajQkßÜËðþ¼nu	\rül¤\0atÀÀÁô5Þ^\\‹HTÂ¨Çî#­fØiz\\¥º1†m‘ôÇJ±âKÍ*ÒÊháþÒÉ‘¸7_nÕ›ýíåNÉ/ë@©ÈêF)6`xƒY–$–]¸ùUAýk—\Z´‹:IæmÕªžçU5+ö¹¹c&Ýäu­U³…¤¸_0•^~c]”èEBò/X¾T{–³ko¥ÆÒZ¥Ä»ž0Šä|À×œÖ¥¥Þ“g“ØØÅlfœ¢m?¥y†¯jútmD€ý y¸ppJã×œ~Óµõ¼1§ÊLmœ¨5ËíëÐ´WËÐÆxjsz_Ì¿¨jÞk¬6ç­THD¶¦é™ä…Wè©äVk¤“Þ²é÷ÁÙó)=;.*ÕÝµàÓ]Z»î#Æ:ZÂNr|Ó6P„mœ†§ªÜ¾¡\"L±\r„…(¸të.]JúÚä­Í´‘ÂT2¹R1ê\r]Õ´ûÉ®Ýœ†<ò¦;ä\nmÎ‰¯ÜÍåOm31þ:×©ISi7aTÓAc×`,ª\\dÕø¯UÆTnúÕ(¼­ªE›18Ûu\rù“ŠØÓ<©Ë1[Ø¥·B£\ndCÏ~‡=(©BŸÙ0ö«©Ÿ7ˆ ·Æäƒ·vvœcëQ.°.¥+ùýcô\n;óÚºé~Y²3¹ °žñª£ÂçGµ”Á7`É“ÿ\0áÆë×¬êS§J7³¸Sª¤ì™É]´°,÷q,’Bå@gä Q·¨­=\'N¾–îÖy¼“i\"‡`ÄƒƒŸÏ±®Á´›»6ó¡2ÂpRÑ~PqÎzn¥áëËë(äò¼¹Ë)XÃíU\0Œ.v³öŽQI/×M\\¢¯c&tä½mÌ-Õ[–wÛ§­jkèöÉqÇÂà”pK\Z­qà¥žu–[ö·ŒŒH€n ûV1ð¾›à+<ÊŽrÛ»Ø‘Ífé%i¶¿2ÓU£­†}¶êòi^ÖÂíâÜv²ÂÇ?•Ol.®.&‰³É”mÇçZZsj6âk{)ŒÉ½²z\n‰#¼¸º/q,m³™P®O±ïš‡n[ÅhiÊîÓ4.ôèÚ3´˜ù~mÙúÖ1‘<ÌÆ…‚’Çñ[‘Ùßdß•wåÛŒö4øü!-Ø&ðŒÀî\0¡ëE*QœßÃ÷IÂVéËmm\'˜Í,€M‡·§Ö¹¹×Q€–3ºB—žõØÞhèj\\Ünù™»Š§*_[ù	w.0ØãÞ¦JtåªL)Ê2Z3œAsö	g•DLŒFÖïÎ+-5€Ò`AOjÚž{ôr^Ò6õÉãò¬‹>ëP¸`ª±oþŸÆ¶£ÊÛç±¤â’ÐÒ±Õ:á×èMt°j@B°éë\\Kx#Rm³$„äãŠÖ±ðö¼]!i•¼@®›:üÎI(ÉêYÕ5\'tl3Ö¹;¹™˜å«´›KžËO‘Z:äœ6NTJã_Ãº¥Ü“n>PÉ*\0<ÑNNR|îÅû8òû¦`µ¾¼|XÙOqØ˜ã,â8§\r3Tóš	tû¤‘@%Lg8õ¯@ðš^i2ýŽæ_=FÂ\0^3‘Óß¿¥&¹âkK9¤ŽÞd–bØvQÈÇ­jë5¤UÌÕ6Ž.Á£ÓµÏ{å8o$pñÓÛ^j\"Û6›g‰ßpu;°GÓµsf·½¸2yq“’KàòkkM¿–Ë0Âg YW§î÷6¦¦ºhnŸ^Z·ïmXª.ÑòœçÖ±¯<KyvÎ§1£c+JèmÔ^a`ÜnÆ3U¦ðËÌÅ„C$öjçJû«•xEê¬ÌÍ:ý^@f!Øðí[¢ðÂ¿»d\0Ž›jH|)((§~8Éèjs£¬9ßóŒóQW5ªÐŸo	35®¤f\'yüè­±ÛbŠçú¼‹öÑìqo;Uá”$@óÝxéìJÎ¹µI£i\",ê mÁ\'=1Ž{Žj¤zÅ¤d2K$`;‡ýõÍ^ûE¥Üm5»·œÜo\\>OmÃ==ûW¢©Î›»¹î\'ð»˜ÒÙ\\Y»ÍT©*6dn?NÇ?…:ÒöI.R´{@äw~_Ò´® š4_=ãTcË&è~µ‡{$p³˜Ã3uÈ9¸<ÿ\0žkª›öªÏWÜÎv¦¹“ÐÝØÏŠAžÝÿ\0 °ËƒÐ›s\\Zµ˜·˜Å›€à`úëFÃ_¸†\rÇï‘\nuükW„”u‹¹Ê±±“´“GH‡Ë)¹@áTžGZ±t-.à\\’6ä+1ìÁfÙê¶SFÛwÆî@\"Lu?çÚ­–I“ê?ä~uŸÂõºck]Y¢	måµù¬î¼èºyR‘¼fã#¿gjòÚ:›‘$º1_”ÿ\0À‡Ê:Û¸l^;•ãëDI\"ÄÑ¦Ùáo½#}U¸5´T^¬à«	Fü«õýnsöºÚ4ªReÎëë]–«—\\ŒŽ+*ãÂºMØt[¶œœ‰ rÀ	Û —…®ØÈ´Éu\Zž#$,˜õçùf¶t¡%î»zœœõÇ;¯é™kªÈ\"@$8_^•·m­Dê¸,ä+Ì4¿DÒÇkwÐÜÇ‘‰“?\ZÞ7™bÀŒÇ¹gf5%xžƒoª««…Áˆ­hnŽç×—ÁzÂ3‚~^zzÖµ®·*æ;s×éJ/”Ê¥+žŒ\'R sÎ=ªpU”ã·Jã­µô•ºí=¹¥°™+ï#Žë¡J/sŽTdí›³À¨ž\rØõ÷¬ãªI\Z)\n¥‹îl`wéWa¾\0$însŽ\0¡Ó‹\"Òˆæü S‘W\rË}*apŒÇ8ïCÊ™À5¤5\'Ø¯þ°eÊô`GF¢%Š\0 \0*u\\ç\"àvæ³äh®aª8Ï¯5\rÜ+5»)wlÕœv=)GCQRš”\\_PŒ¬îqpÖQ•‰7É,zçñ®oÅ×wÖÚ(ÃÜJÇŒtàŸþµzEåšÍ\n œtÎ+ØO\"ÊÛ÷‚6üÇŠóiá])§ºG«U6®ôgœAák×*·…ppÅ8üë{NðäèLrB®3Œ“íœWoä‘Œçž•lªí;6©#ï*Ž¾µÖÓùßÜfëÛá9[éÐ\\6¢öÊ³g;—éŠÙ¶ðò6E‰aÎUOVúÕøxÑPÊïŒÌ Ð\n˜o,˜œtÏjn4¥k¦íÜÁÔ¨¯gbÔzlqÅÔŽ9¥k	Rb˜ù²MS`í/ÌìPžõ+JÅUw>É­T©ÿ\0)ÎÔÿ\0˜‘­,à‘UP}ï”¿%ãldä÷ëP;²Œd÷ÆqT$ŽúC“>Ñx©u-²û#MËyR¥º(XÙÛÑYF?3LÙ,¼ª\0$V\\vr)˜±Í^TxÇÞ\'½>w\'vÓQVNä²$Í—&Ð„a†î¢¨®‘l™TL)äÇ5e—•ÎO\'žôn‘H`2;úÔÎ©ñ«„\\£ð²&Ó-Z¯Ê8ÁêGêEs| 9BY—¹U¶ÜñîägÔÕ)lVB€~tI8«AXÒ›MÞ£¹Ì_Ü\\NdçkáG9ª±[sÜó]Kiq;ƒÔÓ—J·_™°[¯$×/³¨ÏIbéÅY#˜ºûdVø°Ž_8°ÉL}ßCšÑÒô©åe¹ž3‡æ`yæ¶b·h£PŠœ˜öÅ\\B¸Æ0kHS½¹ºTÅ=yVå\'‰¢–ˆ]	ùóÍYK™mIL“qJ7)b[#°¨\Zá‰<j½\"ù®Îmg£ÔŠâê2Í“Žxª¥¤sòFÍî\\¡óýÐjU¼\rËŒ{YÉFNíš&â´F4úMåË¶íƒÔ’Y±ÐE´ÂY¶’?‡~5yõ)Ž¿zUº/Ãg50§J2º¸JuZ³%í…¢A\Z)?/Z¯ÂÎpU~èÇJ{¸ØHcÎ—S–!N3ÆkYÎQÕ*jZ1.õ8•œ»dç¡¬™ucÕ1aÚ™u§_9$˜‡<dÿ\0õ«5´«É]‰raÅ`¤›÷N0„V…‰uIŠ.FRÜ£Î>™”º’[®KMlÿ\0e_´ÏV>M2hYQR~èÆkE5\r†Ôe¡BÑ~Åm,KŸÞFÞÄ÷­}*8$Ø·\rºBxcU‰Øî\0rH­=\'OÚÁÉAêiN¯>–¹›QŠm;%¢ª T\0éW‘ŠuééX©H—ºˆ´*v3Z°o^FL6R*£+lqJ7z›_j»µS¹ºEÎá“Ö².uåãY6ÈÊqT¦“¦Aæ¯Êß^æ¦¤å%d8RŠwfàÕQF\0j+ŸÌgüQY~ÿ\0¹·%Ê#¸ƒn3wåŽ)ÌmIÝÿ\0d*¨nÉë‘çNñ¯\068ÀÏ}‡`U_ThA<°à+œcÊ‘ô«*L«‘cP.Å“Ž\0§åYñJ·¤FDQ’ÁTa²}É\0Ö…¨…nË\"ü¹¨o¯§ãQ*m;Ø¥Y=.U6Ò/îŠlýÜŒgéQ½\'»@ÆÂ´ç»ŽâFóå·“Ð 9ª³H‘³4^fI$îù“¯Lv¡6jÝÑ‰<.›Ùƒ.~áÝÓ×¯ô©-uKë)8™Ý	åKdsZRFæ2óŸ9“%ÂzƒÇ•5´Åœ\"_”ƒÔšÙM5i£;Ášºo‰ £\nÌ@,@Ú£ßá]2Çyž5ÝMð?\ZóÙô¹£ËtêéQCw©XÖ÷2BàõÊŸÒ¡Ð„¶*8šÒZž–Í1YT¼c9$’GáÍÑÈ¡Ú<	Áü«‰ÓüoªYÈ>Ô‘ÞÇÜN¿1ÿ\0u®Š/øjuæÊòÚfb¨®‹øç?¥fð³_	kMühžT‚æB¯d¸$±Ž=ñýin-ãƒvN>½ëFÊÃO×ãß§êÖríç`m®> €jÄžÕmÔˆü¶$zŸçYN5èÖ2¡\'£1^Å#Àn\r½=*Pò)Ð‚^µsû\"é~kìÝÀlÿ\0:€¦Ï.?•O-ö&T¢(ºm¬UˆÇ\0ZXõ©­¤P±×›$8_Üàçø{Ó[Mœ˜Üqš,–ìÂTØÒ·ñ˜êÛqïž+e<BŠ»‹k‰›K\\lãŽ¤Ôg	Þ¡˜z£fš’]L\'†—Xž¡oª…MÓ>Ð£…üæ­A«C,CdžÕäGQ¼ŒysË0AÔdÿ\0:½k¬ÅÌ$7¦úõjLæ•${öŠ€9ÂëJ58Šç^cý¾˜Éi#wzHõ×9o5¼±Î7qŠ|ÌdKûr±à“ì*&¾ÀÜEpëâˆ#@|Ò3Æ;šXuøæl#9èk9\"”Nù.”Ùý)’]Æ¼7_Zâ¢ñ\Z-ÃÆw‘ƒš¯¸ÓÎìÒ0@8ÏCQ%u¢)A\\î~×#dqÏZ‘$×¥pÉ®ÄÎ>[#=+bÛ[„! ÝÉ1K¨Üm±Óˆˆ=yö©T&ìIÇ5Ï¦²žYrÍÒ„Öc~CœwõªQC73}¥Š3³ŒÓ8’Lr+ž“]´W˜r*9<Kl\0TvôïTã ¢Î¼²\n‚*0ë·ù®Wþ;wD§×Jo\0ä;pH\"¡Û±J›;9»Wœõö¦5Ú)m¹8À·‰ŒVé¶g$Ÿ˜æ«MâøÀ\\9\0µ<Ïk©#Ð¾ØªNwtÉú¬pFK¿|pkÎ¯|h|­¨XIÇ#¥P:É’\'•äcÎBç¿­\'5¡j0OSÖ-uX§DÏR3ƒQO¨G2üÄõÍpVº¼±èÂc2¤Ì8Ï\'­5üA‹1ËI÷r{ö¡ó5`PŠw;k[ñ32‰zäôÅY3)F\"LœqÅp¶\ZŒ–VÉs.]¥<.sN—^šÝ\ZYC7;\0?tv¨QiX«&îv?o`ªŽêOr*Ìw‰±Xœäq^Qý½;NÇt€Ó5euÙŒ1–™ú‘Öˆ©ÇtŒÌô´½Ie‘PœÒ¢žîÞÞ-¬À±àg¹®|Oä®˜9î;ÖskRù‹™šFÎy9Å]¶%$ºžu£R§åb:\n¥§°³¶ò¼ýÑ«“žk}rs?.Ç=I=©²kó\"”É$ãv}Mw==ï \n$Ó-î#’F*IëË›ÄSÊá¸$c­h§ˆZÊÈ!gÝÜƒT©´îÑ.JÖLô”ž1³Œ\n_µ	GÈ8Î3^o‰³…ò}zÕ³â‚ª!e8ìkN^èÎþgo(·|«c#©¨Ú,àÍq‹â(ÕYÌ®[¾Nj»x’]ÆT•ˆ_áÏZ^Å7ª+ÚIlÏH†KX-Í½Åêô!2Mp2ø†úfÝ4Å#^v¡ÆjdÖ`†ËÌig÷äÖžÆû¢Ku:Ë™ãû@TÆê;ÍR\r5Ôÿ\0¯pvc±í\\(ñ³›Æ&³®üBòŽÌNpsÏÖýÚÌz²¦™³Ä–$wª’kÊœHÃw\né\\$úÉ—•\'hàk:]NW\0Ì\0µQÁ¶Ãë;¹uôŽà³³;žµ‘©k‰åµÄƒçq\\„×²ìO®i±K;¶»qÚº#ŠÕñ-ìt+âi\n‚&~FzÑX?a¹<ˆÓŠ+O«P\'ÚUo|é…eY~éçò­k/±^y$xT–±íŽ¿Ê¹Ì¿/ f¤Ž9®‰QOTU<SÚGW=¬6ìÞQ\"öo/ïëQ´Å#KŒ²ƒƒØÖ%µù‡¨bqZÑÍo<Gd‚3ÆàÏíô®iBPÜí„ãQ{¬lŒÀº´j76à0F=qIìŒî÷\'¡\rÖÒñÊ¥Ð0ÂõÈ>µn?C¨kIÞÇ?žih÷\rVÅ8çFpÁŠ7½^AÃ{©óGIcm­ížÇñ¨^é:ŽžBÞDväàä*¸²à>ãž¤ðjT\\v/Kttp[B‡ÊžAÓ9·pOåRˆ¬oÞ(gV‚w;|¹SiüCÒ²`½’\0E`:ñœV­ôR0Ù0V¥Ì7ÃgðTr9Ë´¯\'+‘íÞ°5/ßY‚è¾hë…×­¤l|Ûr`›®øio¨è*ÔŽk¡é<«©G\0H<¢‘ú\nÒ3³Ñ˜Î›¶ÇKaqXŠãÔUÝ7^ÖtVÿ\0A¿ž 8Ù»+ÿ\0|ž+Ôå¸µeQm%±\'?¼MÑŸ`ËýqU¯¼7¥ê°¬¶í\Z÷Ý	Í[©Ý*}S1ôïŒ\Z…ºÔ´Ë{ÌV1·ãÁ¥l[|Nðíû…½Ó¦³÷Vä+š¾ðC.LS†AÐÁþuÏÝxvæ×ïÆH=)û’B´¢î{FŸ}áÍLãOÕ vãä-ƒù\ZÒ}0ÊÌ0G¥|äöÒG×ržÔè¯/läÌ±2œ‚ŒEg,<$iEHõ=öm|­»ô¬™ô»¨ÏÌ‡â¼âÇâO‰4ü)¾iÐâaººKoŒ·;@»Ò¡”ú¬Å3ú\ZÉà×Dl±òêÍI\"š#»ÈoÏúT‹\",*ÞÌ¼Õ¨>-h·\0­>{bG%HåZPx»Áú‘îâW=åBµh±wÝœ–z{1\r¡þò6*¡Ðm¥Ê¾–?fPÜ~•è¿Ùºê¶º·f#?,€æ‡ðµ´ƒ+!†höUÂu0Òø•2mÕ€]HþÔ$Z?°õhÁ04Sgº¿5è/á|LÑÇ>Iäü½*¼ž–0™ŸO—š¨Ëö<óf³dåšÖ`zäÕÔ.blº8#Ô^–t[€8|žÙâ£wQ¶\n¶=\nO¬HxJoá‘çVº³øúÖÝ®¹\"ÂWûÇ\'šê$²/ËDû¨ª“iÐàî·Lû*ïöGõ7ÒF4ÚëmÛ¸ç3Uˆ¦Œ¿‡5¥.‘fÿ\07ÙúqTåÐìÈ?ºuÿ\0SNHxJ½\n_ðNI$ç>õºäŽ}8ÇZ»ÿ\0í«$”zcšaðºõIeÇ©Oþ½R•2·c1õI\\u8Ôeß»\'ó­Y<2B|³·ÓËÿ\0ëÕfðôÝÉÇªU)Ñ}H–²ÝÒ_9Ç\'ó¨…ÛžkAô)ü´Áÿ\0pÒ\r¶3súŠÕ:i:u/ª*-Ñ cõ¼;#¥[]VÈY¢Àþ,ÑýrßCô5-ÓIßQ‘ð9úf\ró«(a•Ï#57ö%À9\r=0\r#hÓªòè¦i~ì¥	¾„³ê²NAÉ\\p1MmNBrÄ\0šoö4½ñôõ§\\7YR§–™~Î¯bxµTvÚè0\\ÕiµMÖj…Få?xf‘´	ÁæxÇ¾*&Ðån\rÂëŠv¦º‡²«ü¥!ps‚ÜUÈî-ìy qÍ(ðóž~ÙÝ52øeœdÞ¨Ï¢õéÊt»‚ÂÖþR‰Ô‰|\rE6¤Ò.ÅÏ½k‚söìýÿ\0¯NŽ3–ºsôOþ½Ûº–°X‡ö#*ÿ\0³®â2ßZoöŸ™(.;úÖÐðÅ°82H~£áá»DÆcg?ZŸo@¥—â;Ðj± fòÆ3ÀÍ2M\\¸Úª\0\'\'šÕm*ÚÆm¸÷¦„·À[e§\"—¶¦öWö}^ºÚþ\\,FsëUd¿šeÚöç°ë]b4j¼ª/– (å\\Ib#ü¥ÿ\0fË¹ÏK=ÝÂªùª½*qk}*®b&ºåÞH=x¥û¨2­Æ3Ò¥âã±¢ÊšÝœòi7®§sªgñ¨Ï‡]_-s’züŸýzéRÝž?3Íg®zSb—~åY•ˆÈÅ?­É_•öt4æ0F…ŒÉ#·>˜©¢Ó´ØˆÊÚ«Ò¼r>Å~œµg}µLånÆ;ðjÕYÌÍÐ¥ORè‚Ê4aB=E;íDÀG¸gÐãJêkdd,ySü<Õ­VÈB$bCsJ0œö¹£©Nš»²7ÌyûÇó¢¹vñjv¬YQÀ$ÑWõZ½Œþ¿…êÑžQYIG=ª»!áL1Éo&èÉÈö§­ÐvÄÃiõ+ÔI­žç[MYÞG¤YJŽh*­÷Haê*2¸éOFUåS/Û_›sŠÙõ­½7\\Á‘Çÿ\0ï7zå7J7x¬åF/^§D1²ŽTzîãRD·ºŒD8]ìÿ\0/çŠëÖÇÃºê’ÿ\0g™ÈÀ’\'ê+çØo¥ˆðÜ ô«Öz¼¶·+qÍ€ðc8ð¬}”‘Óí©ÏX»3Ø.þZÜHZÏThÇð¤±nÇüü«Ÿ¿ð.¿§3­ÅÜKÑà%‰ü+:Ãâv¯hê\'ò.W€_~»/â¦™q„º&Ýû’r¿K‚{‚©R.éÜáå:¦˜ÙžÊx@í,e˜rÓÅl€,°nÍÏå^£‰´MR!½²˜?ð4‹ŸçTï¼#áÝQrmüœœï·m¿â*]Å¬[_9;@Ø9òØôÉ­&º±ÔQ|è¢™‡ñdˆæŸuðÂÊDaÔåVÏIðßËƒ{àéß5¼iPp\ZÉüª9eUVœú›ii2Ç®§,h‚dìAýi³Z]Ä€¥½½Ø’%òÛò ÿ\0:çb¸×ì>K­:é@îÐ°ýjÌ^$•x`¤¥m\Z-Âú¦X‘!¸Œ¬Úuäò[–÷Ðâ°/tû&|#.î„Ïå]]¿‰ =Y®*ÑÔôÛ¾%[wÏ÷€¦¥eö<î]\0:ì¸k.]\n]ß/$uÇ5êçNÒ&mé+BÙÿ\0–2ãô¥›A´Ëæ-ÛÌ\n¢¶fR…÷‰ãri—±	Ú¡xeN0ÀW«]xZ|KŽ€6ÓYSøbèg6“ÿ\0Lðâ´SfNèy¹GSÐþU$7—–¯ºåŒÿ\0°äW_?‡&˜i”z´lò¬K8E!¯\\`jùû£?gü¬u—¼C§©j3c¸˜~µ»Å­~0d¶œTÅrsÙ…#å~}ª»ÛàñÏÒ‹S}ÝUÔôñ~éï4¨Oû²‘ý*ômÿ\0Eaë¶|ÿ\0ìµåm	íšaˆŠ¯gJ«sÙ!ø«¢NA’Æh½NA«ËñÃr¡A8ŒŸï-xfÆa‡8©tcÜ¥‰šÝé‹¼<À¶ZîèK8Z5ÝfÁÕtðž¢eÉýkÀÊ¶3Í4†§êÑ}Júì×Cè¡{áéBìÔl[ÿ\0®^Z°/4…\ní¤ºÌ¼WÍ›œSÄòŽŒÃñ¤ð‰Ž9ƒ[ÜúC\ZdÙ%`>€J)>Á¦¸ÈÂ÷ëç%¼¹C•–AôcS\rVütº˜ÀÍfð+ÈÖ9¥»ŸB¾—§7IÏlj!¡X9gð¯MR¥äÿ\0÷Ù§ê™ÏÛ&ÿ\0¾GÔ<‘k5O«=ÖoZt6{Ò«7…­Ý†Ë˜í^0<S«¨âþaÿ\04ßøIõmÅ¾Û.Þ4ÖHRÌ©½ÿ\0#Ú?áOü}žøãRŸ@0~Ú¤z?Æ¼Dø£WÝŸ¶Ëÿ\0}\ZkxŸV9ÿ\0L“ŸöWÕ$fñô|þãÚ¤ðå²Œ-Úçè?Æª·‡Ô6ä¼B;ŒõëÆÏˆuBãò_ûèÓ·õ!Ÿô©9ÿ\0hÑõ&/í*K¹ë’hsïâê23ÓüšA¦áŒL¹ÆwŠò#­ê$çíRgýãL:½ñëpÿ\0™¡àÜÑg*;\\ö?ì(\Z„;dñ§¶‹ÈwlG±ã^,uKÃÿ\0-ßó§&¯}K‡üë\'–Ë£5Ž{Nú¦{+i£\r×ŽÅTš‚l‹øpG*?Ö¼ ê·¬?ãáÿ\0ïªí×Yÿ\0\\üûšQË¤·eË;¦ÝÔYëOqöHØ­õ¹QÈÉþµ^=bÜ¶eº€fåMu;ýéþ5™!îhYTz¿ÀRÏÝýØž®úýšå$¸€ÑƒŠ§q®iBMßiV\rÔkÌÉcëF	õªŽUMud> «ÒôI¼O¥¨ONàÕ9|Sbj¡#=s\\>ÓéHTÖ±Ë¨®æ3Ï12èŽ°x¥åCìVÎÐjI|nC\r¨\\žïŸé\\€CKåšÕàè½ÑÍý§Š»qv¹·7Š.ÉH•Tõ\\Ô\râ¬îEUoQYžQÍ/”kEB’èbñX™u$šþâf%œóÖ ó¤È§ù>Ô¾Oµh¹VˆÂJ´Û ,ÍÔ“IÍY\nMª;Š®dC£-Ù\r6Gµ\\Ÿf»Ž«á™m™š4v_ïm<þ5ÌÜéí•d+Zö¹Â\\»2þ½sÚ‡‡ãºN`Nk–-£Óœc%ª<¡£xNä&psó(ü+©Ô<1qŠXg <ÖÆ›,d†ˆƒ[©ÅîqÊ„ã¬#taš\Z<zÔOlèi¾d©ÔŸÆªÝ™mi8’#Þ“$P³©á†)ß#t Ñ¯QÞ/áb	\nôëOK’­È\\t¦•=ÅLJ¤ã±}&Vl‡Ø}3[z_‹u±mxÏÿ\02×,>´¡ÊžÔ:hÞ8§mQéVßuu MkfàÊÊoéÿ\0­$!níÞýå;…xÀ—\'š]ãÖ—³)W‹GÑvÞ>Ñ.íQÇI)ýjg—ÃÚºåâ³”â†1_8\'£Ô‘Þ\\@ÙŽWO÷MK¥r£Z+]}›ÀÞ¹ù¢–âþÄƒ¨¬ËŸ\0F2,õ&-é(ÌW•[ø»Y¶ÀŽþAõÁþuµgñ+Y„q*L£Õ\0? ¬Ý#xâ¼u3x[_´9LMé°æ«¸ñ\rËi÷\\w±¥6×âœD´DËëŠÜ´ø™¤J\0{‡ê„ÿ\0J‡HÙb_“2cñäM¶êÙãõ%Å[(ˆclªO¦ku<eáûÅÃ^[¾{:c?˜¥	áKó“ohÎÝÔàšŸgm™~Ý?Š&m·ˆŒ¹%×f?‹¥:K6ümžW=sZ/áßL¤,E3ýÙüj›ø7NR\r½Û¡c–Î)òÉlO=6õ2&ðæ…tÄ˜ž3ÿ\0L¤ÅUoiN3åÊŸBTåZóx[QG+iuãÔâ©¾ƒâ˜NVÝ%©\"ëEåØ«R}L‹1¸½ŒúJÇ¸ð.­ÜËÇ[Ù5¯ˆa6rŽ:eOõ¨š÷Uƒí¥Æ:Úè”^Ìà$ðÆµ]:fì.j»èúŒ|>v?í‹…zBëó¨Ä°°ú­=uø‰ç#éUíIú¿™æ+c7Ýx%SþÒÒ¢{p­‚úñ^«ý«g!ù€lõÊÓ$›J•²c‹w¡J=ª¸}^V<âŒû\Z`0\ZõCo¢Ë¸¼äóÊõ¨_NÐ$ÆëHzúT«#7…•úb\"“Iå{W§6‡áÙ8û\")õVaýiá½)òâ\nOûmG·ˆ¾§>Ç™ý©<¡ô¯Goè¤`«;‰4ÃáMˆÁpß5^Ú$<»tcÇjO,W¡?ƒ´íß,ƒþÕDþ±í;­?oä¼Oå8#Æi<±]»ø>×?-Ó~5ð¾pnûÓöÑîKÁÏùN;É©<ªìÂ©ùoâ*ðÂsþ–¤úQíãÜO/å9C\'•]1ðÑÝÍÊÓO†€nnF=E?oäýJ}\"s~P¤Ø;Šè[Ã¼|· Ò7‡—þ{ŸÄQõˆw%àjô‰‚£o¸©ÕÇµÇ‡PŒyæ¤OÆ¿òÙ³RñßSZxJÑÞ:ÞHéHbZèàÒ-Ÿ´<¹õ¥‹áÆEß,áûäµa<daÑ¿DuÃ9íeêÎ(Æ=)6¯JôÐ|2Fvoö™«OMð¦!böªÊ«ÆCþ5‹Ìé®î6þÈ­nk¯¿þåd¨4mÝÐ\Zõxü7¥™G`…s‘ógúÕƒ Ú+îq©õ“Î)+4Y%^²G¤3*±9>Nj_±Ýƒ²ËŸ÷\rzØÒÔI½cqO],ƒ¹ÙKø¨yÄ”ÑdvZÔ<š=\'S•€KIHõ(E[_\rêÅ†mÊŒg\'µz—öwb j_±B¼p}7\ZÊYÄžÉC$¤·›gšCá{Ù	È‰ÍY_«5Ó~»››C1F|5W*‚=Î¨§Ùª´jËTÍÖU…Š÷®Î]<!§©eÅÃø J±…´ä*U$r½˜ðJÖ7°ÂÛDÏ¡5kVQ.æ™N„\nn¶%õc†\0ŸÂ¾ea iøæÈ~tP|C§Næü6Äùþ&Ü¸ÑüÙbF#,~”öE+„‹ó4íÃpçØ§y©¸©[¯Zö.|ÊEV³IÎ~kÿ\0ÃÖó“û F}yý+¡ó“€=*3ÓëKQèyÞ¡áGæy®vëK–!óBG¾k×dÙ8?\"ƒî\rg]iÐÌ§z‚}:UÅ´D”YäZã¶*»DÊx¯D¼ðäR±Bý3XWž2c\0s[Æ§sŽ¦\Z/c—Þã½8KŸ¼+B}&xŽ*«Ù•ê1WÏ`èÕŽÄ!ÔŸJ3Á¡ aL(ÃµV†MÉn‡bõ¦n#ŠPþ¢‰RC¹£qé\n	¡¤;öbîâ…n94c4›h½Ç÷§yŒ:\ZÚ,>v‰D¬;Ô©{<d•×†ªÑG*VKflEâMVl½”ïš»Ž5Äûs0÷Uÿ\0\næ¨ÍO³b–&¢êvÖßµkuÆõoS´sZ¶ÿ\0oýd`ý+Í3Fi{$ZÅÏ©ëÐ|XŒÿ\0­ÇášÒ‹â†“ l…O¼Dÿ\0JñÆ€äw¥ìŠúßt{Òü@ðìã4_ð(øT‰â/\n\\ñþˆÙÿ\0dŠð1½iD®“¢h±©w>óü\' \'Ê‡ðfÙü7+|±¢iükÁ…ÔÊx‘‡ÐÔ‹©]¯IÜ~5.k—V{±Ó|2G,W×÷þ5Ú7‡ø+tËŸö‰¯]^õF>ÐøúÔƒ^¿\0~ýŽ=j~®h³ÝžÃ&¥`ÔpO­BþµÀÙ«¯â+Êˆµÿ\0-ä)Oˆï‹dJEOÕ¼b»ž›\'‡Éÿ\0W¨ÆO×­dêZeÞj×-pŒ‰Ëllšâˆï»JÔÖñã‚\ZV õQõa¼É5k•„WzŽ^ÊbG>aÛÏãZK¦jq3©ðâ¼é5ëÈþä¬¿J_øH/¿çâOÎ¦XDÇÍEjÏD:DÌ0³ÞG£‘*y³Þù«ÎŽ¿}œý¦Lýi?·oOYä?SBÂ´T³83Ðî¬Q¯^81.9-ßim»î€=wÿ\0õëƒ:Ýá?ëÜ}\r!Ö¯[‰1éš>¬ÅÊ	jw-¥J3ÈÇûÂ˜ö.07/ýõ\\@ÖoK‰?:iÕî‰ægüèú«ö3·c8, ýjCj˜ä ÿ\0WuK’Ö½4êWÇšßTö¤èº}çLÿ\0½RyÖ(0Ò ?Zó“}1þ6üé¦òSüF©‡ö´WCÑÆ¡¦$t?C&¡¥)%e_È×›‰ñ\ZO9ýiýMw%æÿ\0Ý;¹u{÷gSÿ\0¨›Äª¥­´Œ|¹Ä÷¤.Ç½RÁÇ©”³i=‘ÜCâ¸íFØf|vÏ5f?ùd`ïÚ¼÷\'ÖŒš‰eÔ%ñ!Ç;ÄGá=,|@·<*=¦ÉãÓ°ª¢ýMy®M;qõ¬ÿ\0²pÝÖCZ¥÷Ûøêä&Ôe×NO\Zên9ÿ\0tW“ëI“ZÇ.Ã¯²Œ¥â_S¨“Å×ò}ë¦>ØáTd×î¤ë3\ZÅ¢¶Ž”vŠ9çšb\'¼‹Òj2»\\œÔ-w#ªôVª]Ybj½Ù/ÚÖŠŠŠ®TGµŸsÞð9ÏZwžÌŽz“EÅd{nNãA`ØÝ“N+–Ècš(¤	\\\0 ä“õ§ª«AÇ~Rl¤<*xÚ*¤¶jí€Ÿz(¥q¤P¸Òƒ¸GÏû5‡y¡Brv¦sØbŠ*£¨¦¬bÜx}òvmãÔÖUÆ“4_{n=U©4dàžå)-6õÅ@ÖÇ¨ÅV‘›9§Fµˆš2)˜¢ŠÝ3‚¤RzM(cEÈ»wµQJÁÌÀ`ÑEµbŠ(ƒ˜¢ŠÁES$(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0ÿÙ','00:20:00','Pizza de 8 pedaÃƒÂ§os, muito recheada e delicioza','Cozinha',NULL,NULL,NULL,2),(3,'FILE C/ FRITAS',69.9,0,0,'CERVEJAS','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0J\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0÷ú(¢€\n(¢€\n3QÉ*D»œT&Ô†5üM+¡ØÐyç`>µN]@/®}Íg»»¶]‰>ç4•.CH’K‰%êÇéQÑE¸£´†wt§yeiÑ}ê²\0oá®J¸žIò¢”nµ)Òâ¥dù¥7µ*ªq¹2†b—ìQ¥TêF°$ØÊ3NÅFÔ”ÔÕâî-nE3UF?5YÕ\\|ÕË]èoLÑ¶q´U†ÅPˆíQúÕÕ;–¼†M3i-n5ÅDÂ§þ*c­zØ:ÜÑåg<ãÔ¥u4v¶²ÜIÄq)v>€Wš7ŽcÔošiÈ…Wh*ßÃêsý+Ô¤^2Ž¡•VR3xÅ|é®Û¾›«_[Æ¹&*· x­q²:0\\¼Í½ÏO†Qq/þõ†íÈq‘ëî*¼¶{·\\I—”0\nPá‡^¾µÅèÚì–\n7ïšÜa™›‚¾õßÚ\\G¨Û‡Þ¤äó\\ÞëgsM4oˆ$[i·¼fM€¹Ë¦zgÔWfGËÎ=rOA\\Xåómæ…Dû~WÜÐº¾¡g¤ËirÎñ¹®~aê§úVÊ¯$uÔä«‡Si£®}DË5Ü=M ¿~s´àv®+Pñ4\Z&Ÿæ¾Ù%Ù˜`Îÿ\0úÕÈÚxÛZ½†l´a›î…\\cüû×\Z¯^§½ªÓŠ³=µ4‰wH¡G\\–Å95+wPÈù¡¯ŸõMrù®O4ÓÊHÙløTVúž¯u4kÿ\0ûv¸|e»œt­—µkV%‡§Ðú%&Fçq¦Üë\Z}„{î®c‰}ÎJòUÕîmáRúâê4Ç˜ÙÛ–<®ž7öÛÙŒ1É†\'ùÍTjNž²dK\r	hmêŸ¬ d‡O…¦’AòÊã\n=Èë\\Æ£â]_Q·9s4\nãr+lÉ=°:â­ÉáM>òÜÂ—3Ç\'˜d+`ç¸¨5½\"ïN…®tøD’mÛ¹G1Œÿ\0ŸZ¸âW£B4úÐÜ§ÛŸÏt0’6»íŒ~}«KM¸K©žÚÖÊïãw½rÐD¨$S§—±@rÏq×ž™÷®¶\rBÆ\rH~õ\\èœÏ½ks[tDi7:“}¡ÝX€8Ó©Áà:Óo]ßÛî»òíä\n@=r{*¬~$´·„½Š¬øËÊíó¹ú\ZÏµñÕÔº†Ømçº‡’Åôõ¬¥-‘¯/.îÅé<	vî´ÔãY±‡fR2=±\\µ×…µ«&)=¹œg\"H›xÇµzdW³N±´y²Ïbi÷RMog¿Êb7Þ!éîk8Õ[IX$¥}Ï»Ÿì÷$S•å‘†?užŒÜ\\Kvï(1Q`s]•í¶âü«»Dó†P\0p~´Ý#ÂÖº\\s,LÄdÁÏåDçÃÝ&ò¦ß1®5KŸ3î)1»¥H³M<Å²PáÆsUm„qFUø‘z–¨n<A¥ÙÈVâò(ä<aÛ¯åX8\'ñ1Æÿ\0e¥pÁ¶“ÔõÍg_Ý<JòHÏJžÞöÆÛæàpA_CÞ¼óÅú­ÜºÕÅº;ÁmUN7q÷‰­éÇ™^)XÍ»JÌé-/‹j|ÐQˆ\0äž•Ô½Ôv«¶nœœWèO>µa.âÃÌÜÇw8è¾\"š6ÒKÉ3FC‚Œ¼sQ\nnM÷5©iÅ#©S\rÄ!ásƒ÷Hä\Zd:…Õ®\Z9w!89¹\nêpE¥Åm#ÈÌ]¶Êy^Ø®Š5¥Ý$¡p3ë]°¯*vçØà©A;ØÛµñ,m…ºˆ©þúò+nˆn|.¬=pòÄ°z½F²Io&ø]ú©ÅzÕÑÃ*v=—µrÖ^&tÂ]¦áýõëùWCmyoyø%WÝGáV™›M(£4SQE\0QIš«=êEÂüÏééEÀ°Îª¹$T¦¿þÇãT¥žIú±úT`T6UçvvÜìIõ¤—m<%CvÕ! P#ÝRp´…ÆßþµpVÇF)¨jm\Zo¨›SvÚM´Ø²ÒãÖ¥Å,\riJ›œØêCTÃQÈûjaŠ\n£u¢Xõ{$\n—rfýàZ¼YòBˆÛÓ‚9Ç\\Õ˜¥\rýk†¥e)ÜÓ“Ý,°¨\\»ºSËµFî}«³×½7Šö1rB>gbF“Ñ¨\r»æÆ}êŠÉøûÕ˜¥]¾ÕåýjU¥y³¡ÓåZUƒ|½)d‹wÝ¤o˜S5ßB¬©j™„¢™F\\£­W\'æ­Y%]§óªZ¼\\Ÿ™}«¶X˜Ê7aëbH»SÂýPÿ\0	ý*8Qw!¤œÃŽ£ƒï\\•¹g5ÐÑ+è]8ûÕ÷}zSc”2ðÔ§æŒúÓ¥RÍ4fãÑ”o\'û<2?U$gÖ¾iÕîç—ZºWfÞf,éž	ëšúÄhgÒæM¹Êòzâ4_…vZ™¨kSLe™·,Q6Ý‹ØÜ×£V¼,›f”*ló%šêé-ãG;O%óÍoi:ÍÜWÈ’Bc“…1ò„{{×ºéš&™£G²ÆÊ8Áe^OÔÖŽ¼#³fÚ¥º¶¡\n“·§œ1Ðû×\"Ä);$m\ZºêsÖÚº¿É8w8Y‚go±ÅhDò\\Z‹wT‘Ë‡IGlv5äº_‰n´‹ÆM¬¡[kFÇ;9äW¡XêI©[ý®Òãdˆß2ÁúÖîñ:4‘‘âM}e…äs42F¸D#9CÍ]ð×‚ã‹G7:¿Ë;œ\"ÆØÚ?Úõ5¥~×g™í¦¹òà¡î·µmZŸí/ù>hK—QµÛ³Œg?­g*œ¶I‰¦Ñçš”6Zv¤×\Z‹ïÚ2·N;ÖD×vZŽ¨[OýÆ¥\'vsŽƒŸ­Gãx/mæu #)Ê\rrQO·6ÉWL Ú¹‡µqv;[-Kd0¬Ž—t\"ø?Î½rw2Ç¼²œÃ…|ò—È³ÚYÝœõ5ëšž í§ÛCæFDgmØ\0c\'5ÅŒŒïŽ¬<£+ß¡±\rÔ1XæS <)<[Ò	r¬€Hs˜ÉÈü+’–àÞGÜ-lLR1ç×¿åÚµ\"œªù¨Î±Æ0lÖj”éüÒV—Är¾:ð%ì·BûG‰Ú›l£gkxJ[mÂío\"í¾¸÷ŒÇ\'éí]æ©Gq‡UÏ(ÙÈõâ±uÑÄ%×Rx+Ïµk*í®YèsÂ›‹<álË0—hm­»c†¯iâöÓš8d´€ù~EÇt·Zu÷Ù§ÿ\0S#aeõ”Ó,íòm~XðGÝ9éZÆñÕ\Z9\'º=COÔ ¿í6²Œ¯Lq]-„‘ÞÆÑnPãåe<f¼WJ½“NÕQ»C¿–aót½J½š‰žö7f%Fã´¸ÌÕË÷‹mLíËð±u[I4»â7PùUÍ:ú7ŒC6wà°ÁÊ‘ý*ÕÚÁi3rç¡ªVºh²¾†PÌF\n–\nEq*R„›ŽÆÜñœye¹™â-T\\¾Ÿ4³FÇ\"5l?­y6¬³¿ˆ\nLŽ’.l‹ŒžëÓÇcÓ|Húuô Ú—Û¼œì>¿Jê¯4ý7Tò¥¹¶†à(’Ïäkª’Q•ÚÜç©&â’g·WZl0 _2O)YB£×¨ø–iuâ÷É¶)Wœ-zµö“i*£Ú~îÍßÂ=+”Ö¼/£ÎÖ×œ”l…-œŽ¸5tâ©7re\'$¹w,xrÎþÓÖY¹Ý^Õ¾\"¶Õ˜ÛÏµ‘H*¥ñ“\\ì÷1ÅÑÀLr}*¥^­î¡r®Â!Ã)ÆH+*+šwf³Ñï­ÌÒD¢(Aâ6Ç=…3FÖ…»Z!”âg\në#äŒôübéúº^ÛÃû”Bˆº¨>µÒßép\\I”Û0ù‘‡BsÇå]r‚œlc~Vuk\ZO0cÌ±ð9ê=)%„«òöïTV´òGŸ0Žt|÷5¤—>zì-ƒŽ­cN££%=êRöŠéÙic’KyÂìŽ:8©Ùj\"µé))+£†JÎÌÜ°ñ7D½_o1¨®Š)£ž0ñ8e=\nœ×Ÿ©¬ïg²›|.Gªö5J]Ü{EdéúÔ7˜I?w/èkT\Z«eÜß;åS*¿Î©NaJfßsD„ž€)Û«Ž¶2ÑjÍ#I½À\nBÝi7|§úSY·.î•åÖ¯:ŠÍ›Æ	.7Pd+ô¨LÁp¸ç±¡UåažÓÖ¼æúGVoËmËíÚ[×õ©\n–Z‡î¯©Cí\\“]ñ  ö1k[¡ví¨¥œ\"ÔßíùW“è*ºÃ=ÇÌÃéšà­ˆIòÒÕ›FŸYóÌ’uïN·wó#8<t©a±	÷Û5o1¢ú\nXjsµêèœvŠeéùñLkxßýg\'ëLšñ§ëQ¯™?N©ïZÊpo‘+²ZÕè=¼„]•^RIH#œõ!¶~û“OŒÁLg×9¬¾\'j–H´ÒÛR\'Ú½ýóW’]Ê*‘³}ÜŸP1@MŸÂkH©AÙ;¡K–E£­†þU@Jÿ\0hdL=«EZ2!Á¡ñ¢\'ÜJ›£ çš7Šz¶êÞ›KÝd»­L›ivLÑÇŠ¾§ZÍÔÕ­oaÐðqW­Û|{úädŠå Ú›¤úâ§Ü­¨ hwS4¹FÒž•,¸u•p+O¿QxbÝƒ’?\Zé”ù©ÿ\0…Š1èuƒ/U£˜2†ýjpûš³æOTg$Ó<\'âß…¿³u¯í›X±oty´p­ëø×¥jÒi¬Y7ílØ#ÔŠúKÅ:LzÎƒug\"ƒæFÁsÎc_1IjöòKo7XØ«gŽEz”jsÆÒèiítz}—ˆ-o~A1mànY#ÚHü+V¦ŠëÎµu1`à±Î=kÇ-uôë€ÑÊ@yü+±Ó|v`hâ6Ø@éÐTÏÛcªºf¬×·ð…þË†ëgÜ)î+R²Ò\'Òå]WL’‡ùc¸1í\n{r:\nèm¼Wi;|î°H:`÷÷«÷‰-›ü¢dfådcÖ¥KØ«ÜR6–<^ÇÂÚ£]~ú#ni¤g ú×m1’âêF’\0fSëŒSõ‰þd^U?€\0¨-u/Üù1æFg$E\Zr~•qÄ{ev¢©« Ö®®l´ÕxÜ¬ÈÅ†`q‚?\ZMÅ3ËgæÜ·žJìË‘þÂº?Aûl%õxšÜg\"ÚL‡aïè*Ì~Ñ|»”´Ýo,§1mo’3øÐ¥[¨;ó]l]ð^¡§^êÓZÛyrª*ËèNO5ÏêúÐµñTö„ˆe`1ƒÜ}*_iZ¿†|A<76ÆH§@¢X†õãŸÂ¹?Ì[Å,·Œ¨Æ+7gf\'+>cs]·†êÏr®NGœûŠä&º½ÒÉš\'UîxÉõ®¢ÇP{;15ÔE­²9¸¦xÏÐTz¹‚õ¢IËò9!iS~Í{ÅKÞÑ¸ºÿ\0Uq»s2ÑûWDº—Ú4ÔûS’ƒîæ¶+/TðÅÕ‚ùÚ{<ö…w^Yg[ÝÂ\0’zWKIë(NÎÌõý*öûx¾Ë1r1—a–?ZÒÜ¾ô2ýÓÊ¢¼£LºžÊò?/ä’.r¤üßã]Öƒ«¶¥nŒ,œ£îrk\Z³¼-ÔÑA^ëcTømÿ\0oÔ´ešçvåùp§?ÃøVe®­ªøqb·‚åžÿ\0©—æÀö=«Ò¡‘@ŽêIù°N+TÒà–âFH•‘ðYu>Çµ(Ôsä.Uds7ºn–˜Ûœ¶HçüŠ|w7Ú²¦-2äV1Ó5…â	ÞhlLO²ÊªÌÃ)8ãÖ½?K¶´Òlvüäí,Ä®3Š×‘»\\‰;lyw‹e“KÓÍ³ü“>ÉÇ~jO‡7:¤Ò¤òŸìè˜4‘ÿ\0}»\n¯s7ü$¾6vt\rmm¹™Xp}ùô®³ÁQ&áxDk‡–Gf#¹ÜGô­*Z•-73¤Üê3®³ÐôK9ÚéÖë.r\\.~µ~k3,2´\n®ÛHÁ8ÆxþµÌÝjÆ+õ¸ç’¼â´´ßyQíÝ•aÐŽ•Åg$ùdu<3”y¢r—Ú5ÓÍ\r »,Èv\"lã<ä÷¯NXÛÄ¨àÈˆAëŒ\n­Ý­ú†;Xö8ÆÓQ22Ì‘FØþ#ƒŽk©Î3ßTsÉKE³EÄBìwðãÖ”¡ïTeÔ&óŒRE‚d*9rÚé.-Æsœu4k{9ò_C:´\\ãÍÔk-3oÍVŠ|£Þ¢ÇÒ½58¾§žã.ÃàZÝ±Ô$‰BÉ—O~¢±\"Ã78àŒô­«D4]‘Òš\\~In7á}ªmçŽ™ô¯™ža:»=AQQ\'V+ÓÐÐíµjˆO¶jQm¹~vÿ\0ëVQ“m¤‚Éu/®Oj„ý¦Y6¢mOï7j´\"H—ŽÞ¼Ó”ïéÚ“6Ø|ÖÕ$IðîsÕHÖ—`Ý·w&åüçMAÄM¡\Z`¿Ã“Q4rOþÈ©‹ÃÖ’)<Üá°Å’“³`›JéŠÖ¾fÁ>´ç\"ùF*­â\\\'ÌŸ8ÿ\0gµe½Ã¯ÊùZã«ŠT}ØÆÆÐ¥í5lÔ’÷wCUëwzÎyêÕ„á¼×Ï–¿­p}b­yòÄéö1§²õ¹·¿ÜížõvWGµ*6ºD]»1Úª\\]néøW¡)B…;EëÜå´ªJïa’Ï·­>Ö1;níÖª*›‰6_›é[°[¬Q€+›MÖ©Ìö4«%Ùn5FÖúSn&ùN*VsßéP°Ýã­zs÷W*9“MÝ•mŽû¥¹æ®ÜÙnù¡m¦³æŽH<jqÔŽõzÒô?ÊzûÖyÂî•Eó4¨¥ñÄ¨·$ò¦ùXtÏ«\"`˜eû¦¬\\ÚCy×ö>•˜-žß÷2—øÖ´•:”–«£e	¯2íÔIyjÑ	)ôªö‹5ªˆ¦\00î)3Èõ©Ã¤ê2yƒJ2N|ÏFqº\rž/Ýï÷ÍqÞ&µ{+…Ô`û…†àCÿ\0×®Î]þ^+?Q±þÒÓf¶ †eùN;Ž•¬ÚoB í«*é:ˆ¼³ŽQüC‘èkZ9G—œ×žè’\\é·R[Ü£\"’v†õ®¶½Ê>Sþ5Ë\ZŠ/•5(ÝsM<~_Îê¤ôÜq^ñ@¹OKs§Zíç]ì#uþ•è Y ¸“Q~Ó(Ïb6ÁÀô5Ê\\ê42ß`áˆEÝ’‹Ôùb½|,“W‹¹’£mYÄiÞÔu}—¶ÒÕ¿å¬Ü`}:×SgáHWOf¶wyU‚î˜Ž@#8àcƒšÖÑ&cµi·:â0Oÿ\0ëÖŽæ%–Ù×l“s§ùÛ\Zšê–š.«áãk7›h—2\n±•²£g5­¦ê—)j–&(RDL—-¹ñëŠÑ‡TšÞêHní§ŽD9’23×øî=k×^Ù¯¾ÓmÓ¡ÃgÔCNtã1)¸‘Ï©’ÞÜË½\"m¬²1ØŠÝðž¯ö}Iå‚ß™	äTx¬-bÆâÌ¥ÓNnc;PÆx#w\0Îµô9­tía¥¶Â78Ã{b²«NÑÑJ|ÏSÑ ÕSVŽ62’êHU`}{ÓÉ¶ƒòÂœüÏ’}ëƒº¹In‡‘pQ$ ü¼\0:‘úÖÄ1ÙA2íFu;Žã’Æ¹Ôeci$µFäþ(´I„BT“+Œ°Æ?*ã|y%¥ì\"òDXY]$^N3Êý*þ´ú~£å®Õ÷|Ò* zã|N“Xiû#u’)ÙÉ¥575vgS•E¤ÆêÞ_•JäÆJÍÑ­]÷Å´±ˆníì*–•©ì¹0!SÛ\"¤Ìëö†AVÏ¡§/»fDe©Ýi7höûÙ™WkFxÀÊ°5¿Úê3o³_³Üd’¨¹}Åa__ÍÖ×6Ò””žzƒèkn?ÛÜ4Aât¹; Ècøt¬ß4uCåMœÝÅ–«¤jÃ\"ogh=z}+Ñ4Kl­ùR®ÇÍ1ÎÓŽMs—:ýŒ·‹‰Â‘ÊšÅÔ¼Ow,f‡|0·‰ùµ½M°/ujÎú+§¿šK„B#r\ndçV¢·“sï•·1Ü£9¬Ä[C¶ù²J“×8ç§á]Ô(»&3—äUÎïPkBíÄ©JÍî±§\rFH\"žÒCåL¬²ÎÞF•vW“F¶r)c’»UÀÎÂ¹Íc\\º·¼^èeÛû Ù*}~µÅëž1Ö–Iá–#hž\në„%ð²\'Ë¹gE±w¾¿KdV¸ÞÎàJçŠÙ°?b±–ÞxZF.œy<W?ðÊ3>±u+³dEœîëÍw:Æ¥‹smp$+„˜(=ø­*SçVftÜa.ddO%³G<¨±Ì»“xÆi>Èñ.ø_g¦9ªé×š¾ƒ¨E§ê»ÚWÛ¤†RGnG¸®žMCJmZKáXQYdh;¾•ÉSß™×\ZÉ=ÑÒe‘UØ° 3ÆlÝ^Ão\næ<WÆr\nÆÔlõÂØ¼2C¼nù€õªºV¥4‚ÚgÚ›¶á†éXÇÜ\\­Yý÷ÌŽŽæÆ{Ë=ñº!U$1|àwªV2ÈŠ6‘0[­\\\'È[Ÿ-ÇÌ„`ñêj¶\"’<ç*Cf´©Ms«ncµÌm´ó*ítçÔv¬]{\\M\'M–áðdÆÔ^ìOAXº¯í`¾–ÜJ>C´œä\ZÁKëfòIfc<À±3cÚ­ÑjZ0ƒæWhÞð=Î¡=Ô²Épd7HÆ=1^‡ßÃùW”hz‘®l²Y„ã\0z~kÒìß}¬o×ŠìÂÍÝÅœØêqV”K:xšâdCïõ§&]Øô¥´dK8”´×ÛýZ’Iëé_;NŒ ¯¹Sœ¦Ùb7\røv¥–P•EÝ#eÏ§j¯)/ß5N¤£u&0M‰-ÉfÛüªÅ³†Ý“øVs©^ÿ\0…5®6t=z×Ö%IóLèt¹•‘®÷h1ÅS—P-œVkÜnþ*«,áWïV5s	Ëá4§…]KÒ]úµO¦]†™“wÞW<×4°]ùWË»[$zÖªÔE6tÏœ\Z;¢~_J§{aÔgødÇ*h¦I#×##,yeçŠ÷šUžÌñÓ”ÑËÁ¦ÉöÏ*ã…ç=kl¬j«c€z\nMV.*õ\rÉª6R–¼UÏQ\\*0ÃËÙÛs²Ru£Ï}f‰vš©$óéÜÕ¡–«H>lv5Ù:QkTsBL,­#·„7Ry,{Õ½Û~•\\M¶ôªÓÝ¼VŠP¥ ä”å©<Ó|ÁGz›;qÚ²#”´ËŸïV«Ê+ÍÕ¼Š©O–È\\ÿ\0\nÂ½Úß2£c#5·wtÇÖ¹ÍzPš’™ŒÔ×667¥}šf¸EÍS”×±Ô·|®ÜÖ£ywí8®.ý\rnÙ_nP¥ºRÁcÿ\0åÕR±8^WÍYàcœÄOÊÞ•^	VùOzÓm“ÆTŒzÊ›÷\r°óU>•Óˆ…µéÜÎ“oF^·o7-»\"­ªüµ‘krM»‡<Ö¤rnÅU	Fk]ÌªÁÅ‘ßiö÷öû&ˆ6:69¹[¨äÓ®\'$U½EvŸv²uë´Y™GúÈ²Àÿ\0:ué{Hó-ÑxjÎå{3Š»¼uÊúú×)%¹ºÝe«›ˆfnp‡ù}k§»|eÇ¦k“ºš;=J9fyv»GÔëYàcÉRÏ©èÉÞ:-ôéâ·¶‹Í\"$8,#ÅkOlë\nK2Æ²¹FòÎxëŒñëTW\\µHY‘—\0\r²—ïõ¬ëa·£˜]¼W³r¦Œšm¦Êú–ºn#ä™RöÙ¾I\\c)ÓV«\'Û[h•‡ÊÍùJ‘žÕ5ìir\\Ým	·åŒŸ¿žÕGFÓîïn-1ÖvÆã·ªzç]¤ívsVŠ¾„z^‘ý4W—1y»×th½žç×fîY4èÙ\nfFÞQÎ:âº½3Â÷ÖK]DDŠ˜\0¶A&¹M}.të©¢»lÉŒÛž˜©sç‘Q\\Ð©²óÜŸç`ñ‚kvé\"±–YV21“’µs\Ztlh¥vÆÏ“(9>‚¶ÂÛ\"«=È}œàdöÅhâ®De+]ÜjÓ¼o±Û/÷ƒqšÉ»¼º¿†N¯XÜzàÕ­Zú¨ÊÃÛ‰ÈÍbÚÉû’~¢ˆA-H«Rúag‹Oe}?NÔŒWfrðÇ¦=é·BËÐT_ûÂ­$ïs6Ümc[ZÔ‚ùPÇ†Û–v¯¸ô©íçyxˆÙ@.ƒ÷®räÛ›œú×Aák[­e›N·R¸’\\}Õõ4T‚Œ.‡N£”ùdZÐ|)¨ë:°KT“ËVËÊçäAõïô¯V‹á¦•-¾Ë¶’áÏ!·mÇÓ£¡ÙG£XÇm+Âªb>fnäŸ­nÁ;´‹»íëšóêWr’:£Xèq>Ò“­jž™ß\nxú”éÇõ­ÍjÊK;±Éu\\ü«“êk[Q°ód‡P…\0º€²ç¹ŒõÈqTõ^öÍü–%Š°9=IÙù“+ËVyíâÍâ;6²ƒìÎŠKC3>Ç½Çl×˜ê¢h.%·ºVBJõÈ?ýjôc=²L5o1›÷„1PaÁëÖ¹ÛùìoB²ì;[-¿ŸL×¡NÝNz×¶ƒüâÑ$¹•ÔêsŽsšö»\rf×R³‡;Tü¼‘žø¯œtö>pSÌ*C0®ó@ñV£Äq[¬#…ÜÊxöâ”ïh]&¥\rw:ßè÷7ºIò0Ó@Þjc‚G|zð®KIñS5Åª¼Ï;ykÅpŠÊH÷ëù×§ÃuçÂ|æL÷R½±\\†¡ðö­RK›K•µ·˜e¢Xóµ½WÒ‡d¼Å¦Iené­I5¥è·„ž&“yG?Ò¶¯í©nû¸.Ó%þW?\nÆ‹ÃWÚB«[J·@œ7ËµˆïŸ^*-Qµ.1«.õùFr2;ŸZå©efŽˆ½w5\"7VR=´Î¯•2þÛ½DÏo4V,$¹ŒxFÇ9úVN“©Io$‰}”vS\"Èã¨ÍR’FÍn^Çæˆ1f=˜\ZÂ0’—¼i.Y#øvk¨n®ÿ\0´Æ7²²àýJ¡=Î—t“C(m„2È¼ƒï]5ŠŠ_/ö¼Šâ2zcxþ£jÿ\0GÒ.´yn,o€†@¥P¶DDòG?\Zï„$õ9%5b\rîž»óc\"BNÅûÃëõ5ë::ÿ\0Ä¶5<‘œýMy\'‚mgmbåp´)…Ï# ŒW©è7\"[‹ÛrÃÌˆ©*;8¥J.5.º‹ù©z4)¬I–ÀêÇ¥LeùvŽ\n­æ\"(@ŸSR«…`Ý«æÕ{»/Àz•æ™Óïäf¨Éw³-»5µ¾9WiPG|óXZ¦žñ.ørñ“–’+›ªYJçE	EË–Z‹—ž@£¡êkU´Ô–=ÜƒíYš4?h›\'¢ô®ŸnÕ¥„ êAÎ¦£ÅTä—,NSP±žß”ù—¾JÃy›£q^ƒ*îZåµ5|á(àgæùÖuðÑ§ïGc«ŠR÷f†iZož¾t‹”ì\rl¤VÉò˜—#Ú.XþÇå#r£¥RÔnÕ$\'½W4hÓŒÒ½Ìç)Õªât¨»sÀì*Á;Z¹ÿ\0Þ™ZH]‰\'æ\\ö®ƒüzô(TU!Ì>¼:Ž,IÓÍ„§÷ÌÙK·Pÿ\0ÀH5Óæ¸­fc§êÒõÃ6å>ÕÏ»å©†ø(ó¹SîŽ½%¿%A3moN*®›/›\n±nµzU\rŒ×D$êSLÅÇÙÊÌ¦Äù…TºMµnôˆ”6î¢±&¼ÚÝk›5NÉ” æ´,Çx$ÕÝ0vä·µo+À{W ZÉ¥wq#‡ß‚¹®°MŒÖµÃ?uÉ21P´¹WBÎIÎk›ñŸ=ÄËqDÚÃ¸æºPÿ\0ÅíQ•n¤dVõiÆ¢³9èUt§Ì=ŠæH¤ò¤ü\rjÛÜuEâ,Y°¼–ÃëT,®ƒ¨õEx˜œ;ƒ=ôá^Ÿ<NÊÎð¼awsQßÑœÖMµÖÆ5^‘üØýGÖº)â]JNœ·<éQäÌÈî\nÉÏ­t\Z}Æÿ\0âÎ+™ž?˜°í[\Z#ïÏ®k$œjÙu5ÅA:|ÇL´¬¡Ô«rÁÄ#ñ§“_Cfxlà5;aky4\'¦r§Ø×â{-›y}@=«Ó<MnÞtS‡ån?*åïtÿ\0>3ŒŸc\\Šôç§CÕ§.h¦Ïkão†fe=óÎjh<EokfU7M\'cÐéZþ&Ð‚Æ_Ê<{tªÞ\Zðdwl/µ+iÖ8÷`ÈÂ½š5)NìŠžÓhìr·Sê\Z´Í6Ùû ŒW£ü2ô>íçM²O2¯¸«¯kmfÂhV1ÙUAÀ©\"·Ž(äKO’CózŠªÕ9àà•ŒáEÆJmÜî\"äÀ#†“T¼AcmtÉ,ÐÆü nžÕ£khÒl¹p%AËþõÐ\\æö×zmo,îm¼ñ^zçI®¦íFþGú~ñ¼BÊƒû¯Ö>¥á}\"_øò»ž>o Vo‹µ[­\'ÄÚSw)#ÜV}–³\rÇËrí„ò¦»a\ZÊ<ÏSJ›—*e{Í.}:7Û¶Eéæ\'¥dÛªWÞ½Ñ|øJž\"9 g5…¬ø~KVûM¤LÑ1ýâ¯$P+jU¹®™…JMY£	˜ªíþ÷jkžž½1éIóÏqµ—c…QÖ»=#ÃñÙÆ’ÝD“ÎØ%O*žßZ¹Ô5vLa)³Ã~¾ñ]÷“l¾\\)ƒ,Ì>TÔûWµXxSNðæŽ¶ÚQ÷äq†úŸJÑÒm¡°Òb‰)eûWüª¶Ü»ä?ÊØ<šç©YJ6fÔèÚFa»1I´ñ“ÆAúUû-B?¶Erevá\0Î=Ï¥p7ú‰kÏ³ÚÊÑÝ[¨‚vž9nqDùÎ1ŸJóÔYÚôZœëÉèOjço\'“FÕ¤ûR2é×º	G;ýåoNzVŒ²ínî)­:^iòÛL‘8*Àö?ýjÚ3[3K{Ç9­x.Òñ¤¾´¸),§.£…oqïX/¤Æ–¿gxK\"}àrF>†½×IIÐÄFãÎ™NíÒ6H‚¸ÝV×GºÔ¥ûMó[\\È@%+øâºã\'t›ÔÎ<­µk£›mAxÏ™h!Þ¿/”vG­gÉ¦ZZ²¬Éà­/-¨­uáMFâ7û=öè6“(ß ŠäeÓîô=P-Ë‰bp6Ë!ež‡•µ¤&â’;´{…‹ì7¨K.@v$öü‡øÓíî5[y\nOäÔãqn}ë>âyÞ·½Ñ˜„SåÏjw`u¯547,‘ÛC¤ý¢2æRÅã¾jš¸¯m\rµwu—ì‰<Ò¿,bU žýOZ¥â=FK]–êßnò¢ÿ\0uÇÿ\0\\UY¢tU[Ø~Ä#pVX×k\09e8?•rþ\"×£ÖuaoÙŠªc$9íøÓZ\"^¥»_3RòÚÑÕ|‘‚“±,£¾=úõÒXÝ:Ãj²[²–T°Æ1Æ>•ç–\\¦± 4.sg‚­w\r¯®¼›¥hZ@B¾0Àö>õÏ=ìÍbôº1üj¨ù@„,E‹°¯nÝºñ\\kI#Ç$ÐD<¸Æ#ÊƒŽäWuqªZYý¢c1’[˜v´F<#s‚yéøVÍ‚X4‘Z´ÍêmF’=Änäçµ\'Ì¬eUr»š^\Z¼{«ˆ‘åû<lÛŠ¨ÂŒqÏ·õ5Þè—òYêÒDDóNæeÜ\0ùkÈ´»]SDÕ&XK´{vª.ÿ\0E¯VðÍ¬wS@òC*ÍùÙ; \'¨«å{E“)\'É¯žå\rózzÔ‰!éÛÒ´LvÏòì_ËXÆÝ85òo	;óEÝ—ícÕÈtnûzãÒ­[É»å4ï³H¿/;Ò,a3Ôzfª4g	\\‡(´5m£·‘Þ5\01É†•ï6ü¼Rú÷¬ËØš&ßÉSúTâ1§ÓZ)¿xÓûB?R*½ÌIq)Æ=k(NVö³·n9=ë’8øÍZhÝaÜ]âGöi­´r«c¨éšÄžàËpsëÎ*üÉ5ÄŒ±¹Íb˜ÞÙ\'Þ}ë6á%x«#ÕÃCVÛÔÔÓï­ôNzƒ~+¹\ræF1Þ¼ÄÉµ«Ðô‹qc¯u®ÌšniG–ÓE¥5s>2°2ÇmrŠNÖ(øô=+«ãuCsžÖHœu^+¶¥;ÁÄóhÕtê)£\'FR–±©ì½MkðËÍeéÃnWºœV #mNÞ’L¼C¼Û25¦ò¡\rÛ¥rªÏ+?¯Q]V½›bP09×\') 5Áþ!êà,éyšº7ÌÄòq[ö6Ö¬Í8mÈÇ\rÏ<UÇË|»ºkl>”“0¯ïTeóq²1éJ	•Cg‘ÅeÍ&ØÕ}yÎkJÅÃBsõªw*ÞÌå>XÝõÛV¿Òåˆ¶Ü¨÷¯<†F‰·wkJõ9‘ö“Ž1^Yª£Ùk—QIÀi/`Aæ¯Nç~YSGfÚ]êuhÁ)þ÷ë›³¸ØÛpyZ×Gô5ãÎ.¹×V(µqµ¾aW47ÛpW×šËiŽÚ—LºjžÌvšºRµE#\n°n“Gp£¿~Ô úÓü¢—5ïÞÇb†±n.,Ê)äão×µrÍ‘IåN»qÏ¥u×êÏ·\"¹/Ý¢i*é5¤\n>l}EDÒ”Îº7µŽjåíuO1“áä)Ôú\nªòIö}±¢´eðU[Ó4¡âŽ(— g‘ëëY3	•¶ZJRRØpp<÷®ˆ(­:Ê6WEåÎÖ–h˜HUB³ž§­eËqäMÄ \0Hž¿[¶[”Qæ*ˆ‹œ»r}y¬Ûèd{­´€Û<Ÿç]0’nÆm;fn­¼¹@;rÙäozë¼x|››cÈ·s´±ÎC`ãð®J$¹žD[MŠè¬ë‘‘ÇðŸJé<ì7Wr|’Mp~R1¸Ó¹ËVêåo‰>\rM[OmOOˆ›ËUÊªsæGÔƒî;W‰ÆLš#òœ2‘‚>µõè‘ôÛð’Ÿ,Û¶Ñ€6ã}kÅ-tÑâ;eu*\rVÝsÀ»AØŸïSÚ¶D£©ËìÛwC´üE[üÈƒœgµoÜÜ}—M\r×!ƒ1Æ0UOì‹7lS[<d`)=úÕé„Í¥ßZ\"+Lê6¦~÷Ò¼Æ›™éAÅE#{»O´”³X¤\'? éQÌ¬©\r¹[\'9êeÐµ]¡…“œõ\0æ¦Ó<\'ª\\\\}¦xM¼hxVá˜}*Ô\"õ–¢©/å=>Ï>ÆÚdÆ0FFqíUf“o¹\'ž•ZÂÖöÞ×ÉŸn:¨Sœ\n-þnWwL‚k–r»œ\"yÆ³ÖZÔ÷l›˜Ï\\ãóÍu¾óšÆêâEož@ªvõ\0s[—Ù6?ÑáÃvÐÕ´¾ÙA·Ë\\€ª1ŠÑÎ/Ý9>„‚	\'m«ÆF:TW1A¦Ç¹æ;ÉÝ‚ ¬Ëß¼ºÃ…\0rÃ¨®F^K¨þÑ$®ÜlñMEµ ýMÍsÄÐYYÈèæRq@y#úW•ßjRjWM}tÇsŸ‘Tô…ljsý¢fì®¤ã¯ç\\âçíÁÙäp+·F1NOVsV›½¢]²×õ{&c½c^‡éí^‰¥øÊ×W³‹O¹¶…¼ÏÝ7™íß•y\\ÅGË}¢¶º™÷lPtÒºœz£5SìÈôD{m.éÞ\rfu\\E8aŒðAô¤.G{-òbÅ¥<õ®)fùv»“Ï,{Óåqä…3ò¨ì(Q}X{EÑ\Z:·Šoµ–i¥+÷Hp¤÷5¬ZÙÃ¾E–B¿‹ñéYÙsÜh2Ýˆœ”rÜ0:ÖfFáˆªöjks\'UÁêŽÖ}e§›í0yqµJŽH÷5n+›ÙU.Ì2È#NíµÄÁtìÛR¹ÊŽµÓi·PCPË2]Í´ðÊk\Z”ùufôjóè‹ž5œA¢éñHÈn¤vu\nÙ)ÁÚ\\Òø†ùV0÷\rò(ô÷«~)¶™5Xœ·Ïà[¿?Î²Ä	nÌ²E–À+Î?\ZÚ\"1”ææí±¿áípÛêÉqvÙ\0Î2z¿Zõ=+Ä‰,Í,$“E\Z®Å|kÏ“­¤AíœGh»dÛÁ*?ˆ}3Í.¥Z®ŠuD[…) êßqsÃ×½%e±£“–’>‰óv·Þ¥:€VõúU+¹wr1õê¬m»åÀµñÞÚJ\\±:ÕÕÙ» ¬½Àô«+wõ¬	dH”cŒj8îÞäÆº¾¹:z37†RØéq¿#ƒPÜ[‡Œ©¬¨¯]ˆšµöïâ¡â(ÔVhÍÑœ†5Ô2[ÈQÁÝ\'½@æ®§ÍŽu+\"†‡š‡û*Æ_›aSþËb¼ùåÜÎôŸÞuG¢­4dÙ¯SëÅfjÖæy¨¹ÏÞ®¡t„I7G3cÑ¹§ÜifXøÆkXàª*v{ŽÈÂ§2g™ÞÌ î7çÖø*ô½©·fû¤íþu‘¯ø^áØË\n8‘G †ªÞ¸{}CÊ|©VÃ#qƒE5È“Ù¦zx‡O…|¯cÓ\ZÝ×ŠŒÏµGÍøT/vü+²u¡n|ÚƒeuQó/@ÜŠ½øÕÃÈ­øf® ùk<$•jtl£ª&ûsžEr¾ì|ßýzíîãómäOUÅp(³*wÝ‚\rsãbÜ“=<¹Þ/Èèl‡îÏb«‘O2ù{R`Åú~u¤ù{†ÇÌ*Ô”`¢+sI°».:p:Š·¦\\íÆöÈ<W=us³îqVôùƒ¶:÷úWšå%?hªPýÑÜ\'Ílb¹ÍsJ¶¿R²D­Ÿºýük^ÎO”g‘ŽÜÒ_Æ\ZÞFAÎ3^ÝYóÒçZ4xô›§SCŒƒÂ;c!oG*vôúúÑ=ÎœÁ\'PA:ò¦·a•ËàzUû»8õ=¡~ãƒž‡±®*qX˜>ç¢ñU!%Ìô8‰f\nµY/SÝ€§9ÍRÔžâÊêKiÐ†CŒã¨õªO¾xN3œt¨ŽÛžŒbš¿CØ-fóíct=T\ZµŸþ½s¿7ZL^aË ØÞ¹Ò#ï^”Õž­O’m\\\rÑ²ûWšøÚ7ŸM+nšóç+Ò.	U>õåÞ&ºÙy2z­L›RMe{£’ÓüK4ê~ÔØvnFÞ‡°­SªÁeg%ÄÙTdã9ô®KQç¸ó ^G,ŒŠ¯¨]oÐÞPÒ_kŒ\nõ£J3i­\'7M4ÎïNÔcÕ¬ZPŒŠXéM’\\y“\rªBeU?sYÞÞÚ-ºy[U#\nÌ¼ïnNZ‘5·šD’fòÛåýÚýáÜgÚ©A)¸æÜ.3V3ZéæXåÄŠß0Cµ¹þuÕiO%­²»(}£psŽk‹ÔÌ×ºÕ¿Þ ä÷ž\në e|)] óJ\'e±íjjk\ZÏÙt­é‚êàó\\Œ‘ÚÜG¨|¤Fæ6Èù×<nã·jÑñmæøà³FÚ>ûè:\näïd…­Ç	Á0Ä£PO4ádïÔŸ„õ5XÚÄÛ­•# }+*ÁjÑ´(‡IÎk‘ÐõŸ6ßì÷NFvŒœf¶ã˜3}áŒd}+’ªÜY¼mtu±kê±î0Œ÷©Äöª§ÎŠEÇ^kóaòKo;šå5­~5aolâIs‚Àð(aå\'¡3”=FÓ_Óï<Å‚â9`)ä}ERÕuøìíÌ¡Nqˆ×$šóï7ÙY¦9!²	Sƒžß­v¶Ò‹¨DE\"!;q˜õ§R’‹·BãÚçžë5æ’+E6‘‘‚Ì2ç×žÕÙøBü¯ƒí¦‘ŒŒw’]³üU­øXN²¹·({ü¸Á¬»9ît‹°–& Åž0Zënœ©Ú*ÌÁB¤gvîýNü¶rÃ<t®bÊïÊó­÷à) {ŠŠêü¶rÙþ•«ö‚Å¾ðÁ÷§N›KRgS[\ZBcæn\rÜVDÓ¦éq8^\r·åè3šÉÔ-Ú+(û²sô>•ÑJÍœõ[H wn»N{š°‰Õ¸ùNxªk(\\n\\cùÕ´¼»xôÉíZ4îDeæF\'3å\\óœc5\'›¹°ûÆå˜v‚¬Øé÷7—gÓáÝ$£,ÇœzóÚ¶î<.SK–X!›u¹ù¥ÛÃz’)JqŽ…Â’r]\npë[mdˆàÅ$^XTP6úç×>µÌIÜqëVŒSªÊ¬¤lùˆ#Uõª‚¶ÄÔ|Ö#’Ü§ÎŸ2úúV–‰ª=•Ò.òOJžÂ8×s?Îåi5ÊŒ\\Û:ye€dÝÈÏqíTÚš³1‡4%ttÞ3Ùu£Ø?Êe…Îd_CþGå\\­Íô>p–5#ä‡ç¥tRè:¦£¡Â–³[\\Êà2Fó:ñ[š/ÂIï#Yµ‹Õ·–†¹‡±=c£IRr|¨¯á¿Z¾“6#en ò†HXçæ?\\þ•£ [ZÚÇ.z†Úå•þh›vsÐã¸ïÅl?Â?\rmÛ\rÅò0|Kž~˜ª×?õ[?*];VK“—Iµ€ÿ\0z…V)èÇfõ’;;-Cý;ÊIŠ^3ŸºkZM9Õ‹[¸#u«’™¿ˆ7~½+CÕL¿¹˜þñGÊIûÕñT¬Õ™ìâi8®xÉ\rÊýø›ê9¦}Õ\níQŒVà“rîïP\\*ò ¥\\¡Ëw{œ±ªöh¤…@jEbí„\0UiÖDäÓÝºc*~µšÄGf¬mÉÍª6ãm¹çñ©Vo_Ã—\ràû¯œjr\\Ç½tûhÙrœî‹f¸Ÿkw©–è7ËÞ±Ìå±žüTˆûrÕqÄJúle*©¶³+ýê©>—e4žw’‚OïƒUDï·¯J|W%ºÖï¤¹d®eìebÉfµ›±•“q$1WSœf¶£¹üª–¨Ñ½œŽ„pk“„§R.qzšQœ”’’*i÷O;ã¯A[è>]ÕÉi.Z`£Œšë¢ÿ\0W‘O,Mó\"±°ä–„2®å÷¯6†}þ ¹‹£$ÏÁ>õéR˜“^9ëx³Q¸¶F·,2Ç©ö®ªôÔ¢îíc§,w”£äz!,;ÆG5Q·³lEËŠ][«¨xCÇ\ržžõÑÛÙ\"|ÅA¥c\n.´U´\n•âÎGPÐeû™å;—æP£¥gh÷nWs¬º|ƒ¾+Ë,nöjsÒB=³Yâ°ñáˆìÁT•zRæ=ON—rûb®H»£?í\nÇÓ&è¾µ¶>e­0ÍT¢\Z¼yfs¶HGpÄVÕ‰Ü¿­d_)P‘{«¶m`»«“\nù+´ÎªËššfŠôhï#¿¾Nþ£Ò¸Ib)!R6•ã½bõ7Ûœõ5Äjöiq	pØœtã­vb—%OS\\WÉfIàÙp·(:îÚÄÛ¾µç›ÈÕ¥‰ø,½>•èÍóqWEÙØËÉ²[±þŽ[Ûõ¯ñÏ™Á–6#?xkÛ&ù­Û5äþ<µY¶ðyük¥®YE™a¥kœ3n·\rÓ>•[MÒ^÷ÄV¶Î¡í¦–V<§ŸËõ¦Y>íÉýÓúVöš©d¿kšÜÏæ¨T(r=Éí^?rlÒªR¹of-d1#í„|¯ð‘Ó#9Á¢d†%–Sâ™ c©§;ayD«§Î9íßë\\Þ³®·[+vW¶—ø¿ýy£W&â\nÊ:›\Z:›ËË‹í˜ùUœýk¡·ˆ¾üõô5›¤[%†—NØm ¾GBy«“\\}ŽÖKƒ(òÂ–<V–¶%ë©ÅkÚ¨mZh	¹\'±n¯·Â\"HUyÈ=XsEíÇÚ.$¸ß÷˜¶HÆ3TŒU“Éjô`—-™Í)j:ØùSy¥N$?+õÐZÌ]ylqï\\õÕÒKj!…~ç;ºUÝ6÷z…Ý†•=ë*°æ\\ÌºSÓ”¹¨9{6„¹R:œãËoÙòŽ¹æ·5‰O’\\1R:€:×:¿5mF+—C\nó>“¨ÿ\0¢›y6ýª¯è^;þ5Õi7Æ,.óŽªÙÎ+€±m³FËØŒûWA¤Þ$S²ŒÛHñë\\ØŠnNçm\ZŠÖ;é/Œñ²™K†6[<ÕY4«kø~Ï<!d+”pq‘V¬â‚ß³&@6°^1W/â‚âæ¶gYGÊÉœŒW:•™R²Ðò-oO›M¸Û\'‰ÚM`¼»[pê9®ãÆH×\'16ø˜a€Î;\ZáDcnã^–©Bìó±	ÆvF¼S	aWõû\Z|±}¢ýò}\rf[Î¶t¥k[8áO^ÃÔÔN.èÚµ#fbÏoqk\'“\"àžG|Õí:Î†;É f´µ=:k«Pâ\'ó“æQŒej-3HÔ™‘…¶7t%À­Nh]ne\nV©kÏý—&È%\r	mß/·Š.Y]o*Pç¸>ÕƒöI¢ýÌíùÝœ+Cû2(ãÍß$‹‘±F\0ükŽW{„tVc?²Äêîb/€sƒ‚WÐV)ðmêèçPÜóòÃŽJúÿ\0õ«³±?»ò­¦†sÀé†¦C¬¿Û¶êˆU&µp+DkN(ÊTT™Î[x7Q²[IuxþÔÊ#†>Nvôúw¨#Ó.®5	l¡@*ìxP=úÕ×Ìšˆu«›ÓrRØºˆöŸîž8úw­;›âix;n``±êN9&®x…ó3&™OB³´³¸Â›îc]†B1ŒõÅw	x‰o¹ØñÁÇ®/JtF“wrzóY÷Þ(5i­#`?”þõqEÎ£léqŠi3¸7÷LÅ£àÂãµO©wûH>¼Wi¯¼±³];¨QÎÆÆkf±y	šÙäòó‚zŠ=”÷4´YÖ²Ù\\.×…=°:UÒá‰ƒÁ);€<óQy‡wõÏzrÌWñí_(êNÇTbÖÌÔ´¼s„›‡RZÒGÜ¼r\rs~gÍØ5£a{¹Š¿·¡]ÞÒ1­CNhšÂ4~«Ïl•\"Y#(ù?J‰$ÿ\0ëÕ‰‰HwW£«Gœ“µÈä²M§8#©¬ë‹8QIôôâ£žöEb}ê¼·XJ¹®:•èÉÙ#ª*‹v2{¯±í=FìsÍJº”n£œg­d\\¹–=¾•HJëòÖ1œ­îžŒpÑ”uÜêâ¸Gn`ûÕ¸—¯?…q_k‘>áÅkÚjS\"ŒóýkhÕQøÑ…l¢½Ó¡\r·éTï_þ%ò¶xÆ)Þ™þ]¸¨5‹š{E€7sVêE­hR—:V °Þ)Nô®ºÞRÑ¯¯zóëä†`fû§‚}+±µ½†[q±Çª°=jpstæîì<Â‹æØÒs¹Iû§¹®~ÛÃqÏ¨MstÁƒÈYPp1ïëZñÊÒ¶Þ£ÔU°»TÚ½8¥YÝê‘çÆs£u¸°[Ga@è)]­Mß¶ªOz‰òî­§RŽºÆ2›*kÒm³oœsÚ¼jwx/7ú>íßzWˆu¶2/\\ð3\\+ÆœàŸB:×\ZÊsrèÏ¢Ëé¸RÔï´É÷,N†\0‚;×KÁ”eº×£°[X‚gF+£µtÿ\0&°ÂÏ’émsÏÆA9õqþ”¬8Ü¿Gi&Ù±©õ´a—vì\ZÏŽMÒEuËW˜týêV:GXG¸®7P&+©\"éŽA®¾ÚOÜúö®oYƒuã8Sœ\nîÅ¯kJ2F8gË&™h5ˆfO¼Ö>ÕÛÀÿ\00lŽœ×ÄÁ0nùÏÔ[N^§¸úÖy´ìÎŠë™\\ÝiƒÂßC^qãQçÙ•_Zîa}Öç\0üp¾+-äôcž{Wd§\'cšŒR‘å0(McÊ~#r2zW^­Œ‹$Ì°¹\"Æ7\\eÙ2Ëßv:ô­ÍE¡–Õ!vf‘\0Cp­zÏ[yš|-ù5m^wgò_ËC‘´sT¼;k%æ¬¬ÿ\02GûÇ$ztªW\rûÍ©Œx×Wá«O±Ø´²(Î7cÑ{ÔÖòJv9TÜä®t¢pŠˆüäóÞ±|YªG›öhÜ›¨Ï!}i·ZÙÔ´œ ]Ø\"¸\rNðÝLÓHÌÎÇ¿a\\ô(óÎï¡ujrDLªÇøÿ\0â’^è98ŒÇZÙðv˜š§Ú[fá¸Î3œ*]kIm.ê(¡\\ù¹Úé]NIIÇ©Î“’R1îà	2ù\nrÃ”^qOû<Ö²?+ã<WOa¦%P®}ç#¨ÔôøQ‚	wyÇOjN®–)Si=¬w¾’gâeÉçŒ`f¸¿»ô¯R´Ñwè7IÓib3ìkË¥ù3ŽF‘ªÃII4‰¯î»³WN¸†	Â²?ZÒ²`·BTÚ\nwnkœ¶—n;ó“VŒå±éÏH6Ë¥Q(Üí¢ñ(·„B~Æûûúš¿iâwÚÊÛTŽ:ç\"¼÷íWïw©ã¼ÙßÞ¹g‡ÓC®5â÷;³©ÁqjÉ:#o\'q+É¼ûT´Ž+Ã©ßžˆ9ÇµZKË‹‰¼«d,}}+OÈM…YÔIq äŽ¨}*èÆtÞ®æU”jì¬bYøræuÌÂ‰ã\'“ZP„³_Ü/\\.æäâ“í†XÈë‚¹éHñÄb·nRøˆŒaOàE[«ùÕ·—1NßÚŸ¦êªY× ÅV¿{iXÚA)\'%¾éô§ÃgtŒ!Ú«Ð‡Ý‘Š®Uc%V\\ÏRh%yó,ÎHQ… ô^Õ«¦ê©2¤–¶ó™Ôy%V±É)!G\\ßq9Í[šÙßÍÊwòÁÆ¡¨“KràÛÒÂ˜â¾\rTmÆÔoÇŠÕžõËX¡ÜDÃs7¢Ž¦š±éË¥Û4*²cærWžü×qáÈ!¸ŒÝ„QhH9è+–¤“š²: Ü`ÆKöm¬~C„®•Á#×ŸZäõÝtÙ·”uËc\0žæºêÐi¶·.ªÓJÂ+xúg–¯!2=Õà–I~içsÏZºxxÉó=ŽyÕ{-ÎïÁzŠ_ÉwnòíÀç’;ÖF²†-zí$`xXvêr+²Ñ|\'¥i2%ô|Å”|ÎüõéYÞ9Óôù-F¡k½®â#ÍÚ0¥j!*n£äÙšJQN[£oc9BK\0¨zƒZÚˆR6ó+•Ý=>ž•ÈE}ç®ÂûXÁç5%œ¢ÞÕÜ°2»c>•¼ ìL*«ŸK=Œ>O•å|€\0+ÿ\0Nžß/\Z’½q]h>îÑþ4Ù@eé‘ü«ç\'„ŒãÌ™¥*ó¦Î\0Üê¤J>ØêÁ£Sy­íGNFËÆ\0cÍPÒ­R]KŒÔ¾#¥p{O•£ÔhºnE‹;ë·m¦\"F2Y¸À­¨ïDñù[ÆqƒTnä}ßw­f¾[=F}\r¿±“ŒNwIUÖÖ.Ï	VúŸ¼gÜÜF¬gŽµ^gº\\æW#×5ùÙÁù½ÏZÉ¨½Q×N—*¼™1;–«È¹©ÌRE•*F=i†¥hÍâíª(ûÀ§Öµ û¢¨y\"[…b¼ZQ®Ü/O­:­4‚´ÓFµš£éÖ³u»k‹Ëv†Þ\"ò7¹­[$–1ò¶!´ò¿‡5Û‡ÃÊq‹è\"uý”î·9+]H£®0dÇ tµí¬‚ô+m¢ü?¥B\'Í[Kï^úÏ*‹Q-c)–¬»íù½*”·ˆŸ(ªr]êÆº•XÒ,NeJSwd÷75‹q?ï	íš/µíãidpFs\\´zœÚ•×X‰àzŠó±•]z#ÕÂá®hjð=æ1Ÿ-FGÖ¹‰•¢+õõ®øÅºÄm^q\\~­o±dÝ÷…8G’Ë£;0õ~Á½á¹U¬Õ¦ìgÒºAï~oÒ¸Ÿ\\†DÂÙ5×C#ü¿7NÝqR¬¥(5ÔâÅBÓ,êñyº<¿ôÏ\rùrk*,yhÃØ5¸Ø{WGä:}ë›´“}¿ºœSÄE;3žƒ|­&žëå•çÚ³µèö¬oÑw`÷ÅI¦É¹¹í×Ú¥×¡óô{”ÚGÈJqÏ­uÐj­S\'îÕ8Fñ8nEkéÞ}ºÊ!”cùW™Ýj3Î»zzýk«ðÃ6›\Zn?!ÛQRƒ¥~§|â¹lwÐÜ/`Æ;×1â¸·BÙäm&µí¤Û Ëwä{Õ?Åö‹=É×kJO™jq[–Z+x§íQªàüã\'Ú¦»%¸•‚°#‚£îÕ]AÝ5Eˆ©Ü§ò§¶ôþDŒõnìkÞ„n‘î2.©Láã;ªô vÐ\\^;1mÀÎ:~¦[®_w›#mF=Ôuýi—ÿ\0~yâŠ—o”ÊœRÕ‘ê—¢uò·,3úW9tû¾QÀ­)¤ùJíF$ä½+?mÆÃô®š1äG=fäìzç€¬Kðý»ò&¹&GÀÎAéQø¢óO‹TÌËæÆ¡xçÞº=.DƒE‰ü <¸ð«œœ‘^,ÓÏ«ëR¼ÌI–Vf;×`êÔ”›Ðé~âQHÞ›ÄeäX¡B±gï·¥nxWDŸ\\Õ¦¸’mö–ü <eøVÖ$¾TV¨£oÞÜq×§Ö½;Ã6ßðŽi)o&wJÝrÆG­Œ[)kš^“xÅ€ò¡\'?^xirÙWëë^Çñ\Zò<.î™ó®§TP¼n“ü…y¤~Ö®#ÇdÅÎìã¦–0æosR”¤’[”mÉÁ©Òè}×SøVïü!×ÛK\\¼1ã5:x{N³]×7/+tØœÎºåZŸ©ÏN…[é¡ÏdËòÆ¤ç¥mé>»¿‘\ZwX\"=7œZ¶×6Vê­kdˆTrOÌOçV$Õã¿ŒÄeÉ¸”uRqíÅe*“jÑV:aJ1w›¸„ÂŸèZtK\ZÇÁ,ycëšdºdšf^BsƒY×\r\ZH9rÝŒsH5\rÑ•ßÖ¡A­KuV-ÿ\0e„ååU†8þµR-ãx‚’S®¨MÃù›‹ÎO8öªÆdÜë¼–Ï«IîÌÛ[\"Hi!gìÉ\"–Bê¯1ù\"<sþx¦`¢¤Ò&F@sƒZ67oåÊ®„‡KíÎÏ|~46	£¸‚Ý|íãÌÇ\réY—š”—’“ŒþuúmÜLßºv\\ðØê*‚OîãëÅk\ZqZÞç4«MékÖ’–µŠßw8Çëž»¶Ót˜-\'S´3sšòMkè™×€7qí]ö¤‘[ÈŽÒrTµçb$ãQ(žµóR¼†ø¸Úkz•Ê`-ÛdMž€\náÅ„‘HËò²ä€Þµ¡yrˆÛÄ¸‘¹dÎk8]É;‡\0ðqé]4ùíärÍE=@ðÝéŸM™OÈ1Œç5¢£ÍcòŒÜu®?G»w¦Î:×b$Iö¼x;»W™R³ÐôâÔ Ž;]ÐaÒÛí–¶4_ÄŠßpÿ\0…r­vì¥ºn9\n;W·A\n?TøNyÍdë>\0Óµ&ËöYÿ\0ˆÇ÷_ê+Ð£ˆ­3Ì­E§î²€´ŠwtçŠ´%Fãpô¬Øî‚ÈÊ]²yžIY7ÝÏ5áóÙ{¦®/©$ë×¥`ÞEûÍÊÛNx#ŠéW¼Ž\rPºÓ·üÂ¹ñ4¥5xîoBªƒ³3Öóíå!öóša„îÝDöRDÙLñüB›ÉEÄ•æM>kÔ;\"’W/Ù‹Gÿ\0ÖªfØÅ6ôàŽÕ¯êW±¥x·æ·T¢ÒtÙ\n´“³ c»_½ûÎêjý F,1RËùƒbÙùvÖŽuu‡»ùbãøZƒ­î(ûÝÄê*>ó–†\r…œ—×Ue¡FŸ<ß3zuµ`´†Ö<EQì:ÔÕèÐÀF\ZÏVyØŒ|ê|:\"îqì)øõ¡Ü%P¸ºþßuÊq¦´9cM–\'™k2k²ÙÃT2ÎíT®¯#·‡tŽz“^}ZîNÈî¥@–I¶üÕQîü©É¬óv÷\rÇÛšÑ±·,Ã5çJ¤¥.Tzš§³ÄQ±gsÛò¬íGÎÀÅnxºº<Þ¸¬mw[¦:ŸÆº%\ZMyT§ÍHìà,!]OJæõÈn`¤g“šß¿rŽ{ÖV²K©éë[ÏZIö8é>ZšÇ…®6j—6ò»‡½w‘)¸¯7·›ì~$‚^>sµ¹õ¯D·ùþn8¬««TRTkŠÝÙ®½F@Ï€ ¼:aº{kr2ûÖ&¡ûaØ¯ Ÿzš×qMœTRæh·§ÉûÎ­lÝ8û+årJãs\\ü-ÆîƒÚ·²\Z¼ÿ\0*Ó\'iDŠëÞLùöõ‘5¤FÊ¬¬£Zßð¥×ï&‹þ?•s\"ÿ\0Bñ&¡ÈŒNØ?^kCÂ;õFMØ\rçÍzØª7 ÙÑ¦¬zLrù¿úõvéV}<åGOÊ¨Û¯ËÔUÕRÑ”ÝËŽ¹¯2“g<÷<7ÄKåjÎèß61‘T_çŒ)s½Ž6ç­oøªÈ-ôŸ.+›µ‰¿´­÷g²\nú:R¦Ÿcš¤Í™ÊA\nÄª\0DÚ>½ÍcÍ$œ·È«sWµ9‚ç=«ö}~•¥ó{ÌÎ¬¹UM+¶s6}€ÅGeó^Eß.ê*&ªî‹}R!ÆnçÚº¥eÎH·*‰ãm2­ˆó«‚R›F²¸‘ežÃ*’¥FÜg×Ö¨¥çú*å¸ÜíEÖ³s>©m§Ú°ùw#8Ò¾~2—3HöÜS³,Ûép@×27ÎÈÓªÜœÕùo]ãQ»„g=ê˜Ë¶Â°/ÌTà×={t.£–ÒÓæ	ó;‡Àlt­MÍÙ\r+.fKªÍe{5­ä’ÈE»åc8Ú©¨u/]Ú®ÈÑvcpd;¥sÒj%Ê~ßÞj„¦Ime•>á`ª ÿ\0*ì…d™„ê¤ï[ýBköe9êÃ§4³°—G^ž§5›æùLo=Á­À!½p@²•R=+t”~ns=@eËƒÜzš”F[]½²£¥C¹Š®@<joœò®ä:õëWÌJ‰—]Ïò¦qŽ¹4‚ô§”±ò¶áGJ°’ùPí†#!\'£Õ{›\rnê31‹÷X,B¥5$Ék”¢×;Êì	ä\nÕ°´´ÔcØT)Ç$pkÃ<_~Ó°Í^ÑïDWÊ\nà1ÅMDùo©µÍfiÏ¦ý—\n	*;sW­nŒQ¢G‚Üg8«27šÅtöéUL¦Ö†ÇËÕ+’56œlZ˜ù°ÈâO\0d{W+¨E˜Ø‰£ö<×O¨žXSÁúÓn.cxBí<äóZÂ¤¯©“Š9»9‚Æ>fV_ºÊjÌ×÷3Û„	ó(ëTo\\%Æäîi±]”oOsTázÆ‘©ek‹—¶Þ½ÉíZv‚&Ú{ž4èåaó£Ò´“Y²ÐÔ<kçN;r}ý(”§/u	(ÃÞdŸðj·ª8|•#9nµj;OxjßÍšÏíV½Ê6JþcGø‡|ÓšÒ\'8Ú§“^¯§\\Úêú|WpmhäÃz{ƒïY½=Ù¢µ·4O7Ó¼Q§Ê¦V•ÖV^cch<þ8‚–¼÷è9À­xEd½±EIs¾H¶à8õú×˜]	-æá>BsØÁ¨¹]êév}t¾T…Â÷ÅÝ\r§¯O^•rù?w‘Á-‘Xa˜~lb¾^¤¥F~ïS®šU!©³¯¸aÎOzÐV*»g=3\\ìwo&Ý»‡N{VŠÞy¬1ÀfºéW‹F5);è^ò‘øe¨.4¸Ýxð¥Ž]½Xg¸«a·/­¡%i#.iÁÝ3žŸMž×ç‡;U9no[o’WÔ°À­f–5ù]‡ãRÇyÄ¦+Ð§Ý;#Yâ\'(Ú×dö–1ÛüÇæoR:U²}*—ö„;zçÞšoÇjôUjPVLóÝ:’w’4ªóN©µénõZYw7Ìk*˜¨µî²áAßRYîT–A·Þ¡º»Ž%å¾•Çk:íÃLðÂLk½ŽMq:ŽR±èÐÃJ[\Zš¶¸–Lb¼Éºë\\uõÍÎ¥t¯;œnùPøSL…³ß?­Ih7ÞD…zž•KÜ»=zt£æuv1•ÆïÆºkF‹cÛ¸©­û$Ç‡‹s»<Ü\\îcxÆØÿ\0aÜ8ÎnZå¼?—µ\\uWsâXŒº-Òã#Ên+‰ðÀÛC×5ÕŠISf˜9Þƒ;kXwZÊ+T€óòñùâº+%?e÷¬ëä²)ÎÒ¡z(ä…Gíåš°ò¯/cŸ§5èÚLá­a˜);ÑXç¾Ep> b¼ã¡ÍuÞ¶—kßÐW-yZ’=*ëš_n®í¢°u÷j)ãrž}knÛ\n¼g•çÚ±<Yû¨lnÇ—8Vã9?ýj©Çžºž]ËTŽ)7(aŽsë[6Ó·õ÷<W=ü£éÇÖ¶´ânG>àsšäÂJÕ,«ÇKžA¯Åº¥ÓmÈ2·QœóYzU°³Ö-¦ˆùÂ•ÏZÞ×m¼­BéOQ!5‚¯åLý×½Úrn(·£=:#û½ÉÖ´!;Y?\\Ve™ómUÇB ‚*üëËJóaÜÂkSŠñÅ†Ûƒ0_¼Á*yZ„oï^Áâ«_6Å¾^ÙÒ¼¯Pµùw«^¾®œ¤nŒ¿+,ÈýÆGòÅaòß‡\\WT©­göy¡üAõ®jòÒ{	ŠH„\0vîÇ½\\<•¹:£ÏÄÅß›¡\\©_šµt9]n+ŒñTQƒ/ˆ©à¤™KŸE­j\'(´eM(Ë˜êµmi,­bPÛŽ@¡à³>£¨I¨ÉîÕv)cÔž¸¬]/ÂÓëmöFf¶GËß˜Ší®\'‡CÐL6H*mQÜšóªªp$~&wÒ•I»¿„ÆÚÔ\ZNËb#‰Û°ùrù×¥_ý–â?œ,Üg4ÙõÛét¶²žQ$E:g­YÒ%ç*$xþóö5¯³Œak	MóüMm\rý¯ÛmZ0Ë€ñ‚k·r­ó³@zU‰nçO3ËmÑ–88ëTU²ïÁcÍmN-FÌæ«Qs]•ËÌ_qààjÖ¶¾D±Üí‡N=ý«7ìûÔ²u§¥´Í•·©É5¤¹ZÔˆ6¯æXÓ¯¦o5ãCæ9êy­8`;„³8PÃœ\0j¬aè=Mg_}·qi7ÿ\0‡Y[žNÚ\Zsr-u:»{­>Õ·»#•Uç&®vh-Ï“#\'/µsÇ~+‚·¼10Þ A].Ÿ©@ñþî\\>9VãšÎtÜ=HÈ{\\Àò²?ºj›;iðè¢á—Œš«©y+‰S09;xÍ6Þü33ö½)(µïDµ(½ÔÚ1–ÝYÔ	1†_qS‹4|¡Q°õ\rÏ5ž»pÈ%G<†­­ì+òLÅ$ê	lf¹”\\Y»jHké6ÖûÙäœÝsíT¯í¤|´8xÉ?Ê¶ÒDi<¨êyS»5ˆÁ@Áçw95¼LYÈÏ`U‹LypÒ©J§îöé]5ÔOq!HvGOO^jæ‹áí·Ž×¶&TäâkE;nG#g+¦è×·³lŒ”Œ¾Çþ½nZxf;{€—Væy¿P?\nïl,àn–Áiq×ðíL¹I Œ´?¼P ‚9ïšN£{©¥¹Âÿ\0c­¼Å!”*1ÁBz\Zè¼;ªO êQ ™|™	âSÓÔÔñéÉ;+Ý[…8vÚøÚ{W;n±éÚ•ÕÜx·•„»çhç$Žõ\r)èÍcî«½q:]F¾[n‰þeqÎEy7Ž´°º\Z¶D6Aû­ÿ\0×®ÛÁú›ê:<‰:¨–#\0`j}^/-ÞÞuST÷ô¬éÔå‘!tw±°½·Yx¬Ö…oSš_Þ¤ðÉà\nr9ìzÕË¤ýß¹Jðgi>¦ñnq2ï2‹Ç¯½b\rVâÎbÇ÷ƒ8*OZÝ‘wÎG­rú—Ë +Þ¹÷ÏB…¤­#¢³Ö#ºÿ\0WÄ˜åIèkrÜ»/5åË4‘L³#íe<Wa¥k2J»n=xï]Jj:ÈË†¶±4ï$Ù\'ÞÞõI§z¸Æ;ÅÜœCÚ k)¦ú×Z”®¶7¬ÆÃ#Ë\" ä±\0WI¤*ª˜åzœõ¬M.\rš‚ï^T9é[°°•‹^k·IrÝîrbåïYlH[«”~<Ò›X¬@ƒøSÂüÜMG uþ/Ê½7—Âq]·¹i¶,Ù{u8èO8ª×>\ZÒ.¾i-‘ÐƒŠ¶wË¿“ë@y¹Æ¦ÐOá-Jki3\nOèí©*ºÿ\0ãP\'´ø®Xî\'9Á ×P~o›ôô¨›~ì…Ší¡¬q5—Ú*Ã¥Ç{Î=HÉ«PZù_Ç‘ô§¿Ÿþµ7qVÆîG¨¦©Æ6v3”å-Ø·–Ÿl³–Áw)ëŠæ4ï]iØV¸‰ñÓ\0Šêÿ\0ÚæœËþ×4êSUª*•z”•¢Èmm^(v¹É5^æÆFÎØ³ŸJºîþTàò/j¨òòòêJœ¯sÍ¼Aàýbþã}­²¤çs…ÏÒ´ü=¢j–V0ÃunÊàôñ]¿šÿ\0Ý 1þíDððœ3¡ãjÚÍ#>yJ¸ ŸZÎñ”—š,Ñ\"–p7(<ŠèD‡wÝãÚ“ÌOÂ’£hÌi)\\áRH×~FpWÖ¦Ÿ*+g$tþµÑºFü:+ê3UÛOµòÚ!]ãok‘aj)ERÅ©«IQ¬Àe¸–^»Žk•½ƒj–^ÕìW>mÏ—4™€ü×žkÚÖ1Y¢!	ù\\r\Zº¨¹S•¤tS©	«#WÃWjÑbpß:­Ÿn+Y.JµrÞ“È¸šÝØa¹Ò\\.É1Ž+žºä›±™vïý\"¯ŒÇ¯4¿´Ùy4$ôb:W¢Ã&èÎsÐþuÅk 6©&Å$	ã5¶\Z£z™5­<¿ØjlœŠélu´YÄ—v;òKÈÎ}êÑÓážò6‘±ÆñŠêí[SŠoôd³\'j/j®W9?þº÷!?kß¹ÌàéÝ³ŠK].y¼ç²Cón*ê@ôÅ_¶KX#t!D$ª\'ë]´óÏj\ZçìˆQŠ4q)Þÿ\0çµaëZT)nlë*©Ùœ9\'ÔUN³×BcËtìYµš‡bJNÑ–cÍsž$Ö#žHb„#,[;½\rFšmËgHD™Ê§¨N„\"ºÛ29*Ø*Çô¬iÓ„_4ÍdäôF:O¾I7®U³’#áÙWæÀè+±M*7SQ{IùWŠ•´X[\n£HW8 Ö¶öêûìeÜä£–_)×èj¥ÓÃv¨äsŽq]›èÖ«$m=´`K×aéU&ð£ÝEä†elž[ª5 ž¦rÃÏ¡ÇÚ\\í“ý“]™GeÎÇ¬žpÙÆväõ4ž†Í¤Ã`Æ~eôëSRª—ÂŠ†QÝË¤[_Ûœ¶ÉPåd^£ÛÞ£·í[É»‰—îäed.Ÿ<Ò³¬ILå©µ~eš{v‰íÕÈœ¡û§×ëYóIhÆ©»èS»ø{m¨þûGÔmár2ÖÓ¶1þëVTž	Ô4Ü½îÅÇFŒîmÙY^\\F|—+€OÌÀ¬ÝV\rGÉ(åÒ3…. çéZÆ¼¥£Ãò»£—ºYgPà•8úÒG}½ˆûÕti³Á—ÊÈA¸“Æ}ù§ÛKHR@T3|Å;\nÙÊÈÇ•ßRÆ‹w¦Þ/’\ZâðËßŠëžÊý¯åLÐ•Ï—·.ŸìûýjŽ•5®›²`Ë’Í½rXuÁ®¢Í®çÌ¶¶ˆ®Ä°UB	öµ`ëE>Á®§$</$¬íÂa[„ÎþõŸs¥OÁ„ÌÈw—l`g®Zííí®ïæ‘îm!±çîK!F|v ‡Ö·m3·dÚ{FøÀùC&=f¦î_*±Ïi¶ö–°ÇmòÊ?…Šçqïšè\"ŽŒ¬\n‘£gçN9ª¥ Y6Î¶ë÷°Ð¶X{qÒ¤XÌ±É‡á2vœýµ5«\r‘Wí7vº’Ãå‹6C™d]¸lô&¬Ooå\\%ÌŽÛ\n±£c,j”ú¤ª<Ë…m£0$“éõ¬-WÅâoh¬ žFáR‹–ˆ—%Yo_º’Ê·F\r¸#±ç5ÊÛ8VD\ròŒO8¥y^y\n–É<œÔ2GoAÄðqÒ›\\¾ê|ÞñAñö_‰?f™JH==\rwZ­Ü~Za‡#åï^J•™Ýþiõìuz,s\\C\\Ü3EÏJÊ²QÕå¹èº8ž×R†]§Ë?+ï]œª\Z=«ÉÇÊFkª²6Î6ëòã5ä*|‘hª•9¥Ìe\\‡é·šæµˆÊÇî§šì.bÛ»\rí\\ö¥	–•Á>•æU÷f™Ý‡–§!ó¶T¯ÓÞ·|;8Kè™ýÔâ±äÊ¶ßJ—N¹0^GØn®§®¨í¨¹ Ñè÷Vˆ¸š#8Í6<ù<cùU»Yöñç©¬û¶6òm=3š+%OßèÏ&\rËÜ{¢XdÙ0Ï\\b¬%ÆÌç=j´;%Pã“×ŽÔÙ7í©»IJ#qMÙ—ŸRýj¬º eá¾oZ¡<2mÝœý*ƒ“ýêÆ®2ªÑšÓÃAšÏª–mÝÇzX/¦¸“¾+WØ»»ö«z=Âý³iqÓšÊ*I«ËCj˜xBGW¹eÝæ¹Ï½+Z;t•³LŠò=¿xT©ï½^¢ömY³Ê|ýŠÏkt¿qÇãÅDMÜ=bf÷Ö·csR”}Z/XÉ¯™>ÚKtb›â¿ë!pÝëJš¢ªŽÜó‘ŠØÄmü*j)-£eûŠsíG°¬¾UƒÒQ3Æ¨ŸÞüzSÆ¤øóOm>ááüª´šB3e¯ÐÔKëQÙ¦ibË«}.íÔÿ\0µÂÝV+iS®vJh\Z]îÝÁÿ\0IbqNB\Z[ó¢TþðéØÐ_rô‡ö=A8È?*F,þäœSúäþÔ>Â=$¼£p,Qò¯OÎ°N¡:·ÏŒuâ™ýªé×8ìO?_¦·L>­.æì¡ÿ\0úõ•ª[Ã{g%¼É•a´ûRE«ùÍJÓAµ˜ó¹x£ÛÂ¯ÂÊ9Szž=ìßKl*O/ž8ê\ru»¼øÇLŸNæ°<]¦ùº¤—°ed ¸«ZmÞë›v_“Úv¥Í|Îù.hÜÐ¸•ìáwl©ô¬2ÂÏsŸ5˜’¢®êÞ–›~|äŸÒ©jË†6ùØfGa€¢ºð´ÒãÔæÛVMÃa¤@ªµÄ²VnqŽÕZÉ’|4jVUlÈ8=@ÿ\0ëTÜx÷:·P‡9Æx\'_Q»›M™Þ×)ÁV%NKœ}+Ô§îÅ+TÖEëY ½¸Üê-÷6LÍËzîÕ‡ÓáŠè$n%”òòHÛ½pyïíUlå‚Þ0ò9yHNÐ+Jê?*iåEG*õ9+œÖ‰ÝÕž…4µfgØ7*¬¿t·o¥RK@ºƒBèçø‹9Ç\'œçÒ­Ù¡hæó.ÉŒîÛŒî#½:Í^[ás#æ%˜Žp¾•”’jÆ‘Ñ’-ŽØÎl€mäö4ZØ~ð©èWÈÈ­åŽþááva!ÚqŒÆª½ÐHÄNãÝ%{IÆÅ)7ó-2ÒßdEÑ¶Ü1ª¯äÎÏ,0Ÿ&´¶;çœTÖ×¶Ö÷Ææ|‘üäó’*\0‡ÉÙ²‹°$1¸ÇÞ<â¯•4Jv‘-Äe¤†Tßr¹º~µ-­…³^::±vå<Poußjñ:÷ÆqŒwª~|öº—œ&\rêNÜ­(Ù0“v:EÑ,UbØ‚!Úè¼;ûñÎ)-t}=f,&ROÝP01ß\'½bË©=¼ÒK½¤‹ÌÞ»[¤	õŠ¼nÒã\rl›¾Q&ÄnªIÏãüëkÅô1´—Rv´7_èö­˜7•PŠ=ûRI¦ùyQ±l`…ldƒM¶Ô ûñ»BTã#¨â¦»óžÔ$wž¼¸-ëJQ‹ØjMhÈ&¶\Zµ¼¢FÁ™T7¿§jñMJ9ôÛç·™6Ëm#Î+Ý£Öm h®SjÆëåO0Cvoé^}ñAOµN0Û²ÄŽ«ØÖ‰¥¹•HÊ[øÁqo.©©ºˆal\"¶\0\'ÿ\0­]­¯Žôôb°[–s´ wÐWŒØ]ÓþÆ%a‚[h=kkN™R0ÎÃäàƒ\\u©ÚM£¦“S²‘î:Š4\rf³yi)Âí•psè\r.¡¡	áýÍÃCžB#dõí^q®˜7ÃÜgw¡«ºÄ½cD›dù½²\'æŽCóê§·Ò´ŒdÖ¦SJ?:]bò=o\'T†˜å—\npþùîq\\ï‹ïWþ<fòG@l’=ë××ûÆþÙ6Ûˆ\'8hô\"¼;Å>½ðæ¬Ö’+OnI0L£ï¯øúÕÓq“ó\"U$ŠrêWW3Í1bNâXõ5n7?g6KòqXÁC/Ï½xÎÅjiÑOq	tRÎ£ö­]’\"îE–wHv…ÆzžµPÊŠÜ~øõ%ºZ2i\Zš¨iGËÅV‡IØ¡Ý÷ÀëYsGsX¦ô!·†K©‚nàBŒs]¶fé±BÛhæªYi	D6ó€Êœµwú6”ÑFDéSí%`«>Hè9\rtZ4¡áÙÏþUÌ«VÆ…/úS§bµæÊ:Í»ˆÃ.í¹¬kñû³…â·æqåýÚÉ¼iaŒkÍÅEr»áäîp—m‘øïT\n°>œ×[6šn-Ì¨¹*Ä\ZÅ’×æÚV±„ÚŠ¹ß\n½Ùxrëíhÿ\0ÜMXÕr†¬ßEäG,GûÛ­{åGR¹ät½oV<ô\Z8Ûå­sß±ÉÎv÷ÇcZ¶×QÜ)nM`ß.Ö5JÞêKy¾FÀô®<=WävÎ‚šºÜìÊ\r»ºüU;‹Hß,™÷â ³ÔÅÂ„2á³“Z`Ç·h}Ä÷Åw¨Ó¬ŽçMœåå¤Ë…ß‚{UA–ò›“úWO*oS•ÈÇQéY·62<Õý€#„ð¼‹C¦ŽefD·%TeÉ5\"N[¯óªE:6Ò¼tÀ¦$ÎŸ+)ükšk£6ŒSZñ]•Æ\Z®%ûÿ\0z¹Øî‡z´“£)F£Os9Ð]ô¾ÛS-ÿ\0^A®uowÞÈ§ý±ø«¢8–ºœï»¾y§‹µéÇá\\ð½JÚïnýkx×—VdðèèVá£Æœ.ãû¹sFëoñ~´}§wñV«ÖÄ<2:<lÕ hÙ}ÿ\0rñÞm»¾•?ÛÝ1ó~u¤1=ddðï¡Ñ#›Î£–Â^BŸÃ5¢ÿ\0ß«	¨úµkí)Ijˆös‹Ü’}\n	»þïs¡Ü&|‰zv~Z×‹QtµY[¨ä_¥e,5\nš”«Vƒ<ßWÑ®v»Éç¯5Ì@\ZÞfˆ©SÔ1^ÜâW±öõ®{ZÑí®¡ÜQwŽ„ŠOËEèuÒÆ_I£ÊnÜ¾¡¦fªÈ:6*)u{$™˜üÇÜp=?*wˆ¬®l™¼I^A×\'öÍÌw®Çœ÷5Ù…MÁy¬’Øé[R³yŽ	ÎHÍeµÆëÉ¼µ\rÀ¨-œjÇ}@y˜Û»>ƒ4^mRÁ1¸òk¾ÎÚœœË¡¶÷Ûa1\0Çæ?{?C-Ì-o´6þ‘‘YÏ,7\nTd>}qQ‚´jX®A\'<Ñö6l.®Ÿg„R£åàõ÷«Vþ ž/á¢#iÂàã·5ÎeÑwŸá©Œûv `3Ô·Z¦Í¯í‹”oÜÅ“ÈíéHºÄŠÛQùŽÛ‰ëƒXo<h»yf\'ŽqŠg›2¨”0U-´19§Épç:NfÕÑ~cÉ•#kÚ‹[Û£ºŸ/ý[c,£Ó5Î5Ùvùå=@Å=˜AÞçAéíG%Šæêu?Û÷n»æRg?~AÐÕK^G·Û·xÜ8ÏJÂ·Ÿå;Ûž»sÚ¤´›†G¨§“Qó3pj{”ÄŸ*2€\\pO|Të¨íòÚ8œ2¬znŒ$…>pÇÊ#ƒÜz’ƒ¸ï¡¨ä./CjòêÚêC(W”\nIFê·§j‹µ½ÌnƒzƒèEr÷¸lbyÎI¨¦ñ2á‰ìF2(åd»ì×¶*» ”É àÿ\0v\\ò;iú•ôz¦žV{ta³ÊxØä3wÁ®2Úõ-\'ÊÝ¶ñŠ¾oQaÛæ¾ÅùŠƒÀõ4ìTbŽ^¶\Zn¨R\rË\rÊ3œ\nm¦¢ïGÏƒZþ(ßý™à\0”R¬G×Šæ\0{Y9\ruÁ)Á\'¹çTr§Uµ±©çB™wÜG¦*H5KR»^Ý€ÎCqYþtn»N0}i Ž¸ž\0´*i«1º½ÙøsÄo¡êu¤Ù…ˆßèÃük±ÖuË-fÎEgÇÎ3Šó}/F<µÖL€nò‡NkªÓVo$l…£Ë-ŒÊ¸êA)hÎºqæä:æÚû¿f\0nâµü#á¤–àùˆpÄîÎÿ\0aV4ß\rê7÷l…q¹“øý¹ë]Ö›¦Ágj\"Y0Ç~ðúÒ³“Ô\ZŒ6,A¥[\\FŸ*ùeH%—¦?ÏzãõM4K«I\rŒQ•Œá¥	Ç×Ókº‘Ó­ÄP³N»~÷wcéYúlñ®Uß ‘Œ•÷÷§,³2ýå¹Í+ÃñÛ·›\'Í)ä¶:\Zèáƒm:Ã(aÜd{ÕÄJì§MEhqN£“Ôá3Z:3íÔ-Œ‚>µœjÎžá5öa^$Ö‡ ™ØÎŸ(ÉÀÅf]/Ë÷³ž•¥8Ú¿tÖ|ÎJíÛ^Ek6Ñ½\'b•Ø‚i×(à)o4Ñ/ï Á21UÉpŸR+bÎëÈ]‡•\'ž:V˜8ª´9^èuäá;®¥ÍœŸ>pF\rjÊ¡£Ü;t§½º<{Óœ÷¤TýÈÇÞNh©4œIçM¦s\Zˆù¿\nÄfýájÞÕFÙ¿¹{Ù|‰í»æúW™J™Äö)¿t¿Û$èk£·Ën%Lœu•ÉÃ u+¦ðô¿3¡­©«NÆÝÕË¿jÝÔÏ>¾´Øn6ü¯ÉTZ…»ÚÉæ¦:çëU¢¼GïùXÖ«$ùeÐæöIÆñ4Z4y¹ÇLâœ¶VÒüÛvƒÇ4Øf=ÇcOaµŽ§5Ò¹d¯c´ì™!ðü2®áÁöªÒøt¯F5§ktR1ó3×½iÅxŒ»_œÕ}Z„÷Ñ“õªÐ8ËŸÝ4ea—iíšÁžÇ[°_ß!`?‰9ëaauã–é·¶>”Þ*>é­<Òq~ò¹ã¢ú}Ü¿JpÕ\'U+¿ô®‹Åzlg›\ní”ñŽ™Æ¼r\'ÊW®NHÞÇ¹Jp­+nmA¨HË¹Û<ý*c©È«Æ8ìx¬K\';qßÚ´˜î]ÁkG–F3„nM¸í!S õ¯.­¹yS\\ào¿ÞJÐw-IlcRìl®©\nãæÛõ«‰vw\'ÿ\0®¹«˜·Z¿¶+5\'š/¹)_aZR•Ö§<©)lwiqó}î}*ÂÞþ*ó÷×î­Wq@àyÅkXkñÜF¶ß÷«¢Í+˜JŒ»ŠêX-:KÝëÏ?ZÀ[¸ÙwúsJ÷;—ïV›]L%M\\‡U²ŽãæÚ3\\V©áÈÛ,W‚y®ÖIK/J¬ì¯ò•Ç½\nM;§¨îìxÝö%•ÑWS´ý×qéT^\'Líä{×¨ëzl7²m#ò¯?»O\"F·+óŠõpø—Q[©œ©#,Ü¼®	#Ò›æÿ\0	äu«wVáqþïw¬·Óÿ\0­Þ»`ã#žiÄ¹ö‡_›¨÷ãŠC{¹¾t¬âO÷çLÉZÑSF.«4MÂ>=®9Ê2üŽµd™6µ8HìÛE?f%ˆ]KË1^Œ=ø«?oÍŠG¯­R‚ÎIØfP€ÿ\0æµ\"ðú3m’ìžÿ\0*ãùÔÉEnËIô*´è2”õ¼ã•¯o¥iÑG¼£HU°Xò*ó„X÷Áh‚5Ãñ¬Ü¡ÐÚ*lÃK´Ýó¹`F\nÔ«|‹ÓhÇLðjÚéS^Í¶FX\"nM¹Áì*«xqâ›÷—*Vž})\'¥þñt!»¼ùC?1ÆÜâ¤–i\"Ž7tP¼`œŠ¤ÚMÓÈÙ•p™*sÖ©]Euåï~Tq‘V¡¢fN¬ãwc~-NÓºãGž—¿hÊC)À\\yu_²¼ò²§ŒóNTWDÃ\'£Ðéž=‘îàî\0Ön¡\nsÛŽsV-¯„ëµœ—<U{¼Ï2 qÈ#5œbÓ¹¤š’±ŽÖá˜ìçÓ=)pæ<)=ªà³ò£æ#æîXñŠÔ´Ò$º™Ò&y>Lg9«eba‡w¹6Ÿe4ú¤0¤ÆYåu\\ÀÏ_Ê½—IÐ­tèB$ ÈÃýkÜÖ7†<\'‰ûÛ¬ÉWæu‚{\nêÕã·…ÞGW™Žú\Zä¿4Ž™µbÄ1ÿ\0PJœ8í‘Tu­oOÐÔ<Ž^I)GcÇAXÚÏ¬l£òtæKË’0$ê©õî~•æ—šÝÝþ ×Lï#d ô©#4¹·7ïuÃ¨5ÝÊ\'@ ãjö«vzÙfUÌ\'¡Âdïë\\ªÎ%Ç—Áÿ\0k©«0ÜdQ#\'v3š\ZÐé‹Hô‘¯êZ|oQÜí?:8Á+êé]F‰©ZÅ.M»Ûî$~þõæ\ZV©ä2«¸òÜ|Ã¶+¾ðÖ°oXÛ¢f8×½=*èÕ|Ü­œøª)ÅÎ(Â©-ŽÛ¨[ý±HWm %8êGÖ¸¤„™ÛÜÈ«_zÉ•÷/|U;Ïµ…Ý°YÅeÝO±N`×ƒ‰›çg](hWÑ¤\\0$‘øUèš²í­Þêè8â%9iCì*ÝÄæÛ>§š×ˆ§F-Ï©Ué¹´¢nY\\y_)å÷íO¸$“*üàW úµÚtqÿ\0|Ôöšá•JÝK†tô­ªbá%î‘4¢îÉ5o›ê\rrš‘\ròúæ¶ïµDy>EßõéXWlgcÀì;W\r$ùù™éÓvV(ÙjUÀ·“î“…oOjî<;\"­ÖÓßŠó™ífó7ªôç\"¶4=ÔhR0Ào ÷®ÙRNJq1¬®šGªÞÚ‰×iô®NúËÊ¯äk§µ½Žx|Ñ26àÊsÅCuN»ÑAÏ­aŠ¡ysDä¡QÇFr±j3YH«&Z?nÕ·ôÇòJ	$¬»Ë6V !ÀöÍbM–·n^ëŠš5\ZÑ3§\Zš£ºšà4acLøäÑÿ\0/Þùý+“³Öæƒþ>WpìËZÐê6×êåÏð“ŠëƒRw8çJQßcm5FãZÑê»Üxã¡ï\\Ü1üÁË=\r3TÖ!°]ÎÙfû¨:ŸðªNPNW3äSvHÊñž¢\ZúŒ ‰ô‰Ôs¯ï¹b:Ôr=ýÔ—rÎsô…*ÚoŒ•r0†¹§ÊÙíÑœiÓQÊºÛÓ#v=«B?™Gk\rÔ\Z”ËtìÌùqí]%ºïQYâ#ËmnLç}J÷02‰­B¿áVæ·-f[oÎ˜o­$PÞ¼ŠÊW²¹„§tS½*Ü¯÷ŽÚÏhCGïŠŠ<Ä†ï–ÜHíŠ¥¦^¤±„™¿z5Ñ\Z2PRFQŸB)ãùNjµ±Û”ô5«wfù>¹¬¢<©ƒnëÁ­ ï\Z©š0K\"°PäLÕï´N‘äüÃØVr˜5t6‰ã;pMdÓæÐ‰´–Å[}NêøÏ©éRùá¤ã;œæ£Ö<4ÏšÆs÷k‰® ýÑ\'Ž0F+{hcÉknð†ô#Ò¸¿é»¤K˜ò0~qëé]º™cýäDý+U½ìn¤°-ÀµÃóFiÄ™GMLi¢ßþ¼síY÷VãËû½«M3äíìzÕ{µýß¶+Ó§&ŽjŠèÈHšxÌ¨Ã`ëíVSÃ7LË½•†Cœž?\n½§\\?–ë\"f!ò©<ú\Z³ó¥ÀTËDÀ›º­uº“¾†1¥M­L£áƒÎûŒíàí\\æoáøR`³;ÈÏk§¿Ôày’[^QUÔ.<çñ¦î´Ô­Jj“Èí‘KžoFËT©­R)Å§iÖº]ëÞÍ ŒñØJ­—öv!Bò¹ëWM}Ë&ñ€gŒŽßZu­§[hÛ~¥€tÏ¨æ¡Ø«	Ãäí„q–ÛÛÚ¦]Ï„Kisµ‚à¬§ ûJªn¾èæ-Êš|Ww+ó[;eY¶ô¤‘nÛ#JÂI\"ÿ\0B¸¶º¶~SÃ¨5zîÀ<~h‡(¸ÎÞpõ“orë|&‘AF!OùÅu^j%¹Â‚²œÏÝ>¿gt¥©²Õ\\Öcl‚·È5Õøc@Ò®´’×Æöù”™ýU‘©6oBI\n«ÅAoÛÉ¾6ÙÁÃ+cšM·±NŸCrïáî™<Ïä1EçnqU%øfŽ£Ë–#&ÇŒþUñ©f¾t7Â™$@A^µ·mãÐê}=s¸åÉŒŸÇüj«¦R§Ðä_á†¦‘–à$æcô§Gð»^vVo¡wÜ\ru÷_´û>gÓ\'!Ž2Œ*)¾\"yìµÓ™‡_Þ¾1ùt­UJ–2ä‡aö>G·OíY–IàWf~¤ó]n›¡Xéq¼VÖQÇ‘÷ˆË7ã^suñCZxÝ­4û8[8-&çý8¬‰>#k·Jmï\\ìbPŠ}ÊM^äº–ÐõíCZÓô»]××QáAýÖì±ú\nóøŠçV·Š$ýÅ¶NØ³÷bÞµÌÚ™/o¼Ù²@äž¸­‹˜£–tøyÅM¬ìk«]êQÓaŽýò†>ßÃþ5qî!\\(@SAÎ÷ªÑA¶0¨Ãn8cÜUeYÝŠG	cžjÑE½PJj;Œ¿Â\\¾|dm55½ÊJ¼¬…û ¡aá›»É¦àg%qšï4¿&àî {cV‘§Í¹Í*Ê;UŽƒ¨ê[ÈŒ‘×–Å{…ôtÑ´Ô·L“Õ˜õ&¬iúT6ª0¢µTmZÞT]Îj˜‰IZçéP²Õù£ÛšªÉ\\R¼dX·¾Ùkä•<}Ò*Íµ½¬ª%¹bdÎB‘À¬åJ¹ùB×\rL&ïÔÚ5šÑM2.T6Õ^€VEÍÀfã8ÏÖ®Ï\0•~ñCYSØN¿4nÔW—S-¨Ö§Dqê2H‹*”¨U¶•©^K¸´ÈHõQšŠ{ëgP¬­æž¥¸©ú¼£ÐÕU¹\nÍ÷»TLã¿çK¼7ÜaïQ¸»‡4¹{–¦À¨Jí#—å(F(QéÅN·å+íÅRºØ¥U¢šZÝØ7›crñ°ãƒZ6þ9ÔmÕbº·ŠB¼ÎÖ4èäF]½J©}¦¥ÂîO½×ëZÂ«Úb¼$o¯‹¬§QæZL¤ŽH`j¥åô7—ÐnòÔuaÔ×0ˆbo)Æõ­[¹z*Y-\näQW.<a”e~ï¥sÚâ˜š9cb¬	ä]`ñ÷÷¬VÈË©çŒŽ3E7É$Ø£+«^+Õ!Qn÷CÀb¼Š±ö‡žO6G.ç©\'5ÏÉO—oCWì\'ÝòÃžâºêÅI]-o[¸ïÏô­[bŽÁ}«\n7Ú§i­->OâÝ^]Xõ4½ÍY´Ô¸^1æv5^{y6>r§=ëoO>3ÓùÕ«­0]1uáÔpÞµ	9GB[{²\"³ÙqÄT`®åU`ƒcU$¥%±x¦ÇGi­ßJ‘.þ’2àëNêµ¨Î~ï¡ÍêÑ‹£Ý\\ýÎžÊÛãá‡ ŽÕÖ¼®Æ¡{?>@ˆ¼±Ú­{Ê,R8ý¥™ÌEt~äÜ7ó¦O†éZZ¦‘4’-’/ëXç)•“Jä	\\ê¥UHµi.øðzŽ+sN˜Å ô<\Zå#¸ò®>÷\0Öý¬›°Á½År×ƒZ¢Û¹è6l—í9öïYšÇ‡ëæÂ J9it;à­±ÚºµA,|bº(µV{œRnœ®¶<ÂKà(CŽ\raêZ/›!^·JôÝ[J*ÞtkÈûÃ¦k›žÙm‡`<÷ÅO3¦üÍ£ïlydÖ·:tžS©hó…aLž=ÊW¾:WkiÖèFàŸJå¦´x.¤¶v³îºž¢»h×U5ê¤á¿S_lh£\'aÃ)­˜.D%8|\0¸#Õ{<£y¨€úZŠmíbÓä½«ÐHÏS™Ã•ÜH.!ów*È¿.Õþ*’)$–?9b#mÈ sÖ³ Þ‘È‡#<}5&tm¡¾UÉÚj›»\"îæöM²KÈBž2ù5Rîk›+ˆ˜KªyìTÕ9å¸F,ÙèO\\V…ü‘‡|0 /<~4¯fS³b85òÓç`å÷sÎ*ì qì˜‘qòŸË¥cÆ¶ÉgRÇ V´7AaVB¹<\'¥&šd‰¥xUBŒàs×¥K6¥3Bªp¸SŒÕ+‡v›Í\n=0õªÂdv\nW¿APãr¹Ú5ŸPÜÉ¾,’1ÈÇ}„j¡Ë©L|Ç>µÏbESëîsÅ=~UyÏ¯j^Ï±j§sNH£E(>hŸž=j8 GŒàçænÆ©‹ØÓæ““Øý)±j¬»”nlôLgŠ|’%ÖŠ\'¸…Þ2“.s‘ÈÅg²=¬r#ççÀBM^FÕn›p@±Ž0ê*I´ÛëˆÙ+Ï<`ÖŠœ’±‹¯ÊûcKtÞ¼ý*¤öBY¢õ<UètE¿téŽ˜flâ·`ÒÄ…<œr}jé«3*ÒæV9{X®l¦Yclcªž„VÃ]¤±íŽG?xuZÓ\Zh~‹Zº~½ƒý*åMIÜÎecž²Ñî¯X<™°=+¯Ò<:FP{WE§èÉtô­Øl‚¨Úµq…ŒªTrz™¶zZD£úVÄá?†¬EljÒÂµHÅ²¸ZqZ€ZfÒý*„ŽvîËzî¥eIFûµÞÞé#m°²w^Æ°.-?xRDÙ\'¡ï\\ó¥cXT¹Ïm§§ËWä³Ûü5AþÍbàl¤CL5`ÅL1ÔòÈ\n†ê¿¥VŸN¶Jº}ªñJŒæ›‚z4\nVØçî|9|Ð±Cìk1ôýFÉ·&$_FÈ®ÀµBì+áiK¡¤kI{^]²Dc|ó‘Å\\Fí÷îã#Ö´ñC.w 5•>—Þ)þéÅqO“º7Ž#¹Y%ÚÛ‡JÓ·Rê©V8‚æÕŽÖóõb§}SdqÄ8Ç¨æ¹e‡”w6öŠ[Õ-†á/qÁã¨§éªY‚Ž´“ÜÑÛs`ž+CÂª²Ý+”ÛÉô¬T½Ó¡ÎÐÔÑŠßoÍý(žØ2•=~•¼Ö;Táxê*¬Ðü¾ôÜ\ZÜÁLó½ON	pÞ‡‘XòÛ˜›pÈ>ÕÝkV/Jç\'·Ýšë¥¬.Šs³\"²›ÍŒgïtjÕ´Ú­\\áI-äÜ3×ó­»)ÑÔ2·_ç\\˜ŠvÕBwV:½>TM¸ëÞºkYÄté\\]¤»ë[Ösîln˜5ÃN|’3©š:†ž÷±¯ï:w™}›f­·”nF1]2#®=úô¨omƒÂå?ˆr\0ë]t¡YT‰“¨ùyYÊ¤{³Û\0ži¼¦pAÈ#µhjí«ßåg1q™X³¶Iîy¬«›@ê~Q]ÖµBD16à¿¦j%Ô¥.Çwdîþ•oI¸;|“÷—¡õ«×0ÏËëXÒ+[ÌpGzå¯Kš6:!3²²”£nîjî4k³,{KsŠóm6èOoÏÚº}2èÅ0`Ø¯&œ)šÔŠ’;‡‰]y®W]Óžvx÷l\'æQé]-µÊKÉ©§‰&Œ¯b0G­z„jÄå„Ý9U$Qí\rØúW5¬X¾g‡ Ç>¦»íkÃék!–o-ŽJõ\\ô–Ê¿)­°XeÊæ˜ŒC’Hå¢‰™¶ÍÛ£b«ÞéÑ§Ì’Ç8«§’Ñøjœöc²×t0éJéœò®ícxþfßP>íA%º\"îÙ¦3]KX³N[ýßÒºý’1UdŽId}Û£_Ÿ¦6RÍÔû?tÜzœ×b–¯ü²–*o²¢ÿ\0¤©Ø%U³‡—Ëÿ\0,G¶hÚ¢±Ä<A]È·OîŠ™!¾è«åBöŒämlµ7ê˜¬;UØü=&ÝÎç$ç#ŒWT³úU¨í7\r\n	\nU%#\Zvëq\'Ó5j§½˜ûn®Î\r;v>ZÑ‡NEþ\Z®T%7Üãmü7n¸C¸ú·9­H4ÿ\0ç’|WT–¨¿ÃR¬\"—*30\"Ñ£U/éR1øk{ÊyùP¹ŽtéŸìÓÓIÝü5Ð-¿û5f+_öir‡1k£F¸ùkjÚÁx«°Úÿ\0³Z[Õ(äTŠöjÜi¶¬¬\"ŸåÖ„6Bm.öj—Ê§,k@,{ºÔÁB¯<Rîù¶\"î5<V¿Å#dúzQa\\µŠ‚æÒ¥Û*è{Š±IUk‘{åÞ•5¿Ì·QYínó\'ýóÜWdkžÕÕRú= .sœf³”Q¬fÌWƒoðÔ-\rjËþ¬}*›ÖN(Úå#BÑUãQ½KŠÌçŠ«¼U¤õYªZÌÙ-ÍU’ÜÖÉ¨$ûµ‚-3¢5Rkd”­m¸ñTäÒ±’èiæ,¶‡iPÝ±Sè³Éaq³v9ïÞ®5U—±ïžµÃVœT[Fð¨Þç§YIçÛ®W\'o_jŽêÔ6[mVðá&ß’O­lO÷Ms7Í°Z;¾§n>ÊÙþîk’–½V»MW·Ð×;rÞ•Ó‡‚åa)3¸¶¦©DM¬Ÿìžµ³7Þ¬ëñ¥Z\nÅÂLè,1,jÞ½+jÜmm¡¿ZæôOº>¢ºˆ;W‘:JæîFŒRíý+F	‹(¬±÷ªí¿jˆÊJZ39+«‹-¨ÜX/SUÚÞµ[îÕs÷ké°ss§ï—+ÐÊ–Ú³nlÿ\0Ù®†J¥=u8£4ÙÉ]ZmÏËX·vÝ~Zë®ûÖßzæ©cXÉ˜º|Íku°ð\ZºÛi>dÅq·=þµÕi\\Æ¹¯sº\rØëlç>^ÝØ§ÑÚ>jÇ‡ý_ãWîŠšwDÊÌ]AÌöìÍrWv…3ò×Xõ•yý+×Ë×¸ÙÉˆ•š9gSÞ«Èµ§s÷ª›×¢ŽfÊ%)V:œT‰÷ªÐˆVÕ2Ùîþ\Z³Þ«pö¦&QM4·ðÕˆôÒ¿ÃZ°ÖŒJ¾ƒòª°®bG§îÕ˜ìöÿ\0\rn*¯ ü©ÁWÐ~TX.fÇßá«\n*ÈÒPMÆ*Ô›*x€çŠ™@ôÊË©–Üÿ\0v­%XZv•Ò­Ãk·øjÂUŠvÈÒ¿ÃSªÒ­(§bDÅ8»INo»@X\'VçÐR¬SO×äùÓ-¹›žyïZFš8âH—\n?\Z–Š)’ÿÙ','00:40:00','FRITAS COM FILE','Cozinha',NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sangria`
--

DROP TABLE IF EXISTS `sangria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sangria` (
  `sanCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `sanValor` float NOT NULL,
  `sanTime` time NOT NULL,
  `san_caiCodigo` int(11) NOT NULL,
  PRIMARY KEY (`sanCodigo`),
  KEY `fk_sangria_caixa1_idx` (`san_caiCodigo`),
  CONSTRAINT `fk_sangria_caixa1` FOREIGN KEY (`san_caiCodigo`) REFERENCES `caixa` (`caiCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sangria`
--

LOCK TABLES `sangria` WRITE;
/*!40000 ALTER TABLE `sangria` DISABLE KEYS */;
INSERT INTO `sangria` VALUES (1,50,'21:37:17',1);
/*!40000 ALTER TABLE `sangria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_preferences`
--

DROP TABLE IF EXISTS `shared_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_preferences` (
  `empCodigo` int(11) NOT NULL,
  PRIMARY KEY (`empCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_preferences`
--

LOCK TABLES `shared_preferences` WRITE;
/*!40000 ALTER TABLE `shared_preferences` DISABLE KEYS */;
INSERT INTO `shared_preferences` VALUES (2);
/*!40000 ALTER TABLE `shared_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `venCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `venQRcode` text,
  `venCheckIn` time DEFAULT NULL,
  `venCheckOut` time DEFAULT NULL,
  `venValor` float DEFAULT NULL,
  `venCusto` float DEFAULT NULL,
  `venMesa` int(11) DEFAULT NULL,
  `venStatus` text NOT NULL,
  `venPagamento` text,
  `ven_caiCodigo` int(11) NOT NULL,
  PRIMARY KEY (`venCodigo`),
  KEY `fk_venda_caixa1_idx` (`ven_caiCodigo`),
  CONSTRAINT `fk_venda_caixa1` FOREIGN KEY (`ven_caiCodigo`) REFERENCES `caixa` (`caiCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,'null',NULL,'10:39:44',68.2,0,2,'fechada','DINHEIRO',1),(2,'[B@423b1243','11:37:02','10:55:19',48.4,0,1,'fechada','DINHEIRO',1),(3,'[B@6a0fb4b1','17:31:29','10:52:24',17.6,0,101,'fechada','DINHEIRO',1),(4,'[B@4ad0c11d','18:04:40','10:55:09',35.2,0,2,'fechada','DINHEIRO',1),(5,'[B@42521c97','10:56:15','11:07:43',17.6,0,102,'fechada','DINHEIRO',1),(6,'[B@713bc4bb','11:31:52','11:32:03',17.6,0,103,'fechada','DINHEIRO',1),(7,'[B@451bae83','11:51:51','11:52:08',17.6,0,104,'fechada','DINHEIRO',1),(8,'[B@1a481cd8','20:52:12','21:49:26',17.6,0,1,'fechada','CARTÃƒ?O CRÃƒ?DITO',1),(10,'[B@63fc7e5f','21:59:28','21:59:51',75.9,0,2,'fechada','DINHEIRO',1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-16  9:55:23
