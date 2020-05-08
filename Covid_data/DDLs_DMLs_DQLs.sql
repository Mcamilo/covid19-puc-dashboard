# Lista de comandos e queries para o monitor covid-19 PUC-PR

### DDLs ###
CREATE DATABASE COVID_19;

CREATE TABLE `dados_covid` (
  `data` date NOT NULL,
  `confirmados` int DEFAULT NULL,
  `recuperados` int DEFAULT NULL,
  `obitos` int DEFAULT NULL,
  `descartados` int DEFAULT NULL,
  `em_investigacao` int DEFAULT NULL,
  `rt` decimal(5,3) DEFAULT NULL,
  `rt_abaixo_95` decimal(5,3) DEFAULT NULL,
  `rt_acima_95` decimal(5,3) DEFAULT NULL,
  `ocupacao_leitos` decimal(6,3) DEFAULT NULL,
  `inter_ate_1_ano` int DEFAULT NULL,
  `inter_1_9` int DEFAULT NULL,
  `inter_10_19` int DEFAULT NULL,
  `inter_20_29` int DEFAULT NULL,
  `inter_30_39` int DEFAULT NULL,
  `inter_40_49` int DEFAULT NULL,
  `inter_50_59` int DEFAULT NULL,
  `inter_60_69` int DEFAULT NULL,
  `inter_70_79` int DEFAULT NULL,
  `inter_maior_80` int DEFAULT NULL,
  `sem_inter_ate_1_ano` int DEFAULT NULL,
  `sem_inter_1_9` int DEFAULT NULL,
  `sem_inter_10_19` int DEFAULT NULL,
  `sem_inter_20_29` int DEFAULT NULL,
  `sem_inter_30_39` int DEFAULT NULL,
  `sem_inter_40_49` int DEFAULT NULL,
  `sem_inter_50_59` int DEFAULT NULL,
  `sem_inter_60_69` int DEFAULT NULL,
  `sem_inter_70_79` int DEFAULT NULL,
  `sem_inter_maior_80` int DEFAULT NULL,
  PRIMARY KEY (`data`)
) ENGINE=InnoDB;

CREATE TABLE `dados_covid_forecast` (
  `data` date NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  `num_casos` int NOT NULL,
  `num_casos_funcao` decimal(10,5) default null,
  `forecast` boolean NOT NULL,
  `abaixo_95` decimal(10,5) DEFAULT NULL,
  `acima_95` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`data`,`tipo`)
) ENGINE=InnoDB;

### DMLs ###
# Dados base
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/11',1,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/12',5,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/13',5,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/14',5,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/15',5,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/16',7,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/17',9,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/18',14,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/19',17,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/20',27,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/22',31,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/23',37,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/24',46,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/25',56,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/26',66,0,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/27',71,14,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/28',75,27,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/29',79,32,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/30',79,39,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/03/31',90,42,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/01',97,48,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/02',109,54,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/03',133,61,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/04',152,68,0);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/06',185,71,3);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/07',220,79,3);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/08',241,83,5);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/09',248,85,5);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/11',299,96,6);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/13',338,107,6);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/14',347,118,7);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/15',358,120,8);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/16',385,125,8);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/17',391,134,8);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/18',401,189,9);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/20',426,210,10);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/21',435,227,14);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/22',450,266,14);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/23',476,290,14);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/24',489,331,14);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/25',503,352,15);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/26',509,360,16);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/27',535,365,17);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/28',559,380,17);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/29',564,393,19);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/04/30',603,415,23);	
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/05/03',623,470,25);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/05/04',651,483,26);
INSERT INTO `COVID_19`.`dados_covid`(`data`,`confirmados`,`recuperados`,`obitos`) VALUES ('2020/05/05',658,487,26);

# Dados forecast
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/10','acumulado',0,7.744309826728,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/11','acumulado',1,8.88696855773432,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/12','acumulado',5,10.1956607717038,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/13','acumulado',5,11.6937037786356,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/14','acumulado',5,13.407435967962,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/15','acumulado',5,15.3665285055034,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/16','acumulado',7,17.6043033101943,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/17','acumulado',9,20.1580475332132,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/18','acumulado',14,23.0693108957144,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/19','acumulado',17,26.3841674789808,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/20','acumulado',27,30.1534178469858,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/22','acumulado',31,34.4327007366466,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/23','acumulado',37,39.2824761213394,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/24','acumulado',46,44.7678335740503,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/25','acumulado',56,50.9580721310315,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/26','acumulado',66,57.9259912414036,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/27','acumulado',71,65.7468282712686,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/28','acumulado',75,74.4967782804158,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/29','acumulado',79,84.2510387297098,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/30','acumulado',79,95.081338042727,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/31','acumulado',90,107.052935155106,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/01','acumulado',97,120.221119383021,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/02','acumulado',109,134.627296789925,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/03','acumulado',133,150.294819015581,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/04','acumulado',152,167.224788165936,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/06','acumulado',185,185.392147698375,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/07','acumulado',220,204.742431131687,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/08','acumulado',241,225.189571999008,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/09','acumulado',248,246.615163903176,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/11','acumulado',299,268.869487058531,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/13','acumulado',338,291.774484176737,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/14','acumulado',347,315.128683142895,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/15','acumulado',358,338.713849213567,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/16','acumulado',385,362.302938766106,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/17','acumulado',391,385.668757425457,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/18','acumulado',401,408.592630365479,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/20','acumulado',426,430.872390918953,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/21','acumulado',435,452.329085674672,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/22','acumulado',450,472.811961383656,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/23','acumulado',476,492.201508894645,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/24','acumulado',489,510.410554514421,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/25','acumulado',503,527.383576053598,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/26','acumulado',509,543.094556355421,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/27','acumulado',535,557.543761686255,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/28','acumulado',559,570.753848755072,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/29','acumulado',564,582.765673872541,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/30','acumulado',603,593.634116633643,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/03','acumulado',623,603.424154428916,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/04','acumulado',651,612.207346323694,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/05','acumulado',658,620.058814684154,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/06','acumulado',633.270466390435,NULL,1,668.986137107094,597.554795673776);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/07','acumulado',638.778850037752,NULL,1,674.494520754411,603.063179321093);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/08','acumulado',643.649339320875,NULL,1,679.365010037534,607.933668604216);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/09','acumulado',647.94717675387,NULL,1,683.662847470529,612.231506037211);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/10','acumulado',651.732985557683,NULL,1,687.448656274342,616.017314841024);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/11','acumulado',655.062571113317,NULL,1,690.778241829976,619.346900396658);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/12','acumulado',657.98689883734,NULL,1,693.702569553999,622.271228120681);

INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/10','diario',1,1.44193862363799,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/11','diario',1,1.67739978053079,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/12','diario',4,1.94282060009767,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/13','diario',0,2.24044934147171,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/14','diario',0,2.57243179275556,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/15','diario',0,2.94075550850881,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/16','diario',2,3.34718934952342,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/17','diario',2,3.79321931844751,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/18','diario',5,4.27998194959381,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/19','diario',3,4.80819676716887,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/20','diario',10,5.37809956128175,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/22','diario',4,5.98937843285578,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/23','diario',6,6.64111471426037,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/24','diario',9,7.33173096988231,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/25','diario',10,8.05894830892009,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/26','diario',10,8.81975519223185,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/27','diario',5,9.61038977946868,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/28','diario',4,10.4263376385101,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/29','diario',4,11.2623463265921,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/30','diario',0,12.1124579557124,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/03/31','diario',11,12.9700603823596,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/01','diario',7,13.8279571259575,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/02','diario',12,14.6784555381813,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/03','diario',24,15.513472136431,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/04','diario',19,16.3246534018856,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/06','diario',33,17.1035097501291,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/07','diario',35,17.8415598354482,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/08','diario',21,18.5304818731803,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/09','diario',7,19.1622682808363,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/11','diario',51,19.7293796680882,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/13','diario',39,20.2248940640126,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/14','diario',9,20.6426472680897,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/15','diario',11,20.9773603545266,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/16','diario',27,21.2247506464317,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/17','diario',6,21.3816228998069,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/18','diario',10,21.4459379836602,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/20','diario',25,21.416856992557,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/21','diario',9,21.2947594575437,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/22','diario',15,21.0812351027933,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/23','diario',26,20.7790493982745,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/24','diario',13,20.3920839519309,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/25','diario',14,19.9252535374709,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/26','diario',6,19.384402236993,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/27','diario',26,18.7761817656999,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/28','diario',24,18.1079155177176,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/29','diario',5,17.3874522117393,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/04/30','diario',39,16.623013213087,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/03','diario',20,15.8230376613526,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/04','diario',28,14.9960294428894,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/05','diario',7,14.150409823866,0,NULL,NULL);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/06','diario',12.4357911066433,NULL,1,31.4446081327167,-6.57302591942994);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/07','diario',11.5820406487711,NULL,1,30.5908576748444,-7.42677637730217);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/08','diario',10.7399698540253,NULL,1,29.7487868800986,-8.268847172048);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/09','diario',9.91579069165525,NULL,1,28.9246077177285,-9.09302633441806);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/10','diario',9.11502680882293,NULL,1,28.1238438348962,-9.89379021725038);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/11','diario',8.34247398004891,NULL,1,27.3512910061222,-10.6663430460244);
INSERT INTO `COVID_19`.`dados_covid_forecast`(`data`,`tipo`,`num_casos`,`num_casos_funcao`,`forecast`,`acima_95`,`abaixo_95`) VALUES ('2020/05/12','diario',7.60217884187429,NULL,1,26.6109958679476,-11.406638184199);

#Leitos
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 27 WHERE data = '2020/04/21';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 34 WHERE data = '2020/04/22';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 39 WHERE data = '2020/04/23';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 37 WHERE data = '2020/04/24';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 34 WHERE data = '2020/04/25';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 37 WHERE data = '2020/04/26';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 39 WHERE data = '2020/04/27';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 44 WHERE data = '2020/04/28';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 37 WHERE data = '2020/04/29';
UPDATE `COVID_19`.`dados_covid` SET  ocupacao_leitos = 29 WHERE data = '2020/04/30';

# Descartados e em investigacao
UPDATE `COVID_19`.`dados_covid` SET  descartados = 1406,  em_investigacao = 136 WHERE data = '2020/05/04';

# Faixa etaria
UPDATE `COVID_19`.`dados_covid`
   SET sem_inter_ate_1_ano = 0, inter_ate_1_ano = 0,
       sem_inter_1_9 = 6, inter_1_9 = 3,
       sem_inter_10_19 = 11, inter_10_19 = 7,
       sem_inter_20_29 = 77, inter_20_29 = 10,
       sem_inter_30_39 = 121, inter_30_39 = 19,
       sem_inter_40_49 = 91, inter_40_49 = 18,
       sem_inter_50_59 = 66, inter_50_59 = 38,
       sem_inter_60_69 = 38, inter_60_69 = 30,
       sem_inter_70_79 = 14, inter_70_79 = 22,
       sem_inter_maior_80 = 9, inter_maior_80 = 29
WHERE data = '2020/04/30';

# Rt
UPDATE `COVID_19`.`dados_covid` SET  rt = 12,  rt_abaixo_95 = 4.62, rt_acima_95 =  12 WHERE data = '2020/03/12';
UPDATE `COVID_19`.`dados_covid` SET  rt = 4.576,  rt_abaixo_95 = 0.366, rt_acima_95 =  8.051 WHERE data = '2020/03/13';
UPDATE `COVID_19`.`dados_covid` SET  rt = 3.171,  rt_abaixo_95 = 0.018, rt_acima_95 =  5.882 WHERE data = '2020/03/14';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.562,  rt_abaixo_95 = 0, rt_acima_95 =  4.938 WHERE data = '2020/03/15';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.759,  rt_abaixo_95 = 0.232, rt_acima_95 =  4.977 WHERE data = '2020/03/16';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.967,  rt_abaixo_95 = 0, rt_acima_95 =  3.916 WHERE data = '2020/03/17';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.784,  rt_abaixo_95 = 0.573, rt_acima_95 =  4.755 WHERE data = '2020/03/18';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.837,  rt_abaixo_95 = 0.863, rt_acima_95 =  4.627 WHERE data = '2020/03/19';
UPDATE `COVID_19`.`dados_covid` SET  rt = 3.47,  rt_abaixo_95 = 1.793, rt_acima_95 =  4.991 WHERE data = '2020/03/20';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.966,  rt_abaixo_95 = 1.52, rt_acima_95 =  4.297 WHERE data = '2020/03/22';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.759,  rt_abaixo_95 = 1.481, rt_acima_95 =  3.93 WHERE data = '2020/03/23';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.584,  rt_abaixo_95 = 1.451, rt_acima_95 =  3.637 WHERE data = '2020/03/24';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.544,  rt_abaixo_95 = 1.537, rt_acima_95 =  3.494 WHERE data = '2020/03/25';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.264,  rt_abaixo_95 = 1.342, rt_acima_95 =  3.13 WHERE data = '2020/03/26';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.096,  rt_abaixo_95 = 1.247, rt_acima_95 =  2.9 WHERE data = '2020/03/27';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.903,  rt_abaixo_95 = 1.103, rt_acima_95 =  2.653 WHERE data = '2020/03/28';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.7,  rt_abaixo_95 = 0.943, rt_acima_95 =  2.417 WHERE data = '2020/03/29';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.449,  rt_abaixo_95 = 0.719, rt_acima_95 =  2.146 WHERE data = '2020/03/30';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.44,  rt_abaixo_95 = 0.731, rt_acima_95 =  2.114 WHERE data = '2020/03/31';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.447,  rt_abaixo_95 = 0.756, rt_acima_95 =  2.096 WHERE data = '2020/04/01';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.545,  rt_abaixo_95 = 0.88, rt_acima_95 =  2.169 WHERE data = '2020/04/02';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.787,  rt_abaixo_95 = 1.165, rt_acima_95 =  2.383 WHERE data = '2020/04/03';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.94,  rt_abaixo_95 = 1.357, rt_acima_95 =  2.496 WHERE data = '2020/04/04';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.06,  rt_abaixo_95 = 1.519, rt_acima_95 =  2.575 WHERE data = '2020/04/06';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.17,  rt_abaixo_95 = 1.677, rt_acima_95 =  2.648 WHERE data = '2020/04/07';
UPDATE `COVID_19`.`dados_covid` SET  rt = 2.07,  rt_abaixo_95 = 1.608, rt_acima_95 =  2.508 WHERE data = '2020/04/08';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.815,  rt_abaixo_95 = 1.38, rt_acima_95 =  2.229 WHERE data = '2020/04/09';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.92,  rt_abaixo_95 = 1.512, rt_acima_95 =  2.307 WHERE data = '2020/04/11';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.845,  rt_abaixo_95 = 1.457, rt_acima_95 =  2.206 WHERE data = '2020/04/13';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.631,  rt_abaixo_95 = 1.261, rt_acima_95 =  1.977 WHERE data = '2020/04/14';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.535,  rt_abaixo_95 = 1.179, rt_acima_95 =  1.868 WHERE data = '2020/04/15';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.579,  rt_abaixo_95 = 1.238, rt_acima_95 =  1.899 WHERE data = '2020/04/16';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.363,  rt_abaixo_95 = 1.032, rt_acima_95 =  1.676 WHERE data = '2020/04/17';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.238,  rt_abaixo_95 = 0.914, rt_acima_95 =  1.547 WHERE data = '2020/04/18';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.288,  rt_abaixo_95 = 0.971, rt_acima_95 =  1.591 WHERE data = '2020/04/20';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.27,  rt_abaixo_95 = 0.96, rt_acima_95 =  1.568 WHERE data = '2020/04/21';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.22,  rt_abaixo_95 = 0.911, rt_acima_95 =  1.51 WHERE data = '2020/04/22';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.277,  rt_abaixo_95 = 0.977, rt_acima_95 =  1.564 WHERE data = '2020/04/23';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.276,  rt_abaixo_95 = 0.978, rt_acima_95 =  1.554 WHERE data = '2020/04/24';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.233,  rt_abaixo_95 = 0.943, rt_acima_95 =  1.509 WHERE data = '2020/04/25';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.217,  rt_abaixo_95 = 0.927, rt_acima_95 =  1.485 WHERE data = '2020/04/26';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.241,  rt_abaixo_95 = 0.959, rt_acima_95 =  1.507 WHERE data = '2020/04/27';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.228,  rt_abaixo_95 = 0.952, rt_acima_95 =  1.491 WHERE data = '2020/04/28';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.199,  rt_abaixo_95 = 0.924, rt_acima_95 =  1.456 WHERE data = '2020/04/29';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.257,  rt_abaixo_95 = 0.988, rt_acima_95 =  1.51 WHERE data = '2020/04/30';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.282,  rt_abaixo_95 = 1.024, rt_acima_95 =  1.535 WHERE data = '2020/05/03';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.276,  rt_abaixo_95 = 1.015, rt_acima_95 =  1.517 WHERE data = '2020/05/04';
UPDATE `COVID_19`.`dados_covid` SET  rt = 1.227,  rt_abaixo_95 = 0.977, rt_acima_95 =  1.47 WHERE data = '2020/05/05';

COMMIT;
### DQLs ###