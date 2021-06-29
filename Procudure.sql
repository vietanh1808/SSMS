create database procudure_practise
use procudure_practise

create table nhanvien 
(
	manv nvarchar(10),
	hoten nvarchar(50),
	diachi nvarchar(100),
	sdt nvarchar(12),
	ngaysinh date,
	gt nvarchar(3),
	hsl nvarchar(10)
)

drop table nhanvien

create table hang(
	mahang nvarchar(10),
	tenhang nvarchar(30),
	nhasx nvarchar(50),
	tgianbaohanh date
)

create table khachhang (
	makh nvarchar(10),
	tenkh nvarchar(50),
	cmt int,
	diachi nvarchar(100),
	sodienthoai nvarchar(12),
	email nvarchar(50)
)

create table ct_hoadon (
	mahd nvarchar(10),
	mahang nvarchar(10),
	soluongmua int,
	dongia int
)

create table hoadonxuat (
	mahd nvarchar(10),
	makh nvarchar(10),
	ngaylaphd date,
	manv nvarchar(10),
	phuongthuctt nvarchar(20)
)


create proc tongtien_khachhang
	(@makh varchar(10))
as begin
	declare @sumMoney int
	set @sumMoney = (select sum(ct_hoadon.soluongmua * ct_hoadon.dongia) from ct_hoadon, khachhang where makh = @makh)

	select tenkh, @sumMoney
	from khachhang 
end
tongtien_khachhang 'kh01'
drop proc tongtien_khachhang

create proc tongtien_donhang
	(@mahd nvarchar(10))
as
	select mahd, sum(soluongmua*dongia)
	from ct_hoadon
	where mahd = @mahd 

create proc tongtien_thang
	(@thang date)
as
	select ngaylaphd, sum(soluongmua*dongia)
	from hoadonxuat
		inner join ct_hoadon on ct_hoadon.mahd = hoadonxuat.mahd
	where ngaylaphd = @thang

create proc tuoi_caonhat
as
	declare @MaxTuoi date
	set @MaxTuoi = (select min(ngaysinh) from nhanvien)

	select hoten from nhanvien
	where ngaysinh = @MaxTuoi

	drop proc tuoi_caonhat

tuoi_caonhat
	


insert into nhanvien values('NV01', 'a', 'hanoi', '039242332', '2000/04/28', 'nam', '123');
insert into nhanvien values('NV03', 'c', 'haiphong', '039246592', '2000/04/26', 'nữ', '356');
insert into nhanvien values('NV02', 'b', 'hanoi', '039242332', '2001/04/28', 'nam', '234');

insert into khachhang values('kh01', 'khA', '123', 'hanoi', '123123', 'abc@gmail.com');
insert into khachhang values('kh02', 'khB', '123', 'hanoi', '123123', 'abc@gmail.com');
insert into khachhang values('kh03', 'khC', '123', 'hanoi', '123123', 'abc@gmail.com');


insert into hoadonxuat values('hd01', 'kh01', '2020/04/28', 'NV01', 'the');
insert into hoadonxuat values('hd02', 'kh01', '2020/04/20', 'NV02', 'the');
insert into hoadonxuat values('hd03', 'kh02', '2020/04/27', 'NV03', 'the');


insert into ct_hoadon values('hd01', 'h01', '2', '37000');
insert into ct_hoadon values('hd02', 'h02', '2', '30000');
insert into ct_hoadon values('hd03', 'h01', '3', '37000');
insert into ct_hoadon values('hd02', 'h02', '2', '30000');
insert into ct_hoadon values('hd01', 'h01', '1', '37000');


insert into hang values ('h01', 'hang1', 'nhasx1', '2020/12/28');
insert into hang values ('h02', 'hang2', 'nhasx2', '2020/12/28');
insert into hang values ('h03', 'hang3', 'nhasx3', '2020/12/28');