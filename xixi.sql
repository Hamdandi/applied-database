-- megelolah DAtabase dan Tabel
-- 1 mater 2022
/*Membuat Database
	Perintah : 
	Create databse <nama_database>
*/

-- Contoh : membuat databse dengan nama "akademik"
create database akademi

-- menmapilkan informasi databse
sp_helpdb

-- menampilkan infromasi database tertentu
-- perintah : sp_helpdb <nama_databse>

-- contoh menampilkan informasi database "akademik"
sp_helpdb akademi

-- ,emginah nama database
-- perintah : sp_renamedb 'nama_databse_lama','nama_database_baru'
-- perintah : sp_rename 'nama_database_lama','nama_database_baru'

-- contoh : mengubah nama DB 'akamedik' menjadi 'akademiku'
sp_renamedb 'akamedik','akademiku'

-- contoh : mengubah nama DB 'akademiku' menjadi 'akademi'
sp_rename 'akademiku','akademi','Database'

-- menghapus database
-- perintah : drop database <nama_database>

-- menghapus database "akademi"
drop database akamedik

---------------------------------------------

-- mengaktifkan database terbaru
-- perintah : use <nama_database>

-- mengaktifkan database "akademi"
use akademi

/*membuat tabel
	perintah :
	create table <nama_tabel>
	(
		nama_field1 tipedata1(lebar),
		nama_field2 tipedata2(lebar),
		...
		nama_fieldn tipedatan(lebar)
	)
	ket	: tipe data yang berkaitan angka, string, tanggal
		  angka		:	int, smallint, tynyint
						float, real
		  string	:	char, varchar
		  tanggal	:	date,time,datetime
*/

-- contoh membuat tabel mahasiswa (npm, nama, prodi, semester)
create table mahasiswa
	(
		npm			char(15),
		nama		varchar(35),
		prodi		varchar(25),
		semester	int
	)

-- menampilkan informasi tabel
-- perintah : select name from dbname.sys.tables

-- menampilkkan informasi tabel2 di DB 'akademi"
select name from akademi.sys.tables

-- menampilkan informasi detail tabel
-- perintah :sp_help nama_tabel

-- contoh : menampilkan informasi detail tabel
sp_help mhs

-- mengubah nama tabel
-- perintah :sp_rename 'nama_tabel_lama','nama_tabel_baru'

-- contoh : mengubah nama tabel mahasiswa menjadi "mhs" jika ingin di ubah ke semula bisa di lakukan dengan cara yang sama
sp_rename 'mahasiswa','mhs'