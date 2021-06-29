create database SPJ;
use SPJ

drop database SPJ;

create table NCC (
	MaNCC varchar(10),
	Ten varchar(50),
	Heso int,
	ThPho varchar(50)
)

create table DUAN (
	MaDA varchar(10),
	Ten varchar(50),
	ThPho varchar(50)
)

create table VATTU (
	MaVT varchar(10),
	Ten varchar(50),
	Mau varchar(20),
	TrLuong float,
	ThPho varchar(50)
)

create table CC (
	MaNCC varchar(10),
	MaVT varchar(10),
	MaDA varchar(10),
	SLuong int
)

insert into NCC values('S1', 'Son', 20, 'TpHCM');
insert into NCC values('S2', 'Tran', 10, 'HaNoi');
insert into NCC values('S3', 'Bach', 30, 'HaNoi');
insert into NCC values('S4', 'Lap', 20, 'TpHCM');
insert into NCC values('S5', 'Anh', 30, 'DaNang');

insert into DUAN values('J1', 'May phan loai', 'HaNoi');
insert into DUAN values('J2', 'Man hinh', 'VietTri');
insert into DUAN values('J3', 'OCR', 'DaNang');
insert into DUAN values('J4', 'Bang dieu khien', 'DaNang');
insert into DUAN values('J5', 'RAID', 'TpHCM');
insert into DUAN values('J6', 'EDS', 'HaiPhong');
insert into DUAN values('J7', 'Bang tu', 'TpHCM');


insert into VATTU values('P1', 'Dai oc', 'Do', 12.0, 'TpHCM');
insert into VATTU values('P2', 'Bu long', 'Xanh la', 17.0, 'HaNoi');
insert into VATTU values('P3', 'Dinh vit', 'Xanh duong', 17.0, 'HaiPhong');
insert into VATTU values('P4', 'Dinh vit', 'Do', 14.0, 'TpHCM');
insert into VATTU values('P5', 'Cam', 'Xanh duong', 12.0, 'HaNoi');
insert into VATTU values('P6', 'Banh rang', 'Do', 19.0, 'TpHCM');

insert into CC values('S1', 'P1', 'J1', 200);
insert into CC values('S1', 'P1', 'J4', 700);
insert into CC values('S2', 'P3', 'J1', 400);
insert into CC values('S2', 'P3', 'J2', 200);
insert into CC values('S2', 'P3', 'J3', 200);
insert into CC values('S2', 'P3', 'J4', 500);
insert into CC values('S2', 'P3', 'J5', 600);
insert into CC values('S2', 'P3', 'J6', 400);
insert into CC values('S2', 'P3', 'J7', 800);
insert into CC values('S2', 'P5', 'J2', 100);
insert into CC values('S3', 'P3', 'J1', 200);
insert into CC values('S3', 'P4', 'J2', 500);
insert into CC values('S4', 'P6', 'J3', 300);
insert into CC values('S4', 'P6', 'J7', 300);
insert into CC values('S3', 'P4', 'J2', 500);
insert into CC values('S5', 'P2', 'J2', 200);
insert into CC values('S5', 'P2', 'J3', 100);
insert into CC values('S5', 'P5', 'J5', 500);
insert into CC values('S5', 'P5', 'J1', 100);
insert into CC values('S5', 'P6', 'J2', 200);
insert into CC values('S5', 'P1', 'J4', 100);
insert into CC values('S5', 'P3', 'J4', 200);
insert into CC values('S5', 'P4', 'J4', 800);
insert into CC values('S5', 'P5', 'J4', 400);
insert into CC values('S5', 'P6', 'J4', 500);

-- câu 2: cho biết thông tin chi tiết về các dự án tphcm
select * from DUAN
where ThPho = 'TpHCM'

-- câu 3: cho biết màu và thành phố của các vật tư 
-- ko được lưuu trũ tại hnoi và có trọng lượng > 10
select mau, thPho from VATTU
where ThPho = 'HaNoi' and TrLuong > 10

-- câu 4: liệt kê các cặp mã số nhà cung cấp ở 
-- cùng 1 thành phố
select a.MaNCC, b.MaNCC from NCC as a, NCC as b
where a.ThPho = b.ThPho

-- câu 5: xây dựng storeprocedure để tính tổng số lượng 
-- vật tư P1 được cung cấp bời nhà cc đc truyền vào
create proc tong_vattu
	(@ncc varchar(20))
as begin
	select sum(SLuong) from CC
	where MaNCC = @ncc and MaVT = 'P1'
end

-- câu 6: cho biết mã số và tên các dự ấn được ung cấp vật tư p1 với
-- số lượng vật tư trung bình lớn hơn tất cả các số lượng vật tư được
-- cung cấp cho dự án J1
select distinct Duan.MaDA, Ten from DUAN
	inner join CC on DUAN.MaDA = CC.MaDA
where (select avg(SLuong) from CC) > SLuong and CC.MaVT = 'P1'

-- câu 7: cho biết mã số và tên các dự án không được cung cấp vật tư
-- nào có quy cách màu đỏ bởi một nhà cung cấp bất kỳ ở tphcm
(select DUAN.MaDA, DUAN.Ten from DUAN)
except
(select distinct DUAN.MaDA, DUAN.Ten from DUAN
	inner join CC on DUAN.MaDA = CC.MaDA
	inner join VATTU on Vattu.MaVT = CC.MaVT
where Mau = 'Do' and VATTU.ThPho = 'TpHCM')

-- câu 8: liệt kê tất cả các cặp mã số nhà cc có thể cung cấp cùng tất 
-- cả các loại vật tư
select a.MaNCC, b.MaNCC from CC as a, CC as b
where a.MaVT = b.MaVT


