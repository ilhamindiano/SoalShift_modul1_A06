# SoalShift_modul1_A06
1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah
   dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah
   nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh
   file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari
   jumat pada bulan Februari.
   Hint: Base64, Hexdump
   
   Jawaban :
   Langkah-Langkah :
   a) unzip file nature.zip
   b) buatlah base script unutk menenkripsikan isi file nature.zip
   c) lalu buatlah fungsi perulangan yang isinya :
        i)  decrypt menggunakan base64 -d
        ii) reverse hexdump menggunakan xxd -r agar menjadi bentuk file
   d) lalu buatlah cronjob dengan mengetikkan crontab -e dan atur waktu menjadi :
    14 14 14 2 * bash /home/hafidzasqalany28/nature/soal1.sh
    0   0  * 2 5 bash /home/hafidzasqalany28/nature/soal1.sh
2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
   untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
   Laporan yang diminta berupa:
        a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
        b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
        c. Tentukan tiga product yang memberikan penjualan(quantity) 
           terbanyak berdasarkan tiga product line yang didapatkan pada soal
           poin b.
           
   jawaban :
   Langkah-Langkah :
   a) buatlah script awk untuk menyortir data agar hanya mendapatkan tabel negara dan quantity pada tahun 2012.
   b) total semua quantity yang ada pada setiap negara.
   c) tampilkan negara yang mempunyai nilai quantity terbanyak pada tahun 2012 dengan menggunakan perulangan.
   d) buatlah script awk untuk menyortir data agar menampilkan tabel product line dan quantity pada negara yang di dapatkan pada poin b.
   e) total semua quantity pada product line.
   f) tampilkan 3 product line yang mempunyai quantity terbanyak dengan menggunakan perulangan.
   g) buatlah script awk untuk menyortir data agar menampilkan tabel product dan quantity pada product line yang didapatkan pada poin f.
   h) total semua quantity pada product.
   i) tampilkan 3 product yang mempunyai quantity terbanyak dengan menggunakan perulangan.
