create database school_library;
use school_library;
create table uyeler(
uyeNo int not null Primary key identity(1,1),
uyeAdi nvarchar(50) not null,
uyeSoyadi nvarchar(50) not null,
eposta nvarchar(100) not null,
cinsiyet char(2) not null, 
telefon int
);
use school_library;
create table adresler(
adresNo int not null Primary Key identity(1,1),
sehir nvarchar(50),
mahalle nvarchar(100),
binaNo int,
cadde nvarchar(200),
ulke nvarchar(50),
postaKodu int
);
ALTER TABLE uyeler ADD adresNo int
constraint FK_uyeler_adres
FOREIGN KEY (adresNo)
references ADRESLER (adresNo);
create table kutuphane(
kutuphaneNo int not null identity(1,1) Primary Key,
kutuphaneIsmi nvarchar(150),
aciklama nvarchar(500),
adresNo int constraint FK_adresler_kutuphane Foreign key(adresNo) references adresler(adresNo)
);
create table Kitaplar(
ISBN nvarchar(50) not null primary key,
KITAPADI nvarchar (50),
SAYFASAYISI int,
YAYINTARIHI DATETIME
);
create table emanetler(
emanetNo int not null identity(1,1) primary key,
emanetTarihi datetime,
teslimTarihi datetime,
uyeNo int constraint FK_uye_emanet Foreign key(uyeNo) references uyeler(uyeNo),
kutuphaneNo int constraint FK_kutuphane_emanet Foreign key(kutuphaneNo) references kutuphane(kutuphaneNo),
ISBN nvarchar(50) CONSTRAINT FK_kitap_emanet FOREIGN KEY(ISBN) REFERENCES Kitaplar(ISBN)
);
create table bulunur(
miktar int not null identity(1,1) primary key,
ISBN nvarchar(50) constraint FK_kitap_bulunur foreign key(ISBN) REFERENCES Kitaplar(ISBN),
kutuphaneNo int constraint FK_kutuphane_bulunur Foreign Key(kutuphaneNo) references kutuphane(kutuphaneNo)
);
create table kategoriler(
kategoriNo int not null identity(1,1) primary key,
kategoriAdi nvarchar(50),
);
create table yazarlar(
yazarNo int not null identity(1,1) primary key,
yazarAdi nvarchar(50) not null,
yazarSoyadi nvarchar(75)not null,
);
create table yazar(
yazar_No int not null identity(1,1) primary key,
ISBN nvarchar(50) constraint FK_kitap_yazar foreign key(ISBN) REFERENCES Kitaplar(ISBN),
yazarNo int constraint FK_yazarlar_yazar foreign key(yazarNo) references yazarlar(yazarNo),
);
create table BulunurKategori(
bulunurNo int not null identity(1,1) primary key,
kategoriNo int constraint FK_kategoriler_BulunurKategori foreign key(kategoriNo) references kategoriler(kategoriNo),
ISBN nvarchar(50) constraint FK_kitap_BulunurKategori foreign key(ISBN) REFERENCES Kitaplar(ISBN),
);