create proc MusteriEkle
@Adsoyad varchar(50),
@Turu varchar(50),
@telefon varchar(50),
@adres varchar(50),
@puan int
as
insert into Musteriler(AdSoyad,T�r�,Telefon,Adres,Puan)
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
update Musteriler set AdSoyad=@Adsoyad,T�r�=@Turu,Telefon=@telefon,Adres=@adres,
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
select *from Musteriler where T�r�=@tur

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
insert into Kampanya(TarifeNo,KAdi,KS�resi,KUcreti)values(@TarifeNo,@ad,@sure,@ucret)

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
update Kampanya set TarifeNo=@TarifeNo,KAdi=@ad,KS�resi=@sure,KUcreti=@ucret where KampanyaNo=@KampanyaNo

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
insert into Odemeler(MusteriNo,Tipi,OdemeTarihi,OdemeTutar�,OdemeGeciktirmeDurumu,OdemeGeciktirmeFaizi)
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
update Odemeler set MusteriNo=@MusteriNo,Tipi=@tip,OdemeTarihi=@tarih,OdemeTutar�=@tutar,
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

-----------------------------------�agr� G�revlisi------------------------------------------
create proc GorevliEkle
@AdSoyad varchar(50),
@Mezuniyet varchar(50),
@vardiya varchar(50),
@cplan varchar(50)
as
insert into CG�revli(CAdSoyad,Mezuniyet,VardiyaDurumu,HaftalikCalismaPlani)
values(@AdSoyad,@Mezuniyet,@vardiya,@cplan)

create proc GorevListele
as
select *from CG�revli

create proc GorevliYenile
@GorevliNo int,
@AdSoyad varchar(50),
@Mezuniyet varchar(50),
@vardiya varchar(50),
@cplan varchar(50)
as
update CG�revli set CAdSoyad=@AdSoyad,Mezuniyet=@Mezuniyet,VardiyaDurumu=@vardiya,
HaftalikCalismaPlani=@cplan where CGorevliNo=@GorevliNo


create proc GorevliSil
@gno int
as
delete from CG�revli where CGorevliNo=@gno

create proc MAdGoreAra
@mad varchar(50)
as
select *from CG�revli where  CAdSoyad=@mad

create proc GVardiyaGoreAra
@durum varchar(50)
as
select *from CG�revli where VardiyaDurumu=@durum

------------------------------Kay�tTablosu--------------------------
create proc KayitEkle
@mno int,
@gno int,
@sure varchar(50),
@tarih nvarchar(50),
@aciklama varchar(50),
@bno int
as
insert into Kay�t(MusteriNo,GorevliNo,Kay�tSuresi,Kay�tTarihi,Ac�klama,BirimNo)
values(@mno,@gno,@sure,@tarih,@aciklama,@bno)

create proc KayitListele
as 
select *from Kay�t

create proc KayitYenile
@kno int,
@mno int,
@gno int,
@sure varchar(50),
@tarih nvarchar(50),
@aciklama varchar(50),
@bno int
as begin
update Kay�t set MusteriNo=@mno,GorevliNo=@gno,Kay�tSuresi=@sure,Kay�tTarihi=@tarih,Ac�klama=@aciklama,
BirimNo=@bno where Kay�tNo=@kno
end

create proc KayitSil
@kno int
as
delete from Kay�t where Kay�tNo=@kno

create proc Kay�tMusteriAra
@mid int
as
select *from Kay�t where  MusteriNo=@mid

create proc Kay�tGorevliAra
@gid int
as
select *from Kay�t where GorevliNo=@gid

---------------------Birimler-----------------------------------------------------------------
create proc BirimEkle
@bAdi varchar(50),
@BirimM�d�r� varchar(50),
@sno int
as
insert into Birimler(BirimAdi,BirimM�d�r�,�ubeNo)
values(@bAdi,@BirimM�d�r�,@sno)

create proc BirimListele
as
select *from Birimler

create proc BirimYenile
@bno int,
@bAdi varchar(50),
@BirimM�d�r� varchar(50),
@sno int
as begin
update Birimler set BirimAdi=@bAdi,BirimM�d�r�=@BirimM�d�r�,�ubeNo=@sno where BirimNo=@bno
end

create proc BirimSil
@bno int
as
delete from Birimler where BirimNo=@bno

create proc BirimAdAra
@mad varchar(50)
as
select *from Birimler where  BirimAdi=@mad

create proc Birim�ubeNoAra
@no int
as
select *from Birimler where �ubeNo=@no
------------------------------�ubeler------------------------------------------------------
create proc SubeEkle
@sAdi varchar(50),
@s�lce varchar(50),
@sYetkili varchar(50)
as
insert into Subeler(�ubeAdi,�ube�lce,�ubeYetkilisi)
values(@sAdi,@s�lce,@sYetkili)

create proc SubeListele
as
select *from Subeler

create proc SubeYenile
@sno int,
@sAdi varchar(50),
@s�lce varchar(50),
@sYetkili varchar(50)
as begin
update Subeler set �ubeAdi=@sAdi,�ube�lce=@s�lce,�ubeYetkilisi=@sYetkili where �ubeNo=@sno
end

create proc SubeSil
@sno int
as
delete from Subeler where �ubeNo=@sno

create proc SubeAdAra
@mad varchar(50)
as
select *from Subeler where  �ubeAdi=@mad

create proc Sube�lceAra
@durum varchar(50)
as
select *from Subeler where �ube�lce=@durum