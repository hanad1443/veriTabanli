Create Database universite_ogretmenleri;
use universite_ogretmenleri;
-- Öğretmenler tablosu
CREATE TABLE ogretmenler (
    ogretmen_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    adi VARCHAR(50) NOT NULL,
    soyadi VARCHAR(50) NOT NULL,
    e_posta VARCHAR(50) NOT NULL,
    telefon_numarasi VARCHAR(15) null,
    ulke VARCHAR(50) NOT NULL
);

-- Uzmanlık Alanları tablosu
CREATE TABLE uzmanlik_alanlari (
    uzmanlik_id INT AUTO_INCREMENT PRIMARY KEY,
    uzmanlik_adi VARCHAR(50) NOT NULL
);

-- Görev Aldığı Dersler tablosu
CREATE TABLE gorev_aldigi_dersler (
    ders_id INT AUTO_INCREMENT PRIMARY KEY,
    ders_adi VARCHAR(50) NOT NULL,
    ders_kodu VARCHAR(20) NOT NULL,
    ders_kredisi INT default '5' 
);

-- ADIM-4: Eğitim Bilgileri tablosu
CREATE TABLE egitim_bilgileri (
    egitim_seviyesi VARCHAR(20) NOT NULL,
    universite_adi VARCHAR(100) NOT NULL,
    bolum_adi VARCHAR(50) NOT NULL,
    oduller VARCHAR(100) NULL ,
    arastirma_alanlari VARCHAR(100),
    unvan VARCHAR(20) NOT NULL,
	ogretmen_id INT,
    FOREIGN KEY (ogretmen_id) REFERENCES ogretmenler(ogretmen_id)
);

-- ADIM-5: Çoktan Çoka İlişki (Öğretmenler - Uzmanlık Alanları)
CREATE TABLE ogretmen_uzmanlik (
    ogretmen_id INT,
    uzmanlik_id INT,
    PRIMARY KEY (ogretmen_id, uzmanlik_id),
    FOREIGN KEY (ogretmen_id) REFERENCES ogretmenler(ogretmen_id),
    FOREIGN KEY (uzmanlik_id) REFERENCES uzmanlik_alanlari(uzmanlik_id)
);

-- ADIM-6: Çoktan Çoka İlişki (Öğretmenler - Görev Aldığı Dersler)
CREATE TABLE ogretmen_ders (
    ogretmen_id INT,
    ders_id INT,
    PRIMARY KEY (ogretmen_id, ders_id),
    FOREIGN KEY (ogretmen_id) REFERENCES ogretmenler(ogretmen_id),
    FOREIGN KEY (ders_id) REFERENCES gorev_aldigi_dersler(ders_id)
);