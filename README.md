# SoalShift_modul1_A06


   1) Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash    script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. 
   Hint: Base64, Hexdump

      Jawaban :

    Langkah-Langkah :
    a) unzip file nature.zip.
    b) lalu buatlah bash script di dalam folder ekstrak file nature.zip.
    c) gunakan fungsi perulangan agar dapat mendecrypt semua file berekstensi .jpg yang ada di dalam folder nature sekaligus.
       <code>
       for i in *.jpg;
       do
       done
       <code>
    d) decrypt isi file menggunakan base64 –d. 
       <code>
       base64 -d $i
       <code>
    e) pipe hasil ouput dari base64 –d. setelah itu reverse hexdump menggunakan xxd -r agar menjadi bentuk file. Dan simpan hasil       file yang udah jadi di folder hex.
       <code>
       | xxd -r > hex/$i
       <code>
    f) lalu buatlah cronjob dengan mengetikkan crontab -e dan atur waktu menjadi :
       <code>
       14 14 14 2 5 bash /home/hafidzasqalany28/nature/soal1.sh
       <code>

   2) Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:

   a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
   b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
   c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

jawaban :

    Langkah-Langkah :
    a) buatlah script awk untuk menyortir data agar hanya mendapatkan tabel negara dan quantity pada tahun 2012 dengan      menggunakan syntax awk –F “,”. Syntax tersebut berfungsi agar awk dapat menyortir data per-tabel.
       <code>
       awk -F "," '{
               if ($7 == "2012") 
       }' WA_Sales_Products_2012-14.csv

       <code>
    b) total semua quantity(berada pada tabel ke 10($10)) yang ada pada setiap negara(berada pada tabel ke 1($1))
       <code>
       total[$1] = total[$1] + $10
       <code>
    c) tampilkan negara yang mempunyai nilai quantity terbanyak pada tahun 2012 dengan menggunakan perulangan.
       <code>
       max=0
       for (i in total) {
                if (total[i] > max) {
                        max = total[i]
                        negara = i
                }
        }
        print "a)", negara, max
        <code>
    d) buatlah script awk untuk menyortir data agar mendapatkan tabel product line(berada pada tabel ke 4($4)) dan quantity(berada pada tabel ke 10($10)) pada negara dengan quantity terbanyak yang telah di dapatkan yaitu United States.
       <code>
       awk -F "," '{
            if ($7 == "2012" && $1 == "United States") 
       }' WA_Sales_Products_2012-14.csv
       <code>
    e) total semua quantity(berada pada tabel ke 10($10)) pada product line(berada pada tabel ke 4($4)). 
       <code>
       productline[$4] = productline[$4] + $10
       <code>
    f) tampilkan 3 product line yang mempunyai quantity terbanyak dengan menggunakan perulangan.
       <code>
       maxpl1=0
       maxpl2=0
       maxpl3=0
       pl1=0
       l2=0
       pl3=0
       for (i in productline) {
                if (productline[i] > maxpl1) {
                        maxpl3 = maxpl2
                        maxpl2 = maxpl1
                        maxpl1 = productline[i]
                        pl3 = pl2
                        pl2 = pl1
                        pl1 = i
                }
                else if (productline[i] > maxpl2) {
                if (productline[i] > maxpl1) {
                        maxpl3 = maxpl2
                        maxpl2 = maxpl1
                        maxpl1 = productline[i]
                        pl3 = pl2
                        pl2 = pl1
                        pl1 = i
                }
                else if (productline[i] > maxpl2) {
                        maxpl3 = maxpl2
                        maxpl2 = productline[i]
                        pl3 = pl2
                        pl2 = i
                }
                else if (productline[i] > maxpl3) {
                        maxpl3 = productline[i]
                        pl3 = i
                }
        } 
                 maxpl2 = productline[i]
                 pl3 = pl2
                 pl2 = i
                }
                else if (productline[i] > maxpl3) {
                        maxpl3 = productline[i]
                        pl3 = i
                }
        } 
        print "b)", pl1, maxpl1
        print "  ", pl2, maxpl2
        print "  ", pl3, maxpl3
       <code>
    g) buatlah script awk untuk menyortir data agar menampilkan tabel product dan quantity pada 3 product line terbanyak yang didapatkan yaitu Personal Accessories, Camping Equipment, dan Outdoor Protection.
       <code>
       awk -F "," '{
             if ($7 == "2012" && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 ==  "Outdoor Protection"))
       }' WA_Sales_Products_2012-14.csv
       <code>
    h) total semua quantity pada product.
       <code>
       product[$6] = product[$6] + $10
       <code>
    i) tampilkan 3 product yang mempunyai quantity terbanyak dengan menggunakan perulangan.
       <code>
       prodk1=0
       prodk2=0
       prodk3=0
       maxprodk1=0
       maxprodk2=0
       maxprodk3=0
         for (i in product) {
                if (product[i] > maxprodk1) {
                        maxprodk3 = maxprodk2
                        maxprodk2 = maxprodk1
                        maxprodk1 = product[i]
                        prodk1 = prodk2
                        prodk2 = prodk1
                        prodk1 = i
        prodk3=0
        maxprodk1=0
        maxprodk2=0
        maxprodk3=0
        for (i in product) {
                if (product[i] > maxprodk1) {
                        maxprodk3 = maxprodk2
                        maxprodk2 = maxprodk1
                        maxprodk1 = product[i]
                        prodk1 = prodk2
                        prodk2 = prodk1
                        prodk1 = i
                }
                else if (product[i] > maxprodk2) {
                        maxprodk3 = maxprodk2
                        maxprodk2 = product[i]
                        prodk3 = prodk2
                        prodk2 = i
                }
                else if (product[i] > maxprodk3) {
                        maxprodk3 = product[i]
                        prodk3 = i
                }
        }
        prodk1 = i
                }
                else if (product[i] > maxprodk2) {
                        maxprodk3 = maxprodk2
                        maxprodk2 = product[i]
                        prodk3 = prodk2
                        prodk2 = i
                }
                else if (product[i] > maxprodk3) {
                        maxprodk3 = product[i]
                        prodk3 = i
                }
        }
        print "c)" prodk1, maxprodk1
        print      prodk2, maxprodk2
        print      prodk3, maxprodk3
        <code>

   3) Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:

   a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt 
    b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya. 
    c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus. 
    d. Password yang dihasilkan tidak boleh sama.

    jawaban :
        Langkah-Langkah : 
        a) Masukkan integer untuk mengetahui bilangan awal 
        b) Masukkan fungsi while test -e untuk mengecheck apakah telah terdapat file dengan nama yang sama 
        c) Jika tidak ada maka file berinisial Password.txt akan terbuat, jika ada maka akan terbuat file baru bernama Password1.txt dan seterusnya 
        d) Masukkan integer untuk setiap file bernama fname kemudian touch untuk membuat file kosong 
        e) Terakhir masukkan fungsi head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12 untuk membuat string berisi 12 karakter acak berhuruf kapital dan kecil serta angka untuk menjadi Password kemudian save di file fname kosong yang telah terbuat

   4) Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:

   a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
    b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.
    c. setelah huruf z akan kembali ke huruf a
    d. Backup file syslog setiap jam.
    e. dan buatkan juga bash script untuk dekripsinya. jawaban :
  
      Langkah-Langkah :
    a) deklarasikan variabel date agar menyimpan data untuk memiliki format nama file “jam:menit tanggal- bulan-tahun”.
    b) deklarasikan variabel agar dapat menyimpan data jam yang akan di print.
    c) melihat semua proses syslog yang telah berjalan
    d) mengubah data syslog menjadi hexdump dan sortir menggunakan awk
    e) membuat fungsi agar isi dari file poin a mempunyai ketentuan sesuai poin soal a-c.
    f) membuat file crontab :
    0 * * * * bash /home/hafidzasqalany28/soal4.sh

   5) Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

   a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah. 
   b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13. 
   c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1. 
   d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

    Langkah-Langkah :
    a) Masukkan fungsi cat untuk mengetahui data di dalam directory var/log/syslog kemudian pipe hasilnya
    b) Masukkan fungsi awk yang bertujuan menyaring data tersebut sehingga hanya string yang memiliki baris kurang dari 13 saja yang ditampilkan kemudian pipe data tersebut
    c) Masukkan fungsi grep -i yang bertujuan untuk menampilkan string yang di dalamnya terdapat kata cron serta bersifat incase-sensitive
    d) Masukkan fungsi grep -v yang bertujuan untuk mencegah menampilkan string yang di dalamnya terdapat kata sudo
    e) Kemudian save file ke dalam directory /home/[user]/modul1
    f) Terakhir buatlah crontab 2-30/6 * * * * /home/[user]/[script] untuk membuat schedule bash script akan berjalan setiap 6 menit diantara menit ke 2 hingga menit ke 30

