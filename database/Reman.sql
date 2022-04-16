BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "components" (
	"id"	INTEGER,
	"equipment"	VARCHAR(255),
	"equipmentType"	VARCHAR(255),
	"component"	VARCHAR(255),
	"componentType"	VARCHAR(255),
	"site"	VARCHAR(255),
	"FMS"	REAL,
	"detectionSystem"	VARCHAR(255),
	"isolationSystem"	VARCHAR(255),
	"mitigationSystem"	VARCHAR(255),
	"grupoInventario"	VARCHAR(255),
	"inventoryGroupMass"	REAL,
	"operatingPressure"	REAL,
	"operatingTemperature"	REAL,
	"insideDiameter"	REAL,
	"lengthComponent"	REAL,
	"volumeComponent"	REAL,
	"representativeFluid"	VARCHAR(255),
	"storedFluidPhase"	VARCHAR(255),
	"percentLiquid"	REAL,
	"reynolds"	REAL,
	"toxicComposition"	VARCHAR(255),
	"percentToxicFluid"	REAL,
	"idlh"	VARCHAR(255),
	"instalationDate"	DATETIME,
	"lastInspectionInterna"	DATETIME,
	"rbiDate"	DATETIME,
	"planDate"	DATETIME,
	"turnaroundDate1"	DATETIME,
	"turnaroundDate2"	DATETIME,
	"prazoMax"	INTEGER,
	"maximumProcessTemperature"	REAL,
	"steamTrace"	VARCHAR(255),
	"steamOut"	VARCHAR(255),
	"pwht"	VARCHAR(255),
	"createdAt"	DATETIME NOT NULL,
	"updatedAt"	DATETIME NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sites" (
	"id"	INTEGER,
	"site"	VARCHAR(255) NOT NULL UNIQUE,
	"FMS"	REAL,
	"ativo"	TINYINT(1) NOT NULL,
	"createdAt"	DATETIME NOT NULL,
	"updatedAt"	DATETIME NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "components" VALUES (1,'V-04','Vessel','Casco','Drum','U-2110',10.0,'A','B','0.25','Teste',1000.0,10.2,85.3,1000.2,1000.2,10.3,'','liquid',12.5,123.4,'',12.3,'true','2019-08-06 00:00:00.000 +00:00','2020-07-14 00:00:00.000 +00:00','2021-08-12 00:00:00.000 +00:00','2028-12-05 00:00:00.000 +00:00','2021-08-20 00:00:00.000 +00:00','2021-08-27 00:00:00.000 +00:00',120,123.4,'true','true','true','2021-08-13 18:44:41.302 +00:00','2021-08-13 18:44:41.302 +00:00');
INSERT INTO "components" VALUES (2,'V-04','Vessel','Calota','Drum','U-2110','','','','','','','','','','','','','','','','','','','Invalid date','Invalid date','Invalid date','Invalid date','Invalid date','Invalid date','','','','','','2021-08-16 03:00:37.304 +00:00','2021-08-16 03:00:37.304 +00:00');
INSERT INTO "components" VALUES (12,'V-05','Vessel','Calota','Drum','U-2111','','','','','','','','','','','','','','','','','','','Invalid date','Invalid date','Invalid date','Invalid date','Invalid date','Invalid date','','','','','','2021-08-17 03:40:18.836 +00:00','2021-08-17 03:40:18.836 +00:00');
INSERT INTO "components" VALUES (15,'V-01','Vessel','Casco','Drum','U-2110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-17 04:14:27.056 +00:00','2021-08-17 04:14:27.056 +00:00');
INSERT INTO "components" VALUES (16,'V-01','Vessel','Calota','Drum','U-2110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-17 04:17:45.309 +00:00','2021-08-17 04:17:45.309 +00:00');
INSERT INTO "components" VALUES (17,'V-02','Vessel','Casco','Drum','U-2110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-17 04:18:03.068 +00:00','2021-08-17 04:18:03.068 +00:00');
INSERT INTO "components" VALUES (20,'V-04','Vessel','Casco','Drum','U-2110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-18 17:06:22.186 +00:00','2021-08-18 17:06:22.186 +00:00');
INSERT INTO "components" VALUES (23,'V-05','Vessel','Casco','Drum','U-2111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','');
INSERT INTO "sites" VALUES (1,'U2111',123.0,1,'2021-08-29 12:27:19.421 +00:00','2021-08-29 12:27:19.421 +00:00');
INSERT INTO "sites" VALUES (2,'U-2221',124.0,1,'2021-08-29 12:27:26.947 +00:00','2021-08-29 23:43:01.121 +00:00');
INSERT INTO "sites" VALUES (3,'UFCC',32.0,1,'2021-08-29 12:27:32.668 +00:00','2021-08-29 13:17:46.181 +00:00');
INSERT INTO "sites" VALUES (4,'U-2110',246.0,1,'2021-08-29 12:30:13.431 +00:00','2021-08-29 23:45:49.756 +00:00');
INSERT INTO "sites" VALUES (5,'vilmara',2345678.0,0,'2021-08-29 23:49:11.126 +00:00','2021-08-29 23:49:48.405 +00:00');
INSERT INTO "sites" VALUES (6,'Nicolas',567.0,0,'2021-08-29 23:49:30.477 +00:00','2021-08-29 23:49:45.212 +00:00');
INSERT INTO "sites" VALUES (7,'Teste Delete',1234567.0,0,'2021-08-29 23:55:19.292 +00:00','2021-08-29 23:55:33.771 +00:00');
COMMIT;
