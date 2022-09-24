select * from Urun

select ParcaNo [Parça No], Adi Adý,
CONVERT(varchar(10), EklenmeTarihi, 104)
+ ' ' + CONVERT(varchar(8), EklenmeTarihi, 108) [Eklenme Tarihi],
CONVERT(varchar(19), GETDATE(), 104)
+ ' ' + CONVERT(varchar(8), GETDATE(), 108) [Sorgulanma Tarihi] from Urun

-- En yüksek birim fiyata sahip ürün:
select top 1 Adi, StokAdedi, BirimFiyati from Urun
order by BirimFiyati desc

-- Stok adedi 200 ile 2000 arasýndaki ürünler:
select * from urun where StokAdedi >= 200 and StokAdedi <= 2000
select * from urun where StokAdedi between 200 and 2000

-- Stok adedi 200'den az, 2000'den fazla olan ürünler:
select * from urun where not (StokAdedi >= 200 and StokAdedi <= 2000)
select * from urun where not (StokAdedi between 200 and 2000)
select * from urun where stokadedi < 200 or StokAdedi > 2000

-- Ankara ve Ýstanbul'daki þubeler:
select * from sube where PlakaNo = 6 or plakano = 34
select * from sube where PlakaNo in (6, 34)

-- Hem eklenme tarihi 2022 yýlýndan büyük hem de (ya da) birim fiyatý 250 ile 500 arasýnda olan ürünler (sorgu sonucunda birim fiyatlar sonunda TL ile gelsin, stok adetleri de sonunda adet ile gelsin): 
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun where year(EklenmeTarihi) >= 2022 or (BirimFiyati >= 250 and BirimFiyati <= 500)
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun where EklenmeTarihi >= '2022-01-01' or (BirimFiyati >= 250 and BirimFiyati <= 500)

-- Union
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun 
where EklenmeTarihi >= '2022-01-01'
union all -- eðer all kullanýlmazsa kayýtlar birleþtirildikten sonra distinct'lenir
select adi, cast(stokadedi as varchar) + ' adet', cast(birimfiyati as varchar) + ' TL', eklenmetarihi from urun 
where BirimFiyati >= 250 and BirimFiyati <= 500

-- Eklenme tarihi 24 Eylül 2022 olan ürünler:
select * from urun where EklenmeTarihi >= '2022-09-24 00:00:00' and EklenmeTarihi <= '2022-09-24 23:59:59'
select * from urun where EklenmeTarihi >= '2022-09-24' and EklenmeTarihi < '2022-09-25'

-- Join'ler: inner join soldaki ve saðdaki tablodan sadece eþleþenleri,
-- left outer join ise soldaki tüm kayýtlarý, saðdaki eþleþenler varsa 
-- eþleþenleri, yoksa eþleþmeyenleri NULL olarak getirir.
select s.Adi ÞubeAdý, s.PlakaNo, u.Adi ÜrünAdý, u.ParcaNo, ISNULL(u.StokAdedi, 0) StokAdedi, ISNULL(u.BirimFiyati, 0) BirimFiyati, CONVERT(varchar(10), u.EklenmeTarihi, 104) EklenmeTarihi, k.Adi KategoriAdi from Sube s left outer join UrunSube us on s.Id = us.SubeId
left outer join Urun u on u.Id = us.UrunId
left outer join Kategori k on u.KategoriId = k.Id
--where s.Adi like 'Ankara%'
where s.PlakaNo = 6
and u.EklenmeTarihi >= '2010-01-01 00:00:00' and u.EklenmeTarihi <= '2022-12-31 23:59:59' and k.Adi = 'beyaz eþya'
order by u.EklenmeTarihi, u.StokAdedi

create view vSubeUrunKategori
as
select s.Adi ÞubeAdý, s.PlakaNo, u.Adi ÜrünAdý, u.ParcaNo, ISNULL(u.StokAdedi, 0) StokAdedi, ISNULL(u.BirimFiyati, 0) BirimFiyati, CONVERT(varchar(10), u.EklenmeTarihi, 104) EklenmeTarihi, k.Adi KategoriAdi from Sube s left outer join UrunSube us on s.Id = us.SubeId
left outer join Urun u on u.Id = us.UrunId
left outer join Kategori k on u.KategoriId = k.Id

select * from vSubeUrunKategori

select u.Adi, u.ParcaNo, (select k.Adi from Kategori k where k.Id = u.KategoriId) Kategori from Urun u

select ÞubeAdý, PlakaNo, sum(StokAdedi) ToplamStok, Count(*) UrunAdedi from vSubeUrunKategori
group by ÞubeAdý, PlakaNo
having Count(*) >= 4

select distinct ÜrünAdý, ParcaNo from vSubeUrunKategori where KategoriAdi like '%eþya%'

select count(distinct ÜrünAdý) ÜrünSayýsý from vSubeUrunKategori where KategoriAdi like '%eþya%'