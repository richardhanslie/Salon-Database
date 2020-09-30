USE HERMOSA

INSERT INTO MsStaff VALUES
('ST001','Abel Reuben','Female',3000000,'AbelReu@gmail.com','+62813277432','Jl. Kemanggisan Raya 5'),
('ST002','Calvin Kirk','Male',3500000,'CalvinK@gmail.com','+62892817542','Jl. Palmerah Utama 3'),
('ST003','Bruce Lenny','Male',4500000,'BruceAlmighty@gmail.com','+62832976565','Jl. Sunter Agung 12'),
('ST004','Ferguson Adam','Male',5000000,'Fer23Adam@gmail.com','+62817324655','Jl. Kelapa Gading 32'),
('ST005','Hubbard','Male',5500000,'Hubbard24@gmail.com','+628133995533','Jl. Gajah Mada 7'),
('ST006','Kelly Walt','Female',4000000,'Kelly123@gmail.com','+62882915567','Jl. Kuningan Raya 13'),
('ST007','Oliver Jean','Female',6000000,'Ojean@gmail.com','+62827459292','Jl. Menteng 16'),
('ST008','Joyce Angelina','Female',6500000,'JoyAngel@gmail.com','+62825693888','Jl. Hayam Wuruk 23'),
('ST009','Johnson Ben','Male',7000000,'JohnBen123@gmail.com','+62812349576','Jl. Tomang Raya 21'),
('ST010','Richelin Keith','Female',7500000,'RichKeith88@gmail.com','+62884756333','Jl. Kemayoran Utara 8')


INSERT INTO MsSupplier VALUES
('VD001','James Arthur','+62899827322', 'ArthurJems@gmail.com','Jl. Taman Palem 23'),
('VD002','Riley Tim','+62835723356', 'Riley0Tim@gmail.com','Jl. Sudirman 12'),
('VD003','Michelle Mille','+62877642113', 'MichMill@gmail.com','Jl. Thamrin 6'),
('VD004','Henry Dan','+62864326213', 'Henry_Dan23@gmail.com','Jl. Harmoni 15'),
('VD005','Steven Burg','+62814151675', 'StevBurgg@gmail.com','Jl. Pegangsaan 7'),
('VD006','Stephanie','+62882736333', 'Stephanie18@gmail.com','Jl. Bekasi Raya 9'),
('VD007','Gabriella Lie','+62878221332', 'Lie_Gabriella@gmail.com','Jl. Sunter Agung 11'),
('VD008','Peter Fredd','+62823111452', 'PeterF@gmail.com','Jl. Kemanggisan Raya 3'),
('VD009','Edward Fille','+62897558866', 'EdwardFill@gmail.com','Jl. Kemayoran Barat 20'),
('VD010','Dylan Bob','+62894751818', 'D_Bob@gmail.com','Jl. Gunung Sahari 24')


INSERT INTO MsMember VALUES
('MM001', 'Anthony Jess', '+62822534178', 'Male', 'Aj3ss@gmail.com'),
('MM002', 'Carla Roe', '+62822113344', 'Female', 'Car_laRoe@gmail.com'),
('MM003', 'Rosa Cab', '+62862314877', 'Female', 'RosaCab89@gmail.com'),
('MM004', 'Jason Wong', '+62865435524', 'Male', 'Ja_Wong88@gmail.com'),
('MM005', 'Budi Setiawan', '+62821546899', 'Male', 'Bud123@gmail.com'),
('MM006', 'Millen Cabello', '+62819851818', 'Female', 'Millen_bell@gmail.com'),
('MM007', 'Tom Hans', '+62861325757', 'Male', 'Tom22Hans@gmail.com'),
('MM008', 'Callista Prilly', '+62829872145', 'Female', 'Callis_Pril@gmail.com'),
('MM009', 'Jonas Chen', '+62838976631', 'Male', 'JChen11@gmail.com'),
('MM010', 'Juan Carlos', '+62817864545', 'Male', 'JuanC45@gmail.com')


INSERT INTO PySupplierType VALUES
('GT001','Mermaid Style','Gown that fits through the torso and hips'),
('GT002','Jacket Gown','Gown that looks like a "Jacket" style'),
('GT003','A-line','Gown consisting of A-shaped panels'),
('GT004','The Sheath','Fitted straight cut Gown nipped at the waistline'),
('GT005','Tea Length','Gown which hemline falls above or below ankle'),
('GT006','Ball Gown','Elaborate Full-length Gown'),
('GT007','Exaggerated','An Egyptian Inspired Gown'),
('GT008','Princess Gown','Gown without separation at the waist'),
('GT009','Empire Waist','Gown that has a fitted bodice ending'),
('GT010','Asymmetrical','Gown with slanted hemline or neckline')


INSERT INTO PySupplier VALUES
('GW001','GT001','Mermaid Style','Red',25000,10),
('GW002','GT001','Mermaid Style','Purple',25000,5),
('GW003','GT001','Mermaid Style','White',25000,10),
('GW004','GT002','Jacket Gown','Yellow',30000,5),
('GW005','GT002','Jacket Gown','Purple',30000,10),
('GW006','GT002','Jacket Gown','Red',30000,5),
('GW007','GT003','A-line','White',45000,10), 
('GW008','GT003','A-line','Black',45000,5),
('GW009','GT004','The Sheath','White',50000,10), 
('GW010','GT004','The Sheath','Grey',50000,5),
('GW011','GT004','The Sheath','Black',50000,5),
('GW012','GT005','Tea Length','Purple',60000,5),
('GW013','GT005','Tea Length','Black',60000,5),
('GW014','GT005','Tea Length','Pink',60000,10), 
('GW015','GT005','Tea Length','White',60000,5),
('GW016','GT006','Ball Gown','White',80000,4),
('GW017','GT006','Ball Gown','Pink',80000,6), 
('GW018','GT007','Exaggerated','Brown',90000,5), 
('GW019','GT007','Exaggerated','Red',90000,4),
('GW020','GT008','Princess Gown','Pink',100000,3),
('GW021','GT008','Princess Gown','Blue',100000,5), 
('GW022','GT009','Empire Waist','White',110000,5), 
('GW023','GT009','Empire Waist','Black',110000,3),
('GW024','GT010','Asymmetrical','Purple',125000,4), 
('GW025','GT010','Asymmetrical','White',125000,4) 


INSERT INTO PyPaymentDetail VALUES
('PY001', 500000, 'BCA'),
('PY002', 625000, 'GOPAY'),
('PY003', 825000, 'GOPAY'),
('PY004', 1000000, 'OVO'),
('PY005', 1150000, 'CASH'),
('PY006', 800000, 'OVO'),
('PY007', 900000, 'CASH'),
('PY008', 1600000, 'BCA'),
('PY009', 1725000, 'OVO'),
('PY010', 2025000, 'CASH'),
('PY011', 875000, 'CASH'),
('PY012', 800000, 'GOPAY'),
('PY013', 1175000, 'BCA'),
('PY014', 950000, 'OVO'),
('PY015', 1100000, 'CASH'),
('PY016', 750000, 'GOPAY'),
('PY017', 900000, 'OVO'),
('PY018', 900000, 'OVO'),
('PY019', 1400000, 'BCA'),
('PY020', 1400000, 'CASH'),
('PY021', 250000, 'CASH')


INSERT INTO PyPaymentHeader VALUES
('PD001','ST001','VD001','GW001','Mermaid Style', 5, 250000, 'PY001', '2019-1-20', 1),
('PD002','ST001','VD001','GW002','Mermaid Style', 5, 250000, 'PY001', '2019-1-20', 1),
('PD003','ST002','VD002','GW003','Mermaid Style', 5, 250000, 'PY002', '2019-2-5', 2),
('PD004','ST002','VD002','GW004','Jacket Gown', 5, 375000, 'PY002', '2019-2-5', 2),
('PD005','ST003','VD003','GW003','Mermaid Style', 5, 250000, 'PY003', '2019-2-15', 3),
('PD006','ST003','VD003','GW005','Jacket Gown', 5, 375000, 'PY003', '2019-2-15', 3),
('PD007','ST003','VD003','GW008','A-line', 2, 200000, 'PY003', '2019-2-15', 3),
('PD008','ST004','VD004','GW006','Jacket Gown', 5, 375000, 'PY004', '2019-2-25', 4),
('PD009','ST004','VD004','GW009','The Sheath', 5, 625000, 'PY004', '2019-2-25', 4),
('PD010','ST005','VD005','GW010','The Sheath', 2, 250000, 'PY005', '2019-3-3', 5),
('PD011','ST005','VD005','GW012','Tea Length', 3, 450000, 'PY005', '2019-3-3', 5),
('PD012','ST005','VD005','GW013','Tea Length', 3, 450000, 'PY005', '2019-3-3', 5),
('PD013','ST006','VD006','GW011','The Sheath', 4, 500000, 'PY006', '2019-3-25', 6),
('PD014','ST006','VD006','GW012','Tea Length', 2, 300000, 'PY006', '2019-3-25', 6),
('PD015','ST007','VD007','GW013','Tea Length', 2, 300000, 'PY007', '2019-3-25', 7),
('PD016','ST007','VD007','GW017','Ball Gown', 3, 600000, 'PY007', '2019-3-25', 7),
('PD017','ST008','VD008','GW017','Ball Gown', 3, 600000, 'PY008', '2019-4-15', 8),
('PD018','ST008','VD008','GW009','The Sheath', 5, 625000, 'PY008', '2019-4-15', 8),
('PD019','ST008','VD008','GW010','The Sheath', 3, 375000, 'PY008', '2019-4-15', 8),
('PD020','ST008','VD008','GW014','Tea Length', 5, 750000, 'PY009', '2019-5-1', 9),
('PD021','ST008','VD008','GW016','Ball Gown', 3, 600000, 'PY009', '2019-5-1', 9),
('PD022','ST009','VD009','GW018','Exaggerated', 5, 1125000, 'PY010', '2019-5-15', 10),
('PD023','ST009','VD009','GW019','Exaggerated', 4, 900000, 'PY010', '2019-5-15', 10),
('PD024','ST010','VD010','GW005','Jacket Gown', 5, 375000, 'PY011', '2019-5-23', 11),
('PD025','ST010','VD010','GW007','A-line', 5, 500000, 'PY011', '2019-5-23', 11),
('PD026','ST003','VD002','GW007','A-line', 5, 500000, 'PY012', '2019-6-8', 12),
('PD027','ST003','VD002','GW008','A-line', 3, 300000, 'PY012', '2019-6-8', 12),
('PD028','ST002','VD005','GW011','The Sheath', 1, 125000, 'PY013', '2019-6-20', 13),
('PD029','ST002','VD005','GW014','Tea Length', 5, 750000, 'PY013', '2019-6-20', 13),
('PD030','ST002','VD005','GW015','Tea Length', 2, 300000, 'PY013', '2019-6-20', 13),
('PD031','ST001','VD007','GW016','Ball Gown', 1, 200000, 'PY014', '2019-7-5', 14),
('PD032','ST001','VD007','GW020','Princess Gown', 3, 750000, 'PY014', '2019-7-5', 14),
('PD033','ST009','VD008','GW021','Princess Gown', 2, 500000, 'PY015', '2019-7-13', 15),
('PD034','ST009','VD008','GW022','Empire Waist', 2, 600000, 'PY015', '2019-7-13', 15),
('PD035','ST010','VD010','GW021','Princess Gown', 3, 750000, 'PY016', '2019-8-3', 16),
('PD036','ST002','VD009','GW022','Empire Waist', 3, 900000, 'PY017', '2019-8-17', 17),
('PD037','ST001','VD005','GW023','Empire Waist', 3, 900000, 'PY018', '2019-9-3', 18),
('PD038','ST003','VD002','GW024','Asymmetrical', 4, 1400000, 'PY019', '2019-10-7', 19),
('PD039','ST006','VD003','GW025','Asymmetrical', 4, 1400000, 'PY020', '2019-11-5', 20),
('PD040','ST001','VD001','GW001','Mermaid Style', 5, 250000, 'PY021', '2019-11-7', 21)


INSERT INTO MsRent VALUES
('RE001','ST001','MM001','2019-2-1','2019-2-4','Mermaid Style','GW001',3,1),
('RE002','ST001','MM001','2019-2-1','2019-2-4','Mermaid Style','GW002',2,1),
('RE003','ST005','MM002','2019-2-6','2019-2-8','Jacket Gown','GW004',3,2),
('RE004','ST005','MM002','2019-2-6','2019-2-8','Mermaid Style','GW003',3,2),
('RE005','ST005','MM003','2019-2-17','2019-2-21','Mermaid Style','GW001',3,3),
('RE006','ST007','MM003','2019-2-17','2019-2-21','Mermaid Style','GW003',3,3),
('RE007','ST002','MM004','2019-2-5','2019-3-8','The Sheath','GW010',3,4),
('RE008','ST002','MM004','2019-2-5','2019-3-8','Tea Length','GW012',2,4),
('RE009','ST006','MM005','2019-3-15','2019-3-18','The Sheath','GW009',4,5),
('RE010','ST006','MM005','2019-3-15','2019-3-18','A-line','GW008',1,5),
('RE011','ST008','MM006','2019-3-19','2019-3-21','Ball Gown','GW017',1,6),
('RE012','ST008','MM006','2019-3-19','2019-3-21','The Sheath','GW010',1,6),
('RE013','ST008','MM006','2019-3-19','2019-3-21','Mermaid Style','GW001',1,6),
('RE014','ST009','MM003','2019-3-23','2019-3-25','A-line','GW008',1,7),
('RE015','ST003','MM005','2019-4-11','2019-4-13','Mermaid Style','GW001',3,8),
('RE016','ST004','MM007','2019-4-15','2019-4-17','Exaggerated','GW018',2,9),
('RE017','ST004','MM007','2019-4-15','2019-4-17','Exaggerated','GW019',2,9),
('RE018','ST004','MM008','2019-4-21','2019-4-22','A-line','GW008',3,10),
('RE019','ST004','MM008','2019-4-21','2019-4-22','Exaggerated','GW018',2,10),
('RE020','ST007','MM004','2019-5-10','2019-5-13','Jacket Gown','GW004',2,11),
('RE021','ST007','MM004','2019-5-10','2019-5-13','Princess Gown','GW020',1,11),
('RE022','ST001','MM009','2019-5-17','2019-5-18','Princess Gown','GW020',2,12),
('RE023','ST003','MM010','2019-5-19','2019-5-21','Empire Waist','GW023',2,13),
('RE024','ST005','MM009','2019-6-8','2019-6-10','A-line','GW007',1,14),
('RE025','ST005','MM009','2019-6-8','2019-6-10','Empire Waist','GW022',2,14),
('RE026','ST010','MM006','2019-6-12','2019-6-14','Tea Length','GW015',2,15),
('RE027','ST009','MM002','2019-7-9','2019-7-11','Tea Length','GW015',3,16),
('RE028','ST009','MM002','2019-7-9','2019-7-11','Empire Waist','GW023',1,16),
('RE029','ST004','MM007','2019-7-14','2019-7-18','Princess Gown','GW021',2,17),
('RE030','ST006','MM008','2019-8-15','2019-8-17','Mermaid Style','GW002',3,18),
('RE031','ST006','MM008','2019-8-15','2019-8-17','Empire Waist','GW022',2,18),
('RE032','ST007','MM008','2019-8-22','2019-8-23','A-line','GW007',2,19),
('RE033','ST007','MM008','2019-8-22','2019-8-23','Ball Gown','GW016',2,19),
('RE034','ST008','MM001','2019-9-7','2019-9-9','Ball Gown','GW016',2,20),
('RE035','ST008','MM001','2019-9-7','2019-9-9','Exaggerated','GW018',1,20),
('RE036','ST002','MM008','2019-10-16','2019-10-18','Jacket Gown','GW005',4,21),
('RE037','ST002','MM003','2019-10-19','2019-10-20','Jacket Gown','GW006',4,22),
('RE038','ST001','MM004','2019-10-19','2019-10-20','The Sheath','GW011',2,22),
('RE039','ST003','MM010','2019-10-21','2019-10-24','Asymmetrical','GW024',2,23),
('RE040','ST003','MM010','2019-10-21','2019-10-24','Asymmetrical','GW025',2,23),
('RE041','ST004','MM005','2019-11-4','2019-11-7','Asymmetrical','GW024',2,24),
('RE042','ST005','MM009','2019-11-12','2019-11-14','Asymmetrical','GW025',2,25)
