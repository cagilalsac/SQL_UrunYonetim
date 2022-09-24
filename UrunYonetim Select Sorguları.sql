select * from Urun

select ParcaNo [Par�a No], Adi Ad�,
CONVERT(varchar(10), EklenmeTarihi, 104)
+ ' ' + CONVERT(varchar(8), EklenmeTarihi, 108) [Eklenme Tarihi],
CONVERT(varchar(19), GETDATE(), 104)
+ ' ' + CONVERT(varchar(8), GETDATE(), 108) [Sorgulanma Tarihi] from Urun

-- En y�ksek birim fiyata sahip �r�n:
select top 1 Adi, StokAdedi, BirimFiyati from Urun
order by BirimFiyati desc

-- Stok adedi 200 ile 2000 aras�ndaki �r�nler:
select * from urun where StokAdedi >= 200 and StokAdedi <= 2000
select * from urun where StokAdedi between 200 and 2000

-- Stok adedi 200'den az, 2000'den fazla olan �r�nler:
select * from urun where not (StokAdedi >= 200 and StokAdedi <= 2000)
select * from urun where not (StokAdedi between 200 and 2000)
select * from urun where stokadedi < 200 or StokAdedi > 2000

-- Ankara ve �stanbul'daki �ubeler:
select * from sube where PlakaNo = 6 or plakano = 34
select * from sube where PlakaNo in (6, 34)

-- Hem eklenme tarihi 2022 y�l�ndan b�y�k hem de (ya da) birim fiyat� 250 ile 500 aras�nda olan �r�nler (sorgu sonucunda birim fiyatlar sonunda TL ile gelsin, stok adetleri de sonunda adet ile gelsin): 
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun where year(EklenmeTarihi) >= 2022 or (BirimFiyati >= 250 and BirimFiyati <= 500)
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun where EklenmeTarihi >= '2022-01-01' or (BirimFiyati >= 250 and BirimFiyati <= 500)

-- Union
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun 
where EklenmeTarihi >= '2022-01-01'
union all -- e�er all kullan�lmazsa kay�tlar birle�tirildikten sonra distinct'lenir
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun 
where BirimFiyati >= 250 and BirimFiyati <= 500

-- Eklenme tarihi 24 Eyl�l 2022 olan �r�nler:
select * from urun where EklenmeTarihi >= '2022-09-24 00:00:00' and EklenmeTarihi <= '2022-09-24 23:59:59'
select * from urun where EklenmeTarihi >= '2022-09-24' and EklenmeTarihi < '2022-09-25'

-- Join'ler: inner join soldaki ve sa�daki tablodan sadece e�le�enleri,
-- left outer join ise soldaki t�m kay�tlar�, sa�daki e�le�enler varsa 
-- e�le�enleri, yoksa e�le�meyenleri NULL olarak getirir.
select s.Adi �ubeAd�, s.PlakaNo, u.Adi �r�nAd�, u.ParcaNo, ISNULL(u.StokAdedi, 0) StokAdedi, ISNULL(u.BirimFiyati, 0) BirimFiyati, CONVERT(varchar(10), u.EklenmeTarihi, 104) EklenmeTarihi, k.Adi KategoriAdi from Sube s left outer join UrunSube us on s.Id = us.SubeId
left outer join Urun u on u.Id = us.UrunId
left outer join Kategori k on u.KategoriId = k.Id
--where s.Adi like 'Ankara%'
where s.PlakaNo = 6
and u.EklenmeTarihi >= '2010-01-01 00:00:00' and u.EklenmeTarihi <= '2022-12-31 23:59:59' and k.Adi = 'beyaz e�ya'
order by u.EklenmeTarihi, u.StokAdedi

create view vSubeUrunKategori
as
select s.Adi �ubeAd�, s.PlakaNo, u.Adi �r�nAd�, u.ParcaNo, ISNULL(u.StokAdedi, 0) StokAdedi, ISNULL(u.BirimFiyati, 0) BirimFiyati, CONVERT(varchar(10), u.EklenmeTarihi, 104) EklenmeTarihi, k.Adi KategoriAdi from Sube s left outer join UrunSube us on s.Id = us.SubeId
left outer join Urun u on u.Id = us.UrunId
left outer join Kategori k on u.KategoriId = k.Id

select * from vSubeUrunKategori

select u.Adi, u.ParcaNo, (select k.Adi from Kategori k where k.Id = u.KategoriId) Kategori from Urun u

select �ubeAd�, PlakaNo, sum(StokAdedi) ToplamStok, Count(*) UrunAdedi from vSubeUrunKategori
group by �ubeAd�, PlakaNo
having Count(*) >= 4

select distinct �r�nAd�, ParcaNo from vSubeUrunKategori where KategoriAdi like '%e�ya%'

select count(distinct �r�nAd�) �r�nSay�s� from vSubeUrunKategori where KategoriAdi like '%e�ya%'