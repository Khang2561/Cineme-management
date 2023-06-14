CREATE DATABASE CINEMA2
GO
USE CINEMA2
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
	XuatChieu time,
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
	MaRap varchar(10) not null,
	MaPhong varchar(10) not null,
	MaShow varchar(10) not null,
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
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'FF01', N'Fast and Furious 10', N'OF11', N'Louis Leterrier', N'AC01','USA', N'19/05/2023', N'19/06/2023', 0 )
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LM02', N'The Little Mermaid',  N'WD12', N'Rob Marshall', N'AV02','USA', N'26/05/2023', N'26/07/2023', 0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LD03', N'Love Destiny',  N'AP13', N'Pawat Panangkasri', N'HH03','USA', N'19/10/2022', N'19/11/2022', 0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'CB04', N'Cô ba Sài Gòn',  N'CV14', N'Trần Bửu Lộc', N'RM04','VN', N'14/10/2017', N'20/06/2018', 0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LA05', N'Lật mặt 1', N'LH15', N'Lý Hải', N'HD05','VN', N'15/05/2015', N'18/07/2019', 0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'MA06', N'Chuyện ma đô thị',  N'PQ16', N'Hong Won Ki', N'KD06','TL', N'13/05/2022', N'13/08/2022',0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'MG07', N'Người môi giới',  N'CH17', N'Kore-eda Hirokazu', N'TL07','VN', N'14/11/2021', N'15/08/2022', 0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'LN08', N'Lạc lối ở Nga',  N'DD18', N'Zheng Xu', N'TC08', 'AD',N'14/05/2020', N'17/02/2021', 0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'HL09', N'Hôn lễ của em',  N'DT19', N'Tian Han', N'RM09','HQ', N'16/07/2021', N'16/09/2021', 0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu])VALUES (N'TT10', N'Tru tiên',  N'DT19', N'Trình Tiểu Đồng', N'AC01','TQ', N'24/12/2019', N'25/12/2020',0)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [MaHangSX], [DaoDien],[MaTheLoai],MaNuocSX , [NgayKhoiChieu], [NgayKetThuc], [TongThu]) VALUES (N'CN11', N'3 chàng ngốc',  N'VC20', N'Rajkumar Hirani', N'HH03','TL', N'25/12/2009', N'21/12/2010', 0)
GO

INSERT INTO RAP (MaRap, TenRap, DiaChi,  SoPhong, TongSoGhe) VALUES 
('CGV01', N'CGV Hùng Vương Plaza', N'Hùng Vương, Phường 11, Quận 5, TP.HCM',  0, 0),
('BHD02', N'BHD Star Vũng Tàu', N'8 Lê Duẩn, Phường 1, Vũng Tàu', 0, 0),
('GAL03', N'Galaxy Quảng Trị', N'Lô B1, Khu đô thị mới Đông Hà, phường Đông Giang, TP Đông Hà, tỉnh Quảng Trị', 0, 0),
('CGV04', N'CGV Vincom Plaza Hà Tĩnh', N'Số 1 Lê Lợi, phường Đức Thọ, TP Hà Tĩnh',  0, 0)

INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES 
('GC01', 'CGV01', '8:00'),
('GC02', 'CGV01', '10:00'),
('GC03', 'CGV01', '11:00'),
('GB01', 'BHD02', '8:00'),
('GB02', 'BHD02', '11:00'),
('GG01', 'GAL03', '10:00'),
('GG02', 'GAL03','11:00'),
('GV01', 'CGV04', '8:00'),
('GV02', 'CGV04', '10:00')


INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES
('PC01', 'CGV01',  200),
('PC02', 'CGV01',  200),
('PC03', 'CGV01',  200),
('PB01', 'BHD02',  180),
('PB02', 'BHD02',  200),
('PG01', 'GAL03',  150),
('PG02', 'GAL03',  150),
('PV01', 'CGV04',  200),
('PV02', 'CGV04',  200)


INSERT INTO LichChieu (MaShow, MaPhim, MaRap, MaPhong, NgayChieu, MaGioChieu, GiaVe, SoVeDaBan, TongTien) VALUES
('LS01', 'FF01', 'CGV01', 'PC01', '19/05/2023', 'GC01', 100000, 50,0),
('LS02', 'FF01', 'CGV01', 'PC02', '19/05/2023', 'GC01', 100000, 75, 0),
('LS03', 'FF01', 'CGV01', 'PC03', '19/05/2023', 'GC02', 150000, 100, 0),
('LS04', 'FF01', 'CGV01', 'PC01', '20/05/2023', 'GC03', 100000, 25, 0),
('LS05', 'LM02', 'BHD02', 'PB01', '26/05/2023', 'GB01', 120000, 80, 0),
('LS06', 'LM02', 'BHD02', 'PB02', '26/05/2023', 'GB01', 120000, 120, 0),
('LS07', 'LM02', 'GAL03', 'PG01', '26/05/2023', 'GG01', 100000, 50, 0),
('LS08', 'LD03', 'CGV04', 'PV01', '19/10/2022', 'GV01', 80000, 70,0),
('LS09', 'LD03', 'CGV04', 'PV02', '19/10/2022', 'GV02', 80000, 60, 0),
('LS10', 'FF01', 'CGV01', 'PV02', '02/06/2023', 'GV02', 80000, 60, 0),
('LS11', 'LD03', 'CGV01', 'PV01', '19/10/2022', 'GV02', 80000, 40, 0),
('LS12', 'LD03', 'CGV01', 'PV02', '19/11/2022', 'GV02', 100000, 50, 0),
('LS13', 'MA06', 'CGV01', 'PV01', '13/05/2022', 'GV02', 80000, 25, 0),
('LS14', 'MA06', 'CGV01', 'PV01', '19/06/2022', 'GV01', 100000, 40, 0),
('LS15', 'MA06', 'CGV01', 'PV02', '23/07/2022', 'GV01', 80000, 100, 0),
('LS16', 'MA06', 'CGV01', 'PV01', '13/08/2022', 'GV02', 100000, 40, 0),
('LS20', 'LD03', 'CGV04', 'PV01', '19/10/2022', 'GV02', 80000, 25, 0),
('LS21', 'LD03', 'CGV04', 'PV02', '19/11/2022', 'GV02', 120000, 60, 0),
('LS22', 'MA06', 'CGV04', 'PV01', '13/05/2022', 'GV02', 100000, 25, 0),
('LS23', 'MA06', 'CGV04', 'PV01', '19/06/2022', 'GV01', 90000, 40, 0),
('LS24', 'MA06', 'CGV04', 'PV02', '23/07/2022', 'GV01', 80000, 120, 0),
('LS25', 'MA06', 'CGV04', 'PV01', '13/08/2022', 'GV02', 100000, 40, 0),
('LS30', 'LD03', 'BHD02', 'PV01', '19/10/2022', 'GV02', 50000, 120, 0),
('LS31', 'LD03', 'BHD02', 'PV02', '19/11/2022', 'GV02', 120000, 40, 0),
('LS32', 'MA06', 'BHD02', 'PV01', '13/05/2022', 'GV02', 100000, 65, 0),
('LS33', 'MA06', 'BHD02', 'PV01', '19/06/2022', 'GV01', 90000, 45, 0),
('LS34', 'MA06', 'BHD02', 'PV02', '23/07/2022', 'GV01', 12000, 20, 0),
('LS35', 'MA06', 'BHD02', 'PV01', '13/08/2022', 'GV02', 100000, 40, 0),
('LS40', 'LD03', 'GAL03', 'PV01', '19/10/2022', 'GV02', 50000, 120, 0),
('LS41', 'LD03', 'GAL03', 'PV02', '19/11/2022', 'GV02', 100000, 25, 0),
('LS42', 'MA06', 'GAL03', 'PV01', '13/05/2022', 'GV02', 100000, 54, 0),
('LS43', 'MA06', 'GAL03', 'PV01', '19/06/2022', 'GV01', 80000, 45, 0),
('LS44', 'MA06', 'GAL03', 'PV02', '23/07/2022', 'GV01', 10000, 63, 0),
('LS45', 'MA06', 'GAL03', 'PV01', '13/08/2022', 'GV02', 7000, 40, 0),
('LS51', 'MG07', 'CGV01', 'PV01', '01/01/2022', 'GV01', 100000, 40, 0),
('LS52', 'MG07', 'CGV01', 'PV01', '03/02/2022', 'GV01', 120000, 20, 0),
('LS53', 'MG07', 'CGV01', 'PV02', '10/03/2022', 'GV02', 100000, 45, 0),
('LS54', 'MG07', 'CGV01', 'PV02', '04/04/2022', 'GV01', 80000, 60, 0),
('LS55', 'CN11', 'CGV01', 'PV01', '01/09/2022', 'GV01', 100000, 40, 0),
('LS56', 'CN11', 'CGV01', 'PV02', '01/12/2022', 'GV02', 80000, 65, 0),
('LS61', 'MG07', 'CGV04', 'PV01', '01/01/2022', 'GV01', 80000, 100, 0),
('LS62', 'MG07', 'CGV04', 'PV01', '03/02/2022', 'GV01', 90000, 50, 0),
('LS63', 'MG07', 'CGV04', 'PV02', '10/03/2022', 'GV02', 75000, 45, 0),
('LS64', 'MG07', 'CGV04', 'PV02', '04/04/2022', 'GV01', 80000, 100, 0),
('LS65', 'CN11', 'CGV04', 'PV01', '01/09/2022', 'GV01', 100000, 25, 0),
('LS66', 'CN11', 'CGV04', 'PV02', '01/12/2022', 'GV02', 90000, 65, 0),
('LS71', 'MG07', 'BHD02', 'PV01', '01/01/2022', 'GV01', 12000, 90, 0),
('LS72', 'MG07', 'BHD02', 'PV01', '03/02/2022', 'GV01', 80000, 40, 0),
('LS73', 'MG07', 'BHD02', 'PV02', '10/03/2022', 'GV02', 75000, 80, 0),
('LS74', 'MG07', 'BHD02', 'PV02', '04/04/2022', 'GV01', 65000, 100, 0),
('LS75', 'CN11', 'BHD02', 'PV01', '01/09/2022', 'GV01', 120000, 25, 0),
('LS76', 'CN11', 'BHD02', 'PV02', '01/12/2022', 'GV02', 80000, 25, 0),
('LS81', 'MG07', 'GAL03', 'PV01', '01/01/2022', 'GV01', 80000, 90, 0),
('LS82', 'MG07', 'GAL03', 'PV01', '03/02/2022', 'GV01', 120000, 40, 0),
('LS83', 'MG07', 'GAL03', 'PV02', '10/03/2022', 'GV02', 80000, 65, 0),
('LS84', 'MG07', 'GAL03', 'PV02', '04/04/2022', 'GV01', 65000, 100, 0),
('LS85', 'CN11', 'GAL03', 'PV01', '01/09/2022', 'GV01', 100000, 40, 0),
('LS86', 'CN11', 'GAL03', 'PV02', '01/12/2022', 'GV02', 90000, 25, 0)


INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai)
VALUES
('V001', 'CGV01', 'PC01', 'LS01', 'G01', 'Đã bán'),
('V002', 'CGV01', 'PC01', 'LS01', 'G02', 'Đã bán'),
('V003', 'CGV01', 'PC01', 'LS01', 'G03', 'Chưa bán'),
('V004', 'CGV01', 'PC01', 'LS01', 'G04', 'Chưa bán'),
('V005', 'CGV01', 'PC01', 'LS01', 'G05', 'Chưa bán'),
('V006', 'CGV01', 'PC01', 'LS01', 'G07', 'Đã bán'),
('V007', 'CGV01', 'PC02', 'LS01', 'A08', 'Đã bán'),
('V008', 'CGV01', 'PC03', 'LS01', 'F09', 'Đã bán'),
('V009', 'CGV01', 'PC01', 'LS01', 'L010', 'Chưa bán'),
('V010', 'CGV01', 'PC01', 'LS01', 'L011', 'Đã bán'),
('V011', 'BHD02', 'PC01', 'LS01', 'G01', 'Đã bán'),
('V012', 'BHD02', 'PC02', 'LS01', 'G02', 'Đã bán'),
('V013', 'BHD02', 'PC03', 'LS01', 'G03', 'Chưa bán'),
('V014', 'BHD02', 'PC01', 'LS01', 'G04', 'Chưa bán'),
('V015', 'BHD02', 'PC02', 'LS01', 'G05', 'Chưa bán'),
('V016', 'BHD02', 'PC03', 'LS01', 'G07', 'Đã bán'),
('V017', 'BHD02', 'PC01', 'LS01', 'A08', 'Đã bán'),
('V018', 'BHD02', 'PC02', 'LS01', 'F09', 'Đã bán'),
('V019', 'BHD02', 'PC03', 'LS01', 'L010', 'Chưa bán'),
('V020', 'BHD02', 'PC01', 'LS01', 'L011', 'Đã bán')
--2/ Cập nhập tổng số ghê của rap khi thêm xóa sữa 
CREATE TRIGGER SoPhongRap ON PhongChieu AFTER INSERT,UPDATE,DELETE AS 
BEGIN
	UPDATE RAP
	SET TongSoGhe = RAP.TongSoGhe + (select TongSoGhe from inserted where MaRap = RAP.MaRap) 
	FROM RAP join inserted on RAP.MaRap=inserted.MaRap
	UPDATE RAP 
	SET SoPhong =  (SELECT COUNT(*) FROM PhongChieu WHERE RAP.MaRap = PhongChieu.MaRap);

	 DECLARE @MaRap varchar(10)
    SELECT @MaRap = MaRap FROM DELETED
    UPDATE RAP
    SET TongSoGhe = (SELECT SUM(TongSoGhe) FROM PhongChieu WHERE MaRap = @MaRap) 
    WHERE MaRap = @MaRap
END 
--3/ kiểm tra ngày chiếu phải sau ngày công chiếu và trước ngày kết thúc 
CREATE TRIGGER UTG_INSERT_CheckDateLichChieu
ON dbo.LichChieu
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idDinhDang VARCHAR(50), @ThoiGianChieu DATE, @NgayKhoiChieu DATE, @NgayKetThuc DATE

	SELECT @idDinhDang = MaPhim, @ThoiGianChieu = CONVERT(DATE, NgayChieu) from INSERTED

	SELECT @NgayKhoiChieu = P.NgayKhoiChieu, @NgayKetThuc = P.NgayKetThuc
	FROM dbo.Phim P, LichChieu
	WHERE @idDinhDang = LichChieu.MaPhim AND LichChieu.MaPhim = P.MaPhim

	IF ( @ThoiGianChieu > @NgayKetThuc or @ThoiGianChieu < @NgayKhoiChieu)
	BEGIN
		ROLLBACK TRAN
		print ('Lịch Chiếu lớn hơn hoặc bằng Ngày Khởi Chiếu và nhỏ hơn hoặc bằng Ngày Kết Thúc')
		Return
    END
END
GO
set dateformat dmy
select* from LichChieu
INSERT INTO LichChieu (MaShow, MaPhim, MaRap, MaPhong, NgayChieu, MaGioChieu, GiaVe, SoVeDaBan, TongTien) VALUES
('LS10', 'FF01', 'CGV01', 'PC01', '18/05/2023', 'GC01', 100000, 50,0)
select * from Phim

-- store procedure 
--1/ thêm tên phim vào danh sách 
CREATE PROCEDURE AddPhim
(
    @MaPhim VARCHAR(10),
    @TenPhim VARCHAR(50),
    @MaHangSX VARCHAR(10),
    @DaoDien VARCHAR(20),
    @MaTheLoai VARCHAR(10),
	@MaNuocSX VARCHAR(10),
    @NgayKhoiChieu SMALLDATETIME,
    @NgayKetThuc SMALLDATETIME,
    @TongThu MONEY
)
AS
BEGIN
    -- Kiểm tra xem Mã hãng sản xuất có tồn tại trong bảng HangSX chưa
    -- Kiểm tra tính hợp lệ của các tham số đầu vào
    IF NOT EXISTS (SELECT * FROM NuocSX WHERE MaNuocSX = @MaNuocSX)
    BEGIN
        PRINT('Mã nước sản xuất không tồn tại')
        RETURN
    END
    
    IF NOT EXISTS (SELECT * FROM HangSX WHERE MaHangSX = @MaHangSX)
    BEGIN
        PRINT('Mã hãng sản xuất không tồn tại')
        RETURN
    END
    
    IF NOT EXISTS (SELECT * FROM TheLoai WHERE MaTheLoai = @MaTheLoai)
    BEGIN
        PRINT('Mã thể loại không tồn tại')
        RETURN
    END
    INSERT INTO Phim (MaPhim,TenPhim ,MaHangSX,DaoDien,MaTheLoai ,MaNuocSX,NgayKhoiChieu ,NgayKetThuc ,TongThu)
    VALUES (@MaPhim,@TenPhim ,@MaHangSX,@DaoDien,@MaTheLoai ,@MaNuocSX,@NgayKhoiChieu ,@NgayKetThuc ,@TongThu)
	PRINT ('Dữ liệu đã được thêm vào thành công ')
END
-- Nhập vào tên phim xuất ra các rạp có chiếu phim, xuất phim, ngày khởi chiếu 
create PROCEDURE TimVe (@TenPhim varchar(50))
AS
BEGIN 
	 IF NOT EXISTS (SELECT * FROM Phim WHERE TenPhim = @TenPhim)
    BEGIN
        PRINT('Tên phim không có xuất chiếu trong các hệ thống rạp ')
        RETURN
    END
        
    SELECT Phim.TenPhim, RAP.TenRap, RAP.DiaChi, LichChieu.NgayChieu,GC.XuatChieu, LichChieu.GiaVe, COUNT(Ve.MaVe) as 'Số vé còn trống '
    FROM Ve
    LEFT JOIN LichChieu ON Ve.MaShow = LichChieu.MaShow
    LEFT JOIN Phim ON Phim.MaPhim = LichChieu.MaPhim
    LEFT JOIN RAP ON LichChieu.MaRap = RAP.MaRap
	LEFT JOIN GioChieu as GC ON GC.MaGioChieu = LichChieu.MaGioChieu
    WHERE Phim.TenPhim = @TenPhim AND Ve.TrangThai = 'Chưa bán'
    GROUP BY Phim.TenPhim, RAP.TenRap, RAP.DiaChi, LichChieu.NgayChieu, LichChieu.GiaVe,GC.XuatChieu
END
EXEC TimVe N'Fast and Furious 10'
-- NHAP VAO MA VE HIEN THI THONG TIN VE 
ALTER PROCEDURE VE_THONGTIN_pro(@MaVe VARCHAR(10))
AS 
SELECT VE.MaVe,LC.MaPhong,LC.NgayChieu,MaGhe,LC.GiaVe,GC.XuatChieu,RAP.TenRap,RAP.MaRap,RAP.DiaChi,P.TenPhim FROM Ve AS Ve 
	LEFT JOIN LichChieu as LC ON LC.MaShow = Ve.MaShow
	LEFT JOIN GioChieu as GC ON GC.MaGioChieu=LC.MaGioChieu
	LEFT JOIN RAP on LC.MaRap=RAP.MaRap 
	LEFT JOIN Phim as P ON P.MaPhim=LC.MaPhim
WHERE Ve.TrangThai = 'Ðã bán' AND Ve.MaVe=@MaVe

---text------
-----import------
