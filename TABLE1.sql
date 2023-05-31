CREATE DATABASE CINEMA
GO
USE CINEMA
GO
CREATE TABLE HangSX(
	MaHangSX varchar(10) not null,
	TenHangSX NVARCHAR(20),
	CONSTRAINT PF_HangSX PRIMARY KEY (MaHangSX)
);

CREATE TABLE NuocSX(
	MaNuocSX varchar(10) not null,
	TenNuocSX NVARCHAR(20),
	CONSTRAINT PF_NuocSX PRIMARY KEY (MaNuocSX)
);

CREATE TABLE TheLoai(
	MaTheLoai varchar(10) not null,
	TenTheLoai nvarchar(20),
	CONSTRAINT PF_TheLoai PRIMARY KEY (MaTheLoai)
);

CREATE TABLE Phim(
	MaPhim VARCHAR(10) NOT NULL,
	TenPhim VARCHAR(50),
	MaNuocSX VARCHAR(10) NOT NULL,
	MaHangSX VARCHAR(10) NOT NULL,
	DaoDien VARCHAR(20),
	MaTheLoai VARCHAR(10) NOT NULL,
	NgayKhoiChieu SMALLDATETIME,
	NgayKetThuc SMALLDATETIME,
	NoiDungChinh text,
	TongChiPhi money  DEFAULT 0,
	TongThu money  DEFAULT 0,
	CONSTRAINT PK_Phim primary key (MaPhim),
	CONSTRAINT FK_MaHangSX foreign key (MaHangSX) REFERENCES HangSX(MaHangSX),
	CONSTRAINT FK_MaNuocSX foreign key (MaNuocSX) REFERENCES NuocSX(MaNuocSX),
	CONSTRAINT FK_TheLoai foreign key (MaTheLoai) REFERENCES TheLoai(MaTheLoai)
);

CREATE TABLE RAP(
	MaRap varchar(10) not null,
	TenRap nvarchar(50),
	DiaChi nvarchar(100),
	DienThoai varchar(10),
	SoPhong varchar(10)  DEFAULT 0,
	TongSoGhe int  DEFAULT 0,
	CONSTRAINT FK_RAP PRIMARY KEY (MaRap)
);
CREATE TABLE GioChieu(
	MaGioChieu varchar(10) not null,
	MaRap varchar(10),
	XuatChieu int,
	CONSTRAINT PK_GioChieu PRIMARY KEY(MaGioChieu),
	CONSTRAINT FK_MaRap FOREIGN KEY(MaRap) references RAP(MaRap)	
);

CREATE TABLE PhongChieu(
	MaPhong varchar(10) not null primary key,
	MaRap varchar(10) not null,
	TenPhong nvarchar(50),
	TongSoGhe int  DEFAULT 0,
	constraint FK_MARAP1 foreign key (MaRap) references RAP(MaRap)
);


CREATE TABLE Ve(
	MaVe varchar(10) not null primary key,
	MaShow varchar(10) not null,
	MaRap varchar(10) not null,
	MaPhong varchar(10) not null,
	MaGhe varchar(10) not null ,
	TrangThai varchar(10),
	constraint fk_MaPhong foreign key(MaPhong) references PhongChieu(MaPhong),
	constraint fk_MaRap2 foreign key (MaRap) references RAP(MaRap),
);


CREATE TABLE LichChieu(
	MaShow varchar(10) not null,
	MaPhim varchar(10) not null,
	MaRap varchar(10) not null,
	MaPhong varchar(10) not null,
	NgayChieu smalldatetime,
	MaGioChieu varchar(10) not null,
	GiaVe money  DEFAULT 0,
	SoVeDaBan int  DEFAULT 0,
	TongTien money  DEFAULT 0,
	CONSTRAINT PF_LichChieu3 primary key (MaShow),
	CONSTRAINT FK_MaPhim3 foreign key (MaPhim) REFERENCES Phim(MaPhim),
	CONSTRAINT FK_MaPhong3 foreign key (MaPhong) REFERENCES PhongChieu(MaPhong),
	constraint fk_MaRap3 foreign key (MaRap) REFERENCES RAP(MaRap),
	constraint fk_MaGioChieu3 foreign key (MaGioChieu) REFERENCES GioChieu(MaGioChieu)
	
	
);
alter table Ve add constraint fk_MaShow3 foreign key (MaShow) references LichChieu(MaShow);


INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'OF11', N'Original Film')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'WD12', N'Walt Disney Pictures')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'AP13', N'Arunuchai Panupan')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'CV14', N'Công ty VAA')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'LH15', N'Lý Hải Production')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'PQ16', N'ProductionQ')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'CH17', N'Creative House')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'DD18', N'Phim ảnh Đại Đồng')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'DT19', N'Phim ảnh Điện Thông')
INSERT [dbo].[HangSX] ([MaHangSX], [TenHangSX]) VALUES (N'VC20', N'Vinod Chopra Films')
GO
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'USA', N'Mỹ')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'TL', N'Thái Lan')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'VN', N'Việt Nam')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'HQ', N'Hàn Quốc')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'TQ', N' Trung Quốc')
INSERT [dbo].[NuocSX] ([MaNuocSX], [TenNuocSX]) VALUES (N'AD', N'Ấn Độ')
GO

INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'AC01', N'Hành động')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'AV02', N'Phiêu lưu')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'HH03', N'Hài hước')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'RM04', N'Lãng mạn')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'HD05', N'Hài hành động')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'KD06', N'Kinh dị')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL07', N'Tâm lý')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TC08', N'Tình cảm')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'RM09', N'Lãng mạn')
GO
set dateformat dmy
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'FF01', N'Fast and Furious 10', N'OF11', N'Louis Leterrier', N'AC01','USA', N'19/05/2023', N'19/06/2023', 300000000 )
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LM02', N'The Little Mermaid',  N'WD12', N'Rob Marshall', N'AV02','USA', N'26/05/2023', N'26/07/2023', 250000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LD03', N'Love Destiny',  N'AP13', N'Pawat Panangkasri', N'HH03','USA', N'19/10/2022', N'19/11/2022', 200000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'CB04', N'Cô ba Sài Gòn',  N'CV14', N'Trần Bửu Lộc', N'RM04','VN', N'14/10/2017', N'20/06/2018', 60000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LA05', N'Lật mặt 1', N'LH15', N'Lý Hải', N'HD05','VN', N'15/05/2015', N'18/07/2019', 70000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'MA06', N'Chuyện ma đô thị',  N'PQ16', N'Hong Won Ki', N'KD06','TL', N'13/05/2022', N'13/08/2022', 100000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'MG07', N'Người môi giới',  N'CH17', N'Kore-eda Hirokazu', N'TL07','VN', N'14/11/2021', N'15/08/2022', 120000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LN08', N'Lạc lối ở Nga',  N'DD18', N'Zheng Xu', N'TC08', 'AD',N'14/05/2020', N'17/02/2021', 90000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'HL09', N'Hôn lễ của em',  N'DT19', N'Tian Han', N'RM09','HQ', N'16/07/2021', N'16/09/2021', 130000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu])VALUES (N'TT10', N'Tru tiên',  N'DT19', N'Trình Tiểu Đồng', N'AC01','TQ', N'24/12/2019', N'25/12/2020',80000000)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'CN11', N'3 chàng ngốc',  N'VC20', N'Rajkumar Hirani', N'HH03','TL', N'25/12/2009', N'21/12/2010', 70000000)
GO

-----
--trigger 
--1/ cập nhập số vé đã bán và tổng doanh thu mà lịch chiếu đó đã bán 
CREATE trigger SoVeDaBan on Ve after INSERT AS
Begin 
	UPDATE LichChieu 
	SET SoVeDaBan = (select count(*) from Ve where Ve.MaShow = LichChieu.MaShow);
	UPDATE LichChieu
	SET TongTien = (GiaVe * SoVeDaBan); 
END
--2/CAP NHAP SO RAP TRONG PHONG CHIEU 
CREATE TRIGGER SoPhongRap ON PhongChieu AFTER INSERT AS
BEGIN
	UPDATE RAP 
	SET SoPhong = ( select count(MaPhong) from PhongChieu where MaRap= RAP.MaRap) 
	from RAP join inserted on RAP.MaRap = inserted.MaRap 
END 
--3/ CAP NHAP TONG SO GHE CUA MOT RAP 
CREAT TRIGGER TongSoGheRap ON PhongChieu AFTER INSERT AS 
BEGIN 
	UPDATE RAP
	SET TongSoGhe = RAP.TongSoGhe + (select TongSoGhe from inserted where MaRap = RAP.MaRap) from RAP join inserted on RAP.MaRap=inserted.MaRap
END
--4/ CAP NHAP TONG SO TIEN KHO Co VE THAY DOI PHIM 
Create trigger TongTienudt on Ve AFTER UPDATE AS 
BEGIN 
	UPDATE LichChieu 
	SET TongTien = (GiaVe * SoVeDaBan) FROM LichChieu join inserted on LichChieu.MaShow = inserted.MaShow 
	WHERE LichChieu.MaShow = inserted.MaShow 
END
---text------
-----import------
