# jalin
Teknikal Test PT. Jalin Pembayaran Nusantara

- Agar program dapat berjalan, diharapkan melakukan restore dari hasil backup database dari file berikut : [Lihat Backup SQL](https://github.com/ratwareid/jalin/blob/master/database/backup_db_jalin.sql)

Answer :
1. Hal yang paling saya kuasai adalah pemrograman java website, mulai dari dasar OOP , membuat code yang clean dan efisien. saya juga cukup mahir dalam query database , memiliki analisa dan problem solving yang baik.
2. Hal yang akan saya lakukan sesuai kondisi yang diminta sbb :
- Saya akan membuat background service yang berjalan setiap 5 menit
- ketika service berjalan, saya akan query ke database untuk mencari jumlah row dengan count(id) dari table alert dimana waktu dibuat alert berkisar antara waktu sekarang - 5 menit kebelakang.
- Jika jumlah count > 100 saya akan menjalankan fungsi untuk mengirim pesan ke telegram secara otomatis yang berisi jumlah banyak nya kegagalan yang saya dapatkan dari hasil query tadi.

3. Source Code dapat dilihat di link berikut [View Code](https://github.com/ratwareid/jalin/blob/master/src/main/java/task/GenerateReportTask.java)
- Silahkan configurasi driver , username , password dan nama DB
- Buat table dengan nama 'payment' dengan struktur sebagai berikut:
client_code varchar(45) PK 
trx_date datetime 
status varchar(45) 
nominal decimal(10,0) 
admin decimal(10,0) 
trx_amount decimal(10,0)

4. Source Code dapat dilihat di link berikut [View Code](https://github.com/ratwareid/jalin/blob/master/src/main/java/task/SendAlertTask.java)
5. Berikut adalah store precedurenya :
<pre>
  CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDataToTableC`()
BEGIN
    -- Deklarasi variabel untuk menyimpan data dari tabel A dan B
    DECLARE c_cardnumber 	VARCHAR(45);
    DECLARE c_iss 		VARCHAR(45);
    DECLARE c_acq 		VARCHAR(45);
    DECLARE c_dest 		VARCHAR(45);
    DECLARE c_status_a 	VARCHAR(45);
    DECLARE c_status_iss 	VARCHAR(45);
    DECLARE c_status_acq 	VARCHAR(45);
    DECLARE c_status_dest	VARCHAR(45);

    -- Cursor untuk mengambil data dari tabel A
    DECLARE curC CURSOR FOR (
		SELECT DISTINCT a.cardnumber,a.iss,a.acq,a.dest,a.status as status_a,
		iss.status as status_iss,acq.status as status_acq,dest.status as status_dest
		FROM table_a a
		inner join table_b iss on 
		a.cardnumber = iss.cardnumber and 
		a.iss = iss.iss and
		a.acq = iss.acq and
		a.dest = iss.dest and
		a.iss = iss.source
		inner join table_b acq on 
		a.cardnumber = acq.cardnumber and 
		a.iss = acq.iss and
		a.acq = acq.acq and
		a.dest = acq.dest and
		a.acq = acq.source
		inner join table_b dest on 
		a.cardnumber = dest.cardnumber and 
		a.iss = dest.iss and
		a.acq = dest.acq and
		a.dest = dest.dest and
		a.dest = dest.source
    );
    OPEN curC;
    -- Loop untuk mengambil dan memasukkan data dari tabel A ke tabel C
    read_loop: LOOP
        FETCH curC INTO c_cardnumber,c_iss,c_acq,c_dest,c_status_a,c_status_iss,c_status_acq,c_status_dest;
        -- Memasukkan data ke dalam tabel C
        INSERT 	INTO table_c (cardnumber,iss,acq,dest,status_a,status_iss,status_acq,status_dest) 
				VALUES (c_cardnumber,c_iss,c_acq,c_dest,c_status_a,c_status_iss,c_status_acq,c_status_dest);
    END LOOP;
    
    CLOSE curC;
END
</pre>

6. Dalam gambar yang tertera terdapat sebuah class bernama ExtractData,
didalamnya ada 2 variable static progProp untuk mengambil dan membaca file .properties, sedangkan Logger dipakai untuk penulisan log di console aplikasi.
dibawahnya ada fungsi main yang akan dipanggil ketika class ini dijalankan.
Log.info("start") akan menuliskan log dengan level info yang berisi kata start
String sDate = null merupakan inisialisasi String date dengan nilai null
selanjutnya ada if untuk mengecek kondisi jika size argument dari pemanggilan aplikasi seperti " java -jar argument1 " bernilai 1 dan tidak string kosong, maka isi variable string sDate dengan argument1
jika kondisi diatas tidak valid , maka akan mengecek kondisi kedua yakni kondisi jika properties rDate tidak null maka isi variable string sDate dengan nilai dari properties dengan key rDate
jika kondisi kedua juga tidak valid, maka masuk ke else
didalam else terdapat inisialisasi calender , kemudian melakukan set ke tanggal dan waktu saat ini
kemudian mengurangi tanggalnya menjadi 1 hari dari sekarang namun di jam dan menit yang sama.
sehingga jika sekarang tanggal 7 September 2023 jam 11:00 maka hasilnya adalah 6 September jam 11:00
kemudian mengisi variable string sDate dengan tanggal tersebut dalam format yyyy-MM-dd sehingga menjadi 2023-09-06
kemudian membuat variable baru bernama rDate dan diisi nilainya dengan sDate
lalu selanjutnya lakukan inisialisasi WriteData dan melakukan generate dari nilai rDate diatas.

Semua fungsi diatas dibungkus dalam try catch, jika terjadi error maka akan ditangkap dicatch kemudian diprint diconsole dengan level error yang berisi pesan error tersebut.
