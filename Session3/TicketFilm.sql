CREATE DATABASE TicketFilm;
USE TicketFilm;
CREATE TABLE tblPhim (
    PhimID INT AUTO_INCREMENT,
    Ten_phim NVARCHAR(30),
    Loai_phim NVARCHAR(25),
    Thoi_gian INT
);
    ALTER TABLE tblPhim
    ADD CONSTRAINT PK_tblPhim PRIMARY KEY (PhimID);
CREATE TABLE tblPhong (
    PhongID INT AUTO_INCREMENT,
    Tenphong NVARCHAR(20),
    Trang_thai TINYINT
);
ALTER TABLE tblPhong
ADD CONSTRAINT PK_tblPhong PRIMARY KEY (PhongID);
CREATE TABLE tblGhe (
    GheID INT AUTO_INCREMENT,
    PhongID INT,
    So_ghe VARCHAR(10)
);
ALTER TABLE tblGhe
ADD CONSTRAINT FK_tblGhe_tblPhong FOREIGN KEY (PhongID) REFERENCES tblPhong(PhongID);
CREATE TABLE tblVe (
    PhimID INT,
    GheID INT,
    Ngay_chieu DATETIME,
    Trang_thai NVARCHAR(20)
);
ALTER TABLE tblVe
ADD CONSTRAINT FK_tblVe_tblPhim FOREIGN KEY (PhimID) REFERENCES tblPhim(PhimID);

ALTER TABLE tblVe
ADD CONSTRAINT FK_tblVe_tblGhe FOREIGN KEY (GheID) REFERENCES tblGhe(GheID);

INSERT INTO tblPhim (Ten_phim, Loai_phim, Thoi_gian) VALUES
('Em bé Hà nội', 'Tâm lý', 90),
('Nhiệm vụ bất khả thi', 'Hành động', 100),
('Dị nhân', 'Viễn tưởng', 90),
('Cuốn theo chiều gió', 'Tình cảm', 120);

INSERT INTO tblPhong (Tenphong, Trang_thai) VALUES
('Phòng chiếu 1', '1'),
('Phòng chiếu 2', '1'),
('Phòng chiếu 3', '0');

INSERT INTO tblGhe (PhongID, So_ghe) VALUES
(1, 'A3'),
(1, 'B5'),
(2, 'A7'),
(2, 'D1'),
(3, 'T2');

INSERT INTO tblVe (PhimID, GheID, Ngay, Trang_thai) VALUES
(1, 1, '10/20/2008', 'Đã bán'),
(1, 3, '11/20/2008', 'Đã bán'),
(1, 4, '12/23/2008', 'Đã bán'),
(2, 1, '02/14/2009', 'Đã bán'),
(3, 1, '02/14/2009', 'Đã bán'),
(2, 5, '03/08/2009', 'Chưa bán'),
(2, 3, '03/08/2009', 'Chưa bán');

-- Hiển thị danh sách các phim sắp xếp theo thời gian
DELIMITER //
CREATE PROCEDURE Show_Movies()
BEGIN
    SELECT * FROM tblPhim p
    ORDER BY p.Thoi_gian;
END//
DELIMITER ;
CALL Show_Movies();

-- Hiển thị phim có thời gian chiếu dài nhất
DELIMITER //
CREATE PROCEDURE Longest_Movie()
BEGIN
    SELECT p.Ten_phim FROM tblPhim p
    ORDER BY p.Thoi_gian DESC LIMIT 1;
END//
DELIMITER ;
CALL Longest_Movie();

-- Hiển thị phim có thời gian chiếu ngắn nhất
DELIMITER //
CREATE PROCEDURE Shortest_Movie()
BEGIN
    SELECT p.Ten_phim FROM tblPhim p
    ORDER BY p.Thoi_gian LIMIT 1;
END//
DELIMITER ;
CALL Shortest_Movie();

-- Hiển thị danh sách ghế bắt đầu bằng chữ 'A'
DELIMITER //
CREATE PROCEDURE Show_Seats()
BEGIN
    SELECT * FROM tblGhe g WHERE g.So_ghe LIKE 'A%';
END//
DELIMITER ;
CALL Show_Seats();

-- Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)
DELIMITER //
CREATE PROCEDURE ChangeStatus()
BEGIN
    ALTER TABLE tblPhong
    MODIFY COLUMN Trang_thai NVARCHAR(25);
END//
DELIMITER ;
CALL ChangeStatus();

-- Cập nhật giá trị cột Trang_thai của bảng tblPhong
DELIMITER //
CREATE PROCEDURE UpdateStatus()
BEGIN
    UPDATE tblPhong 
    SET Trang_thai = CASE 
                        WHEN Trang_thai = '0' THEN 'Đang sửa'
                        WHEN Trang_thai = '1' THEN 'Đang sử dụng'
                        ELSE 'Unknown'
                    END;
    SELECT * FROM tblPhong;
END//
DELIMITER ;
CALL UpdatStatus();

-- Hiển thị danh sách tên phim có độ dài >15 và <25 ký tự
DELIMITER //
CREATE PROCEDURE ShowLengthMovies()
BEGIN
    SELECT p.Ten_phim FROM tblPhim p
    WHERE LENGTH(p.Ten_phim) > 15 AND LENGTH(p.Ten_phim) < 25;
END//
DELIMITER ;
CALL ShowLengthMovies();
