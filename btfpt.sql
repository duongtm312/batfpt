create database baitapfpt;

create table nhacungcap(
manhacc int primary key,
tennhacc varchar(50),
diachi varchar(50),
Sodt varchar (20),
masothue varchar(30)
);

create table loaidichvu(
maloaiDV int primary key,
tenloaidv varchar(50)
);

create table mucphi(
mamucphi int primary key,
dongia int,
mota varchar(50)
);

create table dongxe(
dongxe int primary key,
hangxe varchar(50),
sochongoi int
);

create table Dangkycungcap(
maDKCC int primary key,
manhacc int,foreign key (manhacc) references nhacungcap(manhacc),
maloaidv int, foreign key (maloaidv) references loaidichvu(maloaidv),
dongxe int, foreign key (dongxe) references dongxe(dongxe),
mamucphi int, foreign key (mamucphi) references mucphi(mamucphi),
Nbdcc datetime,
Nktcc datetime,
SLxeDK int
);
INSERT INTO nhacungcap VALUES	(1,'MaiLinh','Hà Nội','0345066663','MLHN'),
								(2,'ACB','Toàn quốc','0345066669','ACBHN'),
								(3,'Taxi HCM','TP HCM','0345063172','HCM1'),
								(4,'Taxi Sài gòn','TP HCM','0345063172','SG2'),
								(5,'Taxi Thủ Đô','Hà Nội','0345063142','TDHN');
INSERT INTO loaidichvu VALUES	(1,'Thuê xe đi lại'),
								(2,'Thuê xe đi du lịch 16 chỗ'),
								(3,'Thuê xe đi du lịch 30 chỗ');
INSERT INTO mucphi VALUES		(1,14000,'14k/1km,Xe 5 chỗ'),
								(2,25000,'10k/1km, Xe 16 chỗ'),
								(3,50000,'10k/1km, Xe 32 chỗ');
INSERT INTO dongxe VALUES       (1,'toyota',5),
								(2,'huyndai',16),
                                (3,'SU',32),
								(4,'BMV',5),
								(5,'Kia',5),
                                (6,'ThaCo',32);
INSERT INTO Dangkycungcap VALUES (1,1,1,1,1,'2022-6-11','2022-6-13',6), (2,3,2,2,2,'2022-6-21','2022-6-23',1),(3,5,3,3,3,'2022-6-19','2022-6-21',2);
-- Cau3
SELECT * FROM dongxe WHERE sochongoi > 5;
-- Cau4
SELECT nhacungcap.* FROM nhacungcap join Dangkycungcap on nhacungcap.manhacc=Dangkycungcap.manhacc;
-- Cau5
SELECT * FROM nhacungcap order by tennhacc;
-- Cau6
SELECT  nhacungcap.*,count(maDKCC) as 'Số lần đăng ký cung cấp'
FROM dangkycungcap join nhacungcap on dangkycungcap.manhacc= nhacungcap.manhacc
where dangkycungcap.Nbdcc > '2019-12-15'
group by nhacungcap.manhacc;  
-- Cau7
SELECT DISTINCT dx.hangxe as 'Hãng xe'
FROM dongxe;
-- Cau8
SELECT dk.maDKCC,n.*,ldv.tenloaidv,m.dongia,dx.hangxe,dk.Nbdcc,dk.Nktcc
FROM nhacungcap AS n 
	LEFT JOIN Dangkycungcap AS dk  ON n.manhacc=dk.manhacc 
    LEFT JOIN loaidichvu as ldv ON dk.maloaiDV=ldv.maloaiDV
    LEFT JOIN mucphi AS m ON dk.mamucphi=m.mamucphi
    LEFT JOIN dongxe AS dx ON dk.dongxe=dx.dongxe;	  
-- Cau9
SELECT *
FROM nhacungcap AS n JOIN Dangkycungcap as dk on n.manhacc =dk.manhacc  JOIN dongxe AS dx on dk.dongxe =dx.dongxe
WHERE dx.hangxe='Toyota' OR dx.hangxe='SU';
-- Cau10
SELECT *
FROM nhacungcap 
WHERE manhacc not in( SELECT manhacc FROM Dangkycungcap);