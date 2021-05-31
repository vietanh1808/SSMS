CREATE TABLE DIEM (
	MASV VARCHAR(9),
	MAMH VARCHAR(50),
	Diem1 INT CHECK (Diem1 between 0 and 10),
	Diem2 INT CHECK (Diem2 >= 0 and Diem2 <= 10)
)

CREATE TABLE DIEM (
	MASV VARCHAR(9),
	MAMH VARCHAR(50),
	constraint R1 CHECK ((Diem1 >= 0 and Diem1 <= 10) and ( Diem2 between 0 an 10))
)

CREATE TABLE SINHVIEN (
	MASV VARCHAR(9),
	TENSV VARCHAR(50), NOT NULL
)
---- ========================================================================
---- Nếu bảng có 1 khoá chính --> <column> <type> PRIMARY KEY
---- Nếu BẢNG CÓ 2  khoá chính trở nên --> CONSTRAINT [tên-ràng-buộc] PRIMARY KEY ([d/s cột])
---- ========================================================================

CREATE TABLE DIEM (
	MASV VARCHAR(9), 

CREATE TABLE PHANCONG (
	MADA varchar(4),
	MANV varchar(100),
	Constraint PK_Ma PRIMARY KEY (MADA, MANV)
)
---- ========================================================================
---- ràng buộc DEFAULT
---- Xác định giá trị mặc định ban đầu cho từng cột
---- ========================================================================
CREATE TABLE VATTU (
	MAVTU varchar(4) primary key,
	TenVtu varchar(100),
	SoLuong int Default(100)
	)

CREATE TABLE SINHVIEN (
	MASV varchar(4) primary key,
	TenSV varchar(100),
	GioiTinh varchar(3) Default ('Nam')
	)
	
-- Ràng buộc UNIQUE
CREATE TABLE VATTU (
	MAVTU varchar(3) primary key
	TenVte varchar(100) UNIQUE
)

CREATE TABLE VATTU (
	MAVTU varchar(4) not null,
	TebVtu varchar(100),
	Constraint UN_Vtu UNIQUE (MAVtu, TenVtu)
)

--Ràng buộc Foreign Key

CASCADE
NOACTION
SET NULL
SET DEFAULT

CREATE TABLE CTHOADON (
	SOHD varchar(3) REFERENCES HOADON(SOHD),  -- SOHD CỦA CTHOADON là khoá ngoại của HOADON
	MAVTU varchar(3) REFERENCES VATTU(MAVTU), -- MAVTU của CTHOADON là khoá ngoại của VATTU
	Soluong int,
	Dongia float
)

CREATE TABLE CTHOADON (
	SOHD varchar(3),
	MAVTU varchar(3),
	Soluong int,
	Dongia float,
	FOREIGN KEY (SOHD) REFERENCES HOADON (SOHD),
	FOREIGN KEY (MAVTU) REFERENCES VATTU(MAVTU)
)


-- Ràng buộc IDENTITY

-- Sửa cấu trúc bảng
-- ALTER TABLE

ALTER TABLE VATTU
ADD Soluong int  -- Thêm cột mới vào trong bảng
DROP COLUMN TenVtu -- Xoá cột trong bảng
ALTER COLUMN TenVtu Nvarchar(30) -- Sửa đổi kiểu dữ liệu bảng
				-- Thêm ràng buộc cho cột
ADD CONSTRAINT CK_NgayNhap		
CHECK ( Ngaynhap <= GetDate() )  
				-- Huỷ ràng buộc đã đặt
DROP CONSTRAINT CK_NgayNhap
				-- Bật/tắt các ràng buộc đã đặt
NOCHECK CONSTRAINT ALL|Tên_Constraint
CHECK CONSTRAINT ALL|Tên_Constraint
				-- Đổi tên cột
EXEC Sp_Rename 'VATTU.MAVTU', 'MAVATTU', 'COLUMN'
				-- Đổi tên bảng
EXEC sp_rename 'tên_bảng', 'tên_ mới'


