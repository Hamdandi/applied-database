/* nama	:Muhammad hamdandi
	NPM	:2024240030
	tgl	:1/3/22
*/

/* membuat Database yang baru
	Perintah	:
	create database <nama_database>
	contoh		:
	membuat database dengan nama "akademik"
*/
create database akademik

/*	menampilkan informasi database menggunakan  :
		sp_helpdb
	menampilkan informasi database tertentu		:
		SP_helpdb <nama_database>
*/
sp_helpdb
sp_helpdb akademik

/*	mengubah nama database :
		perintah :
			sp_renamdb 'nama_database_lama','nama_database_baru'
		perintah :
			sp_rename 'nama_database_lama','nama_database_baru','Database'
		nb	:jika menggunakan "sp_rename" harus menggunakan 'Database' di akhir
*/
sp_renamedb 'akademik','akademiku' 
sp_renamedb 'akademiku','akademi'
sp_rename 'akademi','sekolah','Database'
sp_rename 'sekolah','akademi','Database'

/*	menghapus Database menggunakan perintah drop
	perintah : 
		drop database <nama_database>
*/
drop database akademi
create database akademi

----------------------------------------
/*	mengaktifkan database baru
	perintah	:
		use <nama_database>
*/
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
-- membuat table mahasiswa dengan isi (npm,nama,prodi,semester)
create table mahasiswa
(
	npm			char(15),
	nama		varchar(35),
	prodi		varchar(25),
	semester	int
)

/*	menampilkan informasi table
		perintah	:
			select name from dbname.sys.tables
	menampilkan informasi detail table
		perintah	:
			sp_help <nama_table>
*/
select name from akademi.sys.tables
sp_help mahasiswa

/*	mengubah nama table
		perintah :
			sp_rename 'nama_table_lama','nama_table_baru'
	nb	: jika ingin mengembalika seperti semula atau mau di ubah kembali bisa menggunakan cara yg sama
*/
sp_rename 'mahasiswa','mhs'		
sp_help mhs