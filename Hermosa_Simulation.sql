USE HERMOSA

--A. Transaction Process (Staff beli dari Supplier)
--1. Check dulu apakah Supplier dan Staffnya sudah terdaftar atau belum. Kalau belum harus buat dulu data untuk Supplier/Staff tersebut
--Misalkan Supplier belum terdaftar dan Staff juga belum, maka daftar dulu
INSERT INTO MsSupplier VALUES
('VD011','Stella Jong','+62894143818', 'StellaJong@gmail.com','Jl. Pasar Baru 11')

SELECT * FROM MsSupplier

INSERT INTO MsStaff VALUES
('ST011','Jason Graham','Male',3500000,'JayGraham@gmail.com','+62882817313','Jl. Kelapa Sawit 17')

SELECT * FROM MsStaff

--Setelah itu baru isi PaymentDetail nya bayar berapa tadi dan pakai apa (Contoh total 800k GOPAY)
INSERT INTO PyPaymentDetail VALUES
('PY022', 1800000, 'BCA')

SELECT * FROM PyPaymentDetail

--2. Masukkan data ke PyPaymentHeader (Beli kapan, sama siapa, jumlah gown, dll) (Rent Order sama untuk menandakan kalau itu 1 transaksi)
--Kalau ada Gown jenis baru (GWXXX), daftar dulu di table PySupplierType (Kalau type baru) dan PySupplier tentang data-data Gown tsb
INSERT INTO PySupplierType VALUES
('GT011','Trumpet','Gown that flares at thigh')

SELECT * FROM PySupplierType

--Stok 0 karena belum ada kan
INSERT INTO PySupplier VALUES
('GW026','GT011','Trumpet','White',125000,0) 

SELECT * FROM PySupplier

--Masukkan data pembayaran (Transaction Order sama berarti 1 transaksi yang sama)
INSERT INTO PyPaymentHeader VALUES
('PD041','ST011','VD011','GW008','A-line', 3, 300000, 'PY022', '2019-6-8', 22),
('PD042','ST011','VD011','GW026','Trumpet', 5, 1500000, 'PY022', '2019-6-8', 22)

SELECT * FROM PyPaymentHeader

--Kalau sudah success, maka table stok (PySupplier) akan otomatis mengupdate stok
--Selesai



--B. Rent Process (Member sewa Gown)
--1. Check dulu apakah Member dan Staffnya sudah terdaftar atau belum. Kalau belum harus buat dulu data untuk Member/Staff tersebut
--Misalkan hanya Member yang belum terdaftar , maka mari daftar
INSERT INTO MsMember VALUES
('MM011', 'Cheryl Cath', '+62811872145', 'Female', 'Cheryl_Cherry@gmail.com')

SELECT * FROM MsMember

--Setelah itu kita daftarkan Gown apa saja yang Member tersebut mau Rent dan data lain-lainnya
--(Rent Order sama berarti 1 transaksi yang sama)
INSERT INTO MsRent VALUES
('RE043','ST011','MM011','2019-11-18','2019-11-20','Trumpet','GW026',5,26)

SELECT * FROM MsRent

--Stok (PySupplier) akan otomatis terupdate
--Selesai