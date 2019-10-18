create proc MusteriEkle
@Adsoyad varchar(50),
@Turu varchar(50),
@telefon varchar(50),
@adres varchar(50),
@puan int
as
insert into Musteriler(AdSoyad,Türü,Telefon,Adres,Puan)
values(@Adsoyad,@Turu,@telefon,@adres,@puan)

create proc MusteriListele
as 
select *from Musteriler

create proc MusteriYenile
@MusteriNo int,
@Adsoyad varchar(50),
@Turu varchar(50),
@telefon varchar(50),
@adres varchar(50),
@puan int
as begin
update Musteriler set AdSoyad=@Adsoyad,Türü=@Turu,Telefon=@telefon,Adres=@adres,
Puan=@puan where MusteriNo=@MusteriNo
end

create proc MusteriSil
@no int
as
delete from Musteriler where MusteriNo=@no

create proc AdaGoreAra
@ad varchar(50)
as
select *from Musteriler where AdSoyad=@ad

create proc TureGoreAra
@tur varchar(50)
as
select *from Musteriler where Türü=@tur

-----------------------------Tarifeler-------------------

create proc TarifeEkle
@MusteriNo int,
@ad varchar(50),
@durum varchar(50),
@ucret money,
@baslangic nvarchar(50),
@bitis nvarchar(50)
as
insert into Tarifeler(MusteriNo,TAd,TDurum,TUcret,BaslangicTarihi,BitisTarihi)
values(@MusteriNo,@ad,@durum,@ucret,@baslangic,@bitis)

create proc TarifeListele
as
select *from Tarifeler

create proc TarifeYenile
@TarifeNo int,
@MusteriNo int,
@ad varchar(50),
@durum varchar(50),
@ucret money,
@baslangic nvarchar(50),
@bitis nvarchar(50)
as begin
update Tarifeler set MusteriNo=@MusteriNo,TAd=@ad,TDurum=@durum,TUcret=@ucret,BaslangicTarihi=@baslangic,
BitisTarihi=@bitis where TarifeNo=@TarifeNo
end

create proc TarifeSil
@TarifeNo int
as
delete from Tarifeler where TarifeNo=@TarifeNo

create proc TAdaGoreAra
@ad varchar(50)
as
select *from Tarifeler where TAd=@ad

create proc TDurumeGoreAra
@tur varchar(50)
as
select *from Tarifeler where TDurum=@tur

---------------------------------------------Kampamyalar------------------------------------------------
create proc KampanyaEkle
@TarifeNo int,
@ad varchar(50),
@sure varchar(50),
@ucret money
as
insert into Kampanya(TarifeNo,KAdi,KSüresi,KUcreti)values(@TarifeNo,@ad,@sure,@ucret)

create proc KampanyaListele
as
select *from Kampanya

create proc KampanyaYenile
@KampanyaNo int,
@TarifeNo int,
@ad varchar(50),
@sure varchar(50),
@ucret money
as
update Kampanya set TarifeNo=@TarifeNo,KAdi=@ad,KSüresi=@sure,KUcreti=@ucret where KampanyaNo=@KampanyaNo

create proc KampanyaSil
@KampanyaNo int
as
delete from Kampanya where KampanyaNo=@KampanyaNo

create proc TNoGoreAra
@tno int
as
select *from Kampanya where TarifeNo=@tno

create proc KAdaGoreAra
@kad varchar(50)
as
select *from Kampanya where KAdi=@kad

-------------------------------------Odemeler----------------------------------------------------------
create proc OdemeEkle
@MusteriNo int,
@tip varchar(50),
@tarih nvarchar(50),
@tutar money,
@gecikme int,
@faiz int
as
insert into Odemeler(MusteriNo,Tipi,OdemeTarihi,OdemeTutarý,OdemeGeciktirmeDurumu,OdemeGeciktirmeFaizi)
values(@MusteriNo,@tip,@tarih,@tutar,@gecikme,@faiz)

create proc OdemeListele
as
select *from Odemeler

create proc OdemeYenile
@OdemeNo int,
@MusteriNo int,
@tip varchar(50),
@tarih nvarchar(50),
@tutar money,
@gecikme int,
@faiz int
as
update Odemeler set MusteriNo=@MusteriNo,Tipi=@tip,OdemeTarihi=@tarih,OdemeTutarý=@tutar,
OdemeGeciktirmeDurumu=@gecikme,OdemeGeciktirmeFaizi=@faiz where OdemeNo=@OdemeNo

create proc OdemeSil
@no int
as
delete from Odemeler where OdemeNo=@no

create proc MNoGoreAra
@mno int
as
select *from Odemeler where MusteriNo=@mno

create proc OtipiGoreAra
@otip varchar(50)
as
select *from Odemeler where Tipi=@otip

-----------------------------------Çagrý Görevlisi------------------------------------------
create proc GorevliEkle
@AdSoyad varchar(50),
@Mezuniyet varchar(50),
@vardiya varchar(50),
@cplan varchar(50)
as
insert into CGörevli(CAdSoyad,Mezuniyet,VardiyaDurumu,HaftalikCalismaPlani)
values(@AdSoyad,@Mezuniyet,@vardiya,@cplan)

create proc GorevListele
as
select *from CGörevli

create proc GorevliYenile
@GorevliNo int,
@AdSoyad varchar(50),
@Mezuniyet varchar(50),
@vardiya varchar(50),
@cplan varchar(50)
as
update CGörevli set CAdSoyad=@AdSoyad,Mezuniyet=@Mezuniyet,VardiyaDurumu=@vardiya,
HaftalikCalismaPlani=@cplan where CGorevliNo=@GorevliNo


create proc GorevliSil
@gno int
as
delete from CGörevli where CGorevliNo=@gno

create proc MAdGoreAra
@mad varchar(50)
as
select *from CGörevli where  CAdSoyad=@mad

create proc GVardiyaGoreAra
@durum varchar(50)
as
select *from CGörevli where VardiyaDurumu=@durum

------------------------------KayýtTablosu--------------------------
create proc KayitEkle
@mno int,
@gno int,
@sure varchar(50),
@tarih nvarchar(50),
@aciklama varchar(50),
@bno int
as
insert into Kayýt(MusteriNo,GorevliNo,KayýtSuresi,KayýtTarihi,Acýklama,BirimNo)
values(@mno,@gno,@sure,@tarih,@aciklama,@bno)

create proc KayitListele
as 
select *from Kayýt

create proc KayitYenile
@kno int,
@mno int,
@gno int,
@sure varchar(50),
@tarih nvarchar(50),
@aciklama varchar(50),
@bno int
as begin
update Kayýt set MusteriNo=@mno,GorevliNo=@gno,KayýtSuresi=@sure,KayýtTarihi=@tarih,Acýklama=@aciklama,
BirimNo=@bno where KayýtNo=@kno
end

create proc KayitSil
@kno int
as
delete from Kayýt where KayýtNo=@kno

create proc KayýtMusteriAra
@mid int
as
select *from Kayýt where  MusteriNo=@mid

create proc KayýtGorevliAra
@gid int
as
select *from Kayýt where GorevliNo=@gid

---------------------Birimler-----------------------------------------------------------------
create proc BirimEkle
@bAdi varchar(50),
@BirimMüdürü varchar(50),
@sno int
as
insert into Birimler(BirimAdi,BirimMüdürü,ÞubeNo)
values(@bAdi,@BirimMüdürü,@sno)

create proc BirimListele
as
select *from Birimler

create proc BirimYenile
@bno int,
@bAdi varchar(50),
@BirimMüdürü varchar(50),
@sno int
as begin
update Birimler set BirimAdi=@bAdi,BirimMüdürü=@BirimMüdürü,ÞubeNo=@sno where BirimNo=@bno
end

create proc BirimSil
@bno int
as
delete from Birimler where BirimNo=@bno

create proc BirimAdAra
@mad varchar(50)
as
select *from Birimler where  BirimAdi=@mad

create proc BirimÞubeNoAra
@no int
as
select *from Birimler where ÞubeNo=@no
------------------------------Þubeler------------------------------------------------------
create proc SubeEkle
@sAdi varchar(50),
@sÝlce varchar(50),
@sYetkili varchar(50)
as
insert into Subeler(ÞubeAdi,ÞubeÝlce,ÞubeYetkilisi)
values(@sAdi,@sÝlce,@sYetkili)

create proc SubeListele
as
select *from Subeler

create proc SubeYenile
@sno int,
@sAdi varchar(50),
@sÝlce varchar(50),
@sYetkili varchar(50)
as begin
update Subeler set ÞubeAdi=@sAdi,ÞubeÝlce=@sÝlce,ÞubeYetkilisi=@sYetkili where ÞubeNo=@sno
end

create proc SubeSil
@sno int
as
delete from Subeler where ÞubeNo=@sno

create proc SubeAdAra
@mad varchar(50)
as
select *from Subeler where  ÞubeAdi=@mad

create proc SubeÝlceAra
@durum varchar(50)
as
select *from Subeler where ÞubeÝlce=@durum