create view nhanvien1 as
	select MaNv, Hoten, Diachi, SDT, Ngaysinh, GT, HSL
	from NHANVIEN
	where GT = 'Nu'

create view nhanvien2 as
	select MaNv, Hoten, Ngaysinh, GT
	from NHANVIEN

create view nhanvien3 as
	select tenkh
	from khachhang, ct_hoadon
	where ct_hoadon.dongia * ct_hoadon.dongia > 10000000
	
create view nhanvien4 as
	select hoten
	from nhanvien, hoadonxuat, ct_hoadon
	where
		ct_hoadon.dongia * ct_hoadon.dongia > 10000000,
		hoadonxuat.mahd = ct_hoadon.mahd,
		hoadonxuat.manv = nhanvien.manv