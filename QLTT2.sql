INSERT INTO RAP VALUES (N'MR01',N'RAP 1',N'THỦ ĐỨC',N'0910000001',N'5',500);
INSERT INTO RAP VALUES (N'MR02',N'RAP 2',N'QUẬN 1',N'0910000012',N'4',400);
INSERT INTO RAP VALUES (N'MR03',N'RAP 3',N'QUẬN 4',N'0910000367',N'3',300);
INSERT INTO RAP VALUES (N'MR04',N'RAP 4',N'THỦ ĐỨC',N'0910007890',N'5',500);
INSERT INTO RAP VALUES (N'MR05',N'RAP 5',N'QUẬN 3',N'0910074832',N'8',800);
INSERT INTO RAP VALUES (N'MR06',N'RAP 6',N'BÌNH DƯƠNG',N'0912579121',N'5',550);
GO

INSERT INTO GioChieu VALUES (N'GC101','MR01',3)
INSERT INTO GioChieu VALUES (N'GC102','MR01',4)
INSERT INTO GioChieu VALUES (N'GC112','MR01',1)
INSERT INTO GioChieu VALUES (N'GC201','MR02',2)
INSERT INTO GioChieu VALUES (N'GC202','MR02',1)
INSERT INTO GioChieu VALUES (N'GC301','MR03',2)
INSERT INTO GioChieu VALUES (N'GC302','MR03',3)
INSERT INTO GioChieu VALUES (N'GC401','MR04',3)
INSERT INTO GioChieu VALUES (N'GC402','MR04',2)
INSERT INTO GioChieu VALUES (N'GC501','MR05',1)
INSERT INTO GioChieu VALUES (N'GC601','MR06',2)

GO

INSERT INTO PhongChieu VALUES (N'PC101',N'MR01',N'Phong 1',120)
INSERT INTO PhongChieu VALUES (N'PC102',N'MR01',N'Phong 2',100)
INSERT INTO PhongChieu VALUES (N'PC103',N'MR01',N'Phong 3',120)
INSERT INTO PhongChieu VALUES (N'PC104',N'MR01',N'Phong 4',80)
INSERT INTO PhongChieu VALUES (N'PC105',N'MR01',N'Phong 5',80)
INSERT INTO PhongChieu VALUES (N'PC201',N'MR02',N'Phong 1',150)
INSERT INTO PhongChieu VALUES (N'PC202',N'MR02',N'Phong 2',90)
INSERT INTO PhongChieu VALUES (N'PC203',N'MR02',N'Phong 3',80)
INSERT INTO PhongChieu VALUES (N'PC204',N'MR02',N'Phong 4',80)
INSERT INTO PhongChieu VALUES (N'PC301',N'MR03',N'Phong 1',100)
INSERT INTO PhongChieu VALUES (N'PC302',N'MR03',N'Phong 2',90)
INSERT INTO PhongChieu VALUES (N'PC302',N'MR03',N'Phong 3',110)
INSERT INTO PhongChieu VALUES (N'PC401',N'MR04',N'Phong 1',100)
INSERT INTO PhongChieu VALUES (N'PC402',N'MR04',N'Phong 2',120)
INSERT INTO PhongChieu VALUES (N'PC403',N'MR04',N'Phong 3',70)
INSERT INTO PhongChieu VALUES (N'PC404',N'MR04',N'Phong 4',90)
INSERT INTO PhongChieu VALUES (N'PC405',N'MR04',N'Phong 5',120)
INSERT INTO PhongChieu VALUES (N'PC501',N'MR05',N'Phong 1',120)
INSERT INTO PhongChieu VALUES (N'PC601',N'MR06',N'Phong 1',150)
GO

INSERT INTO Ve VALUES (N'V010101',N'MR01',N'PC101',N'GC101',N'MLC101',N'DANG CHIEU')
INSERT INTO Ve VALUES (N'V010102',N'MR01',N'PC101',N'GC101',N'MLC101',N'DANG CHIEU')
INSERT INTO Ve VALUES (N'V010112',N'MR01',N'PC102',N'GC102',N'MLC112',N'DA CHIEU')
INSERT INTO Ve VALUES (N'V020101',N'MR02',N'PC201',N'GC201',N'MLC201',N'DA CHIEU')
INSERT INTO Ve VALUES (N'V020201',N'MR02',N'PC201',N'GC201',N'MLC201',N'DA CHIEU')
INSERT INTO Ve VALUES (N'V020205',N'MR02',N'PC201',N'GC202',N'MLC202',N'DA CHIEU')
INSERT INTO Ve VALUES (N'V030101',N'MR03',N'PC301',N'GC301',N'MLC301',N'DA CHIEU')
INSERT INTO Ve VALUES (N'V030102',N'MR03',N'PC301',N'GC301',N'MLC301',N'DA CHIEU')
INSERT INTO Ve VALUES (N'V060101',N'MR06',N'PC601',N'GC601',N'MLC601',N'CHUA CHIEU')
GO

set dateformat dmy
INSERT INTO LichChieu VALUES (N'MLC101',N'FF01',N'MR01',N'PC101',N'03/06/2023',N'GC101',45000,60,2700000)
INSERT INTO LichChieu VALUES (N'MLC102',N'LM02',N'MR01',N'PC102',N'03/06/2023',N'GC102',45000,20,900000)
INSERT INTO LichChieu VALUES (N'MLC112',N'CN11',N'MR01',N'PC101',N'26/12/2009',N'GC102',45000,70,3150000)
INSERT INTO LichChieu VALUES (N'MLC201',N'HL09',N'MR02',N'PC201',N'20/07/2021',N'GC201',45000,30,1350000)
INSERT INTO LichChieu VALUES (N'MLC202',N'LA05',N'MR02',N'PC201',N'21/05/2015',N'GC202',45000,42,1890000)
INSERT INTO LichChieu VALUES (N'MLC301',N'LD03',N'MR03',N'PC301',N'30/10/2022',N'GC301',45000,50,2250000)
INSERT INTO LichChieu VALUES (N'MLC302',N'LN08',N'MR03',N'PC302',N'17/05/2020',N'GC302',45000,30,1350000)
INSERT INTO LichChieu VALUES (N'MLC401',N'FF01',N'MR04',N'PC401',N'03/06/2022',N'GC401',45000,50,2250000)
INSERT INTO LichChieu VALUES (N'MLC402',N'TT10',N'MR04',N'PC402',N'01/01/2020',N'GC401',45000,52,2340000)
INSERT INTO LichChieu VALUES (N'MLC501',N'MG07',N'MR05',N'PC501',N'15/11/2021',N'GC501',45000,50,2250000)
INSERT INTO LichChieu VALUES (N'MLC601',N'LM02',N'MR06',N'PC601',N'04/06/2023',N'GC601',45000,20,900000)
GO

CREATE LOGIN nv1WITH PASSWORD = N'123';
CREATE LOGIN ql1WITH PASSWORD = N'123';
CREATE LOGIN gdWITH PASSWORD = N'123';

CREATE USER nv1 FOR LOGIN nv1;
CREATE USER ql1 FOR LOGIN ql1;
CREATE USER gd FOR LOGIN gd;

create role nhanvien;
create role quanli;
create role giamdoc;

GRANT insert  , update,  delete  on Ve to nhanvien ;

GRANT insert  , update,  delete  on LichChieu to quanli;
GRANT insert  , update,  delete  on Ve to quanli ;

GRANT ALL PRIVILEGES ON [dbo].[GioChieu] to giamdoc;
GRANT ALL PRIVILEGES ON [dbo].[HangSX] to giamdoc;
GRANT ALL PRIVILEGES ON [dbo].[LichChieu] to giamdoc with grant option;
GRANT ALL PRIVILEGES ON [dbo].[NuocSX] to giamdoc;
GRANT ALL PRIVILEGES ON [dbo].[Phim] to giamdoc;
GRANT ALL PRIVILEGES ON [dbo].[PhongChieu] to giamdoc;
GRANT ALL PRIVILEGES ON [dbo].[RAP] to giamdoc;
GRANT ALL PRIVILEGES ON [dbo].[TheLoai] to giamdoc;
GRANT ALL PRIVILEGES ON [dbo].[Ve] to giamdoc with grant option;



Exec sp_addrolemember 'nhanvien','nv1'
Exec sp_addrolemember 'quanli','ql1'
Exec sp_addrolemember 'giamdoc','gd'
