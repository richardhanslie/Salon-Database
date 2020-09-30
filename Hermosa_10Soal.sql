USE HERMOSA

--1
--Kalau ikutin data yang di fill, hasilnya tidak ada karena pada bulan Juni yang transaksi cuma MM006 dan MM009

SELECT m.MemberID, m.MemberName, SUM(Quantity) AS TotalRentQuantity
FROM MsMember m, MsRent r
WHERE m.MemberID = r.MemberID AND 
MONTH(r.StartDate) = 6 AND (r.MemberID LIKE 'MM001' OR r.MemberID LIKE 'MM002'
OR r.MemberID LIKE 'MM003' OR r.MemberID LIKE 'MM004' OR r.MemberID LIKE 'MM005')
GROUP BY m.MemberID, m.MemberName

--2
--Kalau ikutin data yang di fill, hasilnya ST008 dan ST009 dan total purchase countnya sama-sama 2
SELECT p.StaffID, StaffName, COUNT(TransactionOrder) AS TotalPurchaseTransaction
FROM MsStaff s, PyPaymentHeader p, PyPaymentDetail pd
WHERE s.StaffID = p.StaffID AND p.PaymentDetailID = pd.PaymentDetailID
AND pd.Amount > 1000000 AND MONTH(p.TransactionDate) = 5
GROUP BY p.TransactionOrder, p.StaffID, StaffName

--3
--Hasilnya Budi Setiawan, Tom Hans, dan Callista Prilly
SELECT MemberName = 'Mrs. '+ MemberName, SUM(r.Quantity*s.RentingPrice*DATEDIFF(day,r.StartDate,r.ReturnDate)) AS RentingCost,
SUM(r.Quantity) AS TotalGownRented
FROM MsMember m, MsRent r, PySupplier s
WHERE m.MemberID = r.MemberID AND r.GownID = s.GownID AND m.MemberGender LIKE 'Female' AND DAY(r.StartDate) = 15
GROUP BY MemberName
UNION
SELECT MemberName = 'Mr. '+ MemberName, SUM(r.Quantity*s.RentingPrice*DATEDIFF(day,r.StartDate,r.ReturnDate)) AS RentingCost,
SUM(r.Quantity) AS TotalGownRented
FROM MsMember m, MsRent r, PySupplier s
WHERE m.MemberID = r.MemberID AND r.GownID = s.GownID AND m.MemberGender LIKE 'Male' AND DAY(r.StartDate) = 15
GROUP BY MemberName

--4
--ST001 First Namenya Abel
SELECT s.StaffID, SUBSTRING(StaffName,1,CHARINDEX(' ', StaffName)) AS FirstName, SUM(pd.Amount) AS TotalPurchasingAmount
FROM MsStaff s, PyPaymentHeader p, PyPaymentDetail pd
WHERE s.StaffID = p.StaffID AND p.PaymentDetailID = pd.PaymentDetailID
AND p.StaffID LIKE 'ST001' AND 
EXISTS
(SELECT StaffID FROM PyPaymentHeader
WHERE StaffID LIKE 'ST001')
GROUP BY s.StaffID, s.StaffName

--5
--Hasilnya tidak ada soalnya Abel punya salary < rata-rata salary
SELECT StaffID , StaffName, 
LEFT(StaffGender, 1) AS StaffGender, StaffSalary
FROM MsStaff s,
(SELECT [avg_salary] = AVG(StaffSalary) FROM MsStaff) AS avgSal
WHERE LEFT(StaffName, 1) = 'A' AND StaffSalary > avgSal.avg_salary
GROUP BY StaffID, StaffName, StaffGender, StaffSalary
ORDER BY StaffID DESC

--6
--Di bulan Juni, GW007 (Desc di bawah rata-rata) di pinjam sebanyak 1 kali
SELECT p.GownID, RentedTotalTimes = CAST(COUNT(r.RentOrder)AS varchar) + ' Times' , p.Colour, p.GownType, py.GownDesc
FROM PySupplier p JOIN PySupplierType py
ON p.GownTypeID = py.GownTypeID JOIN MsRent r
ON p.GownID = r.GownID, 
(SELECT [avg_desc] = AVG(LEN(GownDesc)) FROM PySupplierType) AS avgDesc
WHERE MONTH(r.ReturnDate) = 6 AND LEN(py.GownDesc) < avgDesc.avg_desc
GROUP BY p.GownID, p.Colour, p.GownType, py.GownDesc, RentOrder

--7
SELECT REPLACE(p.GownID,'GW','Gown') AS GownNumber, p.GownType, GownRentPrice = 'Rp. ' + CAST(p.RentingPrice AS varchar), SUM(r.Quantity) AS GownRentedTimes,
p.Colour
FROM PySupplier p JOIN MsRent r
ON p.GownID = r.GownID,
(SELECT [avg_rentPrice] = AVG(RentingPrice) FROM PySupplier) AS avg_Rent
WHERE MONTH(r.StartDate) = 6 AND p.RentingPrice > avg_Rent.avg_rentPrice
GROUP BY p.GownID, p.GownType, p.RentingPrice, p.Colour
ORDER BY p.GownID ASC

--8
SELECT CONVERT(VARCHAR,p.TransactionDate,107) AS PurchaseDate, REPLACE(s.StaffID,'ST','Staff') AS StaffNumber, pd.PaymentDetailID,
PaymentAmount = 'Rp. ' + CAST(pd.Amount AS varchar), SUM(r.Quantity) AS TotalGownRented
FROM MsStaff s JOIN PyPaymentHeader p
ON s.StaffID = p.StaffID JOIN MsRent r
ON s.StaffID = r.StaffID JOIN PyPaymentDetail pd
ON p.PaymentDetailID = pd.PaymentDetailID,
(SELECT [max_amount] = MAX(Amount) FROM PyPaymentDetail) AS maxAmount
WHERE MONTH(p.TransactionDate) = 5 AND pd.Amount = maxAmount.max_amount
GROUP BY s.StaffID, p.TransactionDate, pd.PaymentDetailID, pd.Amount

--9
GO
CREATE VIEW MemberTotalTransaction
AS
SELECT m.MemberID, MemberName, COUNT(r.RentOrder) AS TotalRent,
SUM(r.Quantity*p.RentingPrice*DATEDIFF(day,r.StartDate,r.ReturnDate)) AS PurchaseAmount
FROM MsMember m JOIN MsRent r
ON m.MemberID = r.MemberID JOIN PySupplier p
ON r.GownID = p.GownID
WHERE m.MemberID LIKE 'MM001' AND DATEDIFF(day,r.StartDate,r.ReturnDate) > 1
GROUP BY m.MemberID, MemberName

--10
GO
CREATE VIEW StaffInvolvement
AS
SELECT s.StaffID, s.StaffName,  COUNT(p.PaymentDetailID) AS StaffPurchaseInvolvement, pd.Amount AS StaffTotalExpense
FROM MsStaff s JOIN PyPaymentHeader p 
ON s.StaffID = p.StaffID JOIN PyPaymentDetail pd
ON p.PaymentDetailID = pd.PaymentDetailID
WHERE MONTH(p.TransactionDate) = 5 AND pd.Amount > 1000000
GROUP BY s.StaffID, s.StaffName, pd.Amount





