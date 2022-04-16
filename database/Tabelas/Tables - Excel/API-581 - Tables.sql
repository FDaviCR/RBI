BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.1" (
	"RepresentativeFluid"	TEXT,
	"FluidType"	TEXT,
	"ExamplesofApplicableMaterials"	TEXT
);
;
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.7" (
	"DetectionSystemRating"	TEXT,
	"IsolationSystemRating"	TEXT,
	"Concatenar"	TEXT,
	"MaximumLeakDurationld_max"	TEXT,
	"ld_max"	INTEGER,
	"dn"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.11" (
	"ContinuousReleasesDuration(minutes)"	INTEGER,
	"HF-Acid_c"	REAL,
	"HF-Acid_d"	REAL,
	"H2S_c"	REAL,
	"H2S_d"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.8" (
	"Fluid"	TEXT,
	"FluidType"	TEXT,
	"AINL_CONT_Gas_a"	REAL,
	"AINL_CONT_Gas_b"	REAL,
	"AINL_CONT_Liquid_a"	REAL,
	"AINL_CONT_Liquid_b"	REAL,
	"AIL_CONT_Gas_a"	REAL,
	"AIL_CONT_Gas_b"	REAL,
	"AIL_CONT_Liquid_a"	REAL,
	"AIL_CONT_Liquid_b"	REAL,
	"AINL_INST_Gas_a"	REAL,
	"AINL_INST_Gas_b"	REAL,
	"AINL_INST_Liquid_a"	REAL,
	"AINL_INST_Liquid_b"	REAL,
	"AIL_INST_Gas_a"	REAL,
	"AIL_INST_Gas_b"	REAL,
	"AIL_INST_Liquid_a"	REAL,
	"AIL_INST_Liquid_b"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.9" (
	"Fluid"	TEXT,
	"FluidType"	TEXT,
	"AINL_CONT_Gas_a"	REAL,
	"AINL_CONT_Gas_b"	REAL,
	"AINL_CONT_Liquid_a"	REAL,
	"AINL_CONT_Liquid_b"	REAL,
	"AIL_CONT_Gas_a"	REAL,
	"AIL_CONT_Gas_b"	REAL,
	"AIL_CONT_Liquid_a"	REAL,
	"AIL_CONT_Liquid_b"	REAL,
	"AINL_INST_Gas_a"	REAL,
	"AINL_INST_Gas_b"	REAL,
	"AINL_INST_Liquid_a"	REAL,
	"AINL_INST_Liquid_b"	REAL,
	"AIL_INST_Gas_a"	REAL,
	"AIL_INST_Gas_b"	REAL,
	"AIL_INST_Liquid_a"	REAL,
	"AIL_INST_Liquid_b"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.12" (
	"ContinuousReleasesDuration(minutes)"	TEXT,
	"Ammonia_e"	REAL,
	"Ammonia_f"	REAL,
	"Chlorine_e"	REAL,
	"Chlorine_f"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.13" (
	"Chemical"	TEXT,
	"ReleaseDuration(Minutes)"	TEXT,
	"GasReleaseConstants_e"	INTEGER,
	"GasReleaseConstants_f"	REAL,
	"LiquidReleaseConstants_e"	TEXT,
	"LiquidReleaseConstants_f"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.14" (
	"ToxicComponent"	TEXT,
	"ProbitParameters_A"	TEXT,
	"ProbitParameters_B"	TEXT,
	"ProbitParameters_N"	TEXT,
	"IDLH(ppm)"	TEXT,
	"AEGL3-10(ppm)"	TEXT,
	"AEGL3-30(ppm)"	TEXT,
	"AEGL3-60(ppm)"	TEXT,
	"EPAToxicEndpoint(mg/L)"	TEXT,
	"ERPG-3"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.15" (
	"EquipmentType"	TEXT,
	"ComponentType"	TEXT,
	"holecost_Small"	INTEGER,
	"holecost_Medium"	INTEGER,
	"holecost_Large"	INTEGER,
	"holecost_Rupture"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.16" (
	"Material"	TEXT,
	"matcost"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.17" (
	"EquipmentType"	TEXT,
	"ComponentType"	TEXT,
	"outage_Small"	INTEGER,
	"outage_Medium"	INTEGER,
	"outage_Large"	INTEGER,
	"outage_Rupture"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 3 - Table 4.18" (
	"Fluid"	TEXT,
	"FractionEvaporatedin24Hours(a)-fract_evap"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Figure 6.1" (
	"NaOH"	INTEGER,
	"Inferior"	REAL,
	"Superior"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 1 - Table POF_COF_Category" (
	"Category"	TEXT,
	"POF_menor"	TEXT,
	"POF_maior"	TEXT,
	"DF_menor"	TEXT,
	"DF_maior"	TEXT,
	"COF_menor"	TEXT,
	"COF_maior"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 3.1" (
	"EquipmentType"	TEXT,
	"ComponentType"	TEXT,
	"gff_Small"	REAL,
	"gff_Medium"	INTEGER,
	"gff_Large"	INTEGER,
	"gff_Rupture"	INTEGER,
	"field7"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 4.5" (
	"DamageState"	TEXT,
	"LowConfidenceData"	REAL,
	"MediumConfidenceData"	REAL,
	"HighConfidenceData"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 4.6" (
	"ConditionalProbabilityofInspection"	TEXT,
	"E"	REAL,
	"D"	REAL,
	"C"	REAL,
	"B"	REAL,
	"A"	REAL
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 4.8_Ajustar Condicionais" (
	"ThinningMechanism_Fom"	TEXT,
	"KeyProcessVariable"	INTEGER,
	"ElectricalResistanceProbes"	INTEGER,
	"CorrosionCoupons"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 5.4 and 5.5" (
	"YearsSinceLastThoroughVisualInspection"	INTEGER,
	"StripLinedAlloy(Resistant)"	INTEGER,
	"CastableRefractory"	INTEGER,
	"CastableRefractorySevereConditions"	INTEGER,
	"GlassLined"	INTEGER,
	"AcidBrick"	INTEGER,
	"Fiberglass"	INTEGER,
	"Low-qualityImmersionGradeCoating(SprayAppliedto40mils)"	INTEGER,
	"Medium-qualityImmersionGradeCoating(FilledTrowelAppliedto80mils)"	INTEGER,
	"High-qualityImmersionGradeCoating(ReinforcedTrowelApplied?80mils)"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 6.2" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 6.3" (
	"SVI"	INTEGER,
	"E"	INTEGER,
	"1D"	INTEGER,
	"1C"	INTEGER,
	"1B"	INTEGER,
	"1A"	INTEGER,
	"2D"	INTEGER,
	"2C"	INTEGER,
	"2B"	INTEGER,
	"2A"	INTEGER,
	"3D"	INTEGER,
	"3C"	INTEGER,
	"3B"	INTEGER,
	"3A"	INTEGER,
	"4D"	INTEGER,
	"4C"	INTEGER,
	"4B"	INTEGER,
	"4A"	INTEGER,
	"5D"	INTEGER,
	"5C"	INTEGER,
	"5B"	INTEGER,
	"5A"	INTEGER,
	"6D"	INTEGER,
	"6C"	INTEGER,
	"6B"	INTEGER,
	"6A"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 7.2" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 8.2" (
	"pHofWater"	TEXT,
	"<50ppm"	TEXT,
	"50to1000ppm"	TEXT,
	"1000to10000ppm"	TEXT,
	">10000ppm"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 8.3" (
	"EnvironmentalSeverity"	TEXT,
	"As-welded<200"	TEXT,
	"As-welded200to237"	TEXT,
	"As-welded>237"	TEXT,
	"PWHT<200"	TEXT,
	"PWHT200to237"	TEXT,
	"PWHT>237"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 8.4" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 9.2" (
	"pHofWater"	TEXT,
	"<50ppm"	TEXT,
	"50to1000ppm"	TEXT,
	"1000to10000ppm"	TEXT,
	">10000ppm"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 9.3" (
	"EnvironmentalSeverity"	TEXT,
	"HighSulfurSteela>0.01%S_Aswelded"	TEXT,
	"HighSulfurSteela>0.01%S_PWHT"	TEXT,
	"LowSulfurSteel?0.01%S_Aswelded"	TEXT,
	"LowSulfurSteel?0.01%S_PWHT"	TEXT,
	"ProductForm - Seamless/ExtrudedPipe_Aswelded"	TEXT,
	"ProductForm - Seamless/ExtrudedPipe_PWHT"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 9.4" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 10.2" (
	"pHofWater"	TEXT,
	"PWHT_CO3AllConcentrations"	TEXT,
	"NOPWHT_CO3<100ppm"	TEXT,
	"NOPWHT_CO3?100ppm"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 10.3" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 11.2" (
	"Material"	TEXT,
	"less427_SolutionAnnealed(default)"	TEXT,
	"less427_StabilizedBeforeWelding"	TEXT,
	"less427_StabilizedAfterWelding"	TEXT,
	"equalmore427_SolutionAnnealed(default)"	TEXT,
	"equalmore427_StabilizedBeforeWelding"	TEXT,
	"equalmore427_StabilizedAfterWelding"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 11.3" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 12.2" (
	"Temperature(C)"	TEXT,
	"lessequal10_1to10"	TEXT,
	"lessequal10_11to100"	TEXT,
	"lessequal10_101to1000"	TEXT,
	"lessequal10_>1000"	TEXT,
	"more10_1to10"	TEXT,
	"more10_11to100"	TEXT,
	"more10_101to1000"	TEXT,
	"more10_>1000"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 12.3" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 13.2" (
	"Susceptibility"	TEXT,
	"<200"	TEXT,
	"200to237"	TEXT,
	">237"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 13.3" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 14.2" (
	"WeldCondition"	TEXT,
	"LowSulfurSteel?0.01%S"	TEXT,
	"HighSulfurSteel>0.01%S"	TEXT,
	"ProductForm - Seamless/ExtrudedPipe"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 14.3" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 15.2" (
	"OperatingTemperature(C)"	INTEGER,
	"Severe"	INTEGER,
	"Moderate"	INTEGER,
	"Mild"	INTEGER,
	"Dry"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 16.2" (
	"OperatingTemperature(C)"	INTEGER,
	"Severe"	INTEGER,
	"Moderate"	INTEGER,
	"Mild"	INTEGER,
	"Dry"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 16.3" (
	"InsulationType"	TEXT,
	"AdjustmentFactorFINS"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 17.2" (
	"OperatingTemperature(C)"	TEXT,
	"Severe"	TEXT,
	"Moderate"	TEXT,
	"Mild"	TEXT,
	"Dry"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 17.3" (
	"Susceptibility"	TEXT,
	"SeverityIndex - SVI"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Part 2 - Table 18.2" (
	"OperatingTemperature(C)"	TEXT,
	"Severe"	TEXT,
	"Moderate"	TEXT,
	"Mild"	TEXT,
	"Dry"	TEXT
);
CREATE TABLE IF NOT EXISTS "Part 3.B - Table 3.B.2.1" (
	"ConversionFactor"	TEXT,
	"SIUnits"	INTEGER
);
INSERT INTO "Part 3 - Table 4.1" VALUES ('C1-C2','TYPE 0','Methane, ethane, ethylene, LNG, fuel gas');
INSERT INTO "Part 3 - Table 4.1" VALUES ('C3-C4','TYPE 0','Propane, butane, isobutane, LPG');
INSERT INTO "Part 3 - Table 4.1" VALUES ('C5','TYPE 0','Pentane');
INSERT INTO "Part 3 - Table 4.1" VALUES ('C6-C8','TYPE 0','Gasoline, naphtha, light straight run, heptane');
INSERT INTO "Part 3 - Table 4.1" VALUES ('C9-C12','TYPE 0','Diesel, kerosene');
INSERT INTO "Part 3 - Table 4.1" VALUES ('C13-C16','TYPE 0','Jet fuel, kerosene, atmospheric gas oil');
INSERT INTO "Part 3 - Table 4.1" VALUES ('C17-C25','TYPE 0','Gas oil, typical crude');
INSERT INTO "Part 3 - Table 4.1" VALUES ('C25+','TYPE 0','Residuum, heavy crude, lube oil, seal oil');
INSERT INTO "Part 3 - Table 4.1" VALUES ('H2','TYPE 0','Hydrogen');
INSERT INTO "Part 3 - Table 4.1" VALUES ('H2S','TYPE 0','Hydrogen sulfide');
INSERT INTO "Part 3 - Table 4.1" VALUES ('HF','TYPE 0','Hydrogen fluoride');
INSERT INTO "Part 3 - Table 4.1" VALUES ('HCl(Acid)','TYPE 0','Hydrochloric acid');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Water','TYPE 0','Water');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Steam','TYPE 0','Steam');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Acid/Caustic','TYPE 0','Acid, caustic');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Aromatics','TYPE 1','Benzene, toluene, xylene, cumene');
INSERT INTO "Part 3 - Table 4.1" VALUES ('AlCl3','TYPE 0','Aluminum chloride');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Pyrophoric','TYPE 0','Pyrophoric materials');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Ammonia','TYPE 0','Ammonia');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Chlorine','TYPE 0','Chlorine');
INSERT INTO "Part 3 - Table 4.1" VALUES ('CO','TYPE 1','Carbon monoxide');
INSERT INTO "Part 3 - Table 4.1" VALUES ('DEE','TYPE 0','Diethyl ether');
INSERT INTO "Part 3 - Table 4.1" VALUES ('HCl(Gas)','TYPE 1','Hydrogen chloride');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Nitric acid','TYPE 1','Nitric acid');
INSERT INTO "Part 3 - Table 4.1" VALUES ('NO2','TYPE 1','Nitrogen dioxide');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Phosgene','TYPE 0','Phosgene');
INSERT INTO "Part 3 - Table 4.1" VALUES ('TDI','TYPE 1','Toluene diisocyanate');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Methanol','TYPE 1','Methanol');
INSERT INTO "Part 3 - Table 4.1" VALUES ('PO','TYPE 1','Propylene oxide');
INSERT INTO "Part 3 - Table 4.1" VALUES ('Styrene','TYPE 1','Styrene');
INSERT INTO "Part 3 - Table 4.1" VALUES ('EEA','TYPE 1','Ethylene glycol monoethyl ether acetate');
INSERT INTO "Part 3 - Table 4.1" VALUES ('EE','TYPE 1','Ethylene glycol monoethyl ether');
INSERT INTO "Part 3 - Table 4.1" VALUES ('EG','TYPE 1','Ethylene glycol');
INSERT INTO "Part 3 - Table 4.1" VALUES ('EO','TYPE 1','Ethylene oxide');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C1-C2',23,250.512,-125,'Gas','Note 1','4.927.567.573','12.3','0.115','-0.0000287','-1.30E-09','N/A','558');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C3-C4',51,538.379,-21,'Gas','Note 1','9.902.713.866','2.632','0.3188','-0.000135','1.47E-08','N/A','369');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C5',72,625.199,36,'Liquid','Note 1','1.383.723.981','-3.626','0.4873','-0.00026','0.000000053','N/A','284');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C6-C8',100,684.018,99,'Liquid','Note 1','1.914.361.528','-5.146','0.676','-0.000365','7.66E-08','N/A','223');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C9-C12',149,734.012,184,'Liquid','Note 1','2.840.370.859','-8.5','1.01','-0.000556','0.000000118','N/A','208');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C13-C16',205,764.527,261,'Liquid','Note 1','3.902.537.733','-11.7','1.39','-0.000772','0.000000167','N/A','202');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C17-C25',280,775.019,344,'Liquid','Note 1','5.118.873.889','-22.4','1.94','-0.00112','-0.000000253','N/A','202');
INSERT INTO "Part 3 - Table 4.2" VALUES ('C25+',422,900.026,527,'Liquid','Note 1','5.118.873.889','-22.4','1.94','-0.00112','-0.000000253','N/A','202');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Pyrophoric',149,734.012,184,'Liquid','Note 1','2.840.370.859','-8.5','1.01','-0.000556','0.000000118','N/A','Note 4');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Aromatics',104,683.986,145,'Liquid','Note 2','4.231.658.641','89300','215000','772','99900','2440','490');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Styrene',104,683.986,145,'Liquid','Note 2','4.231.658.641','89300','215000','772','99900','2440','490');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Water',18,997.947,100,'Liquid','Note 3','7.595.710.694','276000','-2090','8.125','-0.0141','0.00000937','N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Steam',18,997.947,100,'Gas','Note 3','1.86E+13','33400','26800','2610','8900','1170','N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Acid/Caustic',18,997.947,100,'Liquid','Note 3','7.595.710.694','276000','-2090','8.125','-0.0141','0.00000937','N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Methanol',32,800.92,65,'Liquid','Note 2','767216463.6','39300','87900','1920','53700','897','464');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Ammonia',17.03,0.769,-33.34,'Gas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('H2',2,71.01,-253,'Gas','Note 1','2.898.956.409','27.1','0.00927','-0.0000138','7.65E-09','N/A','400');
INSERT INTO "Part 3 - Table 4.2" VALUES ('H2S',34,993.029,-59,'Gas','Note 1','3.491.940.033','31.9','0.00144','0.0000243','-1.18E-08','N/A','260');
INSERT INTO "Part 3 - Table 4.2" VALUES ('HF',20,967.031,20,'Gas','Note 1','2.919.036.854','29.1','0.000661','-0.00000203','2.50E-09','N/A','17760');
INSERT INTO "Part 3 - Table 4.2" VALUES ('HCl(Gas)',36,'1.185.362',-85,'Gas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('CO',28,800.92,-191,'Gas','Note 2','9.495.336.888','29100','8770','3090','8460','1540','609');
INSERT INTO "Part 3 - Table 4.2" VALUES ('DEE',74,720.828,35,'Liquid','Note 2','11764790771','86200','255000','1540','144000','-689','160');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Nitric acid',63,'1.521.749',121,'Liquid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('AlCl3',133.5,'2.434.798',194,'Powder','Note 1','1.06E+12','43400','39700','417','24000','N/A','558');
INSERT INTO "Part 3 - Table 4.2" VALUES ('NO2',90,929.068,135,'Liquid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('Phosgene',99,'1.377.583',83,'Liquid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N/A');
INSERT INTO "Part 3 - Table 4.2" VALUES ('TDI',174,'1.217.399',251,'Liquid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'620');
INSERT INTO "Part 3 - Table 4.2" VALUES ('PO',58,832.957,34,'Liquid','Note 2','6164820945','49500','174000','1560','115000','702','449');
INSERT INTO "Part 3 - Table 4.2" VALUES ('EEA',132,977.123,156,'Liquid','Note 2','64175524.47','106000','240000','659','150000','1970','379');
INSERT INTO "Part 3 - Table 4.2" VALUES ('EE',90,929.068,135,'Liquid','Note 2','35436975773','32500','300000','1170','208000','473','235');
INSERT INTO "Part 3 - Table 4.2" VALUES ('EG',62,1105.27,197,'Liquid','Note 2','3493964820','63000','146000','1670','97300','774','396');
INSERT INTO "Part 3 - Table 4.2" VALUES ('EO',44,881.013,11,'Gas','Note 2','2757924883','33500','121000','1610','82400','737','429');
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','A','AA','20 minutes for 6.4 mm leaks',20,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','B','AB','30 minutes for 6.4 mm leaks',30,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','C','AC','40 minutes for 6.4 mm leaks',40,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','A','BA','40 minutes for 6.4 mm leaks',40,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','B','BB','40 minutes for 6.4 mm leaks',40,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','C','BC','1 hour for 6.4 mm leaks',60,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','A','CA','1 hour for 6.4 mm leaks',60,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','B','CB','1 hour for 6.4 mm leaks',60,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','C','CC','1 hour for 6.4 mm leaks',60,6.4);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','A','AA','10 minutes for 25 mm leaks',10,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','B','AB','20 minutes for 25 mm leaks',20,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','C','AC','30 minutes for 25 mm leaks',30,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','A','BA','30 minutes for 25 mm leaks',30,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','B','BB','30 minutes for 25 mm leaks',30,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','C','BC','30 minutes for 25 mm leaks',30,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','A','CA','40 minutes for 25 mm leaks',40,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','B','CB','40 minutes for 25 mm leaks',40,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','C','CC','40 minutes for 25 mm leaks',40,25);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','A','AA','5 minutes for 102 mm leaks',5,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','B','AB','10 minutes for 102 mm leaks',10,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('A','C','AC','20 minutes for 102 mm leaks',20,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','A','BA','20 minutes for 102 mm leaks',20,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','B','BB','20 minutes for 102 mm leaks',20,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('B','C','BC','20 minutes for 102 mm leaks',20,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','A','CA','20 minutes for 102 mm leaks',20,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','B','CB','20 minutes for 102 mm leaks',20,102);
INSERT INTO "Part 3 - Table 4.7" VALUES ('C','C','CC','20 minutes for 102 mm leaks',20,102);
INSERT INTO "Part 3 - Table 4.11" VALUES (5,1.1401,3.5683,1.2411,3.9686);
INSERT INTO "Part 3 - Table 4.11" VALUES (10,1.1031,3.8431,1.241,4.0948);
INSERT INTO "Part 3 - Table 4.11" VALUES (20,1.0816,4.104,1.237,4.238);
INSERT INTO "Part 3 - Table 4.11" VALUES (40,1.0942,4.3295,1.2297,4.3626);
INSERT INTO "Part 3 - Table 4.11" VALUES (60,1.1031,4.4576,1.2266,4.4365);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C1-C2','TYPE 0',8.669,0.98,NULL,NULL,55.13,0.95,NULL,NULL,6.469,0.67,NULL,NULL,163.7,0.62,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C3-C4','TYPE 0',10.13,1.0,NULL,NULL,64.23,1.0,NULL,NULL,4.59,0.72,NULL,NULL,79.94,0.63,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C5','TYPE 0',5.115,0.99,100.6,0.89,62.41,1.0,NULL,NULL,2.214,0.73,0.271,0.85,41.38,0.61,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C6-C8','TYPE 0',5.846,0.98,34.17,0.89,63.98,1.0,103.4,0.95,2.188,0.66,0.749,0.78,41.49,0.61,8.18,0.55);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C9-C12','TYPE 0',2.419,0.98,24.6,0.9,76.98,0.95,110.3,0.95,1.111,0.66,0.559,0.76,42.28,0.61,0.848,0.53);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C13-C16','TYPE 0',NULL,NULL,12.11,0.9,NULL,NULL,196.7,0.92,NULL,NULL,0.086,0.88,NULL,NULL,1.714,0.88);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C17-C25','TYPE 0',NULL,NULL,3.785,0.9,NULL,NULL,165.5,0.92,NULL,NULL,0.021,0.91,NULL,NULL,1.068,0.91);
INSERT INTO "Part 3 - Table 4.8" VALUES ('C25+','TYPE 0',NULL,NULL,2.098,0.91,NULL,NULL,103.0,0.9,NULL,NULL,0.006,0.99,NULL,NULL,0.284,0.99);
INSERT INTO "Part 3 - Table 4.8" VALUES ('Pyrophoric','TYPE 1',2.419,0.98,24.6,0.9,76.98,0.95,110.3,0.95,1.111,0.66,0.559,0.76,42.28,0.61,0.848,0.53);
INSERT INTO "Part 3 - Table 4.8" VALUES ('Aromatics','TYPE 1',3.952,1.097,21.1,0.0,80.11,1.055,NULL,NULL,1.804,0.667,14.36,0.0,83.68,0.713,143.6,0.0);
INSERT INTO "Part 3 - Table 4.8" VALUES ('Styrene','TYPE 1',3.952,1.097,21.1,0.0,80.11,1.055,NULL,NULL,1.804,0.667,14.36,0.0,83.68,0.713,143.6,1.0);
INSERT INTO "Part 3 - Table 4.8" VALUES ('Water','TYPE 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('Steam','TYPE 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('Acid/Caustic','TYPE 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('Methanol','TYPE 1',0.005,0.909,340.4,0.934,NULL,NULL,NULL,NULL,4.425,0.667,0.363,0.9,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('H2','TYPE 0',13.13,0.992,NULL,NULL,86.02,1.0,NULL,NULL,9.605,0.657,NULL,NULL,216.5,0.618,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('H2S','TYPE 0',6.554,1.0,NULL,NULL,38.11,0.89,NULL,NULL,22.63,0.63,NULL,NULL,53.72,0.61,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('HF','TYPE 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('CO','TYPE 1',0.04,1.752,NULL,NULL,NULL,NULL,NULL,NULL,10.97,0.667,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('DEE','TYPE 1',9.072,1.134,164.2,1.106,67.42,1.033,976.0,0.649,24.51,0.667,0.981,0.919,NULL,NULL,1.09,0.919);
INSERT INTO "Part 3 - Table 4.8" VALUES ('PO','TYPE 1',3.277,1.114,257.0,0.96,NULL,NULL,NULL,NULL,10.32,0.667,0.629,0.869,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('EEA','TYPE 1',0.0,1.035,23.96,0.0,NULL,NULL,NULL,NULL,1.261,0.667,14.13,0.0,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('EE','TYPE 1',2.595,1.005,35.45,0.0,NULL,NULL,NULL,NULL,6.119,0.667,14.79,0.0,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('EG','TYPE 1',1.548,0.973,22.12,0.0,NULL,NULL,NULL,NULL,1.027,0.667,14.13,0.0,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.8" VALUES ('EO','TYPE 1',6.712,1.069,NULL,NULL,NULL,NULL,NULL,NULL,21.46,0.667,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C1-C2','TYPE 0',21.83,0.96,NULL,NULL,143.2,0.92,NULL,NULL,12.46,0.67,NULL,NULL,473.9,0.63,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C3-C4','TYPE 0',25.64,1.0,NULL,NULL,171.4,1.0,NULL,NULL,9.702,0.75,NULL,NULL,270.4,0.63,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C5','TYPE 0',12.71,1.0,290.1,0.89,166.1,1.0,NULL,NULL,4.82,0.76,0.79,0.85,146.7,0.63,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C6-C8','TYPE 0',13.49,0.96,96.88,0.89,169.7,1.0,252.8,0.92,4.216,0.67,2.186,0.78,147.2,0.63,31.89,0.54);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C9-C12','TYPE 0',5.755,0.96,70.03,0.89,188.6,0.92,269.4,0.92,2.035,0.66,1.609,0.76,151.0,0.63,2.847,0.54);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C13-C16','TYPE 0',NULL,NULL,34.36,0.89,NULL,NULL,539.4,0.9,NULL,NULL,0.242,0.88,NULL,NULL,4.843,0.88);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C17-C25','TYPE 0',NULL,NULL,10.7,0.89,NULL,NULL,458.0,0.9,NULL,NULL,0.061,0.91,NULL,NULL,3.052,0.91);
INSERT INTO "Part 3 - Table 4.9" VALUES ('C25+','TYPE 0',NULL,NULL,6.196,0.89,NULL,NULL,303.6,0.9,NULL,NULL,0.016,0.99,NULL,NULL,0.833,0.99);
INSERT INTO "Part 3 - Table 4.9" VALUES ('Pyrophoric','TYPE 1',5.755,0.96,70.03,0.89,188.6,0.92,269.4,0.92,2.035,0.66,1.609,0.76,151.0,0.63,2.847,0.54);
INSERT INTO "Part 3 - Table 4.9" VALUES ('Aromatics','TYPE 1',12.76,0.963,66.01,0.883,261.9,0.937,56.0,0.268,2.889,0.686,0.027,0.935,83.68,0.713,0.273,0.935);
INSERT INTO "Part 3 - Table 4.9" VALUES ('Styrene','TYPE 1',12.76,0.963,66.01,0.883,261.9,0.937,56.0,0.268,2.889,0.686,0.027,0.935,83.68,0.713,0.273,0.935);
INSERT INTO "Part 3 - Table 4.9" VALUES ('HF','TYPE 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('Water','TYPE 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('Acid/Caustic','TYPE 0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('Steam','TYPE 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('Methanol','TYPE 0',0.0,1.008,849.9,0.902,NULL,NULL,NULL,NULL,6.035,0.688,1.157,0.871,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('H2','TYPE 0',32.05,0.933,NULL,NULL,228.8,1.0,NULL,NULL,18.43,0.652,NULL,NULL,636.5,0.621,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('H2S','TYPE 0',10.65,1.0,NULL,NULL,73.25,0.94,NULL,NULL,41.43,0.63,NULL,NULL,191.5,0.63,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('CO','TYPE 1',5.491,0.991,NULL,NULL,NULL,NULL,NULL,16.91,0.692,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('DEE','TYPE 1',26.76,1.025,236.7,1.219,241.5,0.997,488.9,0.864,31.71,0.682,8.333,0.814,128.3,0.657,9.258,0.814);
INSERT INTO "Part 3 - Table 4.9" VALUES ('PO','TYPE 1',8.239,1.047,352.8,0.84,NULL,NULL,NULL,NULL,13.33,0.682,2.732,0.834,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('EEA','TYPE 1',0.0,0.946,79.66,0.835,NULL,NULL,NULL,NULL,1.825,0.687,0.03,0.924,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('EE','TYPE 1',7.107,0.969,8.142,0.8,NULL,NULL,NULL,NULL,25.36,0.66,0.029,0.927,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('EG','TYPE 1',5.042,0.947,59.96,0.869,NULL,NULL,NULL,NULL,1.435,0.687,0.027,0.922,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.9" VALUES ('EO','TYPE 1',11.0,1.105,NULL,NULL,NULL,NULL,NULL,NULL,34.7,0.665,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.12" VALUES ('5',636.7,1.183,3350.0,1.097);
INSERT INTO "Part 3 - Table 4.12" VALUES ('10',846.3,1.181,3518.0,1.095);
INSERT INTO "Part 3 - Table 4.12" VALUES ('15',1053.0,1.18,3798.0,1.092);
INSERT INTO "Part 3 - Table 4.12" VALUES ('20',1256.0,1.178,4191.0,1.089);
INSERT INTO "Part 3 - Table 4.12" VALUES ('25',1455.0,1.176,4694.0,1.085);
INSERT INTO "Part 3 - Table 4.12" VALUES ('30',1650.0,1.174,5312.0,1.082);
INSERT INTO "Part 3 - Table 4.12" VALUES ('35',1842.0,1.172,6032.0,1.077);
INSERT INTO "Part 3 - Table 4.12" VALUES ('40',2029.0,1.169,6860.0,1.072);
INSERT INTO "Part 3 - Table 4.12" VALUES ('45',2213.0,1.166,7788.0,1.066);
INSERT INTO "Part 3 - Table 4.12" VALUES ('50',2389.0,1.161,8798.0,1.057);
INSERT INTO "Part 3 - Table 4.12" VALUES ('55',2558.0,1.155,9890.0,1.046);
INSERT INTO "Part 3 - Table 4.12" VALUES ('60',2714.0,1.145,10994.0,1.026);
INSERT INTO "Part 3 - Table 4.12" VALUES ('Instantaneous Releases',2.684,0.9011,3.528,1.177);
INSERT INTO "Part 3 - Table 4.13" VALUES ('AlCl3','All',3.4531,0.9411,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('CO','3',9.55,1.15,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('CO','5',60.09,1.06,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('CO','10',189.42,1.13,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('CO','20',651.49,1.11,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('CO','40',1252.67,1.17,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('CO','60',1521.89,1.21,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('HCl(Gas)','3',47.39,1.09,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('HCl(Gas)','5',123.67,1.15,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('HCl(Gas)','10',531.45,1.1,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('HCl(Gas)','20',950.02,1.18,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('HCl(Gas)','40',1851.8,1.2,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('HCl(Gas)','60',2118.87,1.23,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Nitric acid','3',13230.9,1.25,'1114.96','1.08');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Nitric acid','5',17146,1.25,'2006.1','1.02');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Nitric acid','10',23851.3,1.24,'2674.47','1.06');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Nitric acid','20',31185,1.23,'4112.65','1.06');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Nitric acid','40',35813.7,1.22,'6688.99','1.06');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Nitric acid','60',38105.8,1.22,'9458.29','1.12');
INSERT INTO "Part 3 - Table 4.13" VALUES ('NO2','3',1071.74,0.7,'430','0.98');
INSERT INTO "Part 3 - Table 4.13" VALUES ('NO2','5',1466.57,0.68,'610.31','1.04');
INSERT INTO "Part 3 - Table 4.13" VALUES ('NO2','10',1902.9,0.68,'1340.93','1.07');
INSERT INTO "Part 3 - Table 4.13" VALUES ('NO2','20',2338.76,0.72,'3020.54','1.08');
INSERT INTO "Part 3 - Table 4.13" VALUES ('NO2','40',3621.1,0.7,'6110.67','1.12');
INSERT INTO "Part 3 - Table 4.13" VALUES ('NO2','60',4070.48,0.71,'9455.68','1.13');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Phosgene','3',3095.33,1.2,'733.39','1.06');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Phosgene','5',5918.49,1.29,'1520.02','1.1');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Phosgene','10',12129.3,1.24,'4777.72','1.12');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Phosgene','20',27459.6,1.27,'14727.5','1.16');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Phosgene','40',63526.4,1.3,'42905','1.2');
INSERT INTO "Part 3 - Table 4.13" VALUES ('Phosgene','60',96274.2,1.31,'77287.7','1.23');
INSERT INTO "Part 3 - Table 4.13" VALUES ('TDI','3','N/A','N/A','793.04','1.06');
INSERT INTO "Part 3 - Table 4.13" VALUES ('TDI','5','N/A','N/A','846.54','1.09');
INSERT INTO "Part 3 - Table 4.13" VALUES ('TDI','10','N/A','N/A','1011.9','1.1');
INSERT INTO "Part 3 - Table 4.13" VALUES ('TDI','20','N/A','N/A','1026.06','1.06');
INSERT INTO "Part 3 - Table 4.13" VALUES ('TDI','40','N/A','N/A','1063.8','1.06');
INSERT INTO "Part 3 - Table 4.13" VALUES ('TDI','60','N/A','N/A','1252.57','1.03');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EE','1.5',0.8954,1.171,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EE','3',1.7578,1.181,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EE','5',4.0002,1.122,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EE','10',7.54,1.111,'0.6857','1.105');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EE','20',24.56,0.971,'3.6389','1.065');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EE','40',31.22,0.995,'9.8422','1.132');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EE','60',59.67,0.899,'23.513','1.104');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EO','1.5',0.5085,1.222,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EO','3',2.972,1.207,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EO','5',7.9931,1.271,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EO','10',47.69,1.2909,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EO','20',237.57,1.2849,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EO','40',1088.4,1.1927,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('EO','60',1767.5,1.203,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('PO','3',0.0008,1.913,'N/A','N/A');
INSERT INTO "Part 3 - Table 4.13" VALUES ('PO','5',0.0864,1.217,'2.4084','1.198');
INSERT INTO "Part 3 - Table 4.13" VALUES ('PO','10',0.1768,1.2203,'9.0387','1.111');
INSERT INTO "Part 3 - Table 4.13" VALUES ('PO','20',0.4172,1.2164,'17.425','1.114');
INSERT INTO "Part 3 - Table 4.13" VALUES ('PO','40',0.9537,1.2097,'34.255','1.118');
INSERT INTO "Part 3 - Table 4.13" VALUES ('PO','60',1.2289,1.2522,'367.06','0.9855');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Acrolein','-9.93','2.05','1','2',NULL,NULL,NULL,'0.5',NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Acrylonitrile','-29.42','3.01','1.43','85',NULL,NULL,NULL,'0.08','75');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Aluminum trichloride','-14.65','2','1',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Ammonia','-35.9','1.85','2','10',NULL,NULL,NULL,'0.14','750');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Benzene','-109.8','5.3','2','500',NULL,NULL,NULL,NULL,'1000');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Bromine','-9.04','0.92','2','3',NULL,NULL,NULL,'0.01','5');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Carbon monoxide','-37.98','3.7','1','1200','1700','600','330',NULL,'500');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Carbon tetrachloride','-6.29','0.41','2.5','200',NULL,NULL,NULL,NULL,'750');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Chlorine','-8.29','0.92','2','10',NULL,'28','20','0.01','20');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Ethylene glycol monoethyl ether','-15.54','1','2',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Ethylene oxide','-6.21','1','1','800',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Formaldehyde','-12.24','1.3','2','20',NULL,NULL,NULL,'0.01','25');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Hydrogen chloride','-16.85','2','1','50','620','210','100','0.03','150');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Hydrogen cyanide','-29.42','3.01','1.43','50','27','21','15',NULL,'25');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Hydrogen fluoride','-48.33','4.853','1','30','170','62','44',NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Hydrogen sulfide','-31.42','3.01','1.43','100','76','60','50',NULL,'100');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Methanol',NULL,NULL,NULL,NULL,'15000','15000','7900',NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Methyl bromide','-56.81','5.27','1',NULL,NULL,NULL,NULL,NULL,'200');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Methyl isocyanate','-5.64','1.64','0.65',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Nitric acid','-5.48','1','2',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Nitrogen dioxide','-13.79','1.4','2','20',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Phosgene','-19.27','3.69','1','2','3.6','1.5','0.75',NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Propylene oxide','-7.415','0.509','2','400',NULL,NULL,NULL,'0.59','750');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Styrene',NULL,NULL,NULL,'700',NULL,NULL,NULL,NULL,'1000');
INSERT INTO "Part 3 - Table 4.14" VALUES ('Sulphur dioxide','-15.67','2.1','1','100',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Toluene','-6.79','0.41','2.5','500','1600','900','630',NULL,NULL);
INSERT INTO "Part 3 - Table 4.14" VALUES ('Toluene diisocyanate','-4.49','1','2',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Compressor','COMPC',10000,20000,100000,300000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Compressor','COMPR',5000,10000,50000,100000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Heat exchanger','HEXSS',1000,2000,20000,60000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Heat exchanger','HEXTS',1000,2000,20000,60000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Heat exchanger','HEXTUBE',1000,2000,20000,60000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-1',5,0,0,20);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-2',5,0,0,40);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-4',5,10,0,60);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-6',5,20,0,120);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-8',5,30,60,180);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-10',5,40,80,240);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-12',5,60,120,360);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPE-16',5,80,160,500);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pipe','PIPEGT16',10,120,240,700);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pump','PUMP2S',1000,2500,5000,5000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pump','PUMP1S',1000,2500,5000,5000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Pump','PUMPR',1000,2500,5000,10000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Tank650','TANKBOTTOM',5000,0,0,120000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Tank650','COURSE-1-10',5000,12000,20000,40000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','FINFAN_TUBE',1000,2000,20000,60000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','FINFAN',1000,2000,20000,60000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','KODRUM',5000,12000,20000,40000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','DRUM',5000,12000,20000,40000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','FILTER',1000,2000,4000,10000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','REACTOR',10000,24000,40000,80000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','COLBTM',10000,25000,50000,100000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','COLTOP',10000,25000,50000,100000);
INSERT INTO "Part 3 - Table 4.15" VALUES ('Vessel','COLMID',10000,25000,50000,100000);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Carbon Steel',1.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Organic Coatings (< 80 mil)',1.2);
INSERT INTO "Part 3 - Table 4.16" VALUES ('1.25Cr-0.5Mo',1.3);
INSERT INTO "Part 3 - Table 4.16" VALUES ('2.25Cr-1Mo',1.7);
INSERT INTO "Part 3 - Table 4.16" VALUES ('5Cr-0.5Mo',1.7);
INSERT INTO "Part 3 - Table 4.16" VALUES ('7Cr-0.5Mo',2.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Clad 304 SS',2.1);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Fiberglass',2.5);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Polypropylene Lined (pp)',2.5);
INSERT INTO "Part 3 - Table 4.16" VALUES ('9Cr-1Mo',2.6);
INSERT INTO "Part 3 - Table 4.16" VALUES ('405 SS',2.8);
INSERT INTO "Part 3 - Table 4.16" VALUES ('410 SS',2.8);
INSERT INTO "Part 3 - Table 4.16" VALUES ('304 SS',3.2);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Clad 316 SS',3.3);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Strip Lined Alloy',3.3);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Organic Coating (> 80 mil)',3.4);
INSERT INTO "Part 3 - Table 4.16" VALUES ('CS �Saran� Lined',3.4);
INSERT INTO "Part 3 - Table 4.16" VALUES ('CS Rubber Lined',4.4);
INSERT INTO "Part 3 - Table 4.16" VALUES ('316 SS',4.8);
INSERT INTO "Part 3 - Table 4.16" VALUES ('CS Glass Lined',5.8);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Clad Alloy 400',6.4);
INSERT INTO "Part 3 - Table 4.16" VALUES ('90/10 Cu/Ni',6.8);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Clad Alloy 600',7.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('CS �Teflon� Lined',7.8);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Clad Nickel',8.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Alloy 800',8.4);
INSERT INTO "Part 3 - Table 4.16" VALUES ('70/30 Cu/Ni',8.5);
INSERT INTO "Part 3 - Table 4.16" VALUES ('904L',8.8);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Alloy 20',11.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Alloy 400',15.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Alloy 600',15.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Nickel',18.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Acid Brick',20.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Refractory',20.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Alloy 625',26.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Titanium',28.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Alloy �C�',29.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Zirconium',34.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Alloy �B�',36.0);
INSERT INTO "Part 3 - Table 4.16" VALUES ('Tantalum',535.0);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Compressor','COMPC',0,3,7,0);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Compressor','COMPR',0,3,7,0);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Heat exchanger','HEXSS',2,3,3,10);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Heat exchanger','HEXTS',2,3,3,10);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Heat exchanger','HEXTUBE',0,0,0,0);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-1',0,0,0,1);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-2',0,0,0,1);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-4',0,1,0,2);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-6',0,1,2,3);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-8',0,2,2,3);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-10',0,2,2,4);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-12',1,3,4,4);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPE-16',1,3,4,5);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pipe','PIPEGT16',1,4,5,7);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pump','PUMP2S',0,0,0,0);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pump','PUMP1S',0,0,0,0);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Pump','PUMPR',0,0,0,0);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Tank650','TANKBOTTOM',5,0,0,50);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Tank650','COURSE-1-10',2,3,3,14);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','KODRUM',2,3,3,10);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','FINFAN',0,0,2,3);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','FILTER',0,1,2,3);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','DRUM',2,3,3,10);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','REACTOR',4,6,6,21);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','COLBTM',3,4,5,21);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','COLTOP',3,4,5,21);
INSERT INTO "Part 3 - Table 4.17" VALUES ('Vessel','COLMID',3,4,5,21);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C1-C2',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C3-C4',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C5',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C6-C8',0.9);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C9-C12',0.5);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C13-C16',0.1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C17-C25',0.05);
INSERT INTO "Part 3 - Table 4.18" VALUES ('C25+',0.02);
INSERT INTO "Part 3 - Table 4.18" VALUES ('H2',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('H2S',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('HF',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('HCl(Acid)',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Water',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Steam',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Acid/Caustic',0.9);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Aromatics',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('AlCl3',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Pyrophoric',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Ammonia',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Chlorine',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('CO',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('DEE',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('HCl(Gas)',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Nitric acid',0.8);
INSERT INTO "Part 3 - Table 4.18" VALUES ('NO2',0.75);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Phosgene',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('TDI',0.15);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Methanol',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('PO',1);
INSERT INTO "Part 3 - Table 4.18" VALUES ('Styrene',0.6);
INSERT INTO "Part 3 - Table 4.18" VALUES ('EEA',0.65);
INSERT INTO "Part 3 - Table 4.18" VALUES ('EE',0.75);
INSERT INTO "Part 3 - Table 4.18" VALUES ('EG',0.45);
INSERT INTO "Part 3 - Table 4.18" VALUES ('EO',1);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.072686567,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.198238806,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.323791045,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.449343284,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.574895522,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.700447761,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.826,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (0.951552239,81.8332872,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.077104478,81.54221453,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.202656716,81.54221453,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.328208955,81.54221453,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.453761194,81.54221453,100);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.579313433,81.54221453,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.704865672,81.54221453,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.83041791,81.54221453,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (1.955970149,81.54221453,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.081522388,81.25114187,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.207074627,81.25114187,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.332626866,81.25114187,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.458179104,81.25114187,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.583731343,81.25114187,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.709283582,81.25114187,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.834835821,81.25114187,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (2.96038806,80.9600692,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.085940299,80.9600692,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.211492537,80.9600692,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.337044776,80.9600692,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.462597015,80.9600692,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.588149254,80.9600692,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.713701493,80.66899654,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.839253731,80.66899654,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (3.96480597,80.66899654,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.090358209,80.66899654,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.215910448,80.66899654,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.341462687,80.66899654,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.467014925,80.37792388,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.592567164,80.37792388,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.718119403,80.37792388,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.843671642,80.37792388,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (4.969223881,80.37792388,101.044083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.094776119,80.37792388,101.044083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.220328358,80.08685121,101.044083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.345880597,80.08685121,101.044083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.471432836,80.08685121,101.044083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.596985075,80.08685121,101.3351557);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.722537313,80.08685121,101.3351557);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.848089552,79.79577855,101.3351557);
INSERT INTO "Part 2 - Figure 6.1" VALUES (5.973641791,79.79577855,101.3351557);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.09919403,79.79577855,101.3351557);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.224746269,79.79577855,101.6262284);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.350298507,79.79577855,101.6262284);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.475850746,79.50470588,101.6262284);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.601402985,79.50470588,101.6262284);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.726955224,79.50470588,101.917301);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.852507463,79.50470588,101.917301);
INSERT INTO "Part 2 - Figure 6.1" VALUES (6.978059701,79.50470588,101.917301);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.10361194,79.21363322,101.917301);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.229164179,79.21363322,101.917301);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.354716418,79.21363322,102.2083737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.480268657,78.92256055,102.2083737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.605820896,78.92256055,102.2083737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.731373134,78.92256055,102.4994464);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.856925373,78.92256055,102.4994464);
INSERT INTO "Part 2 - Figure 6.1" VALUES (7.982477612,78.92256055,102.4994464);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.108029851,78.63148789,102.4994464);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.23358209,78.63148789,102.790519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.359134328,78.63148789,102.790519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.484686567,78.63148789,102.790519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.610238806,78.34041522,102.790519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.735791045,78.34041522,103.0815917);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.861343284,78.34041522,103.0815917);
INSERT INTO "Part 2 - Figure 6.1" VALUES (8.986895522,78.34041522,103.0815917);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.112447761,78.04934256,103.3726644);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.238,78.04934256,103.3726644);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.363552239,78.04934256,103.663737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.489104478,77.7582699,103.663737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.614656716,77.7582699,103.663737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.740208955,77.7582699,103.663737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.865761194,77.7582699,103.9548097);
INSERT INTO "Part 2 - Figure 6.1" VALUES (9.991313433,77.7582699,103.9548097);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.11686567,77.46719723,103.9548097);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.24241791,77.46719723,104.2458824);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.36797015,77.46719723,104.2458824);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.49352239,77.17612457,104.536955);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.61907463,77.17612457,104.536955);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.74462687,77.17612457,104.536955);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.8701791,76.8850519,104.536955);
INSERT INTO "Part 2 - Figure 6.1" VALUES (10.99573134,76.8850519,104.8280277);
INSERT INTO "Part 2 - Figure 6.1" VALUES (11.12128358,76.8850519,104.8280277);
INSERT INTO "Part 2 - Figure 6.1" VALUES (11.24683582,76.8850519,105.1191003);
INSERT INTO "Part 2 - Figure 6.1" VALUES (11.37238806,76.59397924,105.1191003);
INSERT INTO "Part 2 - Figure 6.1" VALUES (11.4979403,76.59397924,105.1191003);
INSERT INTO "Part 2 - Figure 6.1" VALUES (11.62349254,76.59397924,105.1191003);
INSERT INTO "Part 2 - Figure 6.1" VALUES (11.74904478,76.59397924,105.410173);
INSERT INTO "Part 2 - Figure 6.1" VALUES (11.87459701,76.30290657,105.410173);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.00014925,76.30290657,105.7012457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.12570149,76.30290657,105.7012457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.25125373,76.01183391,105.7012457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.37680597,76.01183391,105.9923183);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.50235821,76.01183391,105.9923183);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.62791045,75.72076125,105.9923183);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.75346269,75.72076125,106.283391);
INSERT INTO "Part 2 - Figure 6.1" VALUES (12.87901493,75.72076125,106.283391);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.00456716,75.42968858,106.5744637);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.1301194,75.42968858,106.5744637);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.25567164,75.42968858,106.5744637);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.38122388,75.42968858,106.8655363);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.50677612,75.13861592,106.8655363);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.63232836,75.13861592,106.8655363);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.7578806,75.13861592,107.156609);
INSERT INTO "Part 2 - Figure 6.1" VALUES (13.88343284,74.84754325,107.156609);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.00898507,74.84754325,107.156609);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.13453731,74.84754325,107.4476817);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.26008955,74.84754325,107.4476817);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.38564179,74.55647059,107.7387543);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.51119403,74.55647059,107.7387543);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.63674627,74.26539792,107.7387543);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.76229851,74.26539792,108.029827);
INSERT INTO "Part 2 - Figure 6.1" VALUES (14.88785075,74.26539792,108.029827);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.01340299,73.97432526,108.029827);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.13895522,73.97432526,108.3208997);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.26450746,73.6832526,108.3208997);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.3900597,73.6832526,108.3208997);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.51561194,73.6832526,108.6119723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.64116418,73.39217993,108.6119723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.76671642,73.39217993,108.6119723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (15.89226866,73.39217993,108.903045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.0178209,73.10110727,108.903045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.14337313,73.10110727,108.903045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.26892537,73.10110727,109.1941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.39447761,72.8100346,109.1941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.52002985,72.8100346,109.1941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.64558209,72.51896194,109.1941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.77113433,72.51896194,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (16.89668657,72.51896194,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.02223881,72.22788927,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.14779104,72.22788927,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.27334328,72.22788927,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.39889552,71.93681661,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.52444776,71.93681661,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.65,71.64574394,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.77555224,71.64574394,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (17.90110448,71.64574394,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.02665672,71.35467128,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.15220896,71.35467128,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.27776119,71.35467128,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.40331343,71.06359862,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.52886567,71.06359862,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.65441791,70.77252595,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.77997015,70.77252595,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (18.90552239,70.77252595,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.03107463,70.48145329,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.15662687,70.48145329,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.2821791,70.48145329,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.40773134,70.19038062,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.53328358,70.19038062,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.65883582,69.89930796,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.78438806,69.89930796,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (19.9099403,69.89930796,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.03549254,69.60823529,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.16104478,69.60823529,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.28659701,69.31716263,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.41214925,69.31716263,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.53770149,69.31716263,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.66325373,69.02608997,110.3584083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.78880597,69.02608997,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (20.91435821,68.7350173,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.03991045,68.7350173,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.16546269,68.7350173,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.29101493,68.44394464,110.0673356);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.41656716,68.44394464,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.5421194,68.15287197,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.66767164,68.15287197,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.79322388,67.86179931,109.776263);
INSERT INTO "Part 2 - Figure 6.1" VALUES (21.91877612,67.86179931,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.04432836,67.86179931,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.1698806,67.57072664,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.29543284,67.57072664,109.4851903);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.42098507,67.27965398,109.1941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.54653731,67.27965398,109.1941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.67208955,67.27965398,109.1941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.79764179,66.98858131,108.903045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (22.92319403,66.98858131,108.903045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.04874627,66.69750865,108.6119723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.17429851,66.69750865,108.6119723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.29985075,66.69750865,108.6119723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.42540299,66.40643599,108.3208997);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.55095522,66.40643599,108.3208997);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.67650746,66.11536332,108.029827);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.8020597,66.11536332,108.029827);
INSERT INTO "Part 2 - Figure 6.1" VALUES (23.92761194,65.82429066,107.7387543);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.05316418,65.82429066,107.7387543);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.17871642,65.82429066,107.4476817);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.30426866,65.53321799,107.4476817);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.4298209,65.53321799,107.156609);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.55537313,65.24214533,107.156609);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.68092537,65.24214533,106.8655363);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.80647761,64.95107266,106.5744637);
INSERT INTO "Part 2 - Figure 6.1" VALUES (24.93202985,64.95107266,106.5744637);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.05758209,64.95107266,106.283391);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.18313433,64.66,105.9923183);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.30868657,64.66,105.9923183);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.43423881,64.36892734,105.7012457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.55979104,64.36892734,105.410173);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.68534328,64.07785467,105.410173);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.81089552,64.07785467,105.1191003);
INSERT INTO "Part 2 - Figure 6.1" VALUES (25.93644776,64.07785467,104.8280277);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.062,63.78678201,104.8280277);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.18755224,63.78678201,104.536955);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.31310448,63.49570934,104.2458824);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.43865672,63.49570934,103.9548097);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.56420896,63.20463668,103.9548097);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.68976119,63.20463668,103.663737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.81531343,62.91356401,103.3726644);
INSERT INTO "Part 2 - Figure 6.1" VALUES (26.94086567,62.91356401,103.0815917);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.06641791,62.91356401,102.790519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.19197015,62.62249135,102.790519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.31752239,62.62249135,102.4994464);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.44307463,62.33141869,102.2083737);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.56862687,62.33141869,101.917301);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.6941791,62.04034602,101.6262284);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.81973134,62.04034602,101.3351557);
INSERT INTO "Part 2 - Figure 6.1" VALUES (27.94528358,62.04034602,101.3351557);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.07083582,61.74927336,101.044083);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.19638806,61.74927336,100.7530104);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.3219403,61.45820069,100.4619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.44749254,61.45820069,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.57304478,61.16712803,100.1708651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.69859701,61.16712803,99.87979239);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.82414925,61.16712803,99.58871972);
INSERT INTO "Part 2 - Figure 6.1" VALUES (28.94970149,60.87605536,99.29764706);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.07525373,60.87605536,99.00657439);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.20080597,60.5849827,98.71550173);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.32635821,60.5849827,98.71550173);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.45191045,60.29391003,98.42442907);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.57746269,60.29391003,98.1333564);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.70301493,60.29391003,97.84228374);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.82856716,60.00283737,97.84228374);
INSERT INTO "Part 2 - Figure 6.1" VALUES (29.9541194,60.00283737,97.26013841);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.07967164,59.71176471,97.26013841);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.20522388,59.71176471,96.96906574);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.33077612,59.42069204,96.67799308);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.45632836,59.42069204,96.38692042);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.5818806,59.12961938,96.09584775);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.70743284,59.12961938,95.80477509);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.83298507,59.12961938,95.51370242);
INSERT INTO "Part 2 - Figure 6.1" VALUES (30.95853731,58.83854671,95.51370242);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.08408955,58.83854671,95.22262976);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.20964179,58.54747405,94.93155709);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.33519403,58.54747405,94.64048443);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.46074627,58.25640138,94.34941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.58629851,58.25640138,94.34941176);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.71185075,58.25640138,94.0583391);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.83740299,57.96532872,93.76726644);
INSERT INTO "Part 2 - Figure 6.1" VALUES (31.96295522,57.96532872,93.47619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.08850746,57.67425606,93.47619377);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.2140597,57.67425606,93.18512111);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.33961194,57.38318339,92.89404844);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.46516418,57.38318339,92.60297578);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.59071642,57.38318339,92.31190311);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.71626866,57.09211073,92.31190311);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.8418209,57.09211073,92.02083045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (32.96737313,56.80103806,91.72975779);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.09292537,56.80103806,91.72975779);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.21847761,56.80103806,91.43868512);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.34402985,56.5099654,91.14761246);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.46958209,56.5099654,90.85653979);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.59513433,56.21889273,90.56546713);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.72068657,56.21889273,90.56546713);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.84623881,56.21889273,90.27439446);
INSERT INTO "Part 2 - Figure 6.1" VALUES (33.97179104,55.92782007,89.9833218);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.09734328,55.92782007,89.9833218);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.22289552,55.6367474,89.69224913);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.34844776,55.6367474,89.40117647);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.474,55.6367474,89.40117647);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.59955224,55.34567474,89.11010381);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.72510448,55.34567474,88.81903114);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.85065672,55.05460208,88.81903114);
INSERT INTO "Part 2 - Figure 6.1" VALUES (34.97620896,55.05460208,88.52795848);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.10176119,55.05460208,88.23688581);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.22731343,54.76352941,88.23688581);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.35286567,54.76352941,87.94581315);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.47841791,54.47245675,87.94581315);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.60397015,54.47245675,87.65474048);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.72952239,54.47245675,87.36366782);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.85507463,54.18138408,87.36366782);
INSERT INTO "Part 2 - Figure 6.1" VALUES (35.98062687,54.18138408,87.07259516);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.1061791,54.18138408,87.07259516);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.23173134,53.89031142,86.78152249);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.35728358,53.89031142,86.49044983);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.48283582,53.59923875,86.49044983);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.60838806,53.59923875,86.19937716);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.7339403,53.59923875,86.19937716);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.85949254,53.30816609,85.9083045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (36.98504478,53.30816609,85.9083045);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.11059701,53.30816609,85.61723183);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.23614925,53.01709343,85.61723183);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.36170149,53.01709343,85.32615917);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.48725373,52.72602076,85.32615917);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.61280597,52.72602076,85.03508651);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.73835821,52.72602076,84.74401384);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.86391045,52.4349481,84.74401384);
INSERT INTO "Part 2 - Figure 6.1" VALUES (37.98946269,52.4349481,84.74401384);
INSERT INTO "Part 2 - Figure 6.1" VALUES (38.11501493,52.4349481,84.45294118);
INSERT INTO "Part 2 - Figure 6.1" VALUES (38.24056716,52.14387543,84.45294118);
INSERT INTO "Part 2 - Figure 6.1" VALUES (38.3661194,52.14387543,84.16186851);
INSERT INTO "Part 2 - Figure 6.1" VALUES (38.49167164,52.14387543,84.16186851);
INSERT INTO "Part 2 - Figure 6.1" VALUES (38.61722388,51.85280277,83.87079585);
INSERT INTO "Part 2 - Figure 6.1" VALUES (38.74277612,51.85280277,83.57972318);
INSERT INTO "Part 2 - Figure 6.1" VALUES (38.9938806,51.5617301,83.28865052);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.11943284,51.5617301,83.28865052);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.24498507,51.5617301,83.28865052);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.37053731,51.27065744,82.99757785);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.49608955,51.27065744,82.99757785);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.62164179,51.27065744,82.99757785);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.74719403,50.97958478,82.70650519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.87274627,50.97958478,82.70650519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (39.99829851,50.97958478,82.41543253);
INSERT INTO "Part 2 - Figure 6.1" VALUES (40.12385075,50.68851211,82.41543253);
INSERT INTO "Part 2 - Figure 6.1" VALUES (40.24940299,50.68851211,82.12435986);
INSERT INTO "Part 2 - Figure 6.1" VALUES (40.37495522,50.68851211,82.12435986);
INSERT INTO "Part 2 - Figure 6.1" VALUES (40.50050746,50.39743945,82.12435986);
INSERT INTO "Part 2 - Figure 6.1" VALUES (40.6260597,50.39743945,81.8332872);
INSERT INTO "Part 2 - Figure 6.1" VALUES (40.75161194,50.39743945,81.8332872);
INSERT INTO "Part 2 - Figure 6.1" VALUES (40.87716418,50.39743945,81.8332872);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.00271642,50.10636678,81.54221453);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.12826866,50.10636678,81.54221453);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.2538209,50.10636678,81.54221453);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.37937313,50.10636678,81.25114187);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.50492537,49.81529412,81.25114187);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.63047761,49.81529412,80.9600692);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.75602985,49.81529412,80.9600692);
INSERT INTO "Part 2 - Figure 6.1" VALUES (41.88158209,49.81529412,80.9600692);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.00713433,49.52422145,80.66899654);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.13268657,49.52422145,80.66899654);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.25823881,49.52422145,80.66899654);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.38379104,49.23314879,80.37792388);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.50934328,49.23314879,80.37792388);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.63489552,49.23314879,80.37792388);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.76044776,49.23314879,80.08685121);
INSERT INTO "Part 2 - Figure 6.1" VALUES (42.886,48.94207612,80.08685121);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.01155224,48.94207612,80.08685121);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.13710448,48.94207612,79.79577855);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.26265672,48.94207612,79.79577855);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.38820896,48.94207612,79.79577855);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.51376119,48.65100346,79.79577855);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.63931343,48.65100346,79.50470588);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.76486567,48.65100346,79.50470588);
INSERT INTO "Part 2 - Figure 6.1" VALUES (43.89041791,48.65100346,79.50470588);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.01597015,48.3599308,79.50470588);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.14152239,48.3599308,79.21363322);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.26707463,48.3599308,79.21363322);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.39262687,48.3599308,79.21363322);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.5181791,48.3599308,78.92256055);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.64373134,48.06885813,78.92256055);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.76928358,48.06885813,78.92256055);
INSERT INTO "Part 2 - Figure 6.1" VALUES (44.89483582,48.06885813,78.92256055);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.02038806,48.06885813,78.63148789);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.1459403,48.06885813,78.63148789);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.27149254,48.06885813,78.63148789);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.39704478,47.77778547,78.63148789);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.52259701,47.77778547,78.34041522);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.64814925,47.77778547,78.34041522);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.77370149,47.77778547,78.34041522);
INSERT INTO "Part 2 - Figure 6.1" VALUES (45.89925373,47.77778547,78.34041522);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.02480597,47.77778547,78.34041522);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.15035821,47.77778547,78.04934256);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.27591045,47.77778547,78.04934256);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.40146269,47.4867128,78.04934256);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.52701493,47.4867128,78.04934256);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.65256716,47.4867128,77.7582699);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.7781194,47.4867128,77.7582699);
INSERT INTO "Part 2 - Figure 6.1" VALUES (46.90367164,47.4867128,77.7582699);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.02922388,47.4867128,77.7582699);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.15477612,47.4867128,77.7582699);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.28032836,47.4867128,77.46719723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.4058806,47.4867128,77.46719723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.53143284,47.4867128,77.46719723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.65698507,47.19564014,77.46719723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.78253731,47.19564014,77.46719723);
INSERT INTO "Part 2 - Figure 6.1" VALUES (47.90808955,47.19564014,77.17612457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.03364179,47.19564014,77.17612457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.15919403,47.19564014,77.17612457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.28474627,47.19564014,77.17612457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.41029851,47.19564014,77.17612457);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.53585075,47.19564014,76.8850519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.66140299,47.19564014,76.8850519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.78695522,47.19564014,76.8850519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (48.91250746,47.19564014,76.8850519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (49.0380597,47.19564014,76.8850519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (49.16361194,47.19564014,76.8850519);
INSERT INTO "Part 2 - Figure 6.1" VALUES (49.28916418,47.19564014,76.59397924);
INSERT INTO "Part 2 - Figure 6.1" VALUES (49.41471642,47.19564014,76.59397924);
INSERT INTO "Part 2 - Figure 6.1" VALUES (49.54026866,47.19564014,76.59397924);
INSERT INTO "Part 2 - Figure 6.1" VALUES (49.6658209,47.19564014,76.59397924);
INSERT INTO "Part 2 - Figure 6.1" VALUES (50,47.19564014,76);
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('1','0','0.0000306','0','1',NULL,NULL);
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('2','0.0000306','0.000306','1','10',NULL,NULL);
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('3','0.000306','0.00306','10','100',NULL,NULL);
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('4','0.00306','0.0306','100','1000',NULL,NULL);
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('5','0.0306',NULL,'1000',NULL,NULL,NULL);
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('A',NULL,NULL,NULL,NULL,'0','9.29');
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('B',NULL,NULL,NULL,NULL,'9.29','92.9');
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('C',NULL,NULL,NULL,NULL,'92.9','929');
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('D',NULL,NULL,NULL,NULL,'929','9290');
INSERT INTO "Part 1 - Table POF_COF_Category" VALUES ('E',NULL,NULL,NULL,NULL,'9290',NULL);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Compressor','COMPC',8.0e-06,2.0e-05,2.0e-06,0,3.0e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Compressor','COMPR',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Heat exchanger','HEXSS',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Heat exchanger','HEXTS',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-1',2.8e-05,0,0,2.6e-06,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-2',2.8e-05,0,0,2.6e-06,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-4',8.0e-06,2.0e-05,0,2.6e-06,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-6',8.0e-06,2.0e-05,0,2.6e-06,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-8',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-10',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-12',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPE-16',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pipe','PIPEGT16',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pump','PUMP2S',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pump','PUMPR',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Pump','PUMP1S',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Tank650','TANKBOTTOM',0.00072,0,0,2.0e-06,0.000722);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Tank650','COURSE-1-10',7.0e-05,2.5e-05,5.0e-06,1.0e-07,0.0001);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','KODRUM',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','COLBTM',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','FINFAN',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','FILTER',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','DRUM',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','REACTOR',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','COLTOP',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 3.1" VALUES ('Vessel','COLMID',8.0e-06,2.0e-05,2.0e-06,6.0e-07,3.06e-05);
INSERT INTO "Part 2 - Table 4.5" VALUES ('PR_thin_1',0.5,0.7,0.8);
INSERT INTO "Part 2 - Table 4.5" VALUES ('PR_thin_2',0.3,0.2,0.15);
INSERT INTO "Part 2 - Table 4.5" VALUES ('PR_thin_3',0.2,0.1,0.05);
INSERT INTO "Part 2 - Table 4.6" VALUES ('CO_thin_1',0.33,0.4,0.5,0.7,0.9);
INSERT INTO "Part 2 - Table 4.6" VALUES ('CO_thin_2',0.33,0.33,0.3,0.2,0.09);
INSERT INTO "Part 2 - Table 4.6" VALUES ('CO_thin_3',0.33,0.27,0.2,0.1,0.01);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Hydrochloric acid (HCI) corrosion',10,10,2);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('High temperature sulfidic/naphthenic acid corrosion',10,10,2);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('High temperature H2S/H2 corrosion',1,10,1);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Sulfuric acid (H2S/H2) corrosion_Low velocity',20,10,2);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Sulfuric acid (H2S/H2) corrosion_High velocity',10,10,1);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Hydrofluoric acid (HF) corrosion',10,1,1);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Sour water corrosion_Low velocity',20,10,2);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Sour water corrosion_High velocity',10,2,2);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Amine_Low velocity',20,10,2);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Amine_High velocity',10,10,1);
INSERT INTO "Part 2 - Table 4.8_Ajustar Condicionais" VALUES ('Other corrosion mechanism',1,1,1);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (1,0.3,0.5,9,3,0.01,1,30,1,0.1);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (2,0.5,1,40,4,0.03,1,89,4,0.13);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (3,0.7,2,146,6,0.05,1,230,16,0.15);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (4,1,4,428,7,0.15,1,518,53,0.17);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (5,1,9,1017,9,1,1,1017,146,0.2);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (6,2,16,1978,11,1,1,1758,351,1);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (7,3,30,3000,13,1,2,2697,738,4);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (8,4,53,3000,16,1,3,3000,1358,16);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (9,6,89,3000,20,2,7,3000,2209,53);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (10,9,146,3000,25,3,13,3000,3000,146);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (11,12,230,3000,30,4,26,3000,3000,351);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (12,16,351,3000,36,5,47,3000,3000,738);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (13,22,518,3000,44,7,82,3000,3000,1358);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (14,30,738,3000,53,9,139,3000,3000,2209);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (15,40,1017,3000,63,11,228,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (16,53,1358,3000,75,15,359,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (17,69,1758,3000,89,19,548,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (18,89,2209,3000,105,25,808,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (19,115,2697,3000,124,31,1151,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (20,146,3000,3000,146,40,1587,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (21,184,3000,3000,170,50,2119,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (22,230,3000,3000,199,63,2743,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (23,286,3000,3000,230,78,3000,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (24,351,3000,3000,266,97,3000,3000,3000,3000);
INSERT INTO "Part 2 - Table 5.4 and 5.5" VALUES (25,428,3000,3000,306,119,3000,3000,3000,3000);
INSERT INTO "Part 2 - Table 6.2" VALUES ('High',5000);
INSERT INTO "Part 2 - Table 6.2" VALUES ('Medium',500);
INSERT INTO "Part 2 - Table 6.2" VALUES ('Low',50);
INSERT INTO "Part 2 - Table 6.2" VALUES ('None',0);
INSERT INTO "Part 2 - Table 6.3" VALUES (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO "Part 2 - Table 6.3" VALUES (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
INSERT INTO "Part 2 - Table 6.3" VALUES (10,10,8,3,1,1,6,2,1,1,4,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1);
INSERT INTO "Part 2 - Table 6.3" VALUES (50,50,40,17,5,3,30,10,2,1,20,5,1,1,10,2,1,1,5,1,1,1,1,1,1,1);
INSERT INTO "Part 2 - Table 6.3" VALUES (100,100,80,33,10,5,60,20,4,1,40,10,2,1,20,5,1,1,10,2,1,1,5,1,1,1);
INSERT INTO "Part 2 - Table 6.3" VALUES (500,500,400,170,50,25,300,100,20,5,200,50,8,1,100,25,2,1,50,10,1,1,25,5,1,1);
INSERT INTO "Part 2 - Table 6.3" VALUES (1000,1000,800,330,100,50,600,200,40,10,400,100,16,2,200,50,5,1,100,25,2,1,50,10,1,1);
INSERT INTO "Part 2 - Table 6.3" VALUES (5000,5000,4000,1670,500,250,3000,1000,250,50,2000,500,80,10,1000,250,25,2,500,125,5,1,250,50,2,1);
INSERT INTO "Part 2 - Table 7.2" VALUES ('High',100);
INSERT INTO "Part 2 - Table 7.2" VALUES ('Medium',10);
INSERT INTO "Part 2 - Table 7.2" VALUES ('Low',1);
INSERT INTO "Part 2 - Table 7.2" VALUES ('None',0);
INSERT INTO "Part 2 - Table 8.2" VALUES ('< 5,5','Low','Moderate','High','High');
INSERT INTO "Part 2 - Table 8.2" VALUES ('5,5 to 7,5','Low','Low','Low','Moderate');
INSERT INTO "Part 2 - Table 8.2" VALUES ('7,6 to 8,3','Low','Moderate','Moderate','Moderate');
INSERT INTO "Part 2 - Table 8.2" VALUES ('8,4 to 8,9','Low','Moderate','Moderate','High');
INSERT INTO "Part 2 - Table 8.2" VALUES ('> 9,0','Low','Moderate','High','High');
INSERT INTO "Part 2 - Table 8.3" VALUES ('High','Low','Medium','High','None','Low','Medium');
INSERT INTO "Part 2 - Table 8.3" VALUES ('Moderate','Low','Medium','High','None','None','Low');
INSERT INTO "Part 2 - Table 8.3" VALUES ('Low','Low','Low','Medium','None','None','None');
INSERT INTO "Part 2 - Table 8.4" VALUES ('High',100);
INSERT INTO "Part 2 - Table 8.4" VALUES ('Medium',10);
INSERT INTO "Part 2 - Table 8.4" VALUES ('Low',1);
INSERT INTO "Part 2 - Table 8.4" VALUES ('None',0);
INSERT INTO "Part 2 - Table 9.2" VALUES ('< 5,5','Low','Moderate','High','High');
INSERT INTO "Part 2 - Table 9.2" VALUES ('5,5 to 7,5','Low','Low','Low','Moderate');
INSERT INTO "Part 2 - Table 9.2" VALUES ('7,6 to 8,3','Low','Moderate','Moderate','Moderate');
INSERT INTO "Part 2 - Table 9.2" VALUES ('8,4 to 8,9','Low','Moderate','Moderate','High');
INSERT INTO "Part 2 - Table 9.2" VALUES ('> 9,0','Low','Moderate','High','High');
INSERT INTO "Part 2 - Table 9.3" VALUES ('Low','High','High','High','Medium','Medium','Low');
INSERT INTO "Part 2 - Table 9.3" VALUES ('Moderate','High','Medium','Medium','Low','Low','Low');
INSERT INTO "Part 2 - Table 9.3" VALUES ('High','Medium','Low','Low','Low','Low','Low');
INSERT INTO "Part 2 - Table 9.4" VALUES ('High',100);
INSERT INTO "Part 2 - Table 9.4" VALUES ('Medium',10);
INSERT INTO "Part 2 - Table 9.4" VALUES ('Low',1);
INSERT INTO "Part 2 - Table 10.2" VALUES ('< 7,5','None','None','None');
INSERT INTO "Part 2 - Table 10.2" VALUES ('? 7,5 to 8,0','None','Low','Medium');
INSERT INTO "Part 2 - Table 10.2" VALUES ('? 8,0 to 9,0','None','Low','High');
INSERT INTO "Part 2 - Table 10.2" VALUES ('? 9,0','None','High','High');
INSERT INTO "Part 2 - Table 10.3" VALUES ('High',1000);
INSERT INTO "Part 2 - Table 10.3" VALUES ('Medium',100);
INSERT INTO "Part 2 - Table 10.3" VALUES ('Low',10);
INSERT INTO "Part 2 - Table 10.3" VALUES ('None',0);
INSERT INTO "Part 2 - Table 11.2" VALUES ('All regular 300 series SS and Alloys 600 and 800','Medium','None','None','High','None','None');
INSERT INTO "Part 2 - Table 11.2" VALUES ('H Grade 300 series SS','High','None','None','High','None','None');
INSERT INTO "Part 2 - Table 11.2" VALUES ('L Grade 300 series SS','Low','None','None','Medium','None','None');
INSERT INTO "Part 2 - Table 11.2" VALUES ('321 SS','Medium','Medium','Low','High','High','Low');
INSERT INTO "Part 2 - Table 11.2" VALUES ('347 SS, Alloy 20, Alloy 625, all austenitic weld overlay','Low','Low','Low','Medium','Low','Low');
INSERT INTO "Part 2 - Table 11.3" VALUES ('High',5000);
INSERT INTO "Part 2 - Table 11.3" VALUES ('Medium',500);
INSERT INTO "Part 2 - Table 11.3" VALUES ('Low',50);
INSERT INTO "Part 2 - Table 11.3" VALUES ('None',0);
INSERT INTO "Part 2 - Table 12.2" VALUES ('?38','Low','Low','Low','Medium','None','None','None','None');
INSERT INTO "Part 2 - Table 12.2" VALUES ('>38 to 66','Low','Medium','Medium','High','Low','Low','Low','Low');
INSERT INTO "Part 2 - Table 12.2" VALUES ('>66 to 93','Medium','Medium','High','High','Low','Low','Low','Low');
INSERT INTO "Part 2 - Table 12.2" VALUES ('>93 to 149','Medium','High','High','High','Low','Low','Low','Medium');
INSERT INTO "Part 2 - Table 12.2" VALUES ('>149','High','High','High','High','Medium','Medium','Medium','High');
INSERT INTO "Part 2 - Table 12.3" VALUES ('High',5000);
INSERT INTO "Part 2 - Table 12.3" VALUES ('Medium',500);
INSERT INTO "Part 2 - Table 12.3" VALUES ('Low',50);
INSERT INTO "Part 2 - Table 12.3" VALUES ('None',0);
INSERT INTO "Part 2 - Table 13.2" VALUES ('As-welded','Low','Medium','High');
INSERT INTO "Part 2 - Table 13.2" VALUES ('PWHT','None','Low','High');
INSERT INTO "Part 2 - Table 13.3" VALUES ('High',100);
INSERT INTO "Part 2 - Table 13.3" VALUES ('Medium',10);
INSERT INTO "Part 2 - Table 13.3" VALUES ('Low',1);
INSERT INTO "Part 2 - Table 13.3" VALUES ('None',0);
INSERT INTO "Part 2 - Table 14.2" VALUES ('Non-PWHT','High','High','Low');
INSERT INTO "Part 2 - Table 14.2" VALUES ('PWHT','Medium','High','Low');
INSERT INTO "Part 2 - Table 14.3" VALUES ('High',100);
INSERT INTO "Part 2 - Table 14.3" VALUES ('Medium',10);
INSERT INTO "Part 2 - Table 14.3" VALUES ('Low',1);
INSERT INTO "Part 2 - Table 14.3" VALUES ('None',0);
INSERT INTO "Part 2 - Table 15.2" VALUES (-12,0,0,0,0);
INSERT INTO "Part 2 - Table 15.2" VALUES (-8,0.076,0.025,0,0);
INSERT INTO "Part 2 - Table 15.2" VALUES (6,0.254,0.127,0.076,0.025);
INSERT INTO "Part 2 - Table 15.2" VALUES (32,0.254,0.127,0.076,0.025);
INSERT INTO "Part 2 - Table 15.2" VALUES (71,0.254,0.127,0.051,0.025);
INSERT INTO "Part 2 - Table 15.2" VALUES (107,0.051,0.025,0,0);
INSERT INTO "Part 2 - Table 15.2" VALUES (121,0,0,0,0);
INSERT INTO "Part 2 - Table 16.2" VALUES (-12,0,0,0,0);
INSERT INTO "Part 2 - Table 16.2" VALUES (-8,0.076,0.025,0,0);
INSERT INTO "Part 2 - Table 16.2" VALUES (6,0.254,0.127,0.076,0.025);
INSERT INTO "Part 2 - Table 16.2" VALUES (32,0.254,0.127,0.076,0.025);
INSERT INTO "Part 2 - Table 16.2" VALUES (71,0.508,0.254,0.127,0.051);
INSERT INTO "Part 2 - Table 16.2" VALUES (107,0.254,0.127,0.025,0.025);
INSERT INTO "Part 2 - Table 16.2" VALUES (135,0.254,0.051,0.025,0);
INSERT INTO "Part 2 - Table 16.2" VALUES (162,0.127,0.025,0,0);
INSERT INTO "Part 2 - Table 16.2" VALUES (176,0,0,0,0);
INSERT INTO "Part 2 - Table 16.3" VALUES ('Unknown/unspecified',1.25);
INSERT INTO "Part 2 - Table 16.3" VALUES ('Foamglass',0.75);
INSERT INTO "Part 2 - Table 16.3" VALUES ('Pearlite',1);
INSERT INTO "Part 2 - Table 16.3" VALUES ('Fiberglass',1.25);
INSERT INTO "Part 2 - Table 16.3" VALUES ('Mineral wool',1.25);
INSERT INTO "Part 2 - Table 16.3" VALUES ('Calcium silicate',1.25);
INSERT INTO "Part 2 - Table 16.3" VALUES ('Asbestos',1.25);
INSERT INTO "Part 2 - Table 17.2" VALUES ('<49','None','None','None','None');
INSERT INTO "Part 2 - Table 17.2" VALUES ('49 to 93','High','Medium','Low','None');
INSERT INTO "Part 2 - Table 17.2" VALUES ('93 to 149','Medium','Low','Low','None');
INSERT INTO "Part 2 - Table 17.2" VALUES ('>149','None','None','None','None');
INSERT INTO "Part 2 - Table 17.3" VALUES ('High',50);
INSERT INTO "Part 2 - Table 17.3" VALUES ('Medium',10);
INSERT INTO "Part 2 - Table 17.3" VALUES ('Low',1);
INSERT INTO "Part 2 - Table 17.3" VALUES ('None',0);
INSERT INTO "Part 2 - Table 18.2" VALUES ('<49','None','None','None','None');
INSERT INTO "Part 2 - Table 18.2" VALUES ('49 to 93','High','High','Medium','Low');
INSERT INTO "Part 2 - Table 18.2" VALUES ('93 to 149','High','Medium','Low','None');
INSERT INTO "Part 2 - Table 18.2" VALUES ('>149','None','None','None','None');
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C1',31623);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C2',1000);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C3',4536);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C4a e C4b',2.205);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C5',25.2);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C6',55.6);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C8',0.0929);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C9',0.123);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C10',9.744);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C11',0.145);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C12',1.8);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C13',6.29);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C14',1);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C15',4.685);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C16',299.44);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C17',0.001);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C18',0.005);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C19',1.085);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C20',1.013);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C21',5328);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C22',5.8);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C23',0.45);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C24',2.6);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C25',0.0296);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C26',100);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C27',1);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C28',1000);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C29',0.0004303);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C30',2.15e-07);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C31',864);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C32',0.543);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C33',0.0815);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C34',86.4);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C35',29.6195);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C36',30.5);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C37',1.408e-08);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C38',1.1341);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C39',3.9365);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C40',5.9352);
INSERT INTO "Part 3.B - Table 3.B.2.1" VALUES ('C41',32);
COMMIT;
