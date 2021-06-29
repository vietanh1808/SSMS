create view nhanvien1 as
	select MaNv, Hoten, Diachi, SDT, Ngaysinh, GT, HSL
	from NHANVIEN
	where GT = 'Nu'

create view thongtin_nv(MaNV, HoTen, GT, Tuoi)
AS
SELECT MaNV, HoTen, GT, datediff(year,NgaySinh,getdate())
FROM nhanvien

create view khach_hang as
	select TenKH
	from KHACHHANG join HOADONXUAT on KHACHHANG.MAKH = HOADONXUAT.MaKH
		join HOADON on HOADON.MaHD = HOADONXUAT.MaHD
	group by TenKH
	having count(DonGia*SoLuongMua) > 10000000

create view nhan_vien as
	select HoTen
	from NHANVIEN join HOADONXUAT on NHANVIEN.MaNV = HOADONXUAT.MaNV
		join HOADON on HOADON.MaHD = HOADONXUAT.MaHD
	group by HoTen
	having count(DonGia*SoLuongMua) > 20000000

create database KiemTra

create table Khoa(
	MaK varchar(9),
	TenK varchar(20), 
	SoDT varchar(10)
)

create table Lop(
	MaLop varchar(9),
	TenLop varchar(20),
	Siso int,
	Mak varchar(20)
)

create table Sinhvien(
	MaSv varchar(9),
	TenSv varchar(20),
	Ns int,
	Gt varchar(3),
	MaLop varchar(20)
)

create table MonHoc(
	MaMon varchar(9),
	TenMon varchar(20),
	SoDVHT int
)

create table Diem(
	MaSv varchar(9),
	MaMon varchar(9),
	Ketqua float,
	Lanthi int
) 

INSERT INTO Khoa values('CNTT','CNTT', '0912333444');
INSERT INTO Khoa values('CT','Công trình', '0912654444');
INSERT INTO Khoa values('TM','Thương Mại', '0365833444');
INSERT INTO Khoa values('KT','Kinh Tế', '0912598944');


INSERT INTO Lop values('MMT','Mạng máy tính', '112', 'CNTT');
INSERT INTO Lop values('DT','Điện tử', '113', 'CNTT');
INSERT INTO Lop values('QTKD','Quản trị kinh doanh', '114', 'TM');
INSERT INTO Lop values('KT','Kế toán', '115', 'KT');
INSERT INTO Lop values('TD','Tàu đường', '200', 'CT');
INSERT INTO Lop values('HTTT','Hệ thống thông tin', '300', 'CNTT');


INSERT INTO Sinhvien values('ABC123','Nguyen Van A', '2000', 'Nam', 'MMT');
INSERT INTO Sinhvien values('ABC124','Nguyen Van B', '2000', 'Nu', 'KT');
INSERT INTO Sinhvien values('ABC125','Nguyen Van C', '2001', 'Nam', 'TD');
INSERT INTO Sinhvien values('ABC126','Nguyen Van D', '2002', 'Nu', 'HTTT');
INSERT INTO Sinhvien values('ABC127','Nguyen Van E', '2003', 'Nam', 'DT');
INSERT INTO Sinhvien values('ABC128','Nguyen Van G', '2004', 'Nu', 'QTKD');
INSERT INTO Sinhvien values('ABC129','Nguyen Van H', '2004', 'Nam', 'HTTT');
INSERT INTO Sinhvien values('ABC130','Nguyen Van O', '2001', 'Nu', 'QTKD');
INSERT INTO Sinhvien values('ABC131','Nguyen Van L', '2002', 'Nam', 'QTKD');
INSERT INTO Sinhvien values('ABC132','Nguyen Van M', '2003', 'Nu', 'MMT');

INSERT INTO MonHoc values('KTH','Kinh tế học', '6');
INSERT INTO MonHoc values('NMM','nhập môn mạng', '4');
INSERT INTO MonHoc values('DTH','điện tử học', '3');
INSERT INTO MonHoc values('HTH','hệ thống học', '5');
INSERT INTO MonHoc values('TDH','tàu đường học', '3');
INSERT INTO MonHoc values('KDH','kinh doanh học', '4');
INSERT INTO MonHoc values('CSDL','cơ sở dữ liệu', '4');

INSERT INTO Diem values('ABC123','NMM', '5', '1');
INSERT INTO Diem values('ABC124','KDH', '6', '2');
INSERT INTO Diem values('ABC125','TDH', '3', '1');
INSERT INTO Diem values('ABC126','HTH', '4', '3');
INSERT INTO Diem values('ABC127','DTH', '7', '1');
INSERT INTO Diem values('ABC128','KDH', '9', '1');
INSERT INTO Diem values('ABC129','CSDL', '9', '1');

-- bài 1
create view thongtin_sinhvien_nu as
	select MaSv, TenSv, Ns, Gt, MaLop, Diem.Ketqua, Diem.MaMon
	from Sinhvien
		inner join Diem on Diem.MaSv = Sinhvien.MaSv
		inner join MonHoc on MonHoc.MaMon = Diem.MaMon
	where Diem.MaMon = 'CSDL' and Sinhvien.Gt = 'Nu'


-- bài 2
create view sinhvien_quamon as
	select MaSv, TenSv, Ns, Gt, MaLop, Diem.Ketqua, Diem.MaMon
	from Sinhvien
		inner join Diem on Diem.MaSv = Sinhvien.MaSv
		inner join MonHoc on MonHoc.MaMon = Diem.MaMon
	where Diem.Ketqua >= 4 and MonHoc.TenMon = 'toán dời dạc'


-- bài 3
create view sinhvien_diem as
	select TenSv, AVG(Diem.Ketqua) as 'điểm trung bình của các sinh viên'
	from Sinhvien
	group by TenSv

-- bài 4
create view sinhvien_hoclai as
	select TenMon, count(MaSv) as 'số sinh viên học lại'
	from MonHoc, Diem
	where MonHoc.MaMon = Diem.MaMon and Diem.Ketqua < 4 and Diem.Lanthi > 2