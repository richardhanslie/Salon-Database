CREATE DATABASE HERMOSA

USE HERMOSA

CREATE TABLE MsStaff(
StaffID CHAR(5) PRIMARY KEY NOT NULL CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
StaffName VARCHAR(20),
StaffGender VARCHAR(7) CHECK(StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
StaffSalary INT,
StaffEmail VARCHAR(30) CHECK(StaffEmail LIKE '%@%.com'),
StaffPhone VARCHAR(15) CHECK(StaffPhone LIKE '+62%'),
StaffAddress VARCHAR(30)
)

CREATE TABLE MsSupplier(
SupplierID CHAR(5) PRIMARY KEY NOT NULL CHECK(SupplierID LIKE 'VD[0-9][0-9][0-9]'),
SupplierName VARCHAR(20),
SupplierPhone VARCHAR(15) CHECK(SupplierPhone LIKE '+62%'),
SupplierEmail VARCHAR(30) CHECK(SupplierEmail LIKE '%@%.com'),
SupplierAddress VARCHAR(30)
)

CREATE TABLE PySupplierType(
GownTypeID CHAR(5) PRIMARY KEY NOT NULL CHECK(GownTypeID LIKE 'GT[0-9][0-9][0-9]'),
GownType VARCHAR(15),
GownDesc VARCHAR(50)
)

CREATE TABLE PyPaymentDetail(
PaymentDetailID CHAR(5) PRIMARY KEY NOT NULL CHECK(PaymentDetailID LIKE 'PY[0-9][0-9][0-9]'),
Amount INT,
PaymentType VARCHAR(10) CHECK(PaymentType LIKE 'OVO' or PaymentType LIKE 'BCA' or PaymentType LIKE 'GOPAY' or PaymentType LIKE 'CASH')
)

CREATE TABLE PySupplier(
GownID CHAR(5) PRIMARY KEY NOT NULL CHECK(GownID LIKE 'GW[0-9][0-9][0-9]'),
GownTypeID CHAR(5) FOREIGN KEY REFERENCES PySupplierType(GownTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
GownType VARCHAR(15),
Colour VARCHAR(10),
RentingPrice INT,
Quantity INT
)

CREATE TABLE PyPaymentHeader(
PaymentID CHAR(5) PRIMARY KEY NOT NULL CHECK(PaymentID LIKE 'PD[0-9][0-9][0-9]'),
StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
SupplierID CHAR(5) FOREIGN KEY REFERENCES MsSupplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE,
GownID CHAR(5) FOREIGN KEY REFERENCES PySupplier(GownID) ON UPDATE CASCADE ON DELETE CASCADE,
GownType VARCHAR(15),
Quantity INT,
Amount INT,
PaymentDetailID CHAR(5) FOREIGN KEY REFERENCES PyPaymentDetail(PaymentDetailID) ON UPDATE CASCADE ON DELETE CASCADE,
TransactionDate DATE,
TransactionOrder INT
)

CREATE TABLE MsMember(
MemberID CHAR(5) PRIMARY KEY NOT NULL CHECK(MemberID LIKE 'MM[0-9][0-9][0-9]'),
MemberName VARCHAR(20),
MemberPhone VARCHAR(15) CHECK(MemberPhone LIKE '+62%'),
MemberGender VARCHAR(7) CHECK(MemberGender LIKE 'Male' OR MemberGender LIKE 'Female'),
MemberEmail VARCHAR(30) CHECK(MemberEmail LIKE '%@%.com')
)

CREATE TABLE MsRent(
RentID CHAR(5) PRIMARY KEY NOT NULL CHECK(RentID LIKE 'RE[0-9][0-9][0-9]'),
StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
MemberID CHAR(5) FOREIGN KEY REFERENCES MsMember(MemberID) ON UPDATE CASCADE ON DELETE CASCADE,
StartDate DATE,
ReturnDate DATE,
GownRented VARCHAR(15),
GownID CHAR(5) FOREIGN KEY REFERENCES PySupplier(GownID) ON UPDATE CASCADE ON DELETE CASCADE,
Quantity INT,
RentOrder INT
)


--Trigger untuk check supply dan update stok saat mau Rent dan Check apakah Member sudah daftar atau belum
--Check apakah Member sudah daftar atau belum juga (Sebenernya tdk usah soalnya kalau ga ada primary key nya di MsMember, tetep gabisa input)
CREATE TRIGGER rentQuantity
ON MsRent
AFTER INSERT
AS
BEGIN
	DECLARE @GownID CHAR(5), @Quantity INT, @MemberID CHAR(5)
	DECLARE rentCursor CURSOR FOR
	SELECT GownId, Quantity, MemberID
	FROM inserted

	OPEN rentCursor
	FETCH NEXT FROM rentCursor INTO @GownID, @Quantity, @MemberID
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF NOT EXISTS(SELECT MemberID FROM MsMember WHERE MemberID = @MemberID)
				BEGIN
					RAISERROR ('Member Is not Registered, Please Register First',16,1);
					PRINT 'MemberID is not registered for Id : (Check Result)'; SELECT @MemberID
					ROLLBACK TRANSACTION;
					BREAK;
				END
			ELSE IF @Quantity > 5
				BEGIN
					RAISERROR ('Quantity cant be more than 5, Please Check Again',16,1);
					PRINT 'Quantity more than 5 for (Check Result)'; SELECT @GownID
					ROLLBACK TRANSACTION;
					BREAK;
				END
			ELSE IF @Quantity > (SELECT Quantity FROM PySupplier
								WHERE GownID = @GownID
							)
				BEGIN
					RAISERROR ('Quantity Available is not enough, Please Check Again',16,1);
					PRINT 'Insufficient Quantity Available for (Check Result)'; SELECT @GownID
					ROLLBACK TRANSACTION;
					BREAK;
					RETURN 
				END
			ELSE
				BEGIN
					UPDATE PySupplier 
					SET Quantity = Quantity - @Quantity
					WHERE GownID = @GownID
				
					FETCH NEXT FROM rentCursor INTO @GownID, @Quantity, @MemberID
				END
		END
	CLOSE rentCursor
	DEALLOCATE rentCursor
END


--Trigger untuk update stok setelah Buy dari supplier 
--Check apakah Supplier sudah daftar atau belum juga (Sebenernya tdk usah soalnya kalau ga ada primary key nya di MsSupplier, tetep gabisa input)
CREATE TRIGGER buyQuantity
ON PyPaymentHeader
AFTER INSERT
AS
BEGIN
	DECLARE @GownID CHAR(5), @Quantity INT, @SupplierID CHAR(5)
	DECLARE buyCursor CURSOR FOR
	SELECT GownId, Quantity, SupplierID
	FROM inserted

	OPEN buyCursor
	FETCH NEXT FROM buyCursor INTO @GownID, @Quantity, @SupplierID
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF EXISTS(SELECT SupplierID FROM MsSupplier WHERE SupplierID = @SupplierID)
				BEGIN
					UPDATE PySupplier
					SET Quantity = Quantity + @Quantity
					WHERE GownID = @GownID

					FETCH NEXT FROM buyCursor INTO @GownID, @Quantity, @SupplierID
				END
			ELSE
				BEGIN
				RAISERROR ('Supplier Is not Registered, Please Register First',16,1);
				PRINT 'SupplierID is not registered for Id : (Check Result)'; SELECT @SupplierID
				ROLLBACK TRANSACTION;
				BREAK;
				END
		END
	CLOSE buyCursor
	DEALLOCATE buyCursor
END
