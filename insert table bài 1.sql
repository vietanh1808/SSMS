insert into ChungNhan(MaNv, MaMb)
values ('567354612', '757'),
		('567354612', '747')

alter table ChuyenBay
drop column dd, dxp, 
add dd Nvarchar(30)
add dxp Nvarchar(30)
drop column TtCb


ALTER INDEX MaNv On ChungNhan
DISABLE;

ALTER TABLE ChungNhan
DROP CONSTRAINT MaNv;

create table ChungNhan (
	MaNv int ,
	MaMb int
)

create table MayBay (
	MaMb int  ,
	Hieu varchar(50),
	TamBay int
)

create table NhanVien(
	MaNv char(9) ,
	Ten varchar(50),
	Luong int,
)

create table ChuyenBay (
	MaCb char(5),
	GaDi varchar(50),
	GaDen varchar(50),
	DoDai int,
	GioDi time,
	GioDen time,
	ChiPhi int
)

use QLMB;
drop table ChuyenBay
drop table ChungNhan
drop table NhanVien
drop table MayBay

INSERT INTO ChungNhan values('567354612','747');
INSERT INTO ChungNhan values('567354612','737');
INSERT INTO ChungNhan values('567354612','757');
INSERT INTO ChungNhan values('567354612','777');
INSERT INTO ChungNhan values('567354612','767');
INSERT INTO ChungNhan values('567354612','727');
INSERT INTO ChungNhan values('567354612','340');
INSERT INTO ChungNhan values('552455318','737');
INSERT INTO ChungNhan values('552455318','319');
INSERT INTO ChungNhan values('552455318','747');
INSERT INTO ChungNhan values('552455318','767');
INSERT INTO ChungNhan values('39048451','340');
INSERT INTO ChungNhan values('39048451','320');
INSERT INTO ChungNhan values('39048451','319');
INSERT INTO ChungNhan values('274878974','757');
INSERT INTO ChungNhan values('274878974','767');
INSERT INTO ChungNhan values('355548984','154');
INSERT INTO ChungNhan values('310454876','154');
INSERT INTO ChungNhan values('142519864','747');
INSERT INTO ChungNhan values('142519864','757');
INSERT INTO ChungNhan values('142519864','777');
INSERT INTO ChungNhan values('142519864','767');
INSERT INTO ChungNhan values('142519864','737');
INSERT INTO ChungNhan values('142519864','340');
INSERT INTO ChungNhan values('142519864','320');
INSERT INTO ChungNhan values('26934834','747');
INSERT INTO ChungNhan values('26934834','737');
INSERT INTO ChungNhan values('26934834','340');
INSERT INTO ChungNhan values('26934834','757');
INSERT INTO ChungNhan values('26934834','777');
INSERT INTO ChungNhan values('26934834','767');
INSERT INTO ChungNhan values('26934834','320');
INSERT INTO ChungNhan values('26934834','319');
INSERT INTO ChungNhan values('26934834','727');
INSERT INTO ChungNhan values('26934834','154');
INSERT INTO ChungNhan values('242518965','737');
INSERT INTO ChungNhan values('242518965','757');
INSERT INTO ChungNhan values('141582651','737');
INSERT INTO ChungNhan values('141582651','757');
INSERT INTO ChungNhan values('141582651','767');
INSERT INTO ChungNhan values('011564812','737');
INSERT INTO ChungNhan values('011564812','757');
INSERT INTO ChungNhan values('5448945','154');

INSERT INTO MayBay values('747','Boeing 747 - 400','13488');
INSERT INTO MayBay values('737','Boeing 737 - 800','5413');
INSERT INTO MayBay values('340','Airbus A340 - 300','11392');
INSERT INTO MayBay values('757','Boeing 757 - 300','6416');
INSERT INTO MayBay values('777','Boeing 777 - 300','10306');
INSERT INTO MayBay values('767','Boeing 767 - 400ER','10360');
INSERT INTO MayBay values('320','Airbus A320','4168');
INSERT INTO MayBay values('319','Airbus A319','2888');
INSERT INTO MayBay values('727','Boeing 727','2406');
INSERT INTO MayBay values('154','Tupolev 154','6565');

INSERT INTO NhanVien values('242518965','Tran Van Son','120433');
INSERT INTO NhanVien values('141582651','Doan Thi Mai','18345');
INSERT INTO NhanVien values('011564812','Ton Van Quy','153972');
INSERT INTO NhanVien values('567354612','Quan Cam Ly','256481');
INSERT INTO NhanVien values('552455318','La Que','101745');
INSERT INTO NhanVien values('550156548','Nguyen Thi Cam','205187');
INSERT INTO NhanVien values('390487451','Le Van Luat','212156');
INSERT INTO NhanVien values('24878974','Mai Quoc Minh','99890');
INSERT INTO NhanVien values('254099823','Nguyen Thi Quynh','24450');
INSERT INTO NhanVien values('356187925','Nguyen Vinh Bao','44740');
INSERT INTO NhanVien values('355548984','TranThi lloai An','212156');
INSERT INTO NhanVien values('310454876','Ta Van Do','212156');
INSERT INTO NhanVien values('489456522','Nguyen Thi Quy Linh','127984');
INSERT INTO NhanVien values('489221823','Bui Quoc Chinh','23980');
INSERT INTO NhanVien values('548977562','Le Van Quy','8446');
INSERT INTO NhanVien values('310454877','Tran Van Hao','33546');
INSERT INTO NhanVien values('142519864','Nguyen Thi Xuan Dao','227489');
INSERT INTO NhanVien values('26934834','Truong Tuan Anh','289950');
INSERT INTO NhanVien values('287321212','Duong Van Minh','48090');
INSERT INTO NhanVien values('552455348','Bui Thi Dung','92013');
INSERT INTO NhanVien values('248965255','Tran Thi Ba','43723');
INSERT INTO NhanVien values('159542516','Le Van Ky','48250');
INSERT INTO NhanVien values('348121549','Nguyen Van Thanh','32899');
INSERT INTO NhanVien values('54489457','Bui Van Lap','20');

INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN431','SGN','CAH','3693','05:55','06:55','236');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN320','SGN','DAD','2798','06:00','07:10','221');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN464','SGN','DLI','2002','07:20','08:05','225');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN216','SGN','DIN','4170','10:30','14:20','262');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN280','SGN','HPH','11979','06:00','08:00','1279');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN254','SGN','HUI','8765','18:40','20:00','781');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN338','SGN','BMV','4081','15:25','16:25','375');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN440','SGN','BMV','4081','18:30','19:30','426');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN651','DAD','SGN','2798','19:30','08:00','221');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN276','DAD','CXR','1283','09:00','12:00','203');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN374','HAN','VII','510','11:40','13:25','120');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN375','VII','CXR','752','14:15','16:00','181');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN269','HAN','CXR','1262','14:10','15:50','202');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN315','HAN','DAD','134','11:45','13:00','112');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN317','HAN','UIH','827','15:00','16:15','190');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN741','HAN','PXU','395','06:30','08:30','120');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN474','PXU','PQC','1586','08:40','11:20','102');
INSERT INTO  ChuyenBay(MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi) values('VN476','UIH','PQC','485','09:15','11:50','117');

