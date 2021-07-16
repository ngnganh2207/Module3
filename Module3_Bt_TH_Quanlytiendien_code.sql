create database quanlytiendien;
use quanlytiendien;
create table khachhang(
makh int primary key,
tenkh varchar(250),
ngaysinh int,
diachi varchar(250),
dienthoai int,
ghichu varchar(250)
);

create table dongia(
maloai int primary key,
loaiho varchar(50),
gia int
);

create table chiso(
id int primary key, 
makh int ,
chisodau int,
chisocuoi int,
maloai int,
foreign key (makh) references khachhang(makh),
foreign key (maloai) references dongia(maloai)
);

/*DROP TABLE dongia;*/
Insert into khachhang values(001, 'Nguyễn Văn A', 1980, 'Hà Nội', 09123456, 'Khách Vip');
Insert into dongia values(1,'Kinh Doanh',5000);
insert into chiso values(01,001,1000,1500,1);
Insert into khachhang values(002, 'Nguyễn Văn B', 1990,'Hà Nội',09654321,'Khách Thường');
Insert into dongia values(2,'Không Kinh Doanh',6000);
insert into chiso values(02,002,2000,4000,2);
Select * from khachhang;
select * from chiso;
select * from dongia;
SELECT * from khachhang where ngaysinh= 1900;   /* đưa ra khách hàng sinh năm 1980 */    
Select * from khachhang,dongia,chiso where khachhang.makh= chiso.makh and chiso.maloai=dongia.maloai;   /* Đưa ra đầy đủ thông tin về khách hàng, đơn giá, chỉ số, số điện tiêu thụ*/
select * from khachhang,chiso;   /* Đưa ra ds khách hàng, chỉ số tiêu thụ*/
select tenkh,(chisocuoi- chisodau) as 'tientinh' from khachhang, chiso where khachhang.makh= chiso.makh ;
select tenkh,loaiho,(chisocuoi-chisodau) as 'chi_so_tieu_thu' ,(chisocuoi-chisodau)*gia as 'so_tien_phai_tra' from khachhang,dongia,chiso where khachhang.makh= chiso.makh and chiso.maloai=dongia.maloai;
update dongia set loaiho='gd';
 select tenkh from khachhang,chiso where chisocuoi=chisodau;