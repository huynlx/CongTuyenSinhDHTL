DROP DATABASE dhtl;
CREATE DATABASE dhtl CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
Use dhtl;

CREATE TABLE admin (
    tai_khoan VARCHAR(30) PRIMARY KEY,
    mat_khau VARCHAR(30) NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

CREATE TABLE danh_muc (
    ma_dm VARCHAR(10) PRIMARY KEY,
    ten_dm TEXT NOT NULL,
    ma_dm_cha VARCHAR(10)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

CREATE TABLE bai_viet (
    ma_bv INT AUTO_INCREMENT PRIMARY KEY,
    ma_dm VARCHAR(10),
    tieu_de_bv TEXT,
    noi_dung_tom_tat_bv LONGTEXT,
    link_anh_bia_bv LONGTEXT,
    FOREIGN KEY (ma_dm)
        REFERENCES danh_muc (ma_dm)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE chi_tiet_bai_viet (
    ma_ctbv INT AUTO_INCREMENT PRIMARY KEY,
    ma_bv INT,
    noi_dung_chi_tiet_ctbv LONGTEXT,
    link_anh_ctbv LONGTEXT,
    FOREIGN KEY (ma_bv)
        REFERENCES bai_viet (ma_bv)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE tinh_thanh_pho (
    ma_ttp VARCHAR(10) PRIMARY KEY,
    ten_ttp TEXT
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

CREATE TABLE quan_huyen (
    ma_qh VARCHAR(10) PRIMARY KEY,
    ten_qh TEXT,
    ma_ttp VARCHAR(5),
    FOREIGN KEY (ma_ttp)
        REFERENCES tinh_thanh_pho (ma_ttp)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

CREATE TABLE phuong_thi_xa (
    ma_ptx VARCHAR(10) PRIMARY KEY,
    ten_ptx TEXT,
    ma_qh VARCHAR(10),
    FOREIGN KEY (ma_qh)
        REFERENCES quan_huyen (ma_qh)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

CREATE TABLE thi_sinh (
    ma_ts INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten_ts TEXT,
    gioi_tinh_ts TEXT,
    ngay_sinh_ts DATE,
    dia_chi_ts VARCHAR(10),
    so_cmnd_cccd_ts VARCHAR(20),
    sdt_ts VARCHAR(20),
    email_ts VARCHAR(50),
    link_anh_cmnd_ts VARCHAR(50),
    link_anh_chan_dung_ts VARCHAR(50),
    dan_toc_ts TEXT,
    ton_giao_ts TEXT,
    ngay_dang_ki_ts DATE,
    FOREIGN KEY (dia_chi_ts)
        REFERENCES phuong_thi_xa (ma_ptx)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE truong (
    ma_truong VARCHAR(10) PRIMARY KEY,
    ten_truong TEXT,
    dia_chi_truong VARCHAR(10),
    FOREIGN KEY (dia_chi_truong)
        REFERENCES quan_huyen (ma_qh)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

CREATE TABLE ho_so_xet_tuyen (
    ma_hsxt INT AUTO_INCREMENT PRIMARY KEY,
    ma_ts INT,
    FOREIGN KEY (ma_ts)
        REFERENCES thi_sinh (ma_ts)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE trang_thai_ho_son (
    ma_tths INT AUTO_INCREMENT PRIMARY KEY,
    ma_hsxt INT,
    kieu_tths TEXT,
    ngay_tths DATE,
    FOREIGN KEY (ma_hsxt)
        REFERENCES ho_so_xet_tuyen (ma_hsxt)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE co_so_dao_tao (
    ma_csdt INT AUTO_INCREMENT PRIMARY KEY,
    ten_csdt TEXT,
    dia_chi_csdt VARCHAR(10),
    FOREIGN KEY (dia_chi_csdt)
        REFERENCES phuong_thi_xa (ma_ptx)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE nganh_dao_tao (
    ma_ndt INT AUTO_INCREMENT PRIMARY KEY,
    ma_csdt INT,
    ten_ndt TEXT NOT NULL,
    chuong_trinh_dao_tao_ndt TEXT,
    ghi_chu_ndt TEXT,
    gioi_thieu_ndt TEXT,
    FOREIGN KEY (ma_csdt)
        REFERENCES co_so_dao_tao (ma_csdt)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;
use dhtl;
insert into tinh_thanh_pho(ma_ttp,ten_ttp) values('1','Hà Nội');
insert into quan_huyen(ma_qh,ten_qh,ma_ttp) values('1','Đống Đa','1');
insert into phuong_thi_xa(ma_ptx,ten_ptx,ma_qh) values('1','Tây Sơn','1');
insert into co_so_dao_tao(ma_csdt,ten_csdt,dia_chi_csdt) values('1','Cơ sở 1','1');
insert into nganh_dao_tao(ten_ndt, chuong_trinh_dao_tao_ndt, ghi_chu_ndt, gioi_thieu_ndt,ma_csdt) values('1','1','1','1','1');
-- select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt on ndt.ma_csdt = csdt.ma_csdt;
CREATE TABLE diem_chuan (
    ma_dc INT AUTO_INCREMENT PRIMARY KEY,
    ma_ndt INT,
    nam_dc DATE,
    diem_dc FLOAT,
    chi_tieu_dc INT,
    FOREIGN KEY (ma_ndt)
        REFERENCES nganh_dao_tao (ma_ndt)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE to_hop_mon (
    ma_thm VARCHAR(5) PRIMARY KEY,
    ten_mon_1 TEXT,
    ten_mon_2 TEXT,
    ten_mon_3 TEXT
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE to_hop_mon_xet_tuyen (
    ma_thm VARCHAR(5),
    ma_ndt INT,
    FOREIGN KEY (ma_ndt)
        REFERENCES nganh_dao_tao (ma_ndt),
    FOREIGN KEY (ma_thm)
        REFERENCES to_hop_mon (ma_thm),
    PRIMARY KEY (ma_thm , ma_ndt)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE nguyen_vong (
    ma_thm VARCHAR(5),
    ma_hsxt INT,
    ma_ndt INT,
    PRIMARY KEY (ma_thm , ma_hsxt),
    FOREIGN KEY (ma_ndt)
        REFERENCES nganh_dao_tao (ma_ndt),
    FOREIGN KEY (ma_hsxt)
        REFERENCES ho_so_xet_tuyen (ma_hsxt),
    FOREIGN KEY (ma_thm)
        REFERENCES to_hop_mon (ma_thm)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

CREATE TABLE hoc_ba (
    ma_hb INT AUTO_INCREMENT PRIMARY KEY,
    ma_ts INT,
    xep_loai_hb TEXT,
    link_anh_hb VARCHAR(50),
    FOREIGN KEY (ma_ts)
        REFERENCES thi_sinh (ma_ts)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE lop (
    ma_lop INT AUTO_INCREMENT PRIMARY KEY,
    ma_hb INT,
    ma_truong VARCHAR(5),
    cap_do_lop INT,
    FOREIGN KEY (ma_hb)
        REFERENCES hoc_ba (ma_hb),
    FOREIGN KEY (ma_truong)
        REFERENCES truong (ma_truong)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

CREATE TABLE mon (
    ma_mon INT AUTO_INCREMENT PRIMARY KEY,
    ten_mon TEXT,
    diem_mon FLOAT,
    ma_lop INT,
    FOREIGN KEY (ma_lop)
        REFERENCES lop (ma_lop)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

INSERT INTO tinh_thanh_pho VALUES ('51', 'An Giang');
INSERT INTO tinh_thanh_pho VALUES ('52', 'Bà Rịa-Vũng Tàu');
INSERT INTO tinh_thanh_pho VALUES ('18', 'Bắc Giang');
INSERT INTO tinh_thanh_pho VALUES ('11', 'Bắc Kạn');
INSERT INTO tinh_thanh_pho VALUES ('60', 'Bạc Liêu');
INSERT INTO tinh_thanh_pho VALUES ('19', 'Bắc Ninh');
INSERT INTO tinh_thanh_pho VALUES ('56', 'Bến Tre');
INSERT INTO tinh_thanh_pho VALUES ('44', 'Bình Dương');
INSERT INTO tinh_thanh_pho VALUES ('43', 'Bình Phước');
INSERT INTO tinh_thanh_pho VALUES ('47', 'Bình Thuận');
INSERT INTO tinh_thanh_pho VALUES ('37', 'Bình Định');
INSERT INTO tinh_thanh_pho VALUES ('61', 'Cà Mau');
INSERT INTO tinh_thanh_pho VALUES ('55', 'Cần Thơ');
INSERT INTO tinh_thanh_pho VALUES ('06', 'Cao Bằng');
INSERT INTO tinh_thanh_pho VALUES ('65', 'Cục nhà trường');
INSERT INTO tinh_thanh_pho VALUES ('38', 'Gia Lai');
INSERT INTO tinh_thanh_pho VALUES ('05', 'Hà Giang');
INSERT INTO tinh_thanh_pho VALUES ('24', 'Hà Nam');
INSERT INTO tinh_thanh_pho VALUES ('01', 'Hà Nội');
INSERT INTO tinh_thanh_pho VALUES ('30', 'Hà Tĩnh');
INSERT INTO tinh_thanh_pho VALUES ('21', 'Hải Dương');
INSERT INTO tinh_thanh_pho VALUES ('03', 'Hải Phòng');
INSERT INTO tinh_thanh_pho VALUES ('64', 'Hậu Giang');
INSERT INTO tinh_thanh_pho VALUES ('23', 'Hoà Bình');
INSERT INTO tinh_thanh_pho VALUES ('22', 'Hưng Yên');
INSERT INTO tinh_thanh_pho VALUES ('41', 'Khánh Hoà');
INSERT INTO tinh_thanh_pho VALUES ('54', 'Kiên Giang');
INSERT INTO tinh_thanh_pho VALUES ('36', 'Kon Tum');
INSERT INTO tinh_thanh_pho VALUES ('07', 'Lai Châu');
INSERT INTO tinh_thanh_pho VALUES ('42', 'Lâm Đồng');
INSERT INTO tinh_thanh_pho VALUES ('10', 'Lạng Sơn');
INSERT INTO tinh_thanh_pho VALUES ('08', 'Lào Cai');
INSERT INTO tinh_thanh_pho VALUES ('49', 'Long An');
INSERT INTO tinh_thanh_pho VALUES ('25', 'Nam Định');
INSERT INTO tinh_thanh_pho VALUES ('29', 'Nghệ An');
INSERT INTO tinh_thanh_pho VALUES ('27', 'Ninh Bình');
INSERT INTO tinh_thanh_pho VALUES ('45', 'Ninh Thuận');
INSERT INTO tinh_thanh_pho VALUES ('15', 'Phú Thọ');
INSERT INTO tinh_thanh_pho VALUES ('39', 'Phú Yên');
INSERT INTO tinh_thanh_pho VALUES ('31', 'Quảng Bình');
INSERT INTO tinh_thanh_pho VALUES ('34', 'Quảng Nam');
INSERT INTO tinh_thanh_pho VALUES ('35', 'Quảng Ngãi');
INSERT INTO tinh_thanh_pho VALUES ('17', 'Quảng Ninh');
INSERT INTO tinh_thanh_pho VALUES ('32', 'Quảng Trị');
INSERT INTO tinh_thanh_pho VALUES ('59', 'Sóc Trăng');
INSERT INTO tinh_thanh_pho VALUES ('14', 'Sơn La');
INSERT INTO tinh_thanh_pho VALUES ('46', 'Tây Ninh');
INSERT INTO tinh_thanh_pho VALUES ('26', 'Thái Bình');
INSERT INTO tinh_thanh_pho VALUES ('12', 'Thái Nguyên');
INSERT INTO tinh_thanh_pho VALUES ('28', 'Thanh Hoá');
INSERT INTO tinh_thanh_pho VALUES ('33', 'Thừa Thiên -Huế');
INSERT INTO tinh_thanh_pho VALUES ('53', 'Tiền Giang');
INSERT INTO tinh_thanh_pho VALUES ('02', 'Tp. Hồ Chí Minh');
INSERT INTO tinh_thanh_pho VALUES ('58', 'Trà Vinh');
INSERT INTO tinh_thanh_pho VALUES ('09', 'Tuyên Quang');
INSERT INTO tinh_thanh_pho VALUES ('57', 'Vĩnh Long');
INSERT INTO tinh_thanh_pho VALUES ('16', 'Vĩnh Phúc');
INSERT INTO tinh_thanh_pho VALUES ('13', 'Yên Bái');
INSERT INTO tinh_thanh_pho VALUES ('04', 'Đà Nẵng');
INSERT INTO tinh_thanh_pho VALUES ('40', 'Đắk Lắk');
INSERT INTO tinh_thanh_pho VALUES ('63', 'Đăk Nông');
INSERT INTO tinh_thanh_pho VALUES ('62', 'Điện Biên');
INSERT INTO tinh_thanh_pho VALUES ('48', 'Đồng Nai');
INSERT INTO tinh_thanh_pho VALUES ('50', 'Đồng Tháp');

INSERT INTO quan_huyen VALUES ('0059', 'Sở Giáo dục và Đào tạo', '59');
INSERT INTO quan_huyen VALUES ('0101', 'Quận Ba Đình', '01');
INSERT INTO quan_huyen VALUES ('0102', 'Quận 1', '02');
INSERT INTO quan_huyen VALUES ('0105', 'Thành phố Hà Giang', '05');
INSERT INTO quan_huyen VALUES ('0107', 'Thành Phố Lai Châu', '07');
INSERT INTO quan_huyen VALUES ('0110', 'Thành phố Lạng Sơn', '10');
INSERT INTO quan_huyen VALUES ('0111', 'Thành phố Bắc Kạn', '11');
INSERT INTO quan_huyen VALUES ('0112', 'Thành phố Thái Nguyên', '12');
INSERT INTO quan_huyen VALUES ('0113', 'Thành phố Yên Bái', '13');
INSERT INTO quan_huyen VALUES ('0115', 'Thành phố Việt Trì', '15');
INSERT INTO quan_huyen VALUES ('0116', 'Thành phố Vĩnh Yên', '16');
INSERT INTO quan_huyen VALUES ('0118', 'Thành phố Bắc Giang', '18');
INSERT INTO quan_huyen VALUES ('0119', 'Thành phố Bắc Ninh', '19');
INSERT INTO quan_huyen VALUES ('0123', 'Thành phố Hòa Bình', '23');
INSERT INTO quan_huyen VALUES ('0124', 'Thành phố Phủ Lý', '24');
INSERT INTO quan_huyen VALUES ('0125', 'Thành phố Nam Định', '25');
INSERT INTO quan_huyen VALUES ('0126', 'Thành phố Thái Bình', '26');
INSERT INTO quan_huyen VALUES ('0127', 'Thành phố Ninh Bình', '27');
INSERT INTO quan_huyen VALUES ('0128', 'Thành phố Thanh Hóa', '28');
INSERT INTO quan_huyen VALUES ('0129', 'Thành phố Vinh', '29');
INSERT INTO quan_huyen VALUES ('0130', 'Thành phố Hà Tĩnh', '30');
INSERT INTO quan_huyen VALUES ('0131', 'Thành phố Đồng Hới', '31');
INSERT INTO quan_huyen VALUES ('0133', 'Thành phố Huế', '33');
INSERT INTO quan_huyen VALUES ('0134', 'Thành phố Tam Kỳ', '34');
INSERT INTO quan_huyen VALUES ('0136', 'Thành phố Kon Tum', '36');
INSERT INTO quan_huyen VALUES ('0137', 'Thành phố Quy Nhơn', '37');
INSERT INTO quan_huyen VALUES ('0139', 'Thành phố Tuy Hòa', '39');
INSERT INTO quan_huyen VALUES ('0140', 'Thành phố Buôn Ma Thuột', '40');
INSERT INTO quan_huyen VALUES ('0141', 'Thành phố Nha Trang', '41');
INSERT INTO quan_huyen VALUES ('0142', 'Thành phố Đà Lạt', '42');
INSERT INTO quan_huyen VALUES ('0146', 'Thành phố Tây Ninh', '46');
INSERT INTO quan_huyen VALUES ('0147', 'Thành phố Phan Thiết', '47');
INSERT INTO quan_huyen VALUES ('0148', 'Thành phố Biên Hòa', '48');
INSERT INTO quan_huyen VALUES ('0149', 'Thành phố Tân An', '49');
INSERT INTO quan_huyen VALUES ('0151', 'Thành phố Long Xuyên', '51');
INSERT INTO quan_huyen VALUES ('0152', 'Thành phố Vũng Tàu', '52');
INSERT INTO quan_huyen VALUES ('0154', 'Thành phố Rạch Giá', '54');
INSERT INTO quan_huyen VALUES ('0155', 'Quận Ninh Kiều', '55');
INSERT INTO quan_huyen VALUES ('0156', 'Thành phố Bến Tre', '56');
INSERT INTO quan_huyen VALUES ('0157', 'Thành phố Vĩnh Long', '57');
INSERT INTO quan_huyen VALUES ('0158', 'Thành phố Trà Vinh', '58');
INSERT INTO quan_huyen VALUES ('0159', 'Thành phố Sóc Trăng', '59');
INSERT INTO quan_huyen VALUES ('0160', 'Thành phố Bạc Liêu', '60');
INSERT INTO quan_huyen VALUES ('0161', 'Thành phố Cà Mau', '61');
INSERT INTO quan_huyen VALUES ('0201', 'Quận Hoàn Kiếm', '01');
INSERT INTO quan_huyen VALUES ('0205', 'Huyện Đồng Văn', '05');
INSERT INTO quan_huyen VALUES ('0212', 'Thành phố Sông Công', '12');
INSERT INTO quan_huyen VALUES ('0217', 'Thành phố Cẩm Phả', '17');
INSERT INTO quan_huyen VALUES ('0227', 'Thành phố Tam Điệp', '27');
INSERT INTO quan_huyen VALUES ('0229', 'Thị xã Cửa Lò', '29');
INSERT INTO quan_huyen VALUES ('0233', 'Huyện Phong Điền', '33');
INSERT INTO quan_huyen VALUES ('0242', 'Thành phố Bảo Lộc', '42');
INSERT INTO quan_huyen VALUES ('0255', 'Quận Bình Thủy', '55');
INSERT INTO quan_huyen VALUES ('0301', 'Quận Hai Bà Trưng', '01');
INSERT INTO quan_huyen VALUES ('0302', 'Quận 3', '02');
INSERT INTO quan_huyen VALUES ('0305', 'Huyện Mèo Vạc', '05');
INSERT INTO quan_huyen VALUES ('0317', 'Thành phố Uông Bí', '17');
INSERT INTO quan_huyen VALUES ('0327', 'Huyện Nho Quan', '27');
INSERT INTO quan_huyen VALUES ('0343', 'Huyện Chơn Thành', '43');
INSERT INTO quan_huyen VALUES ('0355', 'Quận Cái Răng', '55');
INSERT INTO quan_huyen VALUES ('0401', 'Quận Đống Đa', '01');
INSERT INTO quan_huyen VALUES ('0405', 'Huyện Yên Minh', '05');
INSERT INTO quan_huyen VALUES ('0407', 'Huyện Sìn Hồ', '07');
INSERT INTO quan_huyen VALUES ('0412', 'Huyện Phú Lương', '12');
INSERT INTO quan_huyen VALUES ('0422', 'Huyện Khoái Châu', '22');
INSERT INTO quan_huyen VALUES ('0427', 'Huyện Gia Viễn', '27');
INSERT INTO quan_huyen VALUES ('0444', 'Thị xã Thuận An', '44');
INSERT INTO quan_huyen VALUES ('0450', 'Thành phố Sa Đéc', '50');
INSERT INTO quan_huyen VALUES ('0452', 'Huyện Long Điền', '52');
INSERT INTO quan_huyen VALUES ('0455', 'Quận Ô Môn', '55');
INSERT INTO quan_huyen VALUES ('0501', 'Quận Tây Hồ', '01');
INSERT INTO quan_huyen VALUES ('0505', 'Huyện Quản Bạ', '05');
INSERT INTO quan_huyen VALUES ('0508', 'Thành phố Lào Cai', '08');
INSERT INTO quan_huyen VALUES ('0519', 'Thị xã Từ Sơn', '19');
INSERT INTO quan_huyen VALUES ('0522', 'Huyện Yên Mỹ', '22');
INSERT INTO quan_huyen VALUES ('0527', 'Huyện Hoa Lư', '27');
INSERT INTO quan_huyen VALUES ('0544', 'Thị xã Dĩ An', '44');
INSERT INTO quan_huyen VALUES ('0550', 'Thành phố Cao Lãnh', '50');
INSERT INTO quan_huyen VALUES ('0555', 'Huyện Phong Điền', '55');
INSERT INTO quan_huyen VALUES ('0564', 'Huyện Châu Thành', '64');
INSERT INTO quan_huyen VALUES ('0601', 'Quận Cầu Giấy', '01');
INSERT INTO quan_huyen VALUES ('0602', 'Quận 6', '02');
INSERT INTO quan_huyen VALUES ('0605', 'Huyện Vị Xuyên', '05');
INSERT INTO quan_huyen VALUES ('0607', 'Huyện Than Uyên', '07');
INSERT INTO quan_huyen VALUES ('0616', 'Huyện Bình Xuyên', '16');
INSERT INTO quan_huyen VALUES ('0625', 'Huyện Vụ Bản', '25');
INSERT INTO quan_huyen VALUES ('0627', 'Huyện Yên Mô', '27');
INSERT INTO quan_huyen VALUES ('0633', 'Thị xã Hương Thủy', '33');
INSERT INTO quan_huyen VALUES ('0652', 'Thị xã Phú Mỹ (H. Tân Thành)', '52');
INSERT INTO quan_huyen VALUES ('0655', 'Huyện Cờ Đỏ', '55');
INSERT INTO quan_huyen VALUES ('0701', 'Quận Thanh Xuân', '01');
INSERT INTO quan_huyen VALUES ('0702', 'Quận 7', '02');
INSERT INTO quan_huyen VALUES ('0705', 'Huyện Bắc Mê', '05');
INSERT INTO quan_huyen VALUES ('0727', 'Huyện Kim Sơn', '27');
INSERT INTO quan_huyen VALUES ('0755', 'Huyện Vĩnh Thạnh', '55');
INSERT INTO quan_huyen VALUES ('0801', 'Quận Hoàng Mai', '01');
INSERT INTO quan_huyen VALUES ('0805', 'Huyện Hoàng Su Phì', '05');
INSERT INTO quan_huyen VALUES ('0807', 'Huyện Nậm Nhùn', '07');
INSERT INTO quan_huyen VALUES ('0816', 'Thành phố Phúc Yên', '16');
INSERT INTO quan_huyen VALUES ('0822', 'Huyện Mỹ Hào', '22');
INSERT INTO quan_huyen VALUES ('0827', 'Huyện Yên Khánh', '27');
INSERT INTO quan_huyen VALUES ('0848', 'Huyện Long Thành', '48');
INSERT INTO quan_huyen VALUES ('0849', 'Huyện Bến Lức', '49');
INSERT INTO quan_huyen VALUES ('0855', 'Quận Thốt Nốt', '55');
INSERT INTO quan_huyen VALUES ('0901', 'Quận Long Biên', '01');
INSERT INTO quan_huyen VALUES ('0902', 'Quận 9', '02');
INSERT INTO quan_huyen VALUES ('0905', 'Huyện Xín Mần', '05');
INSERT INTO quan_huyen VALUES ('0912', 'Thị xã Phổ Yên', '12');
INSERT INTO quan_huyen VALUES ('0922', 'Huyện Văn Lâm', '22');
INSERT INTO quan_huyen VALUES ('0923', 'Huyện Lạc Thủy', '23');
INSERT INTO quan_huyen VALUES ('0939', 'Huyện Tây Hòa', '39');
INSERT INTO quan_huyen VALUES ('0955', 'Huyện Thới Lai', '55');
INSERT INTO quan_huyen VALUES ('1001', 'Quận Bắc Từ Liêm', '01');
INSERT INTO quan_huyen VALUES ('1002', 'Quận 10', '02');
INSERT INTO quan_huyen VALUES ('1005', 'Huyện Bắc Quang', '05');
INSERT INTO quan_huyen VALUES ('1048', 'Huyện Trảng Bom', '48');
INSERT INTO quan_huyen VALUES ('1101', 'Huyện Thanh Trì', '01');
INSERT INTO quan_huyen VALUES ('1105', 'Huyện Quang Bình', '05');
INSERT INTO quan_huyen VALUES ('1110', 'Huyện Hữu Lũng', '10');
INSERT INTO quan_huyen VALUES ('1201', 'Huyện Gia Lâm', '01');
INSERT INTO quan_huyen VALUES ('1301', 'Huyện Đông Anh', '01');
INSERT INTO quan_huyen VALUES ('1330', 'Thị xã Kỳ Anh', '30');
INSERT INTO quan_huyen VALUES ('1401', 'Huyện Sóc Sơn', '01');
INSERT INTO quan_huyen VALUES ('1402', 'Quận Tân Bình', '02');
INSERT INTO quan_huyen VALUES ('1501', 'Quận Hà Đông', '01');
INSERT INTO quan_huyen VALUES ('1502', 'Quận Tân Phú', '02');
INSERT INTO quan_huyen VALUES ('1601', 'Thị xã Sơn Tây', '01');
INSERT INTO quan_huyen VALUES ('1602', 'Quận Bình Thạnh', '02');
INSERT INTO quan_huyen VALUES ('1701', 'Huyện Ba Vì', '01');
INSERT INTO quan_huyen VALUES ('1702', 'Quận Phú Nhuận', '02');
INSERT INTO quan_huyen VALUES ('1801', 'Huyện Phúc Thọ', '01');
INSERT INTO quan_huyen VALUES ('1802', 'Quận Thủ Đức', '02');
INSERT INTO quan_huyen VALUES ('1901', 'Huyện Thạch Thất', '01');
INSERT INTO quan_huyen VALUES ('2001', 'Huyện Quốc Oai', '01');
INSERT INTO quan_huyen VALUES ('2101', 'Huyện Chương Mỹ', '01');
INSERT INTO quan_huyen VALUES ('2201', 'Huyện Đan Phượng', '01');
INSERT INTO quan_huyen VALUES ('2301', 'Huyện Hoài Đức', '01');
INSERT INTO quan_huyen VALUES ('2401', 'Huyện Thanh Oai', '01');
INSERT INTO quan_huyen VALUES ('2501', 'Huyện Mỹ Đức', '01');
INSERT INTO quan_huyen VALUES ('2601', 'Huyện Ứng Hòa', '01');
INSERT INTO quan_huyen VALUES ('2628', 'Huyện Tĩnh Gia', '28');
INSERT INTO quan_huyen VALUES ('2701', 'Huyện Thường Tín', '01');
INSERT INTO quan_huyen VALUES ('2801', 'Huyện Phú Xuyên', '01');
INSERT INTO quan_huyen VALUES ('2901', 'Huyện Mê Linh', '01');
INSERT INTO quan_huyen VALUES ('3001', 'Quận Nam Từ Liêm', '01');

INSERT INTO truong VALUES ('1299', 'Bán công Phan Bội Châu', '0113');
INSERT INTO truong VALUES ('3914', 'Bổ Túc Văn Hóa Tỉnh', '0148');
INSERT INTO truong VALUES ('4337', 'BTVH Cấp 2,3 Nguyễn Thái Học', '0152');
INSERT INTO truong VALUES ('107', 'BTVH Công ty Xây dựng Công nghiệp', '0701');
INSERT INTO truong VALUES ('409', 'BTVH CĐKT Cao Thắng', '0102');
INSERT INTO truong VALUES ('4814', 'BTVH Pali Trung cấp Nam Bộ', '0159');
INSERT INTO truong VALUES ('618', 'BTVH Thanh Đa', '1602');
INSERT INTO truong VALUES ('629', 'BTVH ĐH Ngoại Thương', '1702');
INSERT INTO truong VALUES ('1988', 'Cao đẳng ASEAN', '0922');
INSERT INTO truong VALUES ('4569', 'Cao đẳng Cần Thơ', '0155');
INSERT INTO truong VALUES ('1950', 'Cao đẳng Cơ điện và Thủy Lợi', '0422');
INSERT INTO truong VALUES ('2618', 'Cao đẳng Công nghệ Hà Tĩnh', '0130');
INSERT INTO truong VALUES ('2691', 'Cao đẳng Công nghệ Hà Tĩnh (cơ sở 2)', '1330');
INSERT INTO truong VALUES ('1771', 'Cao đẳng Công nghiệp Bắc Ninh', '0119');
INSERT INTO truong VALUES ('2115', 'Cao đẳng Công nghiệp Dệt May Nam Định', '0125');
INSERT INTO truong VALUES ('1958', 'Cao đẳng Công Nghiệp Hưng Yên', '0522');
INSERT INTO truong VALUES ('3345', 'Cao đẳng Công thương Miền Trung', '0139');
INSERT INTO truong VALUES ('4173', 'Cao đẳng cộng đồng Đồng Tháp', '0550');
INSERT INTO truong VALUES ('1979', 'Cao đẳng Hàng Không', '0822');
INSERT INTO truong VALUES ('4460', 'Cao đẳng Kinh tế - Kỹ thuật Kiên Giang', '0154');
INSERT INTO truong VALUES ('1441', 'Cao đẳng Kinh tế - Kỹ thuật Phú Thọ', '0115');
INSERT INTO truong VALUES ('2011', 'Cao Đẳng Kinh tế -Kỹ Thuật HB', '0123');
INSERT INTO truong VALUES ('1951', 'Cao đẳng Kinh tế Kỹ thuật Tô Hiệu Hưng Yên', '0422');
INSERT INTO truong VALUES ('4703', 'Cao đẳng Kinh tế Tài chính Vĩnh Long', '0157');
INSERT INTO truong VALUES ('2620', 'Cao đẳng Kỹ thuật Việt - Đức Hà Tĩnh', '0130');
INSERT INTO truong VALUES ('1033', 'Cao đẳng Lào Cai', '0508');
INSERT INTO truong VALUES ('4887', 'Cao đẳng Nghề Bạc Liêu', '0160');
INSERT INTO truong VALUES ('3671', 'Cao đẳng nghề Bình Phước', '0343');
INSERT INTO truong VALUES ('1948', 'Cao đẳng Nghề Cơ điện và Thủy lợi', '0422');
INSERT INTO truong VALUES ('2695', 'Cao đẳng Nghề công nghệ Hà Tĩnh (cơ sở 2-đến 4/2017)', '1330');
INSERT INTO truong VALUES ('3558', 'Cao đẳng nghề Du lịch Đà Lạt', '0142');
INSERT INTO truong VALUES ('2067', 'Cao đẳng nghề Hà Nam', '0124');
INSERT INTO truong VALUES ('1104', 'Cao đẳng nghề Lạng Sơn', '0110');
INSERT INTO truong VALUES ('3477', 'Cao đẳng nghề Nha Trang', '0141');
INSERT INTO truong VALUES ('3343', 'Cao đẳng nghề Phú Yên', '0139');
INSERT INTO truong VALUES ('2705', 'Cao đẳng nghề Quảng Bình', '0131');
INSERT INTO truong VALUES ('3494', 'Cao đẳng nghề Quốc tế Nam Việt', '0141');
INSERT INTO truong VALUES ('2206', 'Cao đẳng nghề số 19 - Bộ Quốc phòng', '0126');
INSERT INTO truong VALUES ('3945', 'Cao Đẳng Nghề Số 8', '0148');
INSERT INTO truong VALUES ('3813', 'Cao đẳng Nghề Tây Ninh', '0146');
INSERT INTO truong VALUES ('2205', 'Cao đẳng nghề Thái Bình', '0126');
INSERT INTO truong VALUES ('19', 'Cao đẳng Nghệ thuật Hà Nội', '0201');
INSERT INTO truong VALUES ('2014', 'Cao đẳng Nghệ thuật Tây Bắc', '0123');
INSERT INTO truong VALUES ('4457', 'Cao đẳng Nghề tỉnh Kiên Giang', '0154');
INSERT INTO truong VALUES ('4756', 'Cao đẳng nghề Trà Vinh', '0158');
INSERT INTO truong VALUES ('4939', 'Cao đẳng Nghề Việt Nam-Hàn Quốc Cà Mau', '0161');
INSERT INTO truong VALUES ('2622', 'Cao đẳng nghề Việt Đức Hà Tĩnh', '0130');
INSERT INTO truong VALUES ('3560', 'Cao đẳng nghề Đà Lạt', '0142');
INSERT INTO truong VALUES ('4890', 'Cao đẳng Sư phạm Bạc Liêu', '0160');
INSERT INTO truong VALUES ('1030', 'Cao Đẳng Sư Phạm Lào Cai', '0508');
INSERT INTO truong VALUES ('2711', 'Cao đẳng Sư phạm Quảng Bình', '0131');
INSERT INTO truong VALUES ('4760', 'Cao đẳng Sư phạm Trà Vinh', '0158');
INSERT INTO truong VALUES ('84', 'Cao đẳng Sư phạm Trung ương', '0601');
INSERT INTO truong VALUES ('3561', 'Cao đẳng sư phạm Đà Lạt', '0142');
INSERT INTO truong VALUES ('1769', 'Cao đẳng thống kê', '0119');
INSERT INTO truong VALUES ('2069', 'Cao đẳng Thủy lợi Bắc Bộ', '0124');
INSERT INTO truong VALUES ('4246', 'Cao Đẳng Y Tế An Giang', '0151');
INSERT INTO truong VALUES ('1297', 'Cao đẳng Y tế Yên Bái', '0113');
INSERT INTO truong VALUES ('3386', 'Cấp 2-3 Sơn Thành', '0939');
INSERT INTO truong VALUES ('4463', 'Chính trị tỉnh Kiên Giang', '0154');
INSERT INTO truong VALUES ('2470', 'Chuyên Toán ĐH Vinh', '0129');
INSERT INTO truong VALUES ('4808', 'Công an, Quân nhân tại ngũ 59', '0059');
INSERT INTO truong VALUES ('472', 'CĐ BC CN&QTDN', '0702');
INSERT INTO truong VALUES ('4633', 'CĐ Bến Tre', '0156');
INSERT INTO truong VALUES ('4021', 'CĐ Cơ giới - Thủy lợi', '1048');
INSERT INTO truong VALUES ('1233', 'CĐ Cơ khí luyện kim', '0212');
INSERT INTO truong VALUES ('1554', 'CĐ cơ khí nông nghiệp', '0616');
INSERT INTO truong VALUES ('4598', 'CĐ Cơ điện và Nông nghiệp Nam Bộ', '0455');
INSERT INTO truong VALUES ('3575', 'CĐ Công nghệ & Kinh tế Bảo Lộc', '0242');
INSERT INTO truong VALUES ('3997', 'CĐ Công Nghệ Quốc Tế LiLaMa2', '0848');
INSERT INTO truong VALUES ('3401', 'CĐ Công nghệ Tây Nguyên', '0140');
INSERT INTO truong VALUES ('645', 'CĐ Công nghệ Thủ Đức', '1802');
INSERT INTO truong VALUES ('1281', 'CĐ Công nghệ và Kinh tế Công nghiệp', '0912');
INSERT INTO truong VALUES ('1274', 'CĐ Công nghệ và Kinh tế Công nghiệp', '0912');
INSERT INTO truong VALUES ('1154', 'CĐ Công nghệ và Nông lâm Đông Bắc', '1110');
INSERT INTO truong VALUES ('1599', 'CĐ Công nghiệp Cẩm Phả', '0217');
INSERT INTO truong VALUES ('2856', 'CĐ Công nghiệp Huế', '0133');
INSERT INTO truong VALUES ('1801', 'CĐ Công nghiệp Hưng Yên (cơ sở 2)', '0519');
INSERT INTO truong VALUES ('2157', 'CĐ Công nghiệp Nam Định', '0625');
INSERT INTO truong VALUES ('1226', 'CĐ Công nghiệp Thái Nguyên', '0112');
INSERT INTO truong VALUES ('1245', 'CĐ Công nghiệp Thái Nguyên', '0412');
INSERT INTO truong VALUES ('1568', 'CĐ Công nghiệp và Thương mại', '0816');
INSERT INTO truong VALUES ('1605', 'CĐ Công nghiệp và Xây dựng', '0317');
INSERT INTO truong VALUES ('1234', 'CĐ Công nghiệp Việt Đức', '0212');
INSERT INTO truong VALUES ('3874', 'CĐ Cộng đồng Bình Thuận', '0147');
INSERT INTO truong VALUES ('4459', 'CĐ Cộng đồng Kiên Giang', '0154');
INSERT INTO truong VALUES ('950', 'CĐ Cộng đồng Lai Châu', '0107');
INSERT INTO truong VALUES ('1029', 'CĐ Cộng đồng Lào Cai', '0508');
INSERT INTO truong VALUES ('429', 'CĐ Giao thông Vận tải', '0302');
INSERT INTO truong VALUES ('1208', 'CĐ Giao thông Vận tải miền núi', '0112');
INSERT INTO truong VALUES ('459', 'CĐ GTVT 3', '0602');
INSERT INTO truong VALUES ('4022', 'CĐ Hòa Bình Xuân Lộc', '1048');
INSERT INTO truong VALUES ('508', 'CĐ Kinh Tế', '1002');
INSERT INTO truong VALUES ('4568', 'CĐ Kinh tế - Kỹ thuật Cần Thơ', '0155');
INSERT INTO truong VALUES ('3095', 'CĐ Kinh tế - Kỹ thuật Kon Tum', '0136');
INSERT INTO truong VALUES ('2927', 'CĐ Kinh tế - Kỹ thuật Quảng Nam', '0134');
INSERT INTO truong VALUES ('1214', 'CĐ Kinh tế kỹ thuật - ĐH TN', '0112');
INSERT INTO truong VALUES ('1518', 'CĐ Kinh tế Kỹ thuật Vĩnh Phúc', '0116');
INSERT INTO truong VALUES ('1207', 'CĐ Kinh tế Tài chính Thái Nguyên', '0112');
INSERT INTO truong VALUES ('4584', 'CĐ Kinh tế Đối ngoại TPHCM (Cơ sở 2 Cần Thơ)', '0255');
INSERT INTO truong VALUES ('1800', 'CĐ Kinh tế, Kỹ thuật và Thủy sản', '0519');
INSERT INTO truong VALUES ('492', 'CĐ KT KT Công Nghiệp 2', '0902');
INSERT INTO truong VALUES ('1672', 'CĐ Kỹ thuật Công nghiệp', '0118');
INSERT INTO truong VALUES ('460', 'CĐ Kỹ thuật Phú Lâm', '0602');
INSERT INTO truong VALUES ('51', 'CĐ Kỹ thuật thiết bị y tế', '0401');
INSERT INTO truong VALUES ('3400', 'CĐ Kỹ thuật Đắk Lắk', '0140');
INSERT INTO truong VALUES ('3947', 'CĐ kỹ thuật Đồng Nai', '0148');
INSERT INTO truong VALUES ('4233', 'CĐ Nghề An Giang', '0151');
INSERT INTO truong VALUES ('1671', 'CĐ Nghề Bắc Giang', '0118');
INSERT INTO truong VALUES ('297', 'CĐ nghề bách Khoa', '2301');
INSERT INTO truong VALUES ('33', 'CĐ nghề Bách Khoa Hà Nội', '0301');
INSERT INTO truong VALUES ('3869', 'CĐ Nghề Bình Thuận', '0147');
INSERT INTO truong VALUES ('4581', 'CĐ Nghề Cần Thơ', '0255');
INSERT INTO truong VALUES ('2330', 'CĐ nghề CN T.Hóa', '0128');
INSERT INTO truong VALUES ('4016', 'CĐ nghề Cơ giới - Thủy lợi', '1048');
INSERT INTO truong VALUES ('2270', 'CĐ nghề Cơ giới Ninh Bình', '0227');
INSERT INTO truong VALUES ('2269', 'CĐ nghề Cơ điện - Xây dựng Tam Điệp', '0227');
INSERT INTO truong VALUES ('85', 'CĐ nghề cơ điện Hà Nội', '0601');
INSERT INTO truong VALUES ('1215', 'CĐ Nghề Cơ điện LK', '0112');
INSERT INTO truong VALUES ('2052', 'CĐ nghề Cơ điện Tây Bắc', '0923');
INSERT INTO truong VALUES ('1765', 'CĐ Nghề Cơ điện Xây dựng Bắc Ninh', '0119');
INSERT INTO truong VALUES ('3166', 'CĐ nghề cơ điện xây dựng và Nông lâm Trung bộ', '0137');
INSERT INTO truong VALUES ('4172', 'CĐ Nghề Cơ điện Xây dựng Việt Xô', '0550');
INSERT INTO truong VALUES ('368', 'CĐ nghề công nghệ cao Hà Nội', '3001');
INSERT INTO truong VALUES ('4000', 'CĐ nghề công nghệ cao Đồng Nai', '0848');
INSERT INTO truong VALUES ('1152', 'CĐ Nghề Công nghệ và Nông Lâm Đông Bắc', '1110');
INSERT INTO truong VALUES ('1678', 'CĐ nghề Công nghệ Việt Hàn Bắc Giang', '0118');
INSERT INTO truong VALUES ('52', 'CĐ nghề Công nghiệp Hà Nội', '0401');
INSERT INTO truong VALUES ('1164', 'CĐ Nghề Dân tộc Nội trú Bắc Kạn', '0111');
INSERT INTO truong VALUES ('4338', 'CĐ nghề Dầu khí', '0152');
INSERT INTO truong VALUES ('2491', 'CĐ Nghề Du lịch - Thương mại Nghệ An', '0229');
INSERT INTO truong VALUES ('4571', 'CĐ Nghề Du lịch Cần Thơ', '0155');
INSERT INTO truong VALUES ('2861', 'CĐ Nghề Du lịch Huế', '0133');
INSERT INTO truong VALUES ('4341', 'CĐ nghề Du lịch Vũng Tàu', '0152');
INSERT INTO truong VALUES ('247', 'CĐ nghề Giao thông vận tải Trung ương I', '1701');
INSERT INTO truong VALUES ('604', 'CĐ nghề Giao thông vận tải TW3', '1502');
INSERT INTO truong VALUES ('832', 'CĐ Nghề Hà Giang', '0105');
INSERT INTO truong VALUES ('2012', 'CĐ nghề Hòa Bình', '0123');
INSERT INTO truong VALUES ('12', 'CĐ nghề Hùng Vương', '0101');
INSERT INTO truong VALUES ('4560', 'CĐ Nghề ISPACE, Phân hiệu CT', '0155');
INSERT INTO truong VALUES ('120', 'CĐ nghề kinh doanh và công nghệ Hà Nội', '0801');
INSERT INTO truong VALUES ('1764', 'CĐ Nghề Kinh tế Kỹ thuật Bắc Ninh', '0119');
INSERT INTO truong VALUES ('34', 'CĐ nghề KT công nghệ LOD -Phân hiệu HN', '0301');
INSERT INTO truong VALUES ('3998', 'CĐ nghề KV Long Thành-Nhơn Trạch', '0848');
INSERT INTO truong VALUES ('308', 'CĐ nghề kỹ thuật - công nghệ -kinh tế S', '2401');
INSERT INTO truong VALUES ('2479', 'CĐ Nghề Kỹ thuật - Công nghiệp Việt Nam - Hàn Quốc', '0129');
INSERT INTO truong VALUES ('189', 'CĐ nghề Kỹ thuật Công nghệ', '1301');
INSERT INTO truong VALUES ('493', 'CĐ nghề Kỹ thuật Công nghệ', '0902');
INSERT INTO truong VALUES ('4042', 'CĐ nghề Kỹ thuật Công nghệ LADEC', '0149');
INSERT INTO truong VALUES ('173', 'CĐ nghề Kỹ thuật Mỹ nghệ Việt Nam', '1201');
INSERT INTO truong VALUES ('2480', 'CĐ Nghề Kỹ thuật Việt - Đức', '0129');
INSERT INTO truong VALUES ('2260', 'CĐ nghề LiLaMa 1', '0127');
INSERT INTO truong VALUES ('4043', 'CĐ Nghề Long An', '0149');
INSERT INTO truong VALUES ('138', 'CĐ nghề Long Biên', '0901');
INSERT INTO truong VALUES ('3932', 'CĐ nghề Miền Đông Nam Bộ', '0148');
INSERT INTO truong VALUES ('2114', 'CĐ nghề Nam Định', '0125');
INSERT INTO truong VALUES ('2455', 'CĐ nghề Nghi Sơn', '2628');
INSERT INTO truong VALUES ('2871', 'CĐ Nghề Nguyễn Tri Phương', '0233');
INSERT INTO truong VALUES ('86', 'CĐ nghề Phú Châu', '0601');
INSERT INTO truong VALUES ('4370', 'CĐ nghề quốc tế Hồng Lam', '0652');
INSERT INTO truong VALUES ('3165', 'CĐ nghề Quy Nhơn', '0137');
INSERT INTO truong VALUES ('1219', 'CĐ nghề số 1- Bộ Quốc phòng', '0112');
INSERT INTO truong VALUES ('2863', 'CĐ Nghề số 23 Bộ Quốc phòng', '0133');
INSERT INTO truong VALUES ('2013', 'CĐ nghề Sông Đà', '0123');
INSERT INTO truong VALUES ('4083', 'CĐ nghề Tây Sài Gòn', '0849');
INSERT INTO truong VALUES ('1227', 'CĐ Nghề than khoáng sản Việt Nam', '0112');
INSERT INTO truong VALUES ('1246', 'CĐ Nghề than khoáng sản Việt Nam', '0412');
INSERT INTO truong VALUES ('190', 'CĐ nghề Thăng Long', '1301');
INSERT INTO truong VALUES ('411', 'CĐ nghề Thành phố Hồ Chí Minh', '0102');
INSERT INTO truong VALUES ('2899', 'CĐ Nghề Thừa Thiên Huế', '0633');
INSERT INTO truong VALUES ('4360', 'CĐ nghề tỉnh Bà Rịa-Vũng Tàu', '0452');
INSERT INTO truong VALUES ('1027', 'CĐ nghề tỉnh Lào Cai', '0508');
INSERT INTO truong VALUES ('87', 'CĐ nghề Trần Hưng Đạo', '0601');
INSERT INTO truong VALUES ('5119', 'CĐ Nghề Trần Đại Nghĩa', '0564');
INSERT INTO truong VALUES ('149', 'CĐ nghề Văn Lang Hà Nội', '1001');
INSERT INTO truong VALUES ('430', 'CĐ nghề Việt Mỹ', '0302');
INSERT INTO truong VALUES ('4559', 'CĐ Nghề Việt Mỹ, Phân hiệu CT', '0155');
INSERT INTO truong VALUES ('1570', 'CĐ nghề Việt Xô số 1', '0816');
INSERT INTO truong VALUES ('1510', 'CĐ nghề Việt Đức', '0116');
INSERT INTO truong VALUES ('13', 'CĐ nghề VIGLACERA', '0101');
INSERT INTO truong VALUES ('1521', 'CĐ nghề Vĩnh Phúc', '0116');
INSERT INTO truong VALUES ('207', 'CĐ nghề điện', '1401');
INSERT INTO truong VALUES ('4635', 'CĐ nghề Đồng Khởi', '0156');
INSERT INTO truong VALUES ('3931', 'CĐ nghề Đồng Nai', '0148');
INSERT INTO truong VALUES ('4158', 'CĐ nghề Đồng Tháp', '0450');
INSERT INTO truong VALUES ('137', 'CĐ nghề đường sắt I', '0901');
INSERT INTO truong VALUES ('1206', 'CĐ SP Thái Nguyên', '0112');
INSERT INTO truong VALUES ('4461', 'CĐ Sư phạm Kiên Giang', '0154');
INSERT INTO truong VALUES ('3094', 'CĐ Sư phạm Kon Tum', '0136');
INSERT INTO truong VALUES ('1248', 'CĐ than khoáng sản Việt Nam', '0412');
INSERT INTO truong VALUES ('1211', 'CĐ Thương mại và Du lịch', '0112');
INSERT INTO truong VALUES ('1210', 'CĐ Văn hoá Nghệ thuật Việt Bắc', '0112');
INSERT INTO truong VALUES ('2113', 'CĐ Xây dựng Nam Định', '0125');
INSERT INTO truong VALUES ('3875', 'CĐ Y tế Bình Thuận', '0147');
INSERT INTO truong VALUES ('4570', 'CĐ Y tế Cần Thơ', '0155');
INSERT INTO truong VALUES ('4462', 'CĐ Y tế Kiên Giang', '0154');
INSERT INTO truong VALUES ('3557', 'CĐ Y tế Lâm Đồng', '0142');
INSERT INTO truong VALUES ('2251', 'CĐ Y tế Ninh Bình', '0127');
INSERT INTO truong VALUES ('1209', 'CĐ Y tế Thái Nguyên', '0112');
INSERT INTO truong VALUES ('576', 'CĐKT Lý Tự Trọng TP. HCM', '1402');
INSERT INTO truong VALUES ('3748', 'CĐN Công nghệ và NL Nam Bộ', '0544');
INSERT INTO truong VALUES ('2328', 'CĐN NN - PTNT T.Hóa', '0128');
INSERT INTO truong VALUES ('3737', 'CĐN Việt Nam - Singapore', '0444');
INSERT INTO truong VALUES ('3747', 'CĐN Đồng An', '0544');
INSERT INTO truong VALUES ('833', 'CĐSP Hà Giang', '0105');
INSERT INTO truong VALUES ('3566', 'Dân lập Lê Lợi - Bảo Lộc', '0242');
INSERT INTO truong VALUES ('986', 'DTNT THPT huyện Nậm Nhùn', '0807');
INSERT INTO truong VALUES ('965', 'DTNT THPT huyện Sìn Hồ', '0407');
INSERT INTO truong VALUES ('977', 'DTNT THPT huyện Than Uyên', '0607');
INSERT INTO truong VALUES ('863', 'GDNN - GDTX Bắc Mê', '0705');
INSERT INTO truong VALUES ('884', 'GDNN - GDTX Bắc Quang', '1005');
INSERT INTO truong VALUES ('2286', 'GDNN - GDTX Gia Viễn', '0427');
INSERT INTO truong VALUES ('2291', 'GDNN - GDTX Hoa Lư', '0527');
INSERT INTO truong VALUES ('868', 'GDNN - GDTX Hoàng Su Phì', '0805');
INSERT INTO truong VALUES ('4607', 'GDNN - GDTX huyện Cờ Đỏ', '0655');
INSERT INTO truong VALUES ('4600', 'GDNN - GDTX huyện Phong Điền', '0555');
INSERT INTO truong VALUES ('4620', 'GDNN - GDTX huyện Thới Lai', '0955');
INSERT INTO truong VALUES ('4609', 'GDNN - GDTX huyện Vĩnh Thạnh', '0755');
INSERT INTO truong VALUES ('2303', 'GDNN - GDTX Kim Sơn', '0727');
INSERT INTO truong VALUES ('841', 'GDNN - GDTX Mèo Vạc', '0305');
INSERT INTO truong VALUES ('2281', 'GDNN - GDTX Nho Quan', '0327');
INSERT INTO truong VALUES ('851', 'GDNN - GDTX Quản Bạ', '0505');
INSERT INTO truong VALUES ('4579', 'GDNN - GDTX quận Bình Thủy', '0255');
INSERT INTO truong VALUES ('4589', 'GDNN - GDTX quận Cái Răng', '0355');
INSERT INTO truong VALUES ('4552', 'GDNN - GDTX quận Ninh Kiều', '0155');
INSERT INTO truong VALUES ('4596', 'GDNN - GDTX quận Ô Môn', '0455');
INSERT INTO truong VALUES ('4615', 'GDNN - GDTX quận Thốt Nốt', '0855');
INSERT INTO truong VALUES ('890', 'GDNN - GDTX Quang Bình', '1105');
INSERT INTO truong VALUES ('2274', 'GDNN - GDTX Tam Điệp', '0227');
INSERT INTO truong VALUES ('859', 'GDNN - GDTX Vị Xuyên', '0605');
INSERT INTO truong VALUES ('873', 'GDNN - GDTX Xín Mần', '0905');
INSERT INTO truong VALUES ('2309', 'GDNN - GDTX Yên Khánh', '0827');
INSERT INTO truong VALUES ('847', 'GDNN - GDTX Yên Minh', '0405');
INSERT INTO truong VALUES ('2297', 'GDNN - GDTX Yên Mô', '0627');
INSERT INTO truong VALUES ('838', 'GDNN - GDTX Đồng Văn', '0205');
INSERT INTO truong VALUES ('245', 'GDNN-GDTX huyện Ba Vì', '1701');
INSERT INTO truong VALUES ('282', 'GDNN-GDTX huyện Chương Mỹ', '2101');
INSERT INTO truong VALUES ('170', 'GDNN-GDTX huyện Gia Lâm', '1201');
INSERT INTO truong VALUES ('295', 'GDNN-GDTX huyện Hoài Đức', '2301');
INSERT INTO truong VALUES ('352', 'GDNN-GDTX huyện Mê Linh', '2901');
INSERT INTO truong VALUES ('315', 'GDNN-GDTX huyện Mỹ Đức', '2501');
INSERT INTO truong VALUES ('341', 'GDNN-GDTX huyện Phú Xuyên', '2801');
INSERT INTO truong VALUES ('253', 'GDNN-GDTX huyện Phúc Thọ', '1801');
INSERT INTO truong VALUES ('271', 'GDNN-GDTX huyện Quốc Oai', '2001');
INSERT INTO truong VALUES ('205', 'GDNN-GDTX huyện Sóc Sơn', '1401');
INSERT INTO truong VALUES ('261', 'GDNN-GDTX huyện Thạch Thất', '1901');
INSERT INTO truong VALUES ('306', 'GDNN-GDTX huyện Thanh Oai', '2401');
INSERT INTO truong VALUES ('157', 'GDNN-GDTX huyện Thanh Trì', '1101');
INSERT INTO truong VALUES ('332', 'GDNN-GDTX huyện Thường Tín', '2701');
INSERT INTO truong VALUES ('324', 'GDNN-GDTX huyện Ứng Hòa', '2601');
INSERT INTO truong VALUES ('288', 'GDNN-GDTX huyện Đan Phượng', '2201');
INSERT INTO truong VALUES ('187', 'GDNN-GDTX huyện Đông Anh', '1301');
INSERT INTO truong VALUES ('17', 'GDNN-GDTX Nguyễn Văn Tố quận Hoàn Kiếm', '0201');
INSERT INTO truong VALUES ('10', 'GDNN-GDTX quận Ba Đình', '0101');
INSERT INTO truong VALUES ('81', 'GDNN-GDTX quận Cầu Giấy', '0601');
INSERT INTO truong VALUES ('220', 'GDNN-GDTX quận Hà Đông', '1501');
INSERT INTO truong VALUES ('31', 'GDNN-GDTX quận Hai Bà Trưng', '0301');
INSERT INTO truong VALUES ('118', 'GDNN-GDTX quận Hoàng Mai', '0801');
INSERT INTO truong VALUES ('134', 'GDNN-GDTX quận Long Biên', '0901');
INSERT INTO truong VALUES ('366', 'GDNN-GDTX quận Nam Từ Liêm', '3001');
INSERT INTO truong VALUES ('64', 'GDNN-GDTX quận Tây Hồ', '0501');
INSERT INTO truong VALUES ('105', 'GDNN-GDTX quận Thanh Xuân', '0701');
INSERT INTO truong VALUES ('47', 'GDNN-GDTX quận Đống Đa', '0401');
INSERT INTO truong VALUES ('230', 'GDNN-GDTX thị xã Sơn Tây', '1601');
INSERT INTO truong VALUES ('835', 'GDTX - HN tỉnh Hà Giang', '0105');
INSERT INTO truong VALUES ('246', 'GDTX Ba Vì', '1701');
INSERT INTO truong VALUES ('11', 'GDTX Ba Đình', '0101');
INSERT INTO truong VALUES ('861', 'GDTX Bắc Mê', '0705');
INSERT INTO truong VALUES ('879', 'GDTX Bắc Quang', '1005');
INSERT INTO truong VALUES ('283', 'GDTX Chương Mỹ', '2101');
INSERT INTO truong VALUES ('221', 'GDTX Hà Tây', '1501');
INSERT INTO truong VALUES ('32', 'GDTX Hai Bà Trưng', '0301');
INSERT INTO truong VALUES ('296', 'GDTX Hoài Đức', '2301');
INSERT INTO truong VALUES ('119', 'GDTX Hoàng Mai', '0801');
INSERT INTO truong VALUES ('865', 'GDTX Hoàng Su Phì', '0805');
INSERT INTO truong VALUES ('353', 'GDTX Mê Linh', '2901');
INSERT INTO truong VALUES ('840', 'GDTX Mèo Vạc', '0305');
INSERT INTO truong VALUES ('316', 'GDTX Mỹ Đức', '2501');
INSERT INTO truong VALUES ('18', 'GDTX Nguyễn Văn Tố', '0201');
INSERT INTO truong VALUES ('2259', 'GDTX Ninh Bình', '0127');
INSERT INTO truong VALUES ('172', 'GDTX Phú Thị', '1201');
INSERT INTO truong VALUES ('342', 'GDTX Phú Xuyên', '2801');
INSERT INTO truong VALUES ('254', 'GDTX Phúc Thọ', '1801');
INSERT INTO truong VALUES ('849', 'GDTX Quản Bạ', '0505');
INSERT INTO truong VALUES ('272', 'GDTX Quốc Oai', '2001');
INSERT INTO truong VALUES ('206', 'GDTX Sóc Sơn', '1401');
INSERT INTO truong VALUES ('231', 'GDTX Sơn Tây', '1601');
INSERT INTO truong VALUES ('65', 'GDTX Tây Hồ', '0501');
INSERT INTO truong VALUES ('831', 'GDTX Tỉnh', '0105');
INSERT INTO truong VALUES ('367', 'GDTX Từ Liêm', '3001');
INSERT INTO truong VALUES ('854', 'GDTX Vị Xuyên', '0605');
INSERT INTO truong VALUES ('135', 'GDTX Việt Hưng', '0901');
INSERT INTO truong VALUES ('870', 'GDTX Xín Mần', '0905');
INSERT INTO truong VALUES ('843', 'GDTX Yên Minh', '0405');
INSERT INTO truong VALUES ('289', 'GDTX Đan Phượng', '2201');
INSERT INTO truong VALUES ('171', 'GDTX Đình Xuyên', '1201');
INSERT INTO truong VALUES ('188', 'GDTX Đông Anh', '1301');
INSERT INTO truong VALUES ('158', 'GDTX Đông Mỹ', '1101');
INSERT INTO truong VALUES ('837', 'GDTX Đồng Văn', '0205');
INSERT INTO truong VALUES ('48', 'GDTX Đống Đa', '0401');
INSERT INTO truong VALUES ('82', 'GDTX&DN Cầu Giấy', '0601');
INSERT INTO truong VALUES ('3492', 'GDTX&HN Nha Trang', '0141');
INSERT INTO truong VALUES ('4820', 'Hệ thiếu sinh quân Trường Quân sự Quân khu 9', '0159');
INSERT INTO truong VALUES ('2855', 'Học viện Âm nhạc Huế', '0133');
INSERT INTO truong VALUES ('49', 'Học viện âm nhạc QGVN', '0401');
INSERT INTO truong VALUES ('224', 'Hữu Nghị 80', '1601');
INSERT INTO truong VALUES ('248', 'Hữu Nghị T78', '1801');
INSERT INTO truong VALUES ('2850', 'Khối chuyên ĐHKH Huế', '0133');
INSERT INTO truong VALUES ('3491', 'KTTH-HN tỉnh Khánh Hòa', '0141');
INSERT INTO truong VALUES ('4168', 'Năng khiếu TDTT', '0550');
INSERT INTO truong VALUES ('4637', 'Năng khiếu TDTT Bến Tre', '0156');
INSERT INTO truong VALUES ('4466', 'Năng khiếu TDTT Kiên Giang', '0154');
INSERT INTO truong VALUES ('4702', 'Năng khiếu Thể dục thể thao', '0157');
INSERT INTO truong VALUES ('4238', 'Năng khiếu thể thao', '0151');
INSERT INTO truong VALUES ('408', 'Nhạc Viện Thành phố Hồ Chí Minh', '0102');
INSERT INTO truong VALUES ('426', 'Phân hiệu BTVH Lê Thị Hồng Gấm', '0302');
INSERT INTO truong VALUES ('3749', 'Phân hiệu CĐN Đường sắt phía Nam', '0544');
INSERT INTO truong VALUES ('3559', 'Phân hiệu TC Văn thư lưu trữ TW', '0142');
INSERT INTO truong VALUES ('419', 'Phân hiệu THPT Lê Thị Hồng Gấm', '0302');
INSERT INTO truong VALUES ('4752', 'Phổ thông Dân Tộc Nội Trú - THPT tỉnh Trà Vinh', '0158');
INSERT INTO truong VALUES ('3809', 'Phổ thông dân tộc nội trú Tây Ninh', '0146');
INSERT INTO truong VALUES ('2851', 'Phổ thông Dân tộc Nội trú Tỉnh', '0133');
INSERT INTO truong VALUES ('2703', 'Phổ thông dân tộc nội trú tỉnh', '0131');
INSERT INTO truong VALUES ('3493', 'Phổ thông Dân tộc Nội trú tỉnh Khánh Hòa', '0141');
INSERT INTO truong VALUES ('4818', 'Phổ thông DTNT Sóc Trăng', '0159');

create table tai_khoan(
id_tk int AUTO_INCREMENT primary key,
ten_dang_nhap varchar(30) not null UNIQUE,
mat_khau varchar(30) not null,
cap_do int default 1
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1;

create table thong_tin_tai_khoan(
id_tk int primary key,
ho_ten  text not null,
email varchar(50) not null,
ngay_sinh date,
gioi_tinh varchar(4),
dia_chi text,
sdt varchar(20),
foreign key(id_tk) references tai_khoan(id_tk)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table dia_diem(
id_dd int AUTO_INCREMENT primary key,
ten_dd text not null,
link_dd varchar(50)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1;

create table ctdd(
id_dd int primary key,
tieu_de_dd text not null,
noi_dung_dd longtext,
loai text,
foreign key(id_dd) references dia_diem(id_dd)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table dgsdd(
id_dd int,
id_tk int,
so_sao_dd int,
foreign key(id_dd) references dia_diem(id_dd),
foreign key(id_tk) references tai_khoan(id_tk),
primary key (id_dd,id_tk)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table dgcdd(
id_dd int,
id_tk int,
binh_luan_dd text,
thoi_gian datetime,
foreign key(id_dd) references dia_diem(id_dd),
foreign key(id_tk) references tai_khoan(id_tk),
primary key (id_dd,id_tk,thoi_gian)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table dich_vu(
id_dv int AUTO_INCREMENT primary key,
ten_dv text not null,
link_dv varchar(50)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1;

create table ctdv(
id_dv int primary key,
tieu_de_dv text not null,
noi_dung_dv longtext,
loai text,
foreign key(id_dv) references dich_vu(id_dv)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table dgsdv(
id_dv int ,
id_tk int ,
so_sao_dv int,
foreign key(id_dv) references dich_vu(id_dv),
foreign key(id_tk) references tai_khoan(id_tk),
primary key (id_dv,id_tk)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table dgcdv(
id_dv int ,
id_tk int ,
binh_luan_dv text,
thoi_gian datetime,
foreign key(id_dv) references dich_vu(id_dv),
foreign key(id_tk) references tai_khoan(id_tk),
primary key (id_dv,id_tk,thoi_gian)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table cam_nang (
id_cn int AUTO_INCREMENT primary key,
id_tk int,
tieu_de_cn text not null,
noi_dung_cn longtext,
link_cn varchar (50),
foreign key(id_tk) references tai_khoan(id_tk)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1;

insert into tai_khoan(ten_dang_nhap, mat_khau, cap_do) values('admin', '123456', 2);
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach1', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach2', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach3', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach4', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach5', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach6', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach7', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach8', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach9', '123456');
insert into tai_khoan(ten_dang_nhap, mat_khau) values('khach10', '123456');

insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(1,'Nguyễn Xuân Phi','admin@gmail.com','1998-02-13','Nam','Hà Nội','0123456789');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(2,'Nguyễn Thị A','a@gmail.com','1998-10-2','Nữ','Hà Nam','0923456719');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(3,'Nguyễn Văn JK','b@gmail.com','1997-02-26','Nam','Nam Định','0163456729');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(4,'Nguyễn Văn GH','c@gmail.com','1998-02-18','Nam','Huế','0963453589');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(5,'Nguyễn Thị AX','d@gmail.com','1998-03-06','Nữ','Thanh Hóa','0123396789');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(6,'Nguyễn Văn O','e@gmail.com','1995-12-03','Nam','Hồ Chí Minh','0823456709');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(7,'Nguyễn Thị LK','f@gmail.com','1998-02-01','Nữ','Ninh Bình','0166456789');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(8,'Nguyễn Thị UJ','g@gmail.com','1996-03-01','Nữ','Cẩm Phả','0123234789');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(9,'Nguyễn Văn OP','h@gmail.com','1993-04-24','Nam','Bắc Ninh','01234556339');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(10,'Nguyễn Thị ER','i@gmail.com','1998-11-22','Nữ','Hà Giang','0963456789');
insert into thong_tin_tai_khoan(id_tk,ho_ten,email,ngay_sinh,gioi_tinh,dia_chi,sdt) values(11,'Nguyễn Văn QW','k@gmail.com','1994-08-11','Nam','Lang Sơn','0973456779');

insert into dia_diem(ten_dd, link_dd) values('Vịnh Hạ Long','1.jpg');
insert into dia_diem(ten_dd, link_dd) values('Cát Bà','2.jpg');
insert into dia_diem(ten_dd, link_dd) values('Đà Lạt','3.jpg');
insert into dia_diem(ten_dd, link_dd) values('Cáp treo Vinpearl Nha Trang','4.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hang Sơn Đoòng','5.jpg');
insert into dia_diem(ten_dd, link_dd) values('Đảo Phú Quốc','6.jpg');
insert into dia_diem(ten_dd, link_dd) values('bán đảo Sơn Trà','7.jpg');
insert into dia_diem(ten_dd, link_dd) values('núi đôi Quản Bạ','8.jpg');
insert into dia_diem(ten_dd, link_dd) values('Tòa thánh Cao Đài (Tây Ninh)','9.jpg');
insert into dia_diem(ten_dd, link_dd) values('Nhà hát lớn Hà Nội','10.jpg');
insert into dia_diem(ten_dd, link_dd) values('Quốc lộ 4D','11.jpg');
insert into dia_diem(ten_dd, link_dd) values('Than Uyên ','12.jpg');
insert into dia_diem(ten_dd, link_dd) values('Làng An Bằng','13.jpg');
insert into dia_diem(ten_dd, link_dd) values('Côn Đảo','14.jpg');
insert into dia_diem(ten_dd, link_dd) values('thác Bản Giốc','15.jpg');
insert into dia_diem(ten_dd, link_dd) values('Nhà thờ Đức Bà (Sài Gòn)','16.jpg');
insert into dia_diem(ten_dd, link_dd) values('Jungle Beach (Khánh Hòa)','17.jpg');
insert into dia_diem(ten_dd, link_dd) values('Tràng An','18.jpg');
insert into dia_diem(ten_dd, link_dd) values('Chùa Linh Phước','19.jpg');
insert into dia_diem(ten_dd, link_dd) values('TP Huế','20.jpg');
insert into dia_diem(ten_dd, link_dd) values('Ngô Đồng','21.jpg');
insert into dia_diem(ten_dd, link_dd) values('Vườn quốc gia Phong Nha - Kẻ Bàng','22.jpg');
insert into dia_diem(ten_dd, link_dd) values('Thung lũng Bắc Sơn','23.jpg');
insert into dia_diem(ten_dd, link_dd) values('Lăng Khải Định','24.jpg');
insert into dia_diem(ten_dd, link_dd) values('Vườn quốc gia Cúc Phương','25.jpg');
insert into dia_diem(ten_dd, link_dd) values('Chùa Thiên Mụ','26.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hồ Hoàn Kiếm','27.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hội An','28.jpg');
insert into dia_diem(ten_dd, link_dd) values('Mũi Né','29.jpg');
insert into dia_diem(ten_dd, link_dd) values(' Địa đạo Củ Chi','30.jpg');
insert into dia_diem(ten_dd, link_dd) values('Vùng núi Zhangye Danxia, tỉnh Cam Túc, Trung Quốc','31.jpg');
insert into dia_diem(ten_dd, link_dd) values(' Nơi ‘tận cùng thế giới’ ở Banos, Ecuador','32.jpg');
insert into dia_diem(ten_dd, link_dd) values(' Hố xanh vỹ đại ở Belize','33.jpg');
insert into dia_diem(ten_dd, link_dd) values('Cánh đồng hoa tulip Hà Lan','34.jpg');
insert into dia_diem(ten_dd, link_dd) values('Thiên đường hoa ở công viên Hitachi Seaside','35.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hang động băng Mendenhall, Alaska, Mỹ:','36.jpg');
insert into dia_diem(ten_dd, link_dd) values(' Ngọn núi Roraima nằm giữa Venezuela, Brazil và Guyana','37.jpg');
insert into dia_diem(ten_dd, link_dd) values('Khu vực Cappadocia, Thổ Nhĩ Kỳ','38.jpg');
insert into dia_diem(ten_dd, link_dd) values('Bãi biển sao trên đảo Vaadhoo, Mandives:','39.jpg');
insert into dia_diem(ten_dd, link_dd) values('Thác nước Victoria','40.jpg');
insert into dia_diem(ten_dd, link_dd) values('Trolltunga ở Hordaland, Na Uy','41.jpg');
insert into dia_diem(ten_dd, link_dd) values('Bãi biển Whitehaven, Australia:','42.jpg');
insert into dia_diem(ten_dd, link_dd) values('Vườn quốc gia Grand Canyon, bang Arizona, Mỹ','43.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hang động cẩm thạch Marble Cathedral, Chile','44.jpg');
insert into dia_diem(ten_dd, link_dd) values('Đường hầm tình yêu Tunnel of love','45.jpg');
insert into dia_diem(ten_dd, link_dd) values('Cánh đồng muối tuyệt đẹp Salar de Uyuni ở Bolivia:','46.jpg');
insert into dia_diem(ten_dd, link_dd) values('Enchanted Well – Chapada Diamantina National Park (Brazil):','47.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hẻm núi Antelope, Mỹ','48.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hang động Fingal, Scotland','49.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hồ bơi khổng lồ Tosua Ocean Trench, Samoa:','50.jpg');
insert into dia_diem(ten_dd, link_dd) values('Rừng tre Sagano ở Nhật Bản','51.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hang động đom đóm ở New Zealand','52.jpg');
insert into dia_diem(ten_dd, link_dd) values('Cầu thang Haiku, ở Oahu, Hawaii:','53.jpg');
insert into dia_diem(ten_dd, link_dd) values('Núi lửa ở bán đảo Kamchatka, Nga:','54.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hố sụt ở bán đảo Yucatan, Mexico','55.jpg');
insert into dia_diem(ten_dd, link_dd) values('Hồ đổi màu trên đỉnh núi Kelimutu ở Indonesia:','56.jpg');
insert into dia_diem(ten_dd, link_dd) values('Thành phố Amsterdam, Hà Lan','57.jpg');
insert into dia_diem(ten_dd, link_dd) values('Quần đảo Azores, Bồ Đào Nha','58.jpg');
insert into dia_diem(ten_dd, link_dd) values( 'Thủ đô Ljubljana, Slovenia','59.jpg');
insert into dia_diem(ten_dd, link_dd) values('Thác Victoria, Cộng hoà Zimbabwe','60.jpg');
insert into dia_diem(ten_dd, link_dd) values('Ruộng bậc thang Sa Pa','61.jpg');
insert into dia_diem(ten_dd, link_dd) values('Bán đảo Lofoten, Na Uy','62.jpg');
insert into dia_diem(ten_dd, link_dd) values(' Đồng bằng sông Cửu Long','63.jpg');

insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(1,'TP Hạ Long- TP Cẩm Phả -Quảng Ninh','Không chỉ đẹp bởi cảnh sắc “mây trời sóng nước”, vẻ đẹp nên thơ hay vô số những đảo đá vôi nổi trên mặt nước, Hạ Long còn đem lại cho du khách cảm giác bình yên khi hòa mình vào cảnh vật nơi đây. Được đánh giá là một trong 29 Vịnh đẹp nhất thế giới, cuối tháng 3/2012, tổ chức New Open World cũng đã chính thức công nhận vịnh Hạ Long là một trong bảy kỳ quan thiên nhiên mới của thế giới.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(2,'Huyện đảo Cát Bà -phía nam Vịnh Hạ Long','Huyện đảo Cát Bà là quần đảo có tới 367 đảo lớn nhỏ. Cát Bà là tên hòn đảo chính rộng khoảng 100 km2, cách cảng Hải Phòng 30 hải lý, nằm ở phía nam Vịnh Hạ Long, tạo nên một quần thể đảo và hang động trên biển làm mê hồn du khách. Đến đây du khách sẽ được tận hưởng không khí trong lành và hoà mình vào thiên nhiên tươi đẹp.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(3,'Thành phố Sương Mù','Đà Lạt được ví như một Tiểu Paris, Đà Lạt từng mộng mơ và nên thơ nhờ cái lạnh cao nguyên ban đêm, sương mù buổi sớm và những dải rừng thông bao quanh thành phố. Thiên nhiên ưu đãi cho xứ sở Đà Lạt khí hậu ôn hòa, là thiên đường của rất nhiều loài hoa.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(4,'Nha Trang-Hòn ngọc viễn Đông','Cáp treo Vinpearl Nha Trang là tuyến cáp treo vượt biển vịnh Nha Trang dài 3.320 m, nối Nha Trang với khu du lịch Hòn Ngọc Việt trên đảo Hòn Tre. Đây là tuyến cáp treo vượt biển dài nhất thế giới với sức chứa tám người trên một cabin. ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(5,'Tân Trạch-Bố Trạch-Quảng Bình','Hang Sơn Đoòng rộng 150 m, cao hơn 200 m, kéo dài gần 9km. Với kích thước như thế, hang Sơn Đoòng đã vượt qua hang Deer ở Vườn quốc gia Gunung Mulu - Malaysia (với chiều cao 100 m, rộng 90 m, dài 2km) để chiếm vị trí là hang động tự nhiên lớn nhất thế giới.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(6,'Đảo Ngọc-Kiên Giang','Phú Quốc. Hòn đảo này còn được mệnh danh là Đảo Ngọc, là hòn đảo lớn nhất Việt Nam, cũng là đảo lớn nhất trong quần thể 22 đảo tại vùng vịnh Thái Lan. Đảo Phú Quốc cùng với các đảo khác tạo thành huyện đảo Phú Quốc trực thuộc tỉnh Kiên Giang. Toàn bộ huyện đảo có tổng diện tích 589,23 km vuông.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(7,'bán đảo Sơn Trà-Đà Nẵng','Được mệnh danh là “viên ngọc xanh” của Đà Nẵng, bán đảo Sơn Trà không chỉ cung cấp không khí trong lành thanh mát, mà còn là tấm bình phong khổng lồ chắn bão cho thành phố biển; là một điểm đến có sức cuốn hút và quyến rũ lớn đối với khách du lịch. Khám phá Sơn Trà, du khách có thể chinh phục cả “rừng vàng” và “biển bạc” với rất nhiều thắng cảnh thiên nhiên tuyệt mỹ.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(8,'Tam Sơn- Quản Bạ','Quản Bạ là huyện cửa ngõ nằm về phía tây nam của Công viên địa chất toàn cầu Cao nguyên đá Đồng Văn, tỉnh Hà Giang. Cách thành phố Hà Giang 46 km về phía bắc, vượt qua dốc Bắc Sum cao ngất trong mây là du khách đã đến với cổng trời Quản Bạ. Đứng từ đây có thể ngắm nhìn thị trấn Tam Sơn thơ mộng quanh năm mát mẻ, đặc biệt được tận mắt chiêm ngưỡng núi đôi Quản Bạ tròn trịa, đầy quyến rũ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(9,'Hòa Thành- Hòa Thành-Tây Ninh. ','Tòa thánh Cao Đài (Tây Ninh) được khánh thành vào năm 1955, ở xã Long Thành Bắc, phía bắc TP Hồ Chí Minh. Toàn bộ tòa thánh Cao Đài Tây Ninh bao gồm gần 100 công trình kiến trúc lớn nhỏ khác nhau, được xây bằng bê tông cốt tre. Tòa thánh có 12 cổng, các cổng đều được chạm khắc hình Tứ linh (Long, Lân, Quy, Phụng) và hoa sen. ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(10,'01 Tràng Tiền-Hoàn Kiếm-Thủ đô Hà Nội','Nhà hát lớn Hà Nội được người Pháp khởi công xây dựng năm 1901 và hoàn thành vào năm 1911, theo mẫu Nhà hát Opéra Garnier (Paris) nhưng mang tầm vóc nhỏ hơn và sử dụng các vật liệu phù hợp với điều kiện khí hậu địa phương. Ngay khi hoàn thành, Nhà hát Lớn đã giữ vai trò như một trung tâm văn hóa quan trọng của thủ đô, diễn ra thường xuyên các hoạt động văn hóa, biểu diễn nghệ thuật.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(11,'Mường So-Phong Thổ-Lai Châu','Quốc lộ 4D xuất phát từ Pa So (điểm giao với quốc lộ 12, thuộc xã Mường So, huyện Phong Thổ, tỉnh Lai Châu), chạy qua Tam Đường (Phong Thổ, Lai Châu) tới Sa Pa (Lào Cai) qua thành phố Lào Cai, Mường Khương và kết thúc ở cửa khẩu Mường Khương (Lào Cai), chiều dài khoảng 160 km. Trên đường đi có thể tham quan một số địa điểm như: Thác Bạc, đèo Ô Quý Hồ... ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(12,'Mường Than-Tp Lai Châu','Đến với Tây Bắc, chắc chắn không thể bỏ qua cảnh quan tuyệt đẹp là ruộng bậc thang trải khắp các bản làng, thung lũng. Than Uyên không chỉ có ruộng bậc thang mà còn có cả những cánh đồng rộng lớn bạt ngàn, tạo nên những sắc mầu đa dạng cho mùa nước đổ nơi đây. Không giống như những vùng khác ở vùng núi phía Bắc, ở Than Uyên có hai vụ lúa trong năm, chính vì vậy du khách có thể ngắm mùa nước đổ vào khoảng tháng 12, tháng 1 hằng năm.','Trong Nước' );
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(13,'Vinh An-Phú Vang','Làng An Bằng là một làng sát Biển Đông, thuộc xã Vinh An, huyện Phú Vang, tỉnh Thừa Thiên-Huế. Làng An Bằng (nguyên là An Bình, vì kỵ huý nên đổi ra là An Bường), được hình thành cách đây khoảng 450 năm. Dân làng làm nghề đánh cá biển.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(14,'Côn Đảo: Từ địa ngục trần gian đến thiên đường du lịch','Côn Đảo thu hút du khách bởi những bãi biển tuyệt đẹp và quần thể sinh vật biển phong phú, đặc biệt là san hô. Đây còn là điểm đến lý tưởng để tận hưởng một cuộc sống yên bình cho những ai đang cảm thấy ngột ngạt với nhịp sống hối hả của thành thị.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(15,'Đàm Thủy- huyện Trùng Khánh-Cao Bằng.','Nhắc đến Bản Giốc là nhắc đến một trong những thác hùng vĩ và đẹp nhất Việt Nam, không những thế còn được xếp hạng vào top những thác thiên đường tuyệt đẹp trên thế giới. Một chuyến du lịch đến thác Bản Giốc sẽ cho du khách những trải nghiệm thú vị và tươi mới.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(16,'quận 1- TP.HCM','Nhà thờ Đức Bà (Sài Gòn) là một trong những công trình kiến trúc độc đáo nhất tại Sài Gòn, luôn thu hút sự quan tâm của du khách trong và ngoài nước. Toà thánh đường có chu vi 91 x 35,5 m, cao 21 m. Đây là một công trình kiến trúc thật sự có giá trị rất lớn về mặt lịch sử và nghệ thuật kiến trúc xây dựng.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(17,'Nằm trong bán đảo Hòn Hèo thuộc xã Ninh Phước-Ninh Hòa-Khánh Hòa','Jungle Beach (Khánh Hòa) là nơi nghỉ dưỡng với cảnh sắc hoang sơ với nước biển xanh và cát trắng trải dài. Dù chỉ cách Nha Trang 60 km nhưng Jungle Beach tách biệt hoàn toàn với sự ồn ào, bon chen của thành phố. Nằm trong bán đảo Hòn Hèo, thuộc xã Ninh Phước, huyện Ninh Hòa, tỉnh Khánh Hòa, Jungle Beach chính là sự hòa hợp tuyệt vời giữa rừng và biể','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(18,'khu du lịch sinh thái nằm trong Quần thể di sản thế giới Tràng An-Ninh Bình.','Tràng An là khu du lịch sinh thái nằm trong quần thể di sản thế giới Tràng An, thuộc tỉnh Ninh Bình. Nơi đây đã được Chính phủ Việt Nam xếp hạng di tích quốc gia đặc biệt quan trọng và UNESCO công nhận là di sản thế giới kép từ năm 2013, với hệ thống dãy núi đá vôi có tuổi địa chất khoảng 250 triệu năm, qua thời gian dài phong hóa bởi sự biến đổi của trái đất, khí hậu, biển tiến, biển thoái đã mang trong mình hàng trăm thung lũng, hang động, hồ đầm. ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(19,'chùa Ve Chai-Tp Đà Lạt-Lâm Đồng','Chùa Linh Phước là một trong những danh thắng nổi tiếng của Đà Lạt, là công trình kiến trúc đậm đà bản sắc Á Đông. Với sự kết hợp hài hòa giữa chùa và tháp của lối kiến trúc phương Đông, từ nhiều năm qua, nơi đây luôn là điểm du lịch tâm linh hấp dẫn du khách trong và ngoài nước.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(20,'Huế-đô thị cấp quốc gia của Việt Nam và từng là kinh đô của Việt Nam ','Tọa lạc hai bên bờ sông Hương, TP Huế là di sản văn hóa thế giới, thuộc tỉnh Thừa Thiên - Huế, sở hữu nhiều di tích lịch sử có giá trị cao nằm trong quần thể di tích cố đô Huế như: Kinh thành Huế, lăng Minh Mạng, lăng Gia Long, chùa Thiên Mụ... Nhã nhạc cung đình là một trong những nét văn hóa đặc sắc của Huế, thu hút đông đảo du khách. ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(21,'Ninh Hải, huyện Hoa Lư, tỉnh Ninh Bình, Việt Nam','Ngô Đồng là tên dòng sông nhỏ chảy qua địa phận xã Ninh Hải, huyện Hoa Lư, tỉnh Ninh Bình. Vắt ngang mình giữa hệ thống núi đá vôi xanh rờn. Sông Ngô Đồng là đường thủy duy nhất đưa du khách vào tham quan Tam Cốc - một vùng non nước từng được ví như “Hạ Long trên cạn”.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(22,'Bố Trạch, and Minh Hóa-tỉnh Quảng Bình','Vườn quốc gia Phong Nha - Kẻ Bàng là vườn quốc gia tại huyện Bố Trạch, và Minh Hóa (tỉnh Quảng Bình), cách thành phố Đồng Hới khoảng 50 km về phía tây bắc, cách thủ đô Hà Nội khoảng 500 km về phía nam. Được UNESCO công nhận là di sản thiên nhiên thế giới theo tiêu chí địa chất, địa mạo năm 2003; được UNESCO công nhận lần hai là di sản thiên nhiên thế giới với tiêu chí đa dạng sinh học, sinh thái vào năm 2015.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(23,'Bắc Sơn-Lạng Sơn','Thung lũng Bắc Sơn là điểm đến quen thuộc ở Lạng Sơn, thu hút du khách ghé thăm vào mùa cao điểm tháng 7. Thung lũng Bắc Sơn nằm gọn trong dãy núi đá vôi trải dài bên những nếp nhà của người dân tộc Tày, Nùng, Dao. Đứng trên đỉnh Nà Lay, du khách có thể ngắm toàn cảnh thung lũng bao phủ trong màn mây trùng điệp.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(24,'Châu Chữ - Hương Thủy - Thừa Thiên Huế','Lăng Khải Định hay Ứng Lăng là di tích trong quần thể di tích cố đô Huế, thuộc làng Châu Chữ, thị xã Hương Thủy, tỉnh Thừa Thiên - Huế. Đây là nơi yên giấc ngàn thu của Khải Định đế vị vua thứ 12 triều Nguyễn trong lịch sử phong kiến Việt Nam. ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(25,'khu vực Tây Bắc, châu thổ Sông Hồng và Bắc Trung Bộ','Vườn quốc gia Cúc Phương nằm trên địa phận tỉnh Ninh Bình, cách Hà Nội 120 km về phía tây nam, cách thành phố Ninh Bình 45 km về phía tây bắc. Cúc Phương có diện tích 25 nghìn héc-ta, tiếp giáp ba tỉnh Ninh Bình, Hòa Bình và Thanh Hóa. Khu rừng như một bảo tàng thiên nhiên rộng lớn, nơi lưu giữ hệ động, thực vật rừng trên núi đá vôi phong phú nhất ở Việt Nam. Đến Cúc Phương, du khách được chiêm ngưỡng những cây cổ thụ nghìn năm, những loài chim quý tuyệt đẹp… ','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(26,'Chùa Linh Mụ-Huế','Chùa Thiên Mụ. Còn gọi là chùa Linh Mụ, là ngôi chùa cổ nằm trên đồi Hà Khê, tả ngạn sông Hương, cách trung tâm thành phố Huế khoảng 5km về phía tây. Chùa Thiên Mụ chính thức được xây dựng vào năm Tân Sửu (năm 1601), đời chúa Tiên Nguyễn Hoàng, vị chúa Nguyễn đầu tiên ở Đàng Trong.Với cảnh đẹp tự nhiên và quy mô rộng lớn, chùa Thiên Mụ đã trở thành ngôi chùa đẹp nhất thời bấy giờ. Trải qua bao biến cố lịch sử, chùa Thiên Mụ từng được dùng làm đàn Tế Đất dưới triều Tây Sơn (khoảng năm 1788), rồi được trùng tu nhiều lần dưới các triều vua nhà Nguyễn. Ngày nay chùa vẫn được tiếp tục chỉnh trang ngày càng huy hoàng, tráng lệ và luôn hấp dẫn, thu hút đông đảo du khách gần xa.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(27,'Hồ Gươm-Hà Nội','Hồ Hoàn Kiếm. Còn được gọi là Hồ Gươm, là hồ nước ngọt tự nhiên của thành phố Hà Nội, hồ có diện tích khoảng 12 hecta. Trước kia, hồ còn có các tên gọi là: hồ Lục Thủy, hồ Thủy Quân, hồ Tả Vọng và Hữu Vọng, tên gọi Hoàn Kiếm xuất hiện vào đầu thế kỷ XV gắn với truyền thuyết vua Lê Thái Tổ trả gươm báu cho Rùa thần.Hồ Hoàn Kiếm được gắn liền với truyền thuyết huyền sử, là biểu tượng khát khao hòa bình, đức văn tài võ trị của dân tộc Việt Nam. Do vậy, đã có rất nhiều văn nghệ sĩ đã lấy hình ảnh Hồ Gươm làm nền tảng cho các tác phẩm của mình.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(28,'Bờ Bắc hạ lưu sông Thu Bồn-Đà Nãng','Thành phố Hội An nằm bên bờ Bắc hạ lưu sông Thu Bồn, cách thành phố Đà Nẵng khoảng 25km về phía Đông Nam, cách thành phố Tam Kỳ khoảng 50km về phía Đông Bắc. Từ thế kỷ XVI, XVII nơi đây đã nổi tiếng với tên gọi Faifoo, là nơi giao thương và là trung tâm buôn bán lớn của các thương nhân Nhật Bản, Trung Quốc, Bồ Ðào Nha, Italia… ở Đông Nam Á.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(29,'TP Phan Thiết- Bình Thuận','Mũi Né. Là một trung tâm du lịch nổi tiếng vùng Nam Trung Bộ, cách trung tâm thành phố Phan Thiết (tỉnh Bình Thuận) 22km về hướng Đông Bắc, nơi đây là một dải bờ biển xanh hoang vu với các đồi cát đỏ trải dài như sa mạc và những làng chài xứ biển thuần chất Việt Nam.Mũi Né còn hấp dẫn du khách bởi nhiều di tích lịch sử - văn hóa của một nền văn hóa đa dạng, đa dân tộc như Kinh, Chăm, Hoa, tiêu biểu có các tháp Chăm, tháp Nước, chùa Ông, chùa bà Thiên Hậu, Vạn Thủy Tú và nhiều di tích khác có giá trị về văn hóa, lịch sử, du lịch.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(30,'Phú Hiệp-  Phú Mỹ Hưng-  Củ Chi- Hồ Chí Minh','Địa đạo Củ Chi. Là hệ thống phòng thủ trong lòng đất ở huyện Củ Chi, vùng đất được mệnh danh là "đất thép", cách Thành phố Hồ Chí Minh 70km về hướng Tây - Bắc. Hệ thống này được Mặt trận Dân tộc Giải phóng miền Nam Việt Nam xây dựng trong thời kỳ Chiến tranh Đông Dương và Chiến tranh Việt Nam.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(31,'Vùng núi Zhangye Danxia- Cam Túc-Trung Quốc','Nếu không thật sự đặt chân tới địa điểm này, bạn sẽ cho rằng những hình ảnh trước mắt mình là một tác phẩm photoshop. Thế nhưng đây quả thật là phong cảnh tuyệt đẹp có một không hai mà mẹ thiên nhiên ưu ái ban tặng cho vùng núi Zhangye Danxia, Trung Quốc. Khách du lịch sẽ nhìn thấy những vệt đủ màu sắc từ đỏ, vàng, cam cho tới xanh lục, tím, nâu… Kiệt tác đẹp ngoài sức tưởng tượng này là do các yếu tố tự nhiên như mưa, gió, sự xói mòn, quá trình oxy hoá kết hợp với các yếu tố khoáng chất tạo ra những mảng màu sắc độc đáo khác nhau','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(32,'Nơi tận cùng thế giới ở Banos- Ecuador','Đây là một trong những điểm du lịch không dành cho người yếu tim bởi bạn sẽ được ngồi trên một chiếc xích đu tận cùng thế giới và đánh đu trên vực núi sâu mà không dùng bất cứ biện pháp bảo vệ nào. Nhưng trước khi ngồi được lên chiếc đu quay ‘tử thần’ này, bạn cần phải men theo con đường mòn đến Bellavista từ vách Banos, Ecuador để đến điểm quan sát tại một trạm theo dõi địa chấn có tên ‘La Casa del Arbel’ – một ngôi nhà nhỏ nằm trên một cái cây nhỏ sát bên hẻm núi.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(33,'Hố xanh vỹ đại ở Belize','‘Hố xanh vĩ đại’ là một hố sâu nằm dưới mặt biển ngoài khơi bờ biển Belize, là một phần của khu bảo tồn san hô Belize Barrier, khu vực được UNESCO công nhận là di sản thiên nhiên của nhân loại. Được bao quanh bởi một rặng san hô dài 70 km, hố này rộng đến 300m và sâu khoảng 124m. Sự kỳ vĩ và tráng lệ của nơi đây khiến mọi du khách đều phải trầm trồ, thán phục.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(34,'Cánh đồng hoa tulip Hà Lan','Hà Lan luôn được mệnh danh là quê hương của loài hoa kiêu sa tuyệt đẹp – tulip. Nơi đây có những cánh đồng hoa tulip ngập tràn màu sắc, trải dài bất tận tạo nên những bức tranh muôn màu sắc, đẹp ngoài sức tưởng tượng của con người. Mùa hoa tulip bắt đầu từ cuối tháng 3 tới khoảng đầu tháng 8. Vào thời điểm này, những bông hoa với đủ màu sắc tím, hồng, đỏ, vàng… đua nhau nở, giống như những suối hoa rực rỡ muôn màu. Cách tốt nhất để chiêm ngưỡng những cánh đồng hoa là ngắm toàn cảnh từ trực thăng.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(35,'Thiên đường hoa-công viên Hitachi Seaside','Công viên Hitachi Seaside là một trong những điểm du lịch “vàng” của đất nước Nhật Bản. Với diện tích 3,5ha, nơi đây có rất nhiều ngọn đồi, mỗi ngọn đồi là mỗi loại hoa khác nhau, thay phiên khoe sắc suốt 4 mùa trong năm. Công viên này đặc biệt nổi tiếng với hoa nemophilas – loài hoa năm cánh màu xanh trong suốt. Trong mùa xuân, hơn 4,5 triệu cây hoa nemophilas xanh sẽ đua nhau nở rộ trong công viên tạo nên cảnh đẹp “độc nhất vô nhị”.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(36,'Mendenhall- Alaska- Mỹ:','Nhắc tới Alaska, người ta không chỉ nghĩ tới những dòng sông băng trải dài bất tận, ẩn giấu trong mình vẻ đẹp kỳ ảo, lôi cuốn mà còn tưởng tượng tới những hang động băng huyền bí và đẹp  lung linh. Một trong số đó chính là hang động băng Mendenhall. Nơi đây là một trong những địa điểm mà bất kỳ ai cũng mong muốn được đặt chân tới và tận mắt ngắm nhìn vẻ đẹp kỳ vĩ của tạo hoá. Không chỉ mang một vẻ đẹp thuần túy của thiên nhiên, hang động băng này còn giúp các nhà khoa học có một cái nhìn tổng quát hơn về điều kiện khí hậu trong quá khứ, hiện tại và tương lai của những vùng đất cực bắc nước Mỹ.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(37,'nằm giữa Venezuela-Brazil và Guyana','Ngọn núi có đỉnh bằng kỳ lạ Roraima là ngọn núi có đỉnh bằng cao nhất và nổi tiếng nhất Venezuela, đồng thời ngọn núi này được xem như là biên giới giữa ba quốc gia Venezuela, Brazil và Guyana. Ngọn núi thuộc địa phận Vườn Quốc Gia Canaima với diện tích của toàn khu vực là 30.000km2, là nơi chứa và tạo ra nhiều địa chất lâu đời nhất thế giới; có niên đại vào khoảng 2 tỷ năm trước.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(38,'Cappadocia-Thổ Nhĩ Kỳ','Cappadocia là khu vực lịch sử thuộc khu vực trung tâm Anatolia của Thổ Nhĩ Kỳ, nổi tiếng về cảnh quan thiên nhiên ấn tượng nhất ở châu Âu. Nơi đây được hình thành từ lớp đá trầm tích và đá núi lửa – kết quả của vụ phun trào xảy ra khoảng 3 triệu năm trước đây. Trải qua hàng ngàn năm, những tác động của thiên nhiên: mưa, gió và nước sông đã khiến cho các lớp đá sa thạch và các khối đá mềm bị bào mòn dữ dội và tạo thành hàng trăm trụ cột đá ngoạn mục trong hình dạng của một tòa tháp, hình nón, hình ống khói, đạt đến tầm cao 40m, khiến nhìn từ trên cao, khu vực này trông tương tự như địa hình trên mặt trăng.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(39,'o Vaadhoo- Mandives','Nhiều người cho rằng cảnh tượng những sinh vật nhỏ xíu phát sáng trên bãi biển như hàng ngàn ngôi sao lấp lánh chỉ xuất hiện trong những bộ phim khoa học viễn tưởng hay những câu chuyện cổ tích. Song trên thực tế, bãi biển phát sáng trên hoàn toàn có thật ở Mandives. Nước biển phát sáng do các sinh vật phù du có khả năng phát quang xuất hiện với mật độ cao trong nước. Chính sự xuất hiện của những loài sinh vật này đã tạo nên một cảnh đẹp ngoài sức tưởng tượng cho bãi biển nơi đây.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(40,'Thác nước Victoria','Với độ cao khoảng 108m và nằm giữa biên giới Zimbabwe và Zambia, thác nước Victoria được biết tới là thác nước lớn nhất châu Phi. Nơi đây là một trong những điểm du lịch hấp dẫn và nổi tiếng nhất Zimbabwe mà du khách không thể bỏ qua khi có cơ hội đến châu Phi. Sự giao thoa giữa núi đá, sông nước, mây trời và những cánh rừng rậm bao quanh khu vực đã tạo nên một khung cảnh thiên nhiên đẹp hoàn hảo và ngoạn mục.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(41,'Trolltunga - Hordaland- Na Uy','Thêm một điểm du lịch nữa dành cho những du khách ưa mạo hiểm bởi Trolltunga là khu vực nằm trên rìa vách núi, cách mực nước biển hơn 600m và du khách chỉ có thể đi bộ ra ngoài khu vực này trong khoảng thời gian từ tháng 6 đến tháng 9.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(42,'Whitehaven- Australia','Bờ biển Whitehaven là một trong những địa điểm mà khách du lịch không thể bỏ qua khi tới với đất nước Australia. Làn nước trong xanh như pha lê và bãi cát trắng nhất thế giới, trải dài 7km là những viên ngọc quý mà tạo hóa ban tặng cho hòn đảo Whitsunday, đảo lớn nhất trong 74 đảo thuộc đất nước Kangaroo này.Từ trên cao nhìn xuống, bãi biển Whitehaven đẹp ngoài sức tưởng tượng của con người.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(43,'Grand Canyon- bang Arizona- Mỹ','Grand Canyon có diện tích gần 5.000 km2 là một trong những điểm du lịch nổi tiếng nhất thế giới. Nơi đây có những hẻm núi với đủ màu sắc từ nâu, đỏ, cam tới vàng tạo nên một khung cảnh rực rỡ và kỳ thú dưới ánh mặt trời.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(44,'Marble Cathedral- Chile','Động cẩm thạch Marble Cathedral tọa lạc  hồ General Carrera ở Pantagonia, Chile được hình thành từ hàng nghìn năm, nhờ quá trình bào mòn của tự nhiên, tạo nên những hẻm hốc và hang động vô cùng ấn tượng. Có thể nói rằng, hiếm có một tác phẩm nghệ thuật điêu khắc nào có thể so sánh với vẻ đẹp tuyệt mỹ của hang động được xem là một trong những kỳ quan thiên nhiên đẹp nhất thế giới này.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(45,'Klevan - Ukraine','Đây là một trong những đường hầm xe lửa đẹp nhất thế giới, thuộc thành phố Klevan của Ukraine. Nơi đây được bao phủ hoàn toàn bởi cây cối dày đặc tạo nên một khung cảnh tuyệt đẹp xuyên suốt 4 mùa trong năm. Ngay cả trong mùa đông lạnh giá, đường hầm tình yêu cũng mang một vẻ đẹp rất lãng mạn khi những bông tuyết trắng li ti bám lên những cành cây khẳng khiu. Phần lớn khách du lịch tới nơi đây đều là những cặp đôi đang yêu, họ đến để trao cho nhau những nụ hôn ngọt ngào giữa thiên nhiên, gửi gắm những điều ước cho tình yêu vĩnh cữu.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(46,'Salar de Uyuni-Bolivia','Salar de Uyuni là cánh đồng muối tự nhiên lớn nhất thế giới được hình thành do sự vận động của vỏ trái đất. Trong những tháng mùa đông, khu vực này hoàn toàn khô ráo. Tuy nhiên, khi mùa hè đến, cánh đồng lại luôn ngập nước, biến thành tấm gương soi khổng lồ.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(47,'Enchanted Well – Chapada Diamantina National Park -Brazil-','Enchanted Well nằm trong khuôn viên của công viên quốc gia Chapada Diamantina ở Bahia, Brazil. Nơi đây giống như một hồ bơi khổng lồ với độ sâu khoảng 41m, làn nước xanh ngắt. trong veo như một tảng băng tạo nên một khung cảnh tuyệt đẹp.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(48,'Antelop- Mỹ','Nằm ở vùng đất Navajo gần Page, Arizona, Antelope Canyon là một trong những hẻm núi thu hút nhiều người tham quan và chụp ảnh. Nơi đây được coi là một tác phẩm chạm khắc điêu luyện mà thiên nhiên ban tặng cho nước Mỹ và là viên ngọc có sức mạnh ma thuật, huyền bí, cuốn hút lớn đối với những ai đã từng được chiêm ngưỡng vẻ đẹp ấy.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(49,'Fingal- Scotland','Hang động biển Fingal nằm trên hòn đảo Staffa ở Scotland là một trong những điểm du lịch mà bạn không thể bỏ qua. Theo các nhà địa chất, hang Fingal được hình thành do dung nham nóng chảy kết hợp với hiện tượng xói mòn tạo nên một bức tranh điêu khắc cuốn hút đến kỳ lạ.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(50,'Tosua Ocean Trench- Samoa','Tosua Ocean Trench nằm gần Lotofaga, một ngôi làng trên bờ biển phía nam của hòn đảo Upolu, Samoa có độ sâu khoảng 30m. Điểm đặc biệt nhất của hồ bơi này chính là bạn cần phải leo xuống một cầu thang dài để tới với hồ bơi tự nhiên khổng lồ này.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(51,'Sagano - Nhật Bản','Nằm ở quận Arashiyama, Nhật Bản, rừng tre Sagano là một điểm đến tuyệt vời cho những người yêu thích vẻ đẹp của thiên nhiên. Với những rặng tre bạt ngàn và thẳng tắp, nơi đây thu hút hàng triệu lượt du khách trong và ngoài nước tới tham quan mỗi năm. Tới với nơi đây, bạn không chỉ được ngắm những rặng tre thẳng tắm, cao vút mà còn được tận hưởng bầu không khí trong lành và hoà mình vào với cuộc sống thiên nhiên tươi đẹp.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(52,'New Zealand','Hang động Waitomo Glowworm thuộc đảo Bắc, New Zealand nổi tiếng với vô vàn những con đom đóm phát sáng kỳ diệu. Ánh sáng kỳ ảo tuyệt đẹp như hàng ngàn ngôi sao bên trong động khiến bất cứ ai có dịp được đặt chân tới nơi đây đều phải ồ lên kinh ngạc.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(53,'Haiku-  Oahu- Hawaii:','Các bậc thang Haiku ở Hawaii được mệnh danh là “Nấc thang lên thiên đường”. Leo lên các bậc thang này là một trải nghiệm thú vị giữa chinh phục đỉnh cao với địa hình gồ ghề trơn trượt và khám phá thiên nhiên tươi đẹp.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(54,'Kamchatka- Nga','Bán đảo Kamchatka hiện chứa khoảng 160 núi lửa, trong số đó 29 núi vẫn còn hoạt động và 19 núi lửa đang hoạt động đã được UNESCO đưa vào danh sách Di sản thế giới. Núi lửa cao nhất Kljuchevskaia Sopka sở hữu “hình nón hoàn hảo” là một trong những ứng cử viên sáng giá cho vị trí núi lửa đẹp nhất thế giới.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(55,'Yucatan- Mexico','Hố sụt tự nhiên xuất hiện ở bán đảo Yucatan là kết quả của sự sụp đổ những tảng đá vôi xốp do tác động của nguồn nước ngầm ở phía dưới. Nguồn nước ở đây trong vắt, tinh khiết, bắt nguồn từ những trận mưa ngấm dần xuống lớp đá vôi hình thành những giọt nước rơi xuống.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(56,'Kelimutu -Indonesia','Kelimutu là một ngọn núi lửa nhỏ nổi tiếng ở đảo Flores, Indonesia. Điều ấn tượng nhất là trên đỉnh của ngọn núi lửa này có ba hồ được hình thành từ các miệng núi lửa có màu sắc rất độc đáo. Dù cùng nằm trên đỉnh của một ngọn núi lửa, nhưng nước trong các hồ này lại thay đổi màu sắc một cách định kỳ khác nhau từ đỏ và nâu sang màu ngọc lam và xanh lục tạo nên một cảnh sắc tuyệt đẹp.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(57,'Amsterdam-Hà Lan','Nếu bạn đã lên kế hoạch một chuyến đi châu Âu trong năm 2018 này, bạn chắc chắn không thể bỏ qua thành phố Amsterdam – một trong những thành phố xinh đẹp bậc nhất của đất nước Hà Lan.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(58,'Quần đảo Azores, Bồ Đào Nha','Azores là một quần đảo nằm giữa Đại Tây Dương. Vị trí địa lý tương đối hiểm trở nên nơi đây không đông đúc du khách như nhiều địa điểm du lịch khác. Cũng chính điều này, nếu bạn đang tìm kiếm một vùng đất mới để khám phá, Azores nên là cái tên “top-of-mind” đấy.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(59,'Ljubljana- Slovenia','Vùng Đông Âu của Slovenia ít nhiều chịu ảnh hưởng của sự lịch lãm nhưng phóng khoáng từ những người bạn nước Ý thân cận. Và thủ đô Ljubljana không nằm ngoài sự giao thoa văn hoá này.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(60,'Cộng hoà Zimbabwe','Thác Victoria được xem là một trong những kỳ quan tuyệt vời nhất của thiên nhiên với thảm nước hùng vĩ trên những vách đá cao đến 108 mét. Ngắm nhìn thác nước Victoria từ trên cao, bạn mới trải nghiệm được hết khung cảnh thiên nhiên đồ sộ và tuyệt vĩ này.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(61,'di sản danh thắng Quốc gia.','Sa Pa là một thị trấn vùng cao ở phía Tây Bắc Việt Nam, nơi có các thửa ruộng bậc thang tuyệt đẹp, trải dài như là những nấc thang vươn lên tận lưng trời. Với cảnh quang thiên nhiên hùng vĩ, thơ mộng, những phiên chợ tình bí ẩn và ẩm thực phong phú, đặc sắc, Sa Pa đã “mê hoặc” hầu hết những du khách khi đặt chân đến đây.','Trong Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(62,'chiếc đuôi của một loài thuỷ quái đang bò lên bờ biển','Bán đảo Lofoten, Na Uy được xem là một trong những điểm tham quan nổi tiếng nhất của Iceland. Những dãy đá sừng sững bao quanh ôm gọn những thị trấn và người dân nơi đây. Khung cảnh hiện lên hùng vĩ nhưng yên bình dễ khiến người ta siêu lòng.','Ngoài Nước');
insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd,loai) values(63,'đồng bằng Nam Bộ - miền Tây Nam Bộ','Đến đồng bằng sông Cửu Long ngoài việc thăm thú những vườn trái cây bạt ngàn, đi trên một trong 9 nhánh sông đổ ra biển của dòng sông Mê kông, nghe đờn ca tài tử và thưởng thức những món đặc sản vùng Nam Bộ, du khách cũng khó lòng bỏ qua việc tham quan các khu chợ nổi, một đặc trưng chỉ có ở miền Tây sông nước.','Trong Nước');

insert into dich_vu( ten_dv,link_dv) values ('Aria Hotel Budapest', '1.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Mandapa A Ritz-Carlton Reserve', '2.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Turin Palace Hotel', '3.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Hotel The Serras', '4.jpg');
insert into dich_vu( ten_dv,link_dv) values ('BoHo Prague Hotel', '5.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Portrait Firenze', '6.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Shinta Mani Resort', '7.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Tulemar Bungalows & Villas', '8.jpg');
insert into dich_vu( ten_dv,link_dv) values ('JA Manafaru', '9.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Kandolhu Maldives', '10.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khách sạn ibis Styles Nha Trang', '11.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khách Sạn Indochine Palace Huế', '12.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khách Sạn Lotte Hà Nộ', '13.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khu nghỉ dưỡng Ana Mandara Huế', '14.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khách sạn Rum Vàng 2 Đà Lạt ', '15.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Pelican Cruise Hạ Long', '16.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khách Sạn Hadana Boutique Đà Nẵng', '17.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khách Sạn Golden Central Sài Gòn', '18.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khu nghỉ dưỡng Novela Mũi Né', '19.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Khách Sạn Pullman Hà Nội', '20.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Singapore Airlines', '21.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Air New Zealand', '22.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Emirates.', '23.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Japan Airlines', '24.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Eva Air ', '25.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Southwest Airlines', '26.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Jet2.com', '27.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Qatar Airways', '28.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Azul Brazilian Airlines', '29.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Korean Air', '30.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Vietnam Airline', '31.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Jetstar', '32.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Vietjet Air', '33.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Air Mekong', '34.jpg');
insert into dich_vu( ten_dv,link_dv) values ('Vasco', '35.jpg');

insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (1,'Budapest, Hungary. ', 'Khách sạn Aria Hotel thuộc hệ thống khách sạn Library Hotel Collection nổi tiếng tại  Budapest, Hungary. Aria Hotel Budapest mang đến cho du khách những trải nghiệm thực sự hoàn hảo. Sự tiện nghi, thiết kế vô cùng hiện đại, địa điểm hoàn hảo, đội ngũ nhân viên tận tình, chu đáo, dịch vụ spa tuyệt vời tại Aria Hotel Budapest sẽ khiến bạn không muốn rời đi. Tận hưởng bữa sáng và bữa chiều cùng với rượu và pho mát ngon miệng mỗi ngày sẽ là điều mà bạn không nên bỏ qua.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (2,' Ubud, Indonesia','Khách sạn Mandapa A Ritz-Carlton Reserve thuộc tỉnh Ubud, Indonesia được đánh giá là khách sạn tốt nhất của châu Á. Chính vì vậy, không khó để hiểu tại sao Mandapa A Ritz-Carlton Reserve lại là một trong những khách sạn hàng đầu thế giới. Ấn tượng chính là từ để miêu tả khách sạn Mandapa A Ritz-Carlton Reserve. Tất cả những gì mà du khách mong chờ đều được phục vụ vô cùng chu đáo tại đây.','Khách Sạn' );
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (3,'Turin , Italia', 'Turin Palace Hotel là một trong những khách sạn hàng đầu thế giới do Tạp chí du lịch nổi tiếng và uy tín của Mỹ TripAdvisor bình chọn. Turin Palace Hotel nằm tại Turin thuộc đất nước Italia xinh đẹp. Giống như hình ảnh phản chiếu của đất nước Italy, Turin Palace Hotel là một khách sạn thực sự xinh đẹp, với những nhân viên tốt bụng, hài hước và chân thật nhất. Chắc chắn, Turin Palace Hotel sẽ khiến cho kì nghỉ của bạn trở nên có ý nghĩa hơn rất nhiều.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (4,'Barcelona, Tây Ban Nha','Tuyệt vời là từ để miêu tả về Hotel The Serras tại Barcelona, Tây Ban Nha. Kiến trúc, sự bài trí, dịch vụ khách sạn, phong cách làm việc của đội ngũ nhân viên, sự sạch sẽ và thoải mái của khách sạn The Serras này đã đạt đến sự hoàn hảo. Chính vì vậy, sẽ không có gì phải ngạc nhiên nếu The Serras nằm trong top đầu những khách sạn hàng đầu thế giới, được du khách đặc biệt yêu thích và khen ngợi.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (5,' Prague, Cộng hòa Séc','BoHo Prague Hotel nổi tiếng vì sự sang trọng và đẳng cấp của mình. Khách sạn BoHo Prague Hotel này thuộc Prague, Cộng hòa Séc. Dù mang trong mình sự sang trọng và đẳng cấp nhưng không vì thế mà BoHo Prague Hotel trở nên lạnh lẽo và xa cách. Trái lại, sự thoải mái, tiện nghi và thân thiện tại đây được du khách quốc tế đánh giá rất cao. Bên cạnh đó, vị trí thuận lợi cho di chuyển đến nhiều điểm du lịch khác nhau của Cộng hòa Séc cũng là một điểm cộng cho BoHo Prague Hotel.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (6,'Florence , Ý','Nhắc đến những khách sạn hàng đầu thế giới được du khách quốc tế đánh giá cao sẽ thực sự thiếu sót nếu bỏ qua khách sạn Portrait Firenze. Nằm tại Florence của đất nước Ý, Portrait Firenze giống như một thiên đường ánh sáng bên dòng sông Arno. Ngoài chất lượng dịch vụ tuyệt vời, không gian kiến trúc sang trọng, thoải mái, sẽ thật tuyệt vời nếu được chiêm ngưỡng cảnh hoàng hôn, mặt trời xuống núi từ cửa sổ phòng ngủ của Portrait Firenze. ','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (7,'Siem Reap, Campuchia', 'Shinta Mani Resort là một trong những khách sạn hàng đầu thế giới do Tạp chí du lịch nổi tiếng và uy tín của Mỹ TripAdvisor bình chọn. Shinta Mani Resort nằm tại Siem Reap, Campuchia. Chúng ta có thể miêu tả Shinta Mani Resort bằng từ đẹp và thanh bình. Ngoài mang đến cho du khách những dịch vụ khách sạn đầy đủ và tuyệt vời nhất, một điều để Shinta Mani Resort được đánh giá cao đó là đội ngũ nhân viên khách sạn. Các nhân viên tại đây luôn vui vẻ, nhiệt tình, sẵn sàng giúp đỡ dưới mọi hình thức, thậm chí là luôn sáng tạo trong cách thức giúp đỡ khách tới khách sạn. ','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (8,'Manuel Antonio, Costa Rica.' ,'Khách sạn Tulemar Bungalows & Villas nằm tại công viên quốc gia Manuel Antonio của Costa Rica. Hầu như tất cả mọi du khách khi đến Tulemar Bungalows & Villas đều đồng ý rằng kỳ nghỉ dưỡng tại đây là kỳ nghỉ tuyệt vời nhất mà họ từng có. Thật vậy, không gian kiến trúc tuyệt đẹp, chất lượng dịch vụ đều rất tuyệt vời. Tất cả những gì để nói về Tulemar Bungalows & Villas chỉ cần gói gọn trong một chữ "tuyệt" là đủ để hiểu tại sao đây lại nằm trong danh sách những khách sạn hàng đầu thế giới.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (9,'JA Manafaru', 'Trên cả tuyệt vời. Tôi thực sự cảm nhận được sự nồng hậu và hiếu khách tại đây trong suốt thời gian lưu trú". Đó chính là một lời nhận xét của một du khách quốc tế khi kết thúc kỳ nghỉ dưỡng của mình tại khách sạn JA Manafaru. Tại thiên đường Maldives, du khách quốc tế có thể dễ dàng chọn cho mình một khách sạn 5 sao quốc tế nhưng để chọn được một khách sạn ưng ý nhất về chất lượng dịch vụ thì quả thực không dễ dàng. JA Manafaru là một trong số những khách sạn hàng đầu với chất lượng dịch vụ tốt tuyệt đối. Đến với JA Manafaru, du khách sẽ có được tất cả những gì mà mình mong muốn cho một chuyến du lịch hoàn hảo nhất.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (10,'Bắc Ari','Lại là một khách sạn hàng đầu thuộc thiên đường Maldives. Trên đảo san hô vòng Bắc Ari, hãy tìm đến với khách sạn Kandolhu Maldives để được trải nghiệm những dịch vụ tốt nhất, chuyên nghiệp nhất từ sự phụ vụ nhiệt tình của nhân viên, dịch vụ khách hàng nhiệt tình 24/24, đồ ăn ngon cho đến sự êm ái của từng chiếc giường nghỉ hay bồn nước nóng. Thực sự, du khách quốc tế hầu như không thể chê bất cứ điều gì tại nơi đây. Dịch vụ thật sự hoàn hảo!','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (11,'Số 86 Hùng Vương, phường Lộc Thọ, TP Nha Trang','Khách sạn ibis Style Nha Trang tọa lạc ở vị trí đẹp, tiện lợi: vừa gần biển lại ngay tại trung tâm thành phố. Hơn 300 phòng tiêu chuẩn 3 sao của ibis Style Nha Trang sở hữu kiến trúc hiện đại, màu sắc hài hòa và phòng nghỉ sang trọng, ấn tượng.Phòng hội nghị, hồ bơi ngoài trời, phòng thể dục, phòng xông hơi, spa, nhà hàng và quầy bar cũng hội tụ đủ trong khuôn viên khách sạn. Mọi chi tiết của ibis Style Nha Trang đều được chọn lọc, bài trí tỉ mỉ tạo ra không gian ấm cúng, nhằm đáp ứng tốt nhu cầu lưu trú của quý khách hàng.Ibis Styles Nha Trang được tập đoàn Accor quản lý. Các dịch vụ khách sạn như: an ninh 24 giờ, truy cập wifi khu vực công cộng, tư vấn tour, dịch vụ giặt là, dịch vụ taxi, giữ hành lý, nhân viên hướng dẫn, thu đổi ngoại tệ, thủ tục nhận phòng/ trả phòng nhanh chóng, thuận tiện.Với đội ngũ nhân viên nhiệt tình và chuyên nghiệp, khách sạn ibis Style Nha Trang hứa hẹn mang đến cho quý khách sự thoải mái, hài lòng nhất trong thời gian lưu trú.', 'Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (12,'105A Hùng Vương , Thành phố Huế, Thừa Thiên Huế','Khách Sạn Indochine Palace được xây dựng theo tiêu chuẩn 5 sao quốc tế, tọa lạc ở vị trí đắc địa, ngay trung tâm thành phố Huế. Chỗ nghỉ này cho phép bạn dễ dàng tiếp cận các điểm tham quan nổi tiếng ở Cố Đô như Cầu Tràng Tiền, Sông Hương, Chợ Đông Ba, nhà thờ Đức Bà, Cung An Định hoặc nhà văn hóa Trung Tâm…Indochine Palace nổi tiếng về chất lượng lẫn dịch vụ và đội ngũ nhân viên thân thiện. Khi đặt phòng khách sạn nghỉ ngơi tại đây, bạn sẽ được tận hưởng các dịch vụ tiện nghi cao cấp như quán cà phê, dịch vụ du lịch, Wi-Fi ở khu vực công cộng, thiết bị phòng họp và quầy nước….Đặc biệt, chất lượng khách sạn Indochine Palace được phản ánh qua từng phòng. Mỗi phòng đều trang bị đầy đủ thiết bị hiện đại: TV màn hình phẳng, Wifi tốc độ cao, điện thoại, máy sấy tóc, phòng tắm riêng, áo choàng cùng những dụng cụ thiết yếu. Bên cạnh đó, khách sạn còn cung cấp nhiều phương tiện giải trí độc đáo như câu lạc bộ dành cho trẻ em, bể bơi ngoài trời, bồn tắm nóng và phòng tắm hơi… đảm bảo quý khách sẽ luôn hài lòng trong thời gian lưu trú.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (13,'54 Liễu Giai, Phường Cống Vị, Quận Ba Đình, Hà Nội','Khách Sạn Lotte Hà Nội được xây dựng theo tiêu chuẩn 5 sao quốc tế, nằm giao ở khu phố Đào Tấn và Liễu Giai – nơi tổng hòa giữa nét truyền thống của khu phố cổ với sự hiện đại của đô thị mới. Khách sạn này giống như làn gió mới bởi chất lượng tuyệt hảo và dịch vụ chuyên nghiệp. Chính vị thế thuận lợi sẽ giúp bạn dễ dàng hơn trong việc di chuyển đến các địa điểm tham quan nổi tiếng như Trung tâm Triển Lãm Giảng Võ, Chùa Một Chột, Bảo tàng dân tộc học… Lotte Hà Nội Hotel cũng chỉ cách sân bay Quốc tế Nội Bài 27 Km và mất chừng 30 phút lái xe để tới ga Hà Nội mà thôi.Điểm nổi bật của khách sạn là tất cả các phòng nghỉ đều nằm ở trên cao của tòa nhà 65 tầng. Do đó, với những ai muốn trải nghiệm những điều thú vị thì Lotte Ha Noi Hotel chính là lựa chọn hoàn hảo mang đến cho bạn điểm nhìn ngoạn mục về toàn cảnh thành phố. Hơn nữa, mỗi phòng nghỉ đều trang bị đầy đủ tiện nghi hiện đại cùng phong cách bài trí khác nhau, tạo dấu ấn riêng trong lòng mỗi du khách.Dịch vụ khách sạn Lotte Hà Nội cũng rất hoàn hảo, 318 phòng cao cấp được thiết kế hài hòa từ màu sắc đến chi tiết… Như một sự khẳng định về đẳng cấp và chất lượng của mình, khách sạn Hà Nội 5 sao này còn sở hữu hệ thống nhà hàng, phòng tiệc và quán bar xa hoa… đáp ứng mọi nhu cầu của quý khách. Bên cạnh đó, bạn cũng sẽ tìm thấy những giây phút thư giãn trong không gian giải trí nơi đây như khu spa, phòng tập thể dục và bể bơi trong nhà…','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (14,'An Hai Village, Thôn An Hải, thị trấn Thuận An, huyện Phú Vang, Việt Nam','Khu nghỉ dưỡng Ana Mandara Huế nằm ngay làng Thuận An, Huế. Từ Huế, bạn phải mất khoảng 20 phút lái xe bằng xe ô tô hoặc xe máy theo con đường biển mới mở để đến đây. Nét đặc sắc và thu hút khách du lịch ở nơi đây đó chính là khu nghỉ dưỡng được bao quanh bởi những ruộng lúa, phá Tam Giang đã tạo nên một cảnh đẹp như mơ. Hơn thế nữa, resort này lại nằm trong khu vườn nhiệt đới  với cây trái, hoa lá.Khu nghỉ dưỡng Ana Mandara Huế có diện tích là 2.8 ha với tổng số 78 phòng nghỉ. Trong đó có 4 phòng bao gồm: biệt thự có hồ bơi riêng, biệt thự hướng biển, các phòng đôi, phòng nghỉ cao cấp... Mỗi phòng trong khu nghỉ dưỡng đều được cung cấp đầy đủ các tiện nghi hiện đại, tốt nhất, đáp ứng được yêu cầu của những vị khách khó tính.Bên cạnh đó, khi đặt phòng khách sạn tại đây, du khách cũng có thể tìm thấy tất cả tiện nghi và dịch vụ tốt nhất tại khu nghỉ dưỡng bao gồm cửa hàng mua sắm, tầng cao cấp, mát xa, quán cà phê, dịch vụ giặt ủi, tiện nghi phòng họp. Sau một ngày làm việc hoặc du lịch khám phá, du khách có thể sử dụng dịch vụ mát xa, bể tắm Jacuzzi, phòng tập thể dục, tắm hơi, bể bơi để thư giãn.Khu nghỉ dưỡng Ana Mandara Huế hứa hẹn là sự lựa chọn rất hoàn hảo mang đến du khách sự thoải mái và thuận tiện nhất.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (15,'24 Lê Đại Hành, Thành phố Đà Lạt, Việt Nam','Khách sạn Rum Vàng tọa lạc tại vị trí đắc địa nằm ngay trung tâm thành phố Đà Lạt. Khách sạn chỉ cách hồ Xuân Hương thơ mộng khoảng 05 phút đi bộ và du khách chỉ cần di chuyển đến nhà thờ Con Gà khoảng 5 phút lái xe.Khách sạn Rung Vàng được thiết kế theo phong cách hiện đại, gồm có tổng cộng là 50 phòng nghỉ đạt tiêu chuẩn 3 sao. Tất cả các phòng trong khách sạn đều được cung cấp cửa sổ lớn với hướng nhìn ra toàn thành phố, công viên hoặc hồ Xuân Hương. Tiện nghi phòng nghỉ bao gồm két sắt an toàn, bồn tắm, nước nóng lạnh, TV LCD với số lượng kênh truyền hình cáp đa dạng, dụng cụ pha trà và pha cà phê cũng được cung cấp tại khách sạn.Với sức chứa khoản hơn 150 khách, nhà hàng Rum Vàng nằm trên tầng sân thượng của khách sạn, mở cửa từ 06:00 sáng đến 10:00 đêm sẽ là sự lựa chọn lý tưởng để khách có thể thưởng thức các món Âu Á theo yêu cầu. Còn Rum Vàng Bar & Café phục vụ khách từ 06:00 sáng đến 10:00 đêm hằng ngày sẽ phục vụ khách các loại rượu và đồ uống phong phú. Khu vực quầy bar được bố trí tại khu vực có tầm nhìn đẹp ra hồ Xuân Hương, trung tâm thành phố, đồi thông sẽ là sự lựa chọn đầy lý tưởng để bạn tìm lại khoảng lặng cho riêng mình.Nếu du khách đặt phòng khách sạn với mục đích công việc hoặc muốn tổ chức các cuộc hội họp, hội nghị lớn thì du khách cũng có thể lựa chọn phòng họp Mimosa với khả năng phục vụ 120 khách được trang bị đầy đủ dụng cụ tiện nghi cần thiết hội họp như máy chiếu, màn hình chiếu cùng với dịch vụ hỗ trợ hội họp luôn sẵn sàng làm hài lòng khách du lịch.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (16,'Số 32 - Anh Đào – Bãi Cháy – Hạ Long – Quảng Ninh, Việt Nam','Pelican Cruise Hạ Long nằm ở vị trí đắc địa thuộc Hạ Long, đây là nơi nghỉ chân tuyệt vời để du khách có thể tiếp tục khám thành phố trẻ sôi động ở mọi góc cạnh khác nhau.Pelican Cruise Hạ Long được thiết kế theo phong cách cổ điển, nhằm mục đích gợi nên cảm giác thân thuộc, ấm áp nhưng không hề kém phần thanh lịch, tinh tế trong cách thiết kế. Khách sạn gồm có tổng số là 22 phòng với 4 lầu mang đến du khách khi nghỉ chân tại đây có cảm giác ấm cúng và dễ chịu như đang được ở nhà. Mỗi phòng trong khách sạn được trang bị đầy đủ các thiết bị, tiện nghi hiện đại bao gồm máy sấy tóc, két sắt, vòi sen, tủ đồ ăn nhẹ, ban công, TV màn hình phẳng...Cho dù bạn là người thích vui vẻ hay chỉ thích muốn thư giãn sau một ngày làm việc bận rộn, mệt mỏi, bạn sẽ cảm thấy vô cùng thoải mái khi sử dụng các tiện nghi của khách sạn. Đó là một loạt tiện nghi giải trí như giải trí spa, thể thao dưới nước, mát xa. Không dừng lại khi đặt phòng khách sạn giá rẻ và nghỉ chân tại đây, khách sạn còn gợi ý đến bạn những hoạt động vui chơi giải trí đảm bảo bạn luôn cảm thấy vô cùng hứng thú trong suốt kì nghỉ dưỡng của mình.', 'Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (17,'H1-04, H1-05, H1-06 Phạm Văn Đồng, Quận Sơn Trà, Đà Nẵng','Hadana Boutique Hotel Danang nằm ở trục đường chính Phạm Văn Đồng thuận tiện cho việc đi lại của du khách. Vị trí lý tưởng giúp những ai đặt phòng khách sạn dễ dàng thăm quan các điểm du lịch nổi tiếng ở Đà Nẵng như cầu Sông Hàn, bãi biển Mỹ Khê, bán đảo Sơn Trà, núi Ngũ Hành Sơn,…Hadana Boutique Hotel Danang được thiết kế đơn giản nhưng hiện đại, chỗ nghỉ này trở thành sự lựa chọn tuyệt vời cho việc lưu trú lâu dài của các chuyên gia nước ngoài cũng như đây là nơi dừng chân lý tưởng dành cho những du khách muốn đến để khám phá thành phố Đà Nẵng xinh đẹp,...Khách sạn có tất cả 54 phòng khép kín được xây dựng theo tiêu chuẩn 4 sao quốc tế với đầy đủ tiện nghi bao gồm internet - wifi miễn phí, máy lạnh, truyền hình cáp chất lượng HD với tivi LCD 42 inch, trang thiết bị vệ sinh cao cấp, két sắt mini, tủ lạnh trong phòng.Nhà hàng sân thượng & Sky bar Sơn Trà là mô hình nhà hàng kiêm quầy bar độc đáo của khách sạn. Được thiết kế ở tầng 11, với khu vực trong nhà lẫn ngoài trời, hướng nhìn ra sông Hàn và bãi biển thơ mộng. Nhà hàng phục vụ buffet sáng với các món ăn phong phú cũng như phục vụ du khách cả ngày với các món ăn Âu Á ngon miệng khác.Hadana Boutique Hotel Danang cung cấp các dịch vụ phục vụ mọi nhu cầu của du khách như: phòng gia đình, dịch vụ đưa đón sân bay, xe đạp có sẵn, hồ bơi, phòng trăng mật,...Với đội ngũ nhân viên chuyên nghiệp, nhiệt tình, lễ tân phục vụ 24/24 giờ sẽ đem đến sự hài lòng cho du khách, mang lại sự thoải mái như ở nhà.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (18,'140 Lý Tự Trọng, Phường Bến Thành, Quận 1, TP Hồ Chí Minh', 'Khách sạn Golden Central Sài Gòn cách sân bay quốc tế Tân Sơn Nhất 6 km, trong bán kính vài phút tản bộ là chợ Bến Thành. Ngoài ra, quý khách có thể dễ dàng đi bộ tới các điểm du lịch nổi tiếng khác của thành phố như: Dinh Thống Nhất, chợ Bến Thành, công viên văn hoá Đầm Sen, hệ thống trung tâm mua sắm Parkson và Lotte…Khách sạn Golden Central Sài Gòn là khách sạn 4 sao theo tiêu chuẩn quốc tế với 120 phòng đầy đủ tiện nghi và các dịch vụ bổ trợ hoàn hảo. Với phương châm hoạt động “Lấy khách hàng làm trọng tâm”, tất cả nhân viên khách sạn Golden Central Sài Gòn luôn tâm niệm sẽ cố gắng hết mình để đem lại cho quý khách những dịch vụ tốt nhất, những món ăn ngon nhất, những đêm nghỉ tuyệt vời nhất trong một không gian nồng ấm và sang trọng.Khách sạn được thiết kế tinh tế giữa nghệ thuật Á Đông và kiến trúc Tây Âu sang trọng, tiện nghi và hiện đại. Tất cả các phòng đều có phòng không hút thuốc, điều hòa nhiệt độ, báo hàng ngày, áo choàng tắm, máy sấy tóc…Các dịch vụ như quán bar, nhà hàng, dịch vụ phòng hội họp, trung tâm thương vụ là một phần trong chuỗi dịch vụ cao cấp của khách sạn Golden Central Sài Gòn. Ngoài ra, khách sạn giá tốt này còn mang đến cho du khách nhiều dịch vụ giải trí như hồ bơi ngoài trời, phòng tập thể dục với những dụng cụ tiên tiến. Sau phút giây căng thẳng, mệt mỏi, bạn đừng quên đến với spa của khách sạn. Với đội ngũ chuyên viên chuyên nghiệp, được đào tạo bài bản, bạn sẽ được chăm sóc tốt nhất cũng như được đắm chìm trong không gian thư giãn thực sự. Nhằm mang đến cho khách sự an tâm, thoải mái, Golden Central Sài Gòn còn mang đến một dịch vụ đặc biệt là bác sĩ theo yêu cầu.Với vị trí thuận lợi, du khách có thể tự thiết kế riêng cho mình một lịch trình tham quan, nghỉ dưỡng hoặc đặt tour du lịch khám phá các địa danh nổi tiếng tại quầy khách sạn để có được chuyến đi đáng nhớ nhất','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (19,'96A Nguyễn Đình Chiểu, TP. Phan Thiết, Việt Nam','Khu nghỉ dưỡng Novela Mũi Né trải mình trên bãi biển Mũi Né (Bình Thuận) xinh đẹp, nơi luôn được khách du lịch tôn vinh là “thiên đường nghỉ dưỡng” hứa hẹn sẽ mang đến bạn và gia đình bạn một kỳ nghỉ thật sôi động và đáng nhớ. Quý khách có thể di chuyển đến với Novela Resort & Spa Mũi Né từ TP Hồ Chí Minh bằng tàu hỏa, sau đó đi taxi hoặc sẽ được khu nghỉ dưỡng đưa đón. Nếu Quý khách đi bằng xe bus từ trung tâm TP HCM quý khách có thể đến tận nơi. Khu nghỉ dưỡng Novela cách ga Phan Thiết 15 km.Khu nghỉ dưỡng được xây dựng vào năm 2008 và đạt tiêu chuẩn chất lượng 04 sao đẳng cấp. Bao quanh khu nghỉ dưỡng là một khu vườn dừa và cọ mang đến tầm nhìn tuyệt đẹp ra cảnh quan khu rừng. Nội thất chủ yếu của khu nghỉ dưỡng là được trang trí bằng gạch và gỗ tôn thêm vẻ xa hoa, quyến rũ.Novela Resort & Spa Mũi Né sở hữu hệ thống 96 phòng nghỉ hạng sang với rất nhiều trang thiết bị và tiện nghi hiện đại theo tiêu chuẩn 4 sao như: máy lạnh, truyền hình cáp vệ tinh, minibar, két sắt, điện thoại IDD, máy sấy tóc, dụng cụ pha trà/pha cà phê. Phòng tắm riêng tại khu nghỉ dưỡng bao gồm dép tắm, áo choàng tắm và bồn tắm.Nhà hàng được xây dựng nằm ở trung tâm khu nghỉ dưỡng, chuyên phục vụ các món Âu – Á và Việt Nam. Được thiết kế 02 tầng nhà hàng không chỉ là nơi để thưởng thức các món ăn hấp dẫn mà còn là vị trí để chiêm ngưỡng vẻ đẹp của bãi biển với những con sóng trập trùng và những bờ cát trắng trải dài tinh khôi.Đặc biệt với tầm nhìn ra hồ bơi và bãi biển, Bar and Coffee của Novela Resort & Spa Mũi Né được trang trí theo phong cách Việt Nam truyền thống, phục vụ đồ ăn nhẹ cùng nhiều thức uống hấp dẫn. Tại đây, bạn cũng có thể tranh thủ cập nhật thông tin, lướt web với đường truyền internet tốc độ cao.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (20,'40 Cát Linh, Quận Đống Đa, Hà Nội, Việt Nam','Khách sạn Pullman Hà Nội tọa lạc gần với trung tâm thương mại và kinh doanh, nhà chính phủ và các văn phòng ngoại giao. Khách sạn cách sân bay Quốc tế Nội Bài khoảng 45 phút lái xe. Từ khách sạn, du khách cũng có thể di chuyển đến trung tâm triển lãm Giảng Võ, hồ Tây cũng như các địa điểm tham quan lịch sử và văn hóa lớn.Khách sạn Pullman Hà Nội là một thành viên trong hệ thống Swiss-Belhotel quốc tế. Khách sạn được thiết kế đảm bảo mang tới sự thuận tiện và thoải mái cho du khách khi nghỉ tại Hà Nội.Gồm có tổng cộng là 242 phòng nghỉ sang trọng với nội thất trang nhã và tiện nghi hiện đại, du khách có thể nghỉ dưỡng tuyệt đối một trong các phòng phù hợp. Tất cả các phòng nghỉ tại đây được trang bị máy lạnh, truyền hình cáp, két an toàn cá nhân và máy pha trà/cà phê. Các phòng tắm riêng đi kèm với tiện nghi vòi sen nước nóng.Về ẩm thực, khi đặt phòng tại khách sạn Pullman Hà Nội bạn sẽ được thưởng thức nét ẩm thực độc đáo tại hai nhà hàng chuyên phục vụ các món ăn Á và quốc tế. Đồ uống được cung cấp tại quầy Mint Bar ở sảnh đợi.Bên cạnh đó khách sạn còn cung cấp cho khách hàng các dịch vụ tiện lợi khác bao gồm một bể bơi, trung tâm thể hình và sân tennis. Và dịch vụ Internet Wifi sẽ rất tiện lợi cho khách doanh nhân.Không những thể, để khiến bạn luôn cảm thấy hứng thú trong suốt kỳ nghỉ của mình, khách sạn còn gợi ý đến bạn những hoạt động vui chơi thú vị.','Khách Sạn');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (21,'Trụ sở chính: Airline House 25 Airline Road, Singapore 819829 Singapore','Hãng hàng không quốc gia Singapore, Singapore Airlines (SQ) là một trong những hãng hàng không lớn nhất thế giới. Từ trung tâm trung chuyển của hãng tại Sân bay Changi Singapore (SIN), Singapore Airlines bay đến hơn 60 điểm tại 35 quốc gia trên sáu lục địa. Là thành viên của Star Alliance, hãng cũng có các thỏa thuận liên danh với khoảng 10 hãng hàng không khác. Singapore có đội tàu toàn máy bay thân rộng với bốn hạng dịch vụ: Singapore Airlines Suites, Hạng Nhất, Hạng Thương gia và Hạng Phổ thông. Hãng hàng không khai thác ba phòng chờ cho hành khách cao cấp. Phòng chờ SilverKris có địa điểm tại 15 sân bay. Ngoài ra, sân bay Changi còn là mái nhà của Private Room và KrisFlyer Gold Lounge.','Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (22,'Trụ sở chính:185 Fanshawe Street , Miền Trung Auckland, Vùng Auckland 01010 New Zealand','Là hãng hàng không quốc gia của New Zealand, Air New Zealand (NZ) có cơ sở tại Auckland cung cấp các chuyến bay thẳng cho khoảng 50 điểm đến. Các điểm đến này bao gồm 25 điểm đến trong nước và khoảng 25 điểm đến quốc tế tại 15 quốc gia ở châu Đại Dương, châu Á, châu Âu và Bắc Mỹ. Hãng cũng có ba công ty – Air Nelson, Eagle Airways và Mount Cook Airline – phục vụ các điểm đến nhỏ hơn trong New Zealand. Air New Zealand có ba trung tâm tại Sân bay Auckland (Auk), Sân bay Quốc tế Wellington (WLG) và Sân bay Quốc tế Christchurch (CHC); Sân bay Quốc tế Los Angeles (LAX) và Sân bay Sydney (SYD) đóng vai trò là các điểm đến quan trọng. Hãng hàng không này là một phần của Star Alliance.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (23,'Trụ sở chính:PO Box 686 , Dubai Các Tiểu vương quốc Ả Rập Thống nhất','Emirates (EK) có trụ sở tại Các Tiểu vương quốc Ả Rập Thống nhất là hãng hàng không lớn nhất Trung Đông và là một trong hai hãng hàng không quốc gia của đất nước. Hãng khai thác các chuyến bay thẳng đến hơn 140 điểm tại 78 quốc gia từ trung tâm trung chuyển của hãng tại Sân bay Quốc tế Dubai (DXB). Hãng là một trong số ít các hãng hàng không có đường bay đến sáu châu lục. Đội tàu bay của hãng chủ yếu có bố trí khoang hành khách gồm 3 hạng (Hạng Nhất, Hạng Thương gia và Hạng Phổ thông) cũng như một số máy bay hai hạng (Hạng Thương gia và Hạng Phổ thông). Trong khoang hành kháchhạng nhất của hãng, có nhiều loại chỗ ngồi, bao gồm dãy phòng, giường phẳng và ghế sofa. Emirates khai thác 33 Phòng chờ Emirates cho hành khách Hạng Nhất, Hạng Thương gia và các thành viên Vàng Skyward.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (24,'Trụ sở chính:2-4-11 Higashi-Shinagawa, 2-chome Shinagawa-ku, 140-8637 Quận Tokyo','Hãng hàng không lớn nhất của quốc gia, Japan Airlines (JL) có trụ sở tại Tokyo. Hãng có các chuyến bay thẳng đến khoảng 60 điểm đến trong nước và hơn 30 điểm đến quốc tế tại châu Á, châu Âu, châu Đại Dương, Bắc Mỹ và Nam Mỹ. JL là thành viên liên minh một thế giới và cũng có thỏa thuận liên danh với khoảng 30 hãng hàng không. Hãng có các loại dịch vụ: Hạng Nhất, Executive Class (tương đương với Hạng Thương gia), Hạng Phổ thông Cao cấp, Hạng J (chỗ ngồi Hạng Phổ thông với ghế lớn hơn) và Hạng Phổ thông. Hạm đội máy bay của hãng có nhiều loại hai khoang, ba khoang và bốn khoang. Trung tâm chính của Japan Airlines nằm tại Sân bay Haneda ở Tokyo (HND) và Sân bay Quốc tế Narita (NRT).', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (25,'Trụ sở chính:376 Hsin-Nan Rd. Sec. 1, Taoyuan 33801 Đài Loan','EVA Air (BR) có trụ sở tại Sân bay quốc tế Đào Viên (TPE) gần Đài Bắc. Đó là hãng hàng không lớn thứ hai của Đài Loan sau China Airlines. EVA bay đến 70 điểm trong phạm vi Đài Loan, ở những nơi khác ở châu Á, và ở Úc, châu Âu và Bắc Mỹ. Hãng là một thành viên của Star Alliance. Đội tàu bay của hãng bao gồm máy bay được bố trí cả ba khoang hành khách lẫn hai khoang hành khách. Hạng Thương gia được gọi là Hạng Royal Laurel hay Hạng Premium Laurel, tùy thuộc vào loại máy bay. Hạng Elite là khoang hành khách Phổ thông Đặc biệt. Và Hạng Phổ thông được cung cấp trên tất cả các chuyến bay. EVA Air cũng sở hữu một công ty con Uni Air (B7) khai thác các chuyến bay quốc nội và khu vực.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (26,'Trụ sở chính: PO Box 36647-1CR , Dallas, TX 75235 ','Southwest Airlines có trụ sở ở Dallas (WN) là hãng hàng không giá rẻ lớn nhất thế giới. Southwest khai thác các chuyến bay thẳng đến hơn 90 điểm tại 41 tiểu bang, Bahamas, vùng Caribbe và Mexico. Không giống như nhiều hãng hàng không lớn, Southwest không sử dụng trạm trung chuyển, mà là một hệ thống từ điểm đến điểm. Khoảng 15 sân bay với số lượng chuyến bay WN đáng kể được chỉ định làm các thành phố trọng điểm. Đội tàu bay của hãng được bố trí với chỉ một khoang hành khách Hạng Phổ thông duy nhất. Trái ngược với nhiều hãng hàng không giá rẻ, Southwest không thu phí đối với hai hành lý ký gửi trở xuống; đồ uống không cồn và bánh quy hoặc đậu phộng cũng miễn phí trên máy bay. Có sẵn vé lên máy bay sớm, tự động làm thủ tục trực tuyến và đồ uống có cồn để mua.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (27,'Trụ sở chính:Dart Group PLC Leeds Bradford International Airport, Leeds LS19 7TU England','Hãng hàng không giá rẻ của Anh tên Jet2.com (LS) có trụ sở tại Sân bay Quốc tế Leeds Bradford (LBA). Ngoài Leeds, hãng có bảy cơ sở điều hành khác tại Sân bay Alicante–Elche (ACL), Sân bay Quốc tế Belfast (BFS), Sân bay East Midlands (EMA), Sân bay Edinburgh (EDI), Sân bay Glasgow (GLA), Sân bay Manchester (MAN) và Sân bay Newcastle (NCL). Hãng đã lên kế hoạch chở khách và các chuyến bay thuê bao đến khoảng 60 điểm trên khắp châu Âu. Là một hãng hàng không giá rẻ, hành khách sẽ phải trả thêm phí dịch vụ như hành lý ký gửi, ghế ngồi có thêm chỗ để chân, và các bữa ăn trên chuyến bay cùng các loại thức uống có cồn.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (28,'Trụ sở chính: Qatar Airways Tower Airport Road , Doha Qatar','Qatar Airways (QR) là hãng hàng không quốc gia của Qatar và là một thành viên của liên minh Oneworld (Một thế giới). Từ trạm trung chuyển chính tại Sân bay Quốc tế Hamad (DOH), hãng cung cấp các chuyến bay tới khoảng 145 địa điểm trên khắp sáu lục địa có người ở. Đội bay của Qatar Airways gồm các tàu bay thuộc loại hai khoang hành khách (Hạng Thương gia và Hạng Phổ thông) và ba khoang (Hạng Nhất, Hạng Thương gia và Hạng Phổ thông). Ghế ngồi trong cả khoang Thương gia và khoang Hạng Nhất đều có thể chuyển thành giường. Với những hành khách hạng ghế đặc biệt bay từ Sân bay Quốc tế Hamad, Qatar Airways cung cấp dịch vụ Phòng chờ Thương gia Al Mourjan. Một phòng chờ thứ hai của hãng được đặt tại Sân bay London Heathrow (LHR).', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (29,'Trụ sở chính: Av. Marcos Penteado de Ulhôa Rodrigues 939 Barueri, Sao Paulo, Bang Sao Paulo 06460-040 Brazil','Azul (AD) là một hãng hàng không giá rẻ của Brazil có đường bay đến khoảng 100 điểm đến trong nước. Mặc dù hãng hàng không phục vụ các thị trường lớn như Belo Horizonte, Rio de Janeiro, Salvador da Bahia và Selo Paulo, phần lớn các điểm đến của hãng là các thị trường xa xôi và nhỏ hơn. Hãng cũng có một chuyến bay đến Fort Lauderdale, và các thỏa thuận liên danh với Star Alliance và United Airlines (UA). Trung tâm của hãng được đặt tại Sân bay Quốc tế Viracopos (VCP), Sân bay Quốc tế Tancredo Neves (CNF) và Sân bay Santos Dumont (SDU). Đội bay của hãng có khoảng 150 máy bay, bao gồm máy bay Airbus, ATR và Embraer. Hầu hết các máy bay có một khoang Hạng Phổ thông duy nhất, mặc dù một số máy bay cũng có một khoang Hạng Thương gia.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (30,'Trụ sở chính: Korean Air Operations Center 1370 Gonghang-Dong, Seoul 157712 Hàn Quốc','Với tư cách là hãng hàng không quốc gia của Hàn Quốc, Korean Air (KE) là hãng hàng không lớn nhất đất nước. Có trụ sở tại Seoul, hãng hàng không bay thẳng đến 20 điểm đến trong nước và khoảng 100 điểm đến quốc tế trên khắp châu Á, Úc, Châu Phi, Châu Âu, Bắc Mỹ và Nam Mỹ. Hãng hàng không, là một phần của liên minh SkyTeam, cũng có các thỏa thuận liên danh với khoảng 40 hãng hàng không. Đội bay của hãng gồm các máy bay với thiết kế hai khoang (Prestige Class, phiên bản của Hạng Thương gia, và Hạng Phổ thông) và ba khoang (Hạng Nhất, Hạng Thương gia và Hạng Phổ thông). Korean Air có các trung tâm điều hành tại Sân bay Quốc tế Seoul Gimpo (GMP) và Sân bay Quốc tế Seoul Incheon (ICN).','Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (31,'Vietnam Airlines-Hãng hàng không nội địa hàng đầu Việt Nam','Đây là hãng hàng không của quốc gia Việt Nam và cũng nằm trong trong danh sách hãng hàng không lớn nhất tại Việt Nam, hoạt động dựa theo mô hình truyền thống nên khi bạn đi máy bay bạn sẽ được gửi đồ 20kg miễn phí, được phục vụ ăn uống trong máy bay. Bên cạnh đó máy bay của hãng to, rộng hơn.Hãng Vietnam Airline bay đến cả 3 miền Bắc, Trung, Nam của Việt Nam. Nhiều đường bay hiện nay chỉ có hãng quốc gia này hoạt động và khách hàng không có lựa chọn nào khác', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (32,'Jetstar Pacific-Hãng hàng không Việt Nam nội địa lớn thứ 2 Việt Nam','Hãng hàng không Việt Nam nội địa lớn thứ 2 là Jetstar Pacific, hoạt động theo mô hình hàng không giá rẻ. Bạn có thể miễn phí hành lý xách tay 7kg, không được 20kg như như hãng hàng không nội địa.Ưu điểm của hãng hàng không nội địa Jetstar Pacific này chính  là vé máy bay rẻ hơn Vietnam Airlines. Vào thứ 6 hằng tuần thì hãng hàng không này lại tung ra chương trình khuyến mãi rất hấp dẫn.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (33,'Hàng Không nội địa-Vietjet Air','Nằm trong các hãng hàng không Việt Nam tiếp theo đó là Vietjet Air, đơn vị này mới xuất hiện trong thị trường Việt Nam hiện nay, với giá rẻ rất cạnh tranh với hãng Jetstar, ngoài ra giá vé còn có thể giảm xuống từ 19.000 đồng đến 99.000 đồng.Đường bay chủ lực của hãng hàng không này cũng là Hà Nội – TP HCM, ngoài ra trong những thời gian gần đây hãng đã mở đường bay TP HCM đi Nha Trang, Hải Phòng cùng các tỉnh thành khác.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (34,'Hàng Không nội địa-Air Mekong','Hãng hàng không nội địa Air Mekong được ra đời vào năm 2012 không có khuyến mãi sốc như hai hãng hàng không phía trên bên cạnh đó, các máy bay đều rất nhỏ và chỉ sử dụng trong các chuyến bay đặc thù như Hà Nội đi đến Phú Quốc, Côn Đảo.Vì có thiết kế nhỏ nên hãng hàng không này có vinh dự phục vụ mộtvợ chồng siêu tài tử Brad Pitt – Angela khi họ đã thuê riêng một chuyến bay của hãng hàng không này ra Côn Đảo.', 'Phương Tiện');
insert into ctdv( id_dv,tieu_de_dv,noi_dung_dv,loai) values (35,'Hàng không nội địa- Vasco','Hãng hàng không Việt Nam trong nội địa thứ 5 đó là Vasco, chính xác đây là một hãng hàng không xuất phát từ Công ty của hãng VietnamAirlines có thể gọi là công ty con của hãng hàng không quốc gia.Máy bay của Vasco có thiết kế nhỏ vì công ty này chỉ bay và phục vụ cho các tuyến bay hàng không ở Việt Nam trong nội địa ngắn và được xuất phát từ TP Hồ Chí Minh.', 'Phương Tiện');

insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'QUÀ DU LỊCH 3 MIỀN ĐẤT NƯỚC VIỆT NAM','Sau mỗi chuyến du lịch, những đặc sản là món quà nhỏ bé mang đậm hương vị vùng miền mà bạn muốn gửi tặng đến những người thân yêu. Vì thế, quà cho người nhà sau mỗi chuyến đi là điều khiến nhiều người lưu tâm.','1.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'CẨM NANG DU LỊCH ẤN ĐỘ, MUMBAI, DELHI TỪ A ĐẾN Z','Sông Hằng huyền thoại, những đỉnh núi tuyết vĩnh cửu, thành phố sôi động và những bãi biển hoang sơ khiến Ấn Độ luôn nằm trong những điểm đến hấp dẫn nhất hành tinh.','2.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'NHỮNG ĐỊA ĐIỂM SỐNG ẢO CỰC CHẤT TẠI HÀ NỘI','Nếu bạn có dự định đến du lịch Hà Nội và là tín đồ của hoạt động "sống ảo", "checkin" thì hãy ghi nhớ ngay những địa điểm sau đây. Bởi dưới đây là những địa chỉ "sống ảo" cực chất mà không phải ai cũng biết','3.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'NHỮNG HÀNH ĐỘNG CẦN CHÚ Ý KHI DU LỊCH MALAYSIA','Malaysia là một quốc gia sở hữu nhiều danh thắng đẹp, nền văn hóa đa dạng, đa ngôn ngữ và đa sắc tộc. Chính vì vậy mà quốc gia này đang trở thành một điểm đến được yêu thích. Tuy nhiên, vì tính chất đa ngôn ngữ và sắc tộc, nên Malaysia có rất nhiều quy tắc ứng xử riêng biệt, những điều cậm kỵ và sẵn sàng phạt rất nặng nếu du khách vi phạm.', '4.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'LITHUANIA, VIÊN NGỌC ẨN MÌNH NƠI BỜ BIỂN BALTIC','Nằm bên bờ biển Baltic, đất nước Lithuania bình yên với những lâu đài cổ xinh đẹp như trong một câu chuyện thần thoại. Bên cạnh đó là vẻ đẹp giao thoa giữa nét cổ kính của những công trình rêu phong và nét hiện đại của các tòa tháp chọc trời, cùng lối sống hiền hòa, dung dị mà không phải đất nước châu Âu nào cũng có được.', '5.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'NGÔI LÀNG NHƯ HỌA BÙA ĐỦ MÀU SẮC Ở ĐÀI LOAN','Tại Đài Loan có một ngôi làng rất đặc biệt, được mệnh danh là Làng Cầu Vồng. Tại đây mọi bức tường nhà đều phủ đầy màu sắc, từng cánh cửa cũng như có hồn riêng và con đường làng sống động mở ra trước mắt du khách.', '6.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'NHẬT BẢN TƯNG BỪNG NGÀY HỘI CUỐI NĂM','Nhật Bản – Đất nước mặt trời mọc không chỉ nổi tiếng với hoa Anh Đào, núi Phú Sĩ mà còn là cái nôi của một nền văn hóa đặc sắc, đa dạng với những con người thân thiện, hiếu khách và nền khoa học tiên tiến. Cuối năm còn là thời gian diễn ra nhiều lễ hội đặc sắc thu hút đông đảo du khách về tham dự.', '7.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'5 MÔN NGHỆ THUẬT THỂ HIỆN SỰ TINH TẾ CỦA NGƯỜI NHẬT BẢN','Nhật Bản là đất nước luôn hướng tới sự hoàn hảo, bên cạnh sự phát triển nhanh chóng của công nghệ thì các giá trị văn hóa nghệ thuật Nhật Bản không mất đi mà còn có sự thay đổi làm sao để tương thích với thời đại.', '8.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'CẨM NANG DU LỊCH BRAZIL, RIO DE JANEIRO TỪ A ĐẾN Z','Rio de Janeiro là thủ phủ của Brazil nói chung và bang Rio de Janeiro nói riêng, thường được khách du lịch gọi tắt bằng cái tên là Rio. Thành phố này nổi tiếng trong lòng du khách bởi có cảnh sắc thiên nhiên lý thú cùng với những bãi biển cát trắng trải dài, hay những rừng mưa nằm trong lòng đô thị.', '9.jpg');
insert into cam_nang( id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'7 ĐẶC SẢN XỨ HOA VÀNG TRÊN CỎ XANH ĂN LÀ GHIỀN','Sau thành công của bộ phim "Tôi thấy hoa vàng trên cỏ xanh" chuyển thể từ tác phẩm cùng tên của nhà văn Nguyễn Nhật Ánh, vùng đất Phú Yên đầy nắng gió nằm trải dài trên dải đất miền Trung thân thương đã trở nên vô cùng nổi tiếng. Ngoài những cảnh đẹp, hiếm có mảnh đất nào mà ở khắp mọi nơi từ ngoài đường đến trong hẻm, từ trung tâm đến huyện lỵ lại có nhiều đồ ăn ngon như Phú Yên.', '10.jpg');

INSERT INTO dgsdd (id_dd, id_tk, so_sao_dd) VALUES
(1, 2, 1),
(1, 3, 5),
(1, 4, 4),
(1, 5, 1),
(1, 6, 2),
(1, 7, 3),
(2, 2, 1),
(2, 3, 2),
(2, 4, 4),
(2, 5, 5),
(2, 6, 4),
(2, 7, 1),
(3, 2, 2),
(3, 3, 3),
(3, 4, 1),
(3, 5, 3),
(3, 6, 4),
(3, 7, 1),
(4, 2, 1),
(4, 3, 4),
(4, 4, 4),
(4, 5, 1),
(4, 6, 5),
(4, 7, 1),
(5, 8, 2),
(5, 9, 1),
(5, 10, 3),
(5, 11, 1),
(6, 8, 1),
(6, 9, 5),
(6, 10, 2),
(6, 11, 1),
(7, 8, 1),
(7, 9, 5),
(7, 10, 2),
(7, 11, 1),
(8, 2, 1),
(8, 3, 4),
(8, 4, 4),
(8, 5, 3),
(8, 6, 4),
(8, 7, 1),
(9, 7, 1),
(9, 8, 2),
(9, 9, 1),
(10, 10, 3),
(11, 3, 1),
(11, 11, 1),
(12, 4, 1),
(12, 5, 5),
(12, 6, 2),
(13, 7, 1),
(13, 8, 2),
(14, 9, 1),
(15, 2, 5),
(15, 3, 5),
(15, 4, 1),
(15, 5, 2),
(16, 6, 5),
(16, 8, 3),
(17, 2, 5),
(17, 4, 4),
(17, 7, 1),
(18, 2, 3),
(18, 4, 3),
(18, 9, 3),
(18, 10, 4),
(18, 11, 2),
(19, 2, 2),
(19, 3, 1),
(19, 4, 3),
(19, 5, 5),
(19, 7, 4),
(19, 8, 4),
(19, 9, 4),
(19, 10, 4),
(19, 11, 4),
(20, 2, 2),
(20, 3, 5),
(20, 4, 3),
(20, 7, 4),
(20, 8, 4),
(20, 9, 4),
(21, 2, 3),
(21, 3, 4),
(21, 4, 5),
(21, 6, 3),
(21, 7, 3),
(22, 2, 1),
(22, 8, 2),
(22, 9, 3),
(22, 10, 5),
(23, 3, 2),
(23, 4, 5),
(23, 6, 3),
(23, 7, 3),
(24, 2, 1),
(24, 8, 4),
(24, 9, 3),
(25, 3, 4),
(25, 6, 3),
(25, 10, 5),
(26, 2, 1),
(26, 4, 5),
(26, 7, 3),
(27, 8, 2),
(27, 9, 3),
(27, 10, 5),
(28, 3, 4),
(28, 4, 5),
(28, 6, 5),
(29, 2, 1),
(29, 7, 3),
(29, 8, 2),
(29, 9, 5),
(29, 10, 5),
(30, 2, 3),
(30, 3, 4),
(30, 4, 5),
(31, 2, 1),
(31, 7, 3),
(31, 8, 2),
(32, 2, 1),
(32, 6, 3),
(32, 9, 3),
(32, 10, 5),
(33, 3, 4),
(33, 4, 5),
(33, 7, 3),
(33, 10, 5),
(33, 11, 3),
(34, 2, 1),
(34, 4, 5),
(34, 8, 2),
(34, 9, 3),
(35, 3, 4),
(35, 5, 5),
(35, 6, 3),
(35, 8, 2),
(35, 9, 3),
(41, 3, 4),
(41, 4, 5),
(41, 6, 3),
(41, 7, 3),
(41, 11, 3),
(43, 3, 4),
(43, 4, 5),
(43, 6, 3),
(43, 7, 3),
(44, 4, 1),
(44, 8, 4),
(44, 9, 3),
(44, 10, 5),
(44, 11, 1),
(45, 3, 4),
(45, 6, 3),
(45, 10, 5),
(46, 4, 1),
(46, 7, 3),
(46, 11, 5),
(47, 8, 4),
(47, 9, 3),
(47, 10, 5),
(48, 3, 4),
(48, 4, 5),
(48, 6, 5),
(49, 4, 1),
(49, 7, 3),
(49, 8, 4),
(49, 10, 5),
(49, 11, 5),
(51, 3, 5),
(51, 5, 5),
(51, 6, 3),
(51, 7, 3),
(51, 8, 3),
(53, 3, 5),
(53, 5, 5),
(53, 6, 3),
(53, 7, 3),
(55, 5, 1),
(55, 6, 3),
(55, 8, 5),
(55, 9, 3),
(55, 10, 5),
(56, 5, 5),
(56, 7, 3),
(57, 8, 5),
(57, 9, 3),
(57, 10, 5),
(58, 3, 5),
(58, 5, 5),
(58, 6, 5),
(59, 5, 1),
(59, 7, 3),
(59, 8, 5),
(59, 9, 5),
(59, 10, 5),
(60, 2, 3),
(60, 3, 4),
(60, 4, 5),
(61, 2, 1),
(61, 7, 3),
(61, 8, 2),
(62, 2, 1),
(62, 6, 3),
(62, 9, 3),
(62, 10, 5),
(63, 3, 4),
(63, 4, 5),
(63, 7, 3),
(63, 10, 5),
(63, 11, 3);

INSERT INTO dgsdv (id_dv, id_tk, so_sao_dv) VALUES
(1, 2, 1),
(1, 3, 5),
(1, 4, 4),
(1, 5, 1),
(1, 6, 2),
(1, 7, 3),
(2, 2, 1),
(2, 3, 2),
(2, 4, 4),
(2, 5, 5),
(2, 6, 4),
(2, 7, 1),
(3, 2, 2),
(3, 3, 3),
(3, 4, 1),
(3, 5, 3),
(3, 6, 4),
(3, 7, 1),
(4, 2, 1),
(4, 3, 4),
(4, 4, 4),
(4, 5, 1),
(4, 6, 5),
(4, 7, 1),
(5, 8, 2),
(5, 9, 1),
(5, 10, 3),
(5, 11, 1),
(6, 8, 1),
(6, 9, 5),
(6, 10, 2),
(6, 11, 1),
(7, 8, 1),
(7, 9, 5),
(7, 10, 2),
(7, 11, 1),
(8, 2, 1),
(8, 3, 4),
(8, 4, 4),
(8, 5, 3),
(8, 6, 4),
(8, 7, 1),
(9, 7, 1),
(9, 8, 2),
(9, 9, 1),
(10, 10, 3),
(11, 3, 1),
(11, 11, 1),
(12, 4, 1),
(12, 5, 5),
(12, 6, 2),
(13, 7, 1),
(13, 8, 2),
(14, 9, 1),
(15, 2, 5),
(15, 3, 5),
(15, 4, 1),
(15, 5, 2),
(16, 6, 5),
(16, 8, 3),
(17, 2, 5),
(17, 4, 4),
(17, 7, 1),
(18, 2, 3),
(18, 4, 3),
(18, 9, 3),
(18, 10, 4),
(18, 11, 2),
(19, 2, 2),
(19, 3, 1),
(19, 4, 3),
(19, 5, 5),
(19, 7, 4),
(19, 8, 4),
(19, 9, 4),
(19, 10, 4),
(19, 11, 4),
(20, 2, 2),
(20, 3, 5),
(20, 4, 3),
(20, 7, 4),
(20, 8, 4),
(20, 9, 4),
(21, 2, 3),
(21, 3, 4),
(21, 4, 5),
(21, 6, 3),
(21, 7, 3),
(22, 2, 1),
(22, 8, 2),
(22, 9, 3),
(22, 10, 5),
(23, 3, 2),
(23, 4, 5),
(23, 6, 3),
(23, 7, 3),
(24, 2, 1),
(24, 8, 4),
(24, 9, 3),
(25, 3, 4),
(25, 6, 3),
(25, 10, 5),
(26, 2, 1),
(26, 4, 5),
(26, 7, 3),
(27, 8, 2),
(27, 9, 3),
(27, 10, 5),
(28, 3, 4),
(28, 4, 5),
(28, 6, 5),
(29, 2, 1),
(29, 7, 3),
(29, 8, 2),
(29, 9, 5),
(29, 10, 5),
(30, 2, 3),
(30, 3, 4),
(30, 4, 5),
(31, 2, 1),
(31, 7, 3),
(31, 8, 2),
(32, 2, 1),
(32, 6, 3),
(32, 9, 3),
(32, 10, 5),
(33, 3, 4),
(33, 4, 5),
(33, 7, 3),
(33, 10, 5),
(33, 11, 3),
(34, 2, 1),
(34, 4, 5),
(34, 8, 2),
(34, 9, 3),
(35, 3, 4),
(35, 5, 5),
(35, 6, 3),
(35, 8, 2),
(35, 9, 3);

INSERT INTO dgcdv (id_dv, id_tk, binh_luan_dv, thoi_gian) VALUES
(1, 2, 'dịch vụ khá tốt, không gian hợp lý, thoáng mát.', '2018-12-03 06:09:25'),
(2, 3, 'dịch vụ ở đây tuyệt vời.', '2019-01-01 07:12:32'),
(3, 6, 'dịch vụ không nhiều, nhân viên không nhiệt tình.', '2018-12-03 11:14:29'),
(4, 7, 'nhân viên không tôn trọng khách hàng', '2018-02-22 07:17:17'),
(5, 6, 'dịch vụ tốt, có thêm bể bơi thì tuyệt vời', '2018-07-11 08:12:28'),
(6, 11, 'dịch vụ ổn, nhưng không gian phòng chưa hợp lý, hơi ngột ngạt', '2018-07-12 06:09:00'),
(7, 8, 'khu resort lý tưởng cho dịp nghỉ lễ tới', '2019-01-01 02:06:32'),
(8, 6, 'một khách sạn xứng đáng 5 sao', '2019-01-02 05:12:29'),
(9, 8, 'khách sạn đẹp , không gian thoáng mát, dịch vụ tốt', '2018-02-14 07:07:38'),
(10, 9, 'khách sạn này thế nào vậy mọi người, sắp có chuyến công tác cần lắm một khách sạn giá cả tốt', '2018-07-11 13:12:08'),
(11, 6, 'đi nha trang thì chọn khách sạn này là tuyệt vời', '2018-10-15 07:18:00'),
(12, 7, 'an ninh  ở đây đảm bảo lắm này, giá lại rẻ nữa', '2019-01-15 06:14:00'),
(13, 8, 'công tác Hà Nội thì chọn khách sạn này là hợp lý nhất', '2018-05-14 13:32:12'),
(14, 11, 'khu nghỉ dưỡng tuyệt vời cho một kỳ nghỉ', '2017-08-15 04:23:11'),
(15, 4, 'khách sạn vàng của thành phố ngàn hoa', '2017-03-09 08:39:39'),
(16, 8, 'cho em hỏi giá cả thế nào , an ninh có tốt không ạ', '2018-07-24 06:09:30'),
(17, 6, 'dịch vụ khá ổn, vị trí cũng thuận tiện cho việc đi chơi', '2018-09-26 07:16:32'),
(18, 2, 'nhân viên phục vụ không tốt, lại còn chặt chém khách nước ngoài nữa chứ', '2018-10-02 10:12:29'),
(19, 7, 'trong nước mà xây dựng được một khu nghỉ dưỡng tuyệt quá', '2018-10-15 11:16:26'),
(20, 9, 'dịch vụ tốt, cần phát huy ', '2019-01-08 09:16:25'),
(21, 7, 'hãng hàng không tuyệt vời', '2018-09-11 13:15:34'),
(22, 11, 'dịch vụ khá tốt, nhân viên nhiệt tình', '2018-09-10 06:07:29'),
(23, 8, 'hôm đó bay trong thời tiết khá xấu, thật may là chuyến bay hạ cánh an toàn', '2019-01-01 08:12:00'),
(24, 4, 'hãng hàng không đáng để lựa chọn', '2018-08-21 07:18:35'),
(25, 3, 'Eva đã cho tôi một chuyến đi tuyệt vời', '2018-09-02 00:00:00'),
(26, 2, 'một chuyến đi đáng để nhớ', '2018-10-15 14:17:31'),
(27, 6, 'dịch vụ tốt, nhân viên tận tình', '2018-10-08 06:14:25'),
(28, 7, 'giá cả hợp lý mà dịch vụ lại tốt', '2019-01-01 06:32:43'),
(29, 9, 'nhân viên cởi mở, nhiệt tình, dịch vụ tốt, giá hợp lý', '2018-10-16 09:21:00'),
(30, 8, 'vé của Korean hơi chát', '2018-09-10 16:32:35'),
(31, 5, 'một hãng hàng không nội địa tuyệt vời', '2019-01-06 13:36:00'),
(32, 11, 'chuyến bay an toàn là vui rồi, cảm ơn jetstar', '2018-09-10 11:00:27'),
(33, 7, 'giá rẻ, dịch vụ tốt, nhân viên vui tính nhiệt tình', '2018-01-01 09:23:43'),
(34, 9, 'giá cao quá, nhưng đổi lại được dịch vụ tốt', '2018-10-15 00:00:00'),
(35, 10, 'dịch vụ tốt, cần phát huy nhé', '2018-10-08 10:27:34');

INSERT INTO dgcdd (id_dd, id_tk, binh_luan_dd, thoi_gian) VALUES
(1, 2, 'không uổng danh là kỳ quan thiên nhiên thế giới ', '2018-12-03 06:09:25'),
(2, 3, 'cảnh quan ở đây tuyệt vời.', '2019-01-01 07:12:32'),
(3, 6, 'khoog có gì đặc biệt ở đây cả.', '2018-12-03 11:14:29'),
(4, 7, ' chuyến đi khá vui', '2018-02-22 07:17:17'),
(5, 6, 'địa điểm lý thú để hẹ hò', '2018-07-11 08:12:28'),
(6, 11, 'dịch vụ ổn, nhưng không gian phòng chưa hợp lý, hơi ngột ngạt', '2018-07-12 06:09:00'),
(7, 8, 'địa điểm lý tưởng cho dịp nghỉ lễ tới', '2019-01-01 02:06:32'),
(8, 6, 'ai cho mình xin ý ít thông tin với, có gì thú vị không ạ', '2019-01-02 05:12:29'),
(9, 8, 'không khí trong lành, không gian thoáng mát,đẹp', '2018-02-14 07:07:38'),
(10, 9, 'có cơ hội sẽ cùng cả nhà', '2018-07-11 13:12:08'),
(11, 6, ' quá tuyệt vời', '2018-10-15 07:18:00'),
(12, 7, 'an ninh  ở đây đảm bảo lắm này, giá lại rẻ nữa', '2019-01-15 06:14:00'),
(13, 8, 'đẹp, hơn những gì mong đợi', '2018-05-14 13:32:12'),
(14, 11, 'quá tuyệt vời cho một kỳ nghỉ', '2017-08-15 04:23:11'),
(15, 4, 'cho mìn ít thông tin đi', '2017-03-09 08:39:39'),
(16, 8, 'an ninh có tốt không ạ', '2018-07-24 06:09:30'),
(17, 6, ' vị trí cũng thuận tiện cho việc đi chơi', '2018-09-26 07:16:32'),
(18, 2, ' ở đây  chặt chém khách nước ngoài lắm', '2018-10-02 10:12:29'),
(19, 7, '  một khu nghỉ dưỡng tuyệt quá', '2018-10-15 11:16:26'),
(20, 9, 'hợp lý để hẹn hò không mọi người ', '2019-01-08 09:16:25'),
(21, 7, ' tuyệt vời', '2018-09-11 13:15:34'),
(22, 11, 'thời tiết không ủng hộ, nên không được đi đâu, chỉ nàm trong khách sạn, chả biết nó thế nào', '2018-09-10 06:07:29'),
(23, 8, ' thời tiết khá xấu', '2019-01-01 08:12:00'),
(24, 4, ' đáng để lựa chọn', '2018-08-21 07:18:35'),
(25, 3, ' chuyến đi tuyệt vời', '2018-09-02 00:00:00'),
(26, 2, 'chuyến đi đáng để nhớ', '2018-10-15 14:17:31'),
(27, 6, ' kỳ nghỉ ý nghĩa', '2018-10-08 06:14:25'),
(28, 7, 'giá cả hợp lý ', '2019-01-01 06:32:43'),
(29, 9, 'không hài long cho lắm, không như mong đợi', '2018-10-16 09:21:00'),
(30, 8, 'cần chuẩn bị những gì nhỉ', '2018-09-10 16:32:35'),
(31, 5, ' tuyệt vời', '2019-01-06 13:36:00'),
(32, 11, ' quá vui rồi,', '2016-09-10 11:00:27'),
(33, 7, 'ước gì dược đi một lần nữa', '2018-01-01 09:23:43'),
(34, 9, 'đẹp lắm mọi người ạ', '2018-10-15 00:00:00'),
(35, 10, 'dmột sự lựa chọn hợp lý cho cả gia đình cùng ngao du', '2018-10-08 10:27:34'),
(36, 11, 'muốn đi thêm lần nữa', '2018-09-10 09:12:27'),
(37, 3, 'đẹp tuyệt luôn', '2019-01-01 14:14:23'),
(38, 8, 'muốn đi bà xã đi một lần', '2018-12-20 13:36:00'),
(39, 6, 'có sao không', '2018-09-10 06:30:21'),
(40, 8, 'một tạo hóa  tuyệt vời của tự nhiên', '2018-10-03 13:14:32');


-- ===========================Test Danh mục Bài viết Chi tiết bài viết==========================
-- CREATE TABLE danh_muc (
--     ma_dm VARCHAR(10) PRIMARY KEY,
--     ten_dm TEXT NOT NULL,
--     ma_dm_cha VARCHAR(10)
-- )  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;
INSERT INTO danh_muc VALUES ('1', 'Danh mục 1', null);
INSERT INTO danh_muc VALUES ('2', 'Danh mục 2', null);
INSERT INTO danh_muc VALUES ('3', 'Danh mục 3', null);

INSERT INTO danh_muc VALUES ('1.1', 'Danh mục 1.1', '1');
INSERT INTO danh_muc VALUES ('1.2', 'Danh mục 1.2', '1');
INSERT INTO danh_muc VALUES ('1.3', 'Danh mục 1.3', '1');

INSERT INTO danh_muc VALUES ('1.1.1', 'Danh mục 1.1.1', '1.1');
INSERT INTO danh_muc VALUES ('1.1.1.1', 'Danh mục 1.1.1.1', '1.1.1');
INSERT INTO danh_muc VALUES ('1.1.2', 'Danh mục 1.1.2', '1.1');

INSERT INTO danh_muc VALUES ('2.2.1', 'Danh mục 2.2.1', '2.2');

INSERT INTO danh_muc VALUES ('2.1', 'Danh mục 2.1', '2');
INSERT INTO danh_muc VALUES ('2.2', 'Danh mục 2.2', '2');

INSERT INTO danh_muc VALUES ('3.1', 'Danh mục 3.1', '3');
INSERT INTO danh_muc VALUES ('3.2', 'Danh mục 3.2', '3');

-- CREATE TABLE bai_viet (
--     ma_bv INT AUTO_INCREMENT PRIMARY KEY,
--     ma_dm VARCHAR(10),
--     tieu_de_bv TEXT,
--     noi_dung_tom_tat_bv LONGTEXT,
--     link_anh_bia_bv LONGTEXT,
--     FOREIGN KEY (ma_dm)
--         REFERENCES danh_muc (ma_dm)
-- )  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('1.1', 'Tieu De 1', 'Noi Dung Tom Tat', 'Link anh bia 1');
INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('1.1', 'Tieu De 2', 'Noi Dung Tom Tat', 'Link anh bia 2');
INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('1.2', 'Tieu De 3', 'Noi Dung Tom Tat', 'Link anh bia 3');

INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('2.1', 'Tieu De 4', 'Noi Dung Tom Tat', 'Link anh bia 4');
INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('3.2', 'Tieu De 5', 'Noi Dung Tom Tat', 'Link anh bia 5');

INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('1.3', 'Tieu De 6', 'Noi Dung Tom Tat', 'Link anh bia 6');
INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('1.3', 'Tieu De 7', 'Noi Dung Tom Tat', 'Link anh bia 7');

-- CREATE TABLE chi_tiet_bai_viet (
--     ma_ctbv INT AUTO_INCREMENT PRIMARY KEY,
--     ma_bv INT,
--     noi_dung_chi_tiet_ctbv LONGTEXT,
--     link_anh_ctbv LONGTEXT,
--     FOREIGN KEY (ma_bv)
--         REFERENCES bai_viet (ma_bv)
-- )  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI AUTO_INCREMENT=1;

INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('1', 'Noi Dung Chi Tiet 1', 'Link anh 1');
INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('1', 'Noi Dung Chi Tiet 2', 'Link anh 2');
INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('2', 'Noi Dung Chi Tiet 1', 'Link anh 3');
INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('3', 'Noi Dung Chi Tiet 1', 'Link anh 4');
INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('4', 'Noi Dung Chi Tiet 1', 'Link anh 5');
INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('4', null, 'Link anh 6');
INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('4', 'Noi Dung Chi Tiet 3', null);
INSERT INTO chi_tiet_bai_viet (ma_bv, noi_dung_chi_tiet_ctbv, link_anh_ctbv) VALUES ('5', 'Noi Dung Chi Tiet 1', 'Link anh 8');

-- select * from chi_tiet_bai_viet where ma_bv = '1';
-- delete from chi_tiet_bai_viet where ma_bv = '1';
-- select * from bai_viet bv inner join danh_muc dm on bv.ma_dm = dm.ma_dm limit 0, 3;
-- select * from danh_muc;