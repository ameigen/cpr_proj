##########################################
SQL Statements for CPR

Authored by Javier Renteria
##########################################


## TABLE STATEMENTS ##

CREATE TABLE cpu(
    uid int NOT NULL UNIQUE AUTO_INCREMENT, 
    manufacturer VARCHAR(10),
    model VARCHAR(40) NOT NULL,
    price int NOT NULL, 
    category VARCHAR(20),
    socket VARCHAR(10),
    codeName VARCHAR(20),
    graphics CHAR(3), 
    tdp smallint, 
    cores smallint,
    threads smallint, 
    baseClock smallint,
    boostClock smallint,
    l2 smallint, 
    l3 smallint,
    smt CHAR(3),
    memController VARCHAR(40),
    ecc CHAR(3),
    unlocked CHAR(3),
    chipset VARCHAR(100),
    cooler CHAR(3),
    segment VARCHAR(10),
    architecture VARCHAR(20),
    manuProcess smallint,
    releaseDate smallint, 
    pcie VARCHAR(40),
    memMax smallint, 
    scalability smallint,
    warranty smallint, 
    gaming smallint,
    productivity smallint,
    balance smallint,
    PRIMARY KEY(uid)
); 

CREATE TABLE motherboard(
    uid int NOT NULL UNIQUE AUTO_INCREMENT, 
    manufacturer VARCHAR(10),
    model VARCHAR(40) NOT NULL,
    price int,
    form CHAR(4),
    chipset CHAR(7), 
    ramMaxSpeed int,
    ramMaxSticks smallint, 
    ramMaxCapacity int, 
    wifi CHAR(3), 
    socket VARCHAR(10),
    platform CHAR(5), 
    numPcie smallint, 
    category VARCHAR(20),
    m2 smallint, 
    PRIMARY KEY(uid)
);

CREATE TABLE memory(
    uid int NOT NULL UNIQUE AUTO_INCREMENT,
    manufacturer VARCHAR(15),
    model VARCHAR(40) NOT NULL, 
    type CHAR(4),
    size smallint, 
    numSticks smallint, 
    memSize smallint, 
    price int, 
    speed int, 
    cl smallint,
    reliability smallint, 
    PRIMARY KEY(uid) 
);

CREATE TABLE gpu(
    uid int NOT NULL UNIQUE AUTO_INCREMENT,
    manufacturer VARCHAR(15),
    series VARCHAR(20),
    model VARCHAR(40) NOT NULL, 
    price int, 
    clock int, 
    memType VARCHAR(10), 
    memSize smallint, 
    releaseDate int, 
    tbp int, 
    category VARCHAR(20), 
    PRIMARY KEY(uid)
); 

CREATE TABLE storage(
    uid int NOT NULL UNIQUE AUTO_INCREMENT,
    manufacturer VARCHAR(15),
    model VARCHAR(40) NOT NULL,
    price int, 
    type CHAR(3), 
    form VARCHAR(5), 
    size int, 
    isNvme CHAR(3), 
    gen4 CHAR(3),
    PRIMARY KEY(uid)
);

CREATE TABLE cooler(
    uid int NOT NULL UNIQUE AUTO_INCREMENT,
    manufacturer VARCHAR(15),
    model VARCHAR(40) NOT NULL,
    intel VARCHAR(10),
    amd VARCHAR(10), 
    type VARCHAR(10), 
    size VARCHAR(10), 
    price int, 
    radiator smallint, 
    fans smallint,
    fanSize smallint, 
    PRIMARY KEY(uid) 
);

CREATE TABLE cases(
    uid int NOT NULL UNIQUE AUTO_INCREMENT,
    manufacturer VARCHAR(15),
    model VARCHAR(40) NOT NULL,
    price int,
    size VARCHAR(20),
    maxBoard VARCHAR(10), 
    fans smallint, 
    coolerSize CHAR(8), 
    maxRad smallint, 
    colors VARCHAR(100), 
    rgb CHAR(3), 
    maxFans smallint,
    PRIMARY KEY(uid)
);

CREATE TABLE psu(
    uid int NOT NULL UNIQUE AUTO_INCREMENT,
    manufacturer VARCHAR(15),
    model VARCHAR(40) NOT NULL,
    price int,
    wattage int, 
    certified VARCHAR(10), 
    reliability smallint, 
    PRIMARY KEY(uid)
);

## INSERT STATEMENTS ##

INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 9 5900X','549','Enthusiast','AM4','Vermeer','no','105','12','24','3700','4800','6','64','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','no','desktop','Zen 3','7','2020','24xPCIe 4.0 16+4+4','128','1','3','11','6','5');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 9 5950X','799','Enthusiast','AM4','Vermeer','no','105','16','32','3400','4900','8','64','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','no','desktop','Zen 3','7','2020','24xPCIe 4.0 16+4+4','128','1','3','11','7','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 7 5800X','449','Performance','AM4','Vermeer','no','105','8','16','3800','4700','4','32','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 3','7','2020','24xPCIe 4.0 16+4+4','128','1','3','11','5','6');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 5600X','299','Mainstream','AM4','Vermeer','no','65','6','12','3700','4600','3','32','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 3','7','2020','24xPCIe 4.0 16+4+4','128','1','3','10','5','5');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen Threadripper 3990X','3990','Workstation','sTRX4','Castle Peak','no','280','64','128','2900','4300','32','256','yes','Quad Channel DDR4-3200','yes','yes','TRX40','no','desktop','Zen 2','7','2019','64x PCIe 4.0','256','1','3','9','12','3');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen Threadripper 3970X','1999','Workstation','sTRX4','Castle Peak','no','280','32','64','3800','4500','16','128','yes','Quad Channel DDR4-3200','yes','yes','TRX40','no','desktop','Zen 2','7','2019','64x PCIe 4.0','256','1','3','9','12','3');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen Threadripper 3960X','1399','Workstation','sTRX4','Castle Peak','no','280','24','48','3700','4500','12','128','yes','Quad Channel DDR4-3200','yes','yes','TRX40','no','desktop','Zen 2','7','2019','64x PCIe 4.0','256','1','3','9','11','2');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 9 3950X','749','Enthusiast','AM4','Matisse','no','105','16','32','3500','4800','6','64','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','no','desktop','Zen 2','7','2019','24xPCIe 4.0 16+4+4','128','1','3','11','7','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 9 3900XT','499','Enthusiast','AM4','Matisse','no','105','12','24','3800','4700','6','64','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','no','desktop','Zen 2','7','2020','24xPCIe 4.0 16+4+4','128','1','3','10','6','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 9 3900X','499','Enthusiast','AM4','Matisse','no','105','12','24','3800','4600','6','64','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2019','24xPCIe 4.0 16+4+4','128','1','3','10','6','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 7 3800XT','399','Performance','AM4','Matisse','no','105','8','16','3900','4700','4','32','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2020','24xPCIe 4.0 16+4+4','128','1','3','10','5','5');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 7 3800X','399','Performance','AM4','Matisse','no','105','8','16','3900','4500','4','32','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2019','24xPCIe 4.0 16+4+4','128','1','3','10','5','5');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 7 3700X','329','Performance','AM4','Matisse','no','65','8','16','3600','4400','4','32','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2019','24xPCIe 4.0 16+4+4','128','1','3','11','5','6');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 3600XT','249','Mainstream','AM4','Matisse','no','95','6','12','3800','4500','3','32','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2020','24xPCIe 4.0 16+4+4','128','1','3','9','5','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 3600X','249','Mainstream','AM4','Matisse','no','95','6','12','3800','4400','3','32','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2019','24xPCIe 4.0 16+4+4','128','1','3','9','5','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 3600','199','Mainstream','AM4','Matisse','no','65','6','12','3600','4200','3','32','yes','Dual Channel DDR4-3200','yes','no','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2019','24xPCIe 4.0 16+4+4','128','1','3','7','4','3');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 3 3300X','120','Entry','AM4','Matisse','no','65','4','8','3800','4300','2','16','yes','Dual Channel DDR4-3200','yes','yes','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2019','24xPCIe 4.0 16+4+4','128','1','3','9','5','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 3 3100','99','Entry','AM4','Matisse','no','65','4','8','3600','3900','2','16','yes','Dual Channel DDR4-3200','yes','no','A520, B450, B550, X470, X570','yes','desktop','Zen 2','7','2020','24xPCIe 4.0 16+4+4','128','1','3','5','4','1');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','RyzenThreadripper 2990WX','1799','Workstation','TR4','Colfax','no','250','32','64','3000','4200','16','64','yes','Quad Channel DDR4-3200','yes','yes','X399','no','desktop','Zen +','12','2018','64x PCIe 3.0','128','1','3','8','9','1');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen Threadripper 2970WX','1299','Workstation','TR4','Colfax','no','250','24','48','3000','4200','12','64','yes','Quad Channel DDR4-3200','yes','yes','X399','no','desktop','Zen +','12','2018','64x PCIe 3.0','128','1','3','8','8','0');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen Threadripper 2950X','899','Workstation','TR4','Colfax','no','250','16','32','3500','4400','8','32','yes','Quad Channel DDR4-3200','yes','yes','X399','no','desktop','Zen +','12','2018','64x PCIe 3.0','128','1','3','8','7','1');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen Threadripper 2920X','649','Workstation','TR4','Colfax','no','250','12','24','3500','4300','6','32','yes','Quad Channel DDR4-3200','yes','yes','X399','no','desktop','Zen +','12','2018','64x PCIe 3.0','128','1','3','8','6','2');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 7 2700X','329','Performance','AM4','Pinacle Ridge','no','105','8','16','3700','4300','4','16','yes','Dual Channel DDR4-3200','yes','yes','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2018','24x PCIe 3.0','64','1','3','9','2','7');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 7 2700','299','Performance','AM4','Pinacle Ridge','no','105','8','16','3200','4100','4','16','yes','Dual Channel DDR4-3200','yes','no','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2018','24x PCIe 3.0','64','1','3','6','1','5');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 2600X','229','Mainstream','AM4','Pinacle Ridge','no','65','6','12','3600','4200','3','16','yes','Dual Channel DDR4-3200','yes','yes','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2018','24x PCIe 3.0','64','1','3','9','2','7');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 2600','199','Mainstream','AM4','Pinacle Ridge','no','65','6','12','3400','3900','3','16','yes','Dual Channel DDR4-3200','yes','no','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2018','24x PCIe 3.0','64','1','3','5','1','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 1600AF','85','Mainstream','AM4','Pinacle Ridge','no','65','6','12','3200','3600','3','16','yes','Dual Channel DDR4-3200','yes','no','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2018','24x PCIe 3.0','64','1','3','5','1','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 3 1200AF','60','Entry','AM4','Pinacle Ridge','no','65','4','8','3100','3400','2','8','yes','Dual Channel DDR4-3200','yes','no','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2018','24x PCIe 3.0','64','1','3','4','1','3');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 3 2200G','99','Entry','AM4','Raven Ridge','yes','65','4','4','3500','3700','2','4','yes','Dual Channel DDR4-3200','no','no','A320, B350, B450, X370, X470','yes','desktop','Zen +','14','2018','12x PCIe 3.0','64','1','3','4','1','3');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 2400G','169','Mainstream','AM4','Raven Ridge','yes','65','4','8','3600','3900','2','4','yes','Dual Channel DDR4-3200','no','no','A320, B350, B450, X370, X470','yes','desktop','Zen +','14','2018','12x PCIe 3.0','64','1','3','4','1','3');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 3 3200G','99','Entry','AM4','Picasso','yes','65','4','4','3600','4000','2','4','yes','Dual Channel DDR4-3200','no','no','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2019','16x PCIe 3.0','64','1','3','5','1','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('AMD','Ryzen 5 3400G','149','Mainstream','AM4','Picasso','yes','65','4','8','3700','4200','2','4','yes','Dual Channel DDR4-3200','no','no','A320, B350, B450, X370, X470, X570','yes','desktop','Zen +','12','2019','16x PCIe 3.0','64','1','3','5','1','4');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i9-10900','439','Enthusiast','LGA 1200','Comet Lake','yes','125','10','20','2800','5200','0','20','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','7','2','5');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i9-10900K','499','Enthusiast','LGA 1200','Comet Lake','yes','125','10','20','3700','5300','0','32','yes','Dual Channel DDR4-2933','no','yes','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','10','3','7');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i9-10900F','429','Enthusiast','LGA 1200','Comet Lake','no','65','10','20','2800','5200','0','20','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','8','2','6');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i9-10900KF','469','Enthusiast','LGA 1200','Comet Lake','no','125','10','20','3700','5300','0','20','yes','Dual Channel DDR4-2933','no','yes','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','10','3','7');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i7-10700','329','Performance','LGA 1200','Comet Lake','yes','65','10','20','2900','4800','0','16','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','8','2','6');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i7-10700K','379','Performance','LGA 1200','Comet Lake','yes','125','8','16','3800','5100','0','16','yes','Dual Channel DDR4-2933','no','yes','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','10','3','7');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i7-10700F','299','Performance','LGA 1200','Comet Lake','no','65','8','16','2900','4800','0','16','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','8','2','6');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i7-10700KF','349','Performance','LGA 1200','Comet Lake','no','125','8','16','3800','5100','0','16','yes','Dual Channel DDR4-2933','no','yes','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','10','3','7');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i5-10600','199','Mainstream','LGA 1200','Comet Lake','yes','65','6','12','3300','4800','0','8','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','7','2','5');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i5-10600K','269','Mainstream','LGA 1200','Comet Lake','yes','125','6','12','4100','4800','0','8','yes','Dual Channel DDR4-2933','no','yes','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','9','3','6');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i5-10600KF','239','Mainstream','LGA 1200','Comet Lake','no','125','6','12','4100','4800','0','8','yes','Dual Channel DDR4-2933','no','yes','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','9','3','6');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i3-10300','149','Entry','LGA 1200','Comet Lake','yes','65','4','8','3700','4400','0','4','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','5','2','3');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i3-10100','119','Entry','LGA 1200','Comet Lake','yes','65','4','8','3600','4300','0','4','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','5','3','2');
INSERT INTO cpu (manufacturer,model,price,category,socket,codeName,graphics,tdp,cores,threads,baseClock,boostClock,l2,l3,smt,memController,ecc,unlocked,chipset,cooler,segment,architecture,manuProcess,releaseDate,pcie,memMax,scalability,warranty,gaming,productivity,balance) VALUES ('Intel','i3-10100F','79','Entry','LGA 1200','Comet Lake','no','65','4','8','3600','4300','0','4','yes','Dual Channel DDR4-2933','no','no','B460, H410, H470, Q470, W480, Z490','no','desktop','Comet Lake','14','2020','16x PCIe 3.0','128','1','3','5','3','2');

INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Crosshair VI Extreme','235','ATX','X370','4200','4','64','no','AM4','AMD','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Crosshair VI Hero','200','ATX','X370','4200','4','64','no','AM4','AMD','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Cosshair VI Hero WiFi/AC','230','ATX','X370','4200','4','64','yes','AM4','AMD','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Crosshair VII Hero','255','ATX','X470','4433','4','128','no','AM4','AMD','3','Enthusiast','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Crosshair VII Hero WiFi','275','ATX','X470','4433','4','128','yes','AM4','AMD','3','Enthusiast','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','Gaming Pro Carbon AC','139','ATX','B450','3600','4','64','yes','AM4','AMD','3','Mainstream','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Strix B450-F Gaming','149','ATX','B450','3600','4','64','no','AM4','AMD','3','Mainstream','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','B450 Aorus M','99','mATX','B450','3200','4','64','no','AM4','AMD','3','Mainstream','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','B450M Bazooka','109','mATX','B450','3200','4','64','no','AM4','AMD','3','Mainstream','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','B450I Gaming Plus AC','149','ITX','B450','3200','2','32','yes','AM4','AMD','3','Enthusiast','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Strix B450-I','149','ITX','B450','3200','2','32','yes','AM4','AMD','3','Enthusiast','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','X470 Taichi','199','ATX','X470','3933','4','128','yes','AM4','AMD','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','X470 Gaming Pro Carbon','199','ATX','X470','3600','4','128','no','AM4','AMD','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','X470 Aorus Gaming 7 WiFi','209','ATX','X470','3600','4','128','yes','AM4','AMD','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS ','Prime X470-Pro','149','ATX','X470','3600','4','128','no','AM4','AMD','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Strix B550-F Gaming WiFi','209','ATX','B550','3600','4','128','yes','AM4','AMD','4','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','B550 Aorus Master','249','ATX','B550','3600','4','128','yes','AM4','AMD','4','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','MAG B550 Tomahawk','179','ATX','B550','3600','4','128','no','AM4','AMD','4','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Strix B550-I Gaming','229','ITX','B550','3200','4','64','yes','AM4','AMD','4','Performance','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','TUF Gaming B550M-Plus','89','mATX','B550','3200','4','64','no','AM4','AMD','4','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS ','Prime B550M-A','115','mATX','B550','3200','4','64','no','AM4','AMD','4','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','Phantom Gaming','299','ATX','X570','4666','4','128','yes','AM4','AMD','4','Enthusiast','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','Aorus Master','349','ATX','X570','4666','4','128','yes','AM4','AMD','4','Enthusiast','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Crosshair VIII Hero','389','ATX','X570','4666','4','128','yes','AM4','AMD','4','Enthusiast','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','MEG X570 ACE','349','ATX','X570','4600','4','128','yes','AM4','AMD','4','Enthusiast','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','TUF Gaming X570-Plus','219','ATX','X570','3933','4','128','yes','AM4','AMD','4','Performance','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','X570 Godlike','499','ATX','X570','4933','4','128','yes','AM4','AMD','4','Enthusiast','4');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','X570 Taichi','349','ATX','X570','4666','4','128','yes','AM4','AMD','4','Enthusiast','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','GA-A320M-S2H','49','ATX','A320','2933','2','32','no','AM4','AMD','3','Entry','0');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Prime A320M-K','60','mATX','A320','2933','2','32','no','AM4','AMD','3','Entry','0');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','ProSeries A320M ','69','mATX','A320','2933','2','32','no','AM4','AMD','3','Entry','0');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','A320M-HDV','83','mATX','A320','2933','2','32','no','AM4','AMD','3','Entry','0');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI ','Gaming A320M Bazooka','89','mATX','A320','2933','4','64','no','AM4','AMD','3','Entry','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','A320M-DGS','79','mATX','A320','2933','2','32','no','AM4','AMD','3','Entry','0');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','TRX40 Aorus Pro WiFi','399','ATX','TRX40','4400','8','256','yes','sTRX4','AMD','4','Workstation','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Zenith II Extreme','799','EATX','TRX40','4733','8','256','yes','sTRX4','AMD','4','Workstation','5');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Prime TRX40-Pro','399','ATX','TRX40','4666','8','256','yes','sTRX4','AMD','4','Workstation','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','TRX40 Pro Wifi','399','ATX','TRX40','4666','8','256','yes','sTRX4','AMD','4','Workstation','4');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','Creator TRX40','799','EATX','TRX40','4666','8','256','yes','sTRX4','AMD','5','Workstation','7');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','Mag B460 Tomahawk','139','ATX','B460','2933','4','128','no','LGA 1200','Intel','2','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','B460 Aorus Pro AC','179','ATX','B460','2933','4','128','yes','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Strix B460-I Gaming','149','ITX','B460','2933','2','64','yes','LGA 1200','Intel','1','Enthusiast','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','MAG B460M Mortar WiFi','129','MATX','B460','2933','4','128','yes','LGA 1200','Intel','2','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','B460M Aorus Pro','139','mATX','B460','2933','4','128','no','LGA 1200','Intel','2','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','B460 Steel Legend','139','ATX','B460','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS ','ROG Strix B460-H Gaming','139','ATX','B460','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Prime B460M-A ','99','mATX','B460','2933','4','128','no','LGA 1200','Intel','1','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','H410M Pro','90','mATX','H410','2933','2','64','no','LGA 1200','Intel','1','Entry','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','H410M AC','139','mATX','H410','2933','2','64','yes','LGA 1200','Intel','1','Entry','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','H410M S2H','69','mATX','H410','2933','2','64','no','LGA 1200','Intel','1','Entry','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','H470 Steel Legend','139','ATX','H470','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Strix H470-I Gaming','159','ITX','H470','2933','2','64','no','LGA 1200','Intel','1','Enthusiast','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Prime H470-Plus','119','ATX','H470','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','H470M DS3H','89','mATX','H470','2933','2','64','no','LGA 1200','Intel','1','Mainstream','1');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','W480 Cretor','450','ATX','W480','3666','4','128','yes','LGA 1200','Intel','4','Performance','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS ','Pro WS W480 Ace','280','ATX','W480','3466','4','128','yes','LGA 1200','Intel','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','Z490 Taichi','370','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','4','Performance','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','Z490 Steel Legend','185','ATX','Z490','2933','4','128','no','LGA 1200','Intel','3','Performance','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASROCK ','Z490 Phantom Gaming','150','ATX','Z490','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Maximus XII Formula','499','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','4','Performance','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','ROG Strix Z490-F Gaming','269','ATX','Z490','2933','4','128','no','LGA 1200','Intel','4','Performance','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','TUF Z490-Plus WiFI','200','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('ASUS','Prime Z490-P','160','ATX','Z490','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Biostar','Racing z490GTA Evo','239','ATX','Z490','2933','4','128','no','LGA 1200','Intel','4','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('EVGA','Z490 FTW WiFi','289','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','4','Mainstream','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','Z490 Aorus Master ','389','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','4','Performance','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','Z490 Aours Ultra','299','ATX','Z490','2933','4','128','no','LGA 1200','Intel','4','Mainstream','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','Z490 Aorus Elite AC','219','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('Gigabyte','Z490 Aorus Pro','269','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','4','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','MEG Z490 ACE','400','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','4','Enthusiast','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','MPG Z490 Gaming Carbon WiFi','270','ATX','Z490','2933','4','128','yes','LGA 1200','Intel','4','Performance','3');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI','MAG Z490 Tomahawk','200','ATX','Z490','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');
INSERT INTO motherboard (manufacturer,model,price,form,chipset,ramMaxSpeed,ramMaxSticks,ramMaxCapacity,wifi,socket,platform,numPcie,category,m2) VALUES ('MSI ','Z490-A Pro','160','ATX','Z490','2933','4','128','no','LGA 1200','Intel','3','Mainstream','2');

INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','16','2','8','79','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Gskill','Aegis','DDR4','16','2','8','69','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Gskill','Trident Z Neo','DDR4','16','2','8','139','3600','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('OLOy','Warhawk Aura Sync RGB ','DDR4','16','2','8','65','3200','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('OLOy','Desktop Gaming UDIMM','DDR4','16','2','8','55','3000','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence LPX','DDR4','16','2','8','70','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence LPX','DDR4','16','2','8','67','3600','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('TEAMGROUP','T-Force Vulcan Z','DDR4','16','2','8','55','3000','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('XPG','Z1','DDR4','16','2','8','55','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','32','2','16','140','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','32','2','16','155','3600','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Crucial','RAM Desktop','DDR4','32','2','16','215','2666','19','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('PNY','XLR8 Gaming Epic-X','DDR4','16','2','16','68','3200','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('OLOy','Warhawk Aura Sync RGB ','DDR4','16','2','8','78','3600','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','64','2','32','249','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Gskill','Trident Z RGB','DDR4','16','2','8','85','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('OLOy','Warhawk Aura Sync RGB ','DDR4','16','2','8','59','3000','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','64','4','16','299','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('TEAMGROUP','T-Force Vulcan Z','DDR4','64','2','32','224','3000','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Gskill','Trident Z RGB','DDR4','64','2','32','259','3600','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','64','2','32','318','3600','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence LPX','DDR4','64','2','32','264','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','128','4','32','589','3600','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Gskill','Ripjaws V','DDR4','128','4','32','489','3600','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Gskill','Trident Z Royal','DDR4','128','4','32','576','3600','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('HyperX','Fury','DDR4','128','4','32','555','3200','18','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Corsair','Vengence RGB Pro','DDR4','256','8','32','1179','3200','16','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('Crucial','RAM Desktop','DDR4','8','1','8','23','2666','19','3');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('TEAMGROUP','Elite ','DDR4','8','1','8','26','2400','16','2');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('LEVEN','SINBA','DDR4','16','2','8','49','3200','16','1');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('V-Color','Desktop Memory Upgrade','DDR4','8','1','8','40','2666','19','1');
INSERT INTO memory (manufacturer,model,type,size,numSticks,memSize,price,speed,cl,reliability) VALUES ('HyperX','Fury','DDR4','8','2','4','46','2600','19','3');

INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','RX','Vega 56','399','1156','HBM2','8','2017','295','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','RX','Vega 64','499','1247','HBM2','8','2017','345','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon','VII','699','1400','HBM2','16','2019','300','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon','VII Liquid Cooled','799','1400','HBM2','16','2019','300','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','5500','139','1670','GDDR6','4','2019','150','Entry');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','5500XT','169','1717','GDDR6','4','2019','130','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','5500XT','199','1717','GDDR6','8','2019','130','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','5600','239','1375','GDDR6','6','2020','150','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','5600XT','279','1375','GDDR6','6','2020','160','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','5700','349','1465','GDDR6','8','2019','180','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','5700XT','399','1605','GDDR6','8','2019','225','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','6800','579','1700','GDDR6','16','2020','250','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','6800XT','649','1825','GDDR6','16','2020','300','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon RX','6900XT','999','1825','GDDR6','16','2020','300','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('AMD','Radeon Pro','WX 8200','1799','1200','HBM2','8','2018','230','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GT  ','1030','79','1152','GDDR4','2','2018','120','Entry');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1050','109','1354','GDDR5','3','2016','120','Entry');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1050Ti','139','1392','GDDR5','4','2016','120','Entry');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1060','249','1506','GDDR5','3','2016','200','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1060','299','1506','GDDR5','6','2016','200','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1070','379','1506','GDDR5','8','2017','250','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1070Ti','449','1607','GDDR5','8','2016','300','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1080','599','1607','GDDR5','8','2017','300','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1080Ti','699','1480','GDDR5X','11','2017','250','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','Titan X','1200','1417','GDDR5X','12','2016','250','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','Titan Xp','1200','1405','GDDR5X','12','2017','250','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','Volta','TITAN V','2999','1200','HBM2','12','2017','250','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1650','149','1485','GDDR6','4','2019','75','Entry');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1650 Super','159','1530','GDDR6','4','2019','75','Entry');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1660','219','1530','GDDR6','6','2019','100','Entry');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1660 Super','229','1530','GDDR6','6','2019','125','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce GTX','1660Ti','279','1500','GDDR6','6','2019','120','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','2060','349','1365','GDDR6','6','2019','160','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','2060 Super','399','1470','GDDR6','8','2019','175','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','2070','449','1410','GDDR6','8','2018','175','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','2070 Super','499','1605','GDDR6','8','2019','215','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','2080','699','1515','GDDR6','8','2018','215','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','2080 Super','699','1650','GDDR6','8','2019','250','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','2080Ti','999','1350','GDDR6','11','2018','250','Enthusiast ');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','Titan','1499','1350','GDDR6','24','2018','250','Workstation');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','3060Ti','399','1410','GDDR6','8','2020','200','Mainstream');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','3070','499','1500','GDDR6','8','2020','220','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','3080','699','1440','GDDR6X','10','2020','320','Performance');
INSERT INTO gpu (manufacturer,series,model,price,clock,memType,memSize,releaseDate,tbp,category) VALUES ('Nvidia','GeForce RTX','3090','1499','1395','GDDR6X','24','2020','350','Enthusiast ');

INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Seagate','BarraCuda Compute','49','hdd','3.5','1000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Seagate','BarraCuda Compute','59','hdd','3.5','2000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Seagate','BarraCuda Compute','89','hdd','3.5','4000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Seagate','BarraCuda Compute','119','hdd','3.5','6000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Seagate','BarraCuda Compute','159','hdd','3.5','8000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Western Digital','WD Blue','44','hdd','3.5','1000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Western Digital','WD Blue','69','hdd','3.5','2000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Western Digital','WD Blue','129','hdd','3.5','6000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','19','ssd','2.5','120','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','29','ssd','2.5','240','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','44','ssd','2.5','480','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','89','ssd','2.5','960','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','179','ssd','2.5','1920','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','24','ssd','m.2','120','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','34','ssd','m.2','240','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Kingston','A400','58','ssd','m.2','480','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','19','ssd','2.5','120','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','27','ssd','2.5','240','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','28','ssd','2.5','250','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','52','ssd','2.5','480','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','54','ssd','2.5','500','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','85','ssd','2.5','960','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','87','ssd','2.5','1000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('PNY','CS900','219','ssd','2.5','2000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('ADATA','SU655','19','ssd','2.5','120','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('ADATA','SU655','25','ssd','2.5','240','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('ADATA','SU655','89','ssd','2.5','960','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sandisk','SDSSDA','22','ssd','2.5','120','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sandisk','SDSSDA','27','ssd','2.5','240','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sandisk','SDSSDA','54','ssd','2.5','480','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sandisk','SDSSDA','129','ssd','2.5','960','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sandisk','SDSSDA','105','ssd','2.5','1000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sandisk','SDSSDA','189','ssd','2.5','2000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Samsung','970 Evo NVMe','59','ssd','m.2','250','yes','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Samsung','970 Evo NVMe','79','ssd','m.2','500','yes','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Samsung','970 Evo NVMe','159','ssd','m.2','1000','yes','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Samsung','970 Evo NVMe','299','ssd','m.2','2000','yes','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('TEAMGROUP','MS30','29','ssd','m.2','256','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('TEAMGROUP','MS30','49','ssd','m.2','512','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Western Digital','WD Blue','45','ssd','m.2','250','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Western Digital','WD Blue','55','ssd','m.2','500','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Western Digital','WD Blue','95','ssd','m.2','1000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Western Digital','WD Blue','259','ssd','m.2','2000','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sabrent','Rocket','89','ssd','m.2','500','yes','yes');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sabrent','Rocket','169','ssd','m.2','1000','yes','yes');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sabrent','Rocket','369','ssd','m.2','2000','yes','yes');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('Sabrent','Rocket','699','ssd','m.2','4000','yes','yes');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('XPG','SX6000','29','ssd','m.2','128','no','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('XPG','SX8200','45','ssd','m.2','256','yes','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('XPG','SX8200','60','ssd','m.2','512','yes','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('XPG','SX8200','109','ssd','m.2','1000','yes','no');
INSERT INTO storage (manufacturer,model,price,type,form,size,isnvme,gen4) VALUES ('XPG','SX8200','239','ssd','m.2','2000','yes','no');

INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Noctua','NH-L12S','LGA 1200','AM4','air','small','49','0','1','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Cooler Master','MasterAir MA620M Dual Tower RGB','LGA 1200','AM4','air','large','99','0','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('DeepCool','GAMMAXX400','LGA 1200','AM4','air','small','25','0','1','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Thermaltake','Floe RC360 ARGB','LGA 1200','AM4','liquid','large','169','360','3','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Cooler Master','MasterLiquid ML240L','LGA 1200','AM4','liquid','medium','69','240','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Pccooler','GI-D66A','LGA 1200','AM4','air','medium','55','0','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Thermaltake','Floe RC240 ARGB','LGA 1200','AM4','liquid','medium','139','240','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Corsair','H100i Pro RGB','LGA 1200','AM4','liquid','medium','119','240','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Corsair','H150i Pro RGB','LGA 1200','AM4','liquid','large','159','360','3','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Cooler Master','Hyper T2','LGA 1200','AM4','air','small','31','0','1','92');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Noctua','NH-U14S','LGA 1200','AM4','air','medium','80','0','1','140');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Corsair','H115i RGB Platinum','LGA 1200','AM4','liquid','medium','169','280','2','140');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Cooler Master','Hyper 212 Evo','LGA 1200','AM4','air','small','35','0','1','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Cooler Master','Hyper 212 Evo Black','LGA 1200','AM4','air','small','45','0','1','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('NZXT ','Kraken Z63','LGA 1200','AM4','liquid','medium','249','280','2','140');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('NZXT ','Kraken Z52','LGA 1200','AM4','liquid','medium','199','240','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('NZXT ','Kraken Z53','LGA 1200','AM4','liquid','medium','129','240','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('NZXT ','Kraken Z72','LGA 1200','AM4','liquid','large','209','360','3','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('NZXT ','Kraken Z73','LGA 1200','AM4','liquid','large','329','360','3','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('NZXT ','Kraken M22','LGA 1200','AM4','liquid','small','79','120','1','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('NZXT ','Kraken Z62','LGA 1200','AM4','liquid','medium','199','280','2','140');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Corsair','H100i ELITE CAPELLIX','LGA 1200','AM4','liquid','medium','149','240','2','120');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Corsair','H115i ELITE CAPELLIX','LGA 1200','AM4','liquid','medium','169','280','2','140');
INSERT INTO cooler (manufacturer,model,intel,amd,type,size,price,radiator,fans,fanSize) VALUES ('Corsair','H60','no','AM4','liquid','small','79','0','1','120');

INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('NZXT','H210','89','Mini Tower','ITX','1','small','120','custum, black, white, red, blue','no','4');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('NZXT','H510','69','Mid Tower','ATX','2','medium ','240','custum, black, white, red, blue','no','4');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('NZXT','H510 Elite','169','Mid Tower','ATX','2','medium ','280','white, black','yes','4');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('NZXT','H710','169','Full Tower','ATX','3','large','360','custum, black, white, red, blue','no','7');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('NZXT','H210i','119','Mini Tower','ITX','1','small','120','custum, black, white, red, blue','yes','4');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('NZXT','H510i','89','Mid Tower','ATX','2','medium ','240','custum, black, white, red, blue','yes','4');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('NZXT','H710i','199','Full Tower','ATX','3','large','360','custum, black, white, red, blue','yes','7');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Corsair','iCUE 220T','99','Mid Tower','ATX','3','large','360','white, black','yes','5');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Corsair','4000D Airflow','79','Mid Tower','ATX','4','large','360','white, black','no','6');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Corsair','Obsidian 500D','279','Full Tower','EATX','3','large','360','white, black','yes','19');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Corsair','Crystal 280X','179','Micro Tower','mATX','2','medium ','280','white, black','yes','5');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Corsair','Crystal 680X','249','Full Tower','EATX','4','large','360','white, black','yes','7');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Corsair','Crystal 465X','139','Mid Tower','ATX','3','large','360','white, black','yes','6');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Corsair','Carbide 200R','60','Mid Tower','ATX','2','medium ','120','red, black','no','2');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Lian Li','PC-O11 Dynamic','169','Mid Tower','ATX','0','large','360','white, black','no','9');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Lian Li','LIANCOOL II','89','Mid Tower','ATX','3','medium ','280','white, black','yes','6');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Lian Li','LIANCOOL II Mesh','139','Mid Tower','ATX','3','medium ','280','white, black','yes','6');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Lian Li','O11 Dynamic XL','199','Full Tower','EATX','0','large','420','white, black','yes','10');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Cooler Master','MasterBox MB530','109','Mid Tower','ATX','4','large','360','black','yes','6');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Cooler Master','HAF XB Evo','109','Micro Tower','ATX','2','medium ','240','black','no','4');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Cooler Master','MasterCase H500M','199','Full Tower','EATX','3','large','360','white, black','yes','7');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Cooler Master','MasterCase H500 ARGB','105','Mid Tower','ATX','3','large','360','black','yes','5');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Cooler Master','MasterBox MB511','59','Mid Tower','ATX','4','medium ','240','black','no','4');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Cooler Master','MasterBox Q300L','49','Micro Tower','mATX','1','medium ','240','black','no','5');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Cooler Master','MasterCase H100','69','Mini Tower','ITX','1','small','120','black','yes','1');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Deep Cool','CL500','79','Mid Tower','ATX','4','large','360','white, black','no','6');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Rosewill','SCM-01B','21','Micro Tower','mATX','2','medium ','120','black','no','2');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Fractal Design','Meshify C','69','Mid Tower','ATX','1','medium ','280','white, black','no','6');
INSERT INTO cases (manufacturer,model,price,size,maxBoard,fans,coolerSize,maxRad,colors,rgb,maxFans) VALUES ('Fractal Design','Node 804','69','Micro Tower','mATX','2','small','120','black','no','2');

INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Corsair','RM550x','99','550','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Corsair','RM650x','119','650','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Corsair','RM750x','149','750','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Corsair','RM850x','179','850','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','E500','79','500','gold','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','E600','99','650','gold','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','E700','109','750','gold','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','E800','129','850','gold','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','C550','89','550','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','C650','109','650','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','C750','129','750','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('NZXT','C850','149','850','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Segostep','Gaming Power Supply','79','650','gold','1');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Segostep','Gaming Power Supply','99','750','gold','1');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Segostep','Gaming Power Supply','129','850','gold','1');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','N1','39','400','no','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','N1','55','550','no','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','N1','59','650','no','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','N1','65','750','no','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','BR','49','500','bronze','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','BR','59','600','bronze','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','BR','69','700','bronze','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova G3','119','650','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova G3','139','750','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova G3','159','850','gold','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova P2','179','750','platinum','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova P2','219','850','platinum','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova P2','299','1000','platinum','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova P2','319','1200','platinum','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova P2','469','1600','platinum','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova T2','259','850','titanium','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova T2','329','1000','titanium','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('EVGA','SuperNova T2','549','1600','titanium','3');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Thermaltake','Smart','49','500','white','2');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('ARESGAME','Power Supply','49','500','bronze','1');
INSERT INTO psu (manufacturer,model,price,wattage,certified,reliability) VALUES ('Seasonic','Focus GX-650','124','650','gold','3');
