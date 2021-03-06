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
sp_rename 'mhs','mahasiswa'

/* menambahkan kolom/field pada suatu table
	perintah : alter table <namatable> add <namakolom/field tipedata labarkolom>
	contoh	: menmbahkan kolom/field alamat pada table mahasiswa
*/ 
alter table mhs add alamat varchar(35)

/* menghapus kolom/field dari suatu table
	perintah : alter table <namatable> drop colum <namakolom>
	contoh : menghapus kolom/field alamat dari table mahasiswa
*/ 
alter table mhs drop column alamat

/* mengubah nama kolom/field pada table
	perintah : sp_rename 'namatable.nama_field_lama','nama_field_baru',column
	contoh : mengubah nama kolom/field "prodi" menjadi "programStudi" pada table
*/
sp_rename 'mhs.prodi','mhs.programStudi','column'
sp_rename 'mhs.programStudi','mhs.prodi','column'
alter table mhs drop column mhs.programStudi
sp_help mhs

/* menghapus table
	perintah :drop table <nama_table>
	contoh	:menghapus table mahasiswa
*/
drop table mhs
sp_helpdb

/* CONSTRAINT
	1. Primary key(PK)	: kunci utama (menjamin keunikan suatu table)
*/

-- contoh	: membuat tble mahasiswa (npm, nama,prodi,semester) PK :npm di awal
-- cara 1
create table mahasiswa
(
	npm			char(15) primary key,
	nama		varchar(35),
	prodi		varchar(25),
	semester	int
)
sp_help mahasiswa

-- cara 2
-- contoh	: membuat tble mahasiswa (npm, nama,prodi,semester) PK :npm di akhir
create table mahasiswa2
(
	npm			char(15),
	nama		varchar(35),
	prodi		varchar(25),
	semester	int,
	primary key(npm,nama)
)
sp_help mahasiswa2

/* membuat constraint PK dengan nama sendiri
	perintah : constraint nama_constraint jenis_constraint
	contoh	: membuat tble mahasiswa (npm, nama,prodi,semester) PK :npm dengan nama constraint "PKmhs"
*/

-- cara 3
create table mahasiswa3
(
	npm			char(15),
	nama		varchar(35),
	prodi		varchar(25),
	semester	int,
	constraint PKmhs primary key(npm)
)
sp_help mahasiswa3

-- cara 4
create table mahasiswa4
(
	npm			char(15) constraint PKmhs4 primary key(npm),
	nama		varchar(35),
	prodi		varchar(25),
	semester	int
)
sp_help mahasiswa4

/* menambahkan constraint ke suatu table
	perintah	: alter table <nama_table> add constraint <nama_constraint> jenis_constaint(kolom)
	contoh	: table mahasiswa belum ada constraint PK akan di tambahkan constrain PK dengan nama PKmahasiswa
*/
sp_help mahasiswa5

create table mahasiswa5
(
	npm			char(15) not null,
	nama		varchar(35),
	prodi		varchar(25),
	semester	int
)

-- menambahkan constraint PK dengan nama PKmahasiswa
alter table mahasiswa5 add constraint PKmahasiswa primary key(npm)
sp_help mahasiswa5

/* menghapus constraint dari suatu table
	perintah : alter table <nama_table> drop constraint <nama_constraint>
	contoh	: menghapus constraint PK dari table mahasiswa5
*/
alter table mahasiswa5 drop constraint PKmahasiswa
sp_help mahasiswa5

/* 2. Foreign key (PK) : kunci tamu (refrensi dari table lain)
	contoh	:	membuat table mahasiswa6 (npm, nama, semester, kodeprodi) PK : npm FK : kodeprodi
				membuat table prodi (kodeprodi, namaprodi) PK : kodeprodi
*/

-- cara 1
create table prodi
(
	kodeprodi		varchar(35) primary key,
	namaprodi		varchar(25),
)

create table mahasiswa6
(
	npm			char(15) primary key,
	nama		varchar(35),
	semester	int,
	kodeprodi	varchar(35) references prodi(kodeprodi)
)
sp_help mahasiswa6