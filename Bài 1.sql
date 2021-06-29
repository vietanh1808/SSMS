

-- Câu 1
select * from ChuyenBay
where GaDi = 'DAD'

-- Câu 2
select * from MayBay
where TamBay > '10000'

-- Câu 3
select * from NhanVien
where Luong < '10000'

-- Câu 4
select * from ChuyenBay
where DoDai < '10000' and DoDai > '8000'

-- Câu 5
select * from ChuyenBay
where GaDi = 'SGN' and GaDen = 'BMV'

-- Câu 6
select GaDi, count(*) as 'Số chuyến bay xuất phát từ Sài Gòn'
from ChuyenBay
group by GaDi
having GaDi = 'SGN'

-- Câu 7
select Hieu, count(*) as 'Số loại máy bay Boeing'
from MayBay
group by Hieu
having Hieu like 'Boeing %'

-- Câu 8
select sum(Luong) as 'Tổng số lương phải trả cho nhân viên'
from NhanVien

-- Câu 9
select distinct ChungNhan.MaNv , NhanVien.Ten from NhanVien 
	inner join ChungNhan on NhanVien.MaNv = ChungNhan.MaNv
	inner join MayBay on MayBay.MaMb = ChungNhan.MaMb
		where Hieu like 'Boeing%'

-- Câu 10
select distinct ChungNhan.MaNv , NhanVien.Ten from NhanVien 
	inner join ChungNhan on NhanVien.MaNv = ChungNhan.MaNv
		where MaMb like '747'

-- Câu 11
select distinct ChungNhan.MaMb , MayBay.Hieu from MayBay 
	inner join ChungNhan on MayBay.MaMb = ChungNhan.MaMb
	inner join NhanVien on NhanVien.MaNv = ChungNhan.MaNv
		where Ten like 'NGUYEN %'

-- Câu 12
select distinct ChungNhan.MaNv from NhanVien 
	inner join ChungNhan on NhanVien.MaNv = ChungNhan.MaNv
	inner join MayBay on MayBay.MaMb = ChungNhan.MaMb
		where Hieu like 'Boeing%' or Hieu = 'Airbus A320'

-- Câu 13 ChuyenBay - VN280, Hieu - MayBay
SELECT MayBay.Hieu as 'May Bay'
FROM MayBay, ChuyenBay
WHERE ChuyenBay.MaCB like 'VN280' AND MayBay.TamBay >= ChuyenBay.DoDai

-- Câu 14 
SELECT ChuyenBay.MaCb as 'May Bay', ChuyenBay.DoDai
FROM MayBay, ChuyenBay
WHERE MayBay.Hieu like '% A320' and MayBay.TamBay >= ChuyenBay.DoDai

-- Câu 17
select a.GaDi, a.GaDen, b.GaDen
from ChuyenBay as a, ChuyenBay as b
where a.GaDen = b.GaDi and a.GaDi = b.GaDen and a.GioDen < b.GioDi

-- Câu 18
select GaDi, COUNT(MaCb) as 'Số chuyến bay'
from ChuyenBay
Group by GaDi

-- Câu 19
select GaDi, SUM(ChiPhi) as 'Tổng chi phí'
from ChuyenBay
Group by GaDi

-- Câu 20
select GaDi, COUNT(MaCb) as 'Số chuyến bay'
from ChuyenBay
where ChuyenBay.GioDi < '12:00'
Group by GaDi

-- Câu 21 chưa đc
select MaNv, COUNT(MaMb)
from ChungNhan
group by MaNv
having count(MaMb)=3

-- Câu 22 chưa đc
select ChungNhan.MaNv, MAX(MayBay.TamBay) from NhanVien, MayBay 
	inner join MayBay on MayBay.MaMb = ChungNhan.MaMb
	inner join ChungNhan on NhanVien.MaNv = ChungNhan.MaNv
		group by ChungNhan.MaNv
		having count(MayBay.MaMb) >= 3

select TamBay, MaNv from MayBay, ChungNhan
where TamBay = (
	select Max(TamBay) from MayBay
)
intersect

select MaNv, MAX(MaMb)
from MayBay
where MaMb = (select COUNT MaMb from MayBay group by MaMb having COUNT MaMb )


-- Câu 23
select MaNv, COUNT(MaMb) as 'a', MAX(MaMb)
from ChungNhan
group by MaNv
having MaMb=3

-- Câu 30
select distinct MaCb from ChuyenBay, NhanVien, MayBay
where NhanVien.Luong > 100000 and MayBay.TamBay > DoDai

-- Câu 31
select ten from NhanVien inner join ChungNhan on
NhanVien.MaNv = ChungNhan.MaNv
where NhanVien.Luong < 
(	select Min(Chiphi) from ChuyenBay 
	where ChuyenBay.GaDi = 'SGN' and ChuyenBay.GaDen = 'BMV'
	)

-- Cau 32 --
select distinct NhanVien.MaNv, NhanVien.Ten from NhanVien inner join ChungNhan on
NhanVien.MaNv = ChungNhan.MaNv
where Luong = ( 
	select Max(Luong) from NhanVien
)

select MaNv from NhanVien
order by Luong desc

-- Cau 33
select distinct NhanVien.MaNv, NhanVien.Ten from NhanVien inner join ChungNhan on
NhanVien.MaNv = ChungNhan.MaNv
where Luong = ( 
	select Max(Luong) from NhanVien
	where Luong < (
		select Max(Luong) from NhanVien
	)
)

-- Cau 34
select distinct NhanVien.MaNv, NhanVien.Ten from NhanVien inner join ChungNhan on
NhanVien.MaNv = ChungNhan.MaNv
where Luong = ( 
	select Max(Luong) from NhanVien
	where Luong < (
		select Max(Luong) from NhanVien
	)
)
union
select distinct NhanVien.MaNv, NhanVien.Ten 
from NhanVien inner join ChungNhan on NhanVien.MaNv = ChungNhan.MaNv
where Luong = ( 
	select Max(Luong) from NhanVien
)

-- câu 35.	Cho biết tên và lương của các nhân viên không phải là phi công và có lương lớn hơn lương trung bình của tất cả các phi công.
select distinct ten, luong from NhanVien 
where MaNv not in (select MaNv from ChungNhan) 
	and luong <= (
		select avg(Luong) from NhanVien 
			inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
		)

-- câu 36.	Cho biết tên các phi công có thể lái các máy bay có tầm bay lớn hơn 4.800km nhưng không có chứng nhận lái máy bay Boeing
select distinct ten, MayBay.Hieu from NhanVien 
	inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
	inner join MayBay on ChungNhan.MaMb = MayBay.MaMb
where TamBay > 4800 
	and Hieu not in (
		select Hieu from MayBay inner join ChungNhan on MayBay.MaMb = ChungNhan.MaMb
		where Hieu like 'Boeing%'
		)

-- Câu 37.	Cho biết tên các phi công lái ít nhất 3 loại máy bay có tầm xa hơn 3200km


-- Câu 38. Với mỗi nhân viên cho biết mã số, tên nhân viên và tổng số loại máy bay mà nhân viên đó có thể lái
select NhanVien.MaNv, NhanVien.Ten, count(ChungNhan.MaMb) from ChungNhan
	inner join NhanVien on ChungNhan.MaNv = NhanVien.MaNv
group by NhanVien.Ten, NhanVien.MaNv

-- Câu 39.	Với mỗi nhân viên, cho biết mã số, tên nhân viên và tổng số loại máy bay Boeing mà nhân viên đó có thể lái
select NhanVien.MaNv, NhanVien.Ten, count(MayBay.Hieu) as 'số máy bay boeing' from MayBay
	inner join ChungNhan on ChungNhan.MaMb = MayBay.MaMb
	inner join NhanVien on ChungNhan.MaNv = NhanVien.MaNv
where MayBay.Hieu like 'Boeing%'
group by NhanVien.Ten, NhanVien.MaNv

-- Câu 40.	Với mỗi loại máy bay,  cho biết loại máy bay và tổng số phi công có thể lái loại máy bay đó.
select MayBay.Hieu, count(Ten) from NhanVien
	inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
	inner join MayBay on ChungNhan.MaMb = MayBay.MaMb
group by MayBay.Hieu


-- Câu 41.	Với mỗi loại máy bay, cho biết loại máy bay và tổng số chuyến bay không thể thực hiện bởi loại máy bay đó.


-- Câu 42.	Với mỗi loại máy bay, hãy cho biết loại máy bay và tổng số phi công có lương lớn hơn 100.000 có thể lái loại máy bay đó.
select MayBay.Hieu, count(Ten) from NhanVien
	inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
	inner join MayBay on ChungNhan.MaMb = MayBay.MaMb
where NhanVien.Luong > 100000
group by MayBay.Hieu

-- Câu 43.	Với mỗi loại máy bay có tầm bay trên 3200km, cho biết tên của loại máy bay và lương trung bình của các phi công có thể lái loại máy bay đó.
select avg(NhanVien.Luong), Hieu from MayBay
	inner join ChungNhan on ChungNhan.MaMb = MayBay.MaMb
	inner join NhanVien on NhanVien.MaNv = ChungNhan.MaNv
where MayBay.TamBay > 3200
group by Hieu

-- Câu 44.	Với mỗi loại máy bay hãy cho biết loại máy bay và tổng số nhân viên không thể lái loại máy bay đó sum(maybay) - maybay co the lai


-- Câu 45.	Với mỗi loại máy bay  hãy cho biết loại máy bay và tổng số phi công không thể lái loại máy bay đó.
select hieu, (select count(manv) from NhanVien) - count(manv) from ChungNhan 
	inner join MayBay on ChungNhan.MaMb = MayBay.MaMb
group by Hieu

-- Câu 46.	Với mỗi nhân viên, cho biết mã số, tên nhân viên và tổng số chuyến bay xuất phát từ Sài Gòn mà nhân viên đó không thể lái
select ChungNhan.MaNv, Ten, (select count(distinct MaCb) from ChuyenBay where GaDi='SGN') - count( distinct Macb) from ChuyenBay, NhanVien
	inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
	inner join MayBay on ChungNhan.MaMb = MayBay.MaMb
where MayBay.TamBay > ChuyenBay.DoDai
group by ChungNhan.MaNv


select MaNv, COUNT(MaMb)
from ChungNhan
group by MaNv
having count(MaMb)=3


create procedure tongso_chuyenbay14
	(@manv varchar(10))
as
	select count(distinct MaCb)
	from ChuyenBay, NhanVien
		 inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
		 inner join MayBay on MayBay.MaMb = ChungNhan.MaMb
	
	-- where ChungNhan.MaMb = MayBay.MaMb and ChuyenBay.DoDai <= MayBay.TamBay and ChungNhan.MaNv = @manv
	where ChuyenBay.DoDai <= MayBay.TamBay and ChungNhan.MaNv = @manv

tongso_chuyenbay14 '011564812'

create proc luong_caonhat
as begin
	declare @maxLuong float
	set @maxLuong = (SELECT Max(Luong) from NhanVien)

	select Ten
	from NhanVien
	where Luong = @maxLuong
end

luong_caonhat

-- câu 53 tìm phi công có thể lái đc tất cả các loại máy bay boing

select count(NhanVien.Ten) from ChuyenBay, NhanVien
	inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
	inner join MayBay on MayBay.MaMb = ChungNhan.MaMb
where MayBay.Hieu like 'Boing%' and MayBay.TamBay > ChuyenBay.DoDai


create function tongso_cb (@mnv nvarchar(50))
	returns int
as	
Begin
	declare @tongso_cb int
	select @tongso_cb=count(ChuyenBay.MaCb) from ChuyenBay, NhanVien
		inner join ChungNhan on ChungNhan.MaNv = NhanVien.MaNv
		inner join MayBay on MayBay.MaMb = ChungNhan.MaMb
	where ChuyenBay.DoDai < MayBay.TamBay and NhanVien.MaNv = @mnv
	return @tongso_cb
end

select * from ChungNhan

tongso_cb('567354612')