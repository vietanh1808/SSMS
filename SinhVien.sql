use Example

CREATE TABLE SINHVIEN (
	MASV INT IDENTITY,
	TENSV NVARCHAR(50) UNIQUE NOT NULL,
	NAMSINH date,
	GIOITINH nvarchar(3),
	QUEQUAN nvarchar(50),
)

drop table SINHVIEN

ALTER TABLE SINHVIEN
--drop COLUMN GIOITINH
ALTER COLUMN GIOITINH nvarchar(3)

insert into sinhvien(TENSV, NAMSINH, GIOITINH, QUEQUAN)
--values('Vũ Lương Việt Đức', '2000/10/29', 'Nam', 'Hà Nội')
--		values('Trần Tiến Đạt', '2000/12/02', 'Nam', 'Nam Định')
--		values('Hiếu Dương', '2000/01/22', 'Nam', 'Thanh Hoá')
--		values('Huệ', '2000/06/20', 'Nữ', 'Hà Nội')
--		values('Nhi', '2001/05/10', 'Nữ', 'Hải Phòng')
		values('Trần Văn Khoa', '1999/01/25', 'Nam', 'Hà Nội')
)