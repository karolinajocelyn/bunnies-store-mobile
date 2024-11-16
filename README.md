# bunnies_store 🐰

## Tugas 9

1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

Model untuk JSON akan mempermudah pengelolaan data dari API. Model bisa menyediakan struktur yang jelas untuk memetakan JSON ke object dari Flutter. Kalau kita tidak membuat model terlbeih dahulu, hal ini tidak selalu menyebabkan error, tetapi akan menyulitkan pengelolaan data karena kita harus bekerja dengan struktur JSON yang mentah yang rentan terhadap kesalahan seperti typo dan perubahan struktur di backend.

2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

Library HTTP digunakan untuk komunikasi HTTP antara Flutter dan backend dari Django. Contohnya ketika mengambil data dari API untuk daftar produk dan mengirimkan data ke API untuk data registration pengguna. 

3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest adalah library yang digunakan untuk membantu mengelola sesi dan autentikas berbasis cookie. Seperti di Django, kegunaannya adalah untuk menyimpan status login pengguna di Flutter. CookieRequest secara otomatis menyertakan cookie pada setiap permintaan HTTP ke backend, sehingga pengguna tetap terautentikasi. Instance ini perlu dibagikan ke semua komponen agar setiap permintaan http memiliki status autentikasi yang sama. Dengan itu, cookies dan tokens akan tetap konsisten di seluruh aplikasi.

4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

- User memasukkan data melalui form di Flutter
- Django memproses datanya, menyimpan ke database, dan mengembalikan respons JSON.
- Respons JSON akan diterima di Flutter, lalu dikonversi menjadi model dengan product_entry.dart, lalu ditampilkan.

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Untuk login, mekanisme autentikasinya adalah sebagai berikut:
- Flutter akan mengirimkan username dan password ke endpoint Django ketika login.
- Django akan melakukan validasi credential dan mengembalikan cookie autentikasi
- Cookie disimpan di CookieRequest dan digunakan di permintaan berikutnya.

Untuk register, mekanisme autentikasinya adalah sebagai berikut:
- Flutter mengirimkan data registrasi ke endpoint Django.
- Django akan validasi data, membuat akun baru, dan mengembalikan respons sukses.

Untuk logout, mekanisme autentikasinya adalah:
- Flutter memanggil endpoint logout Django
- Django akan menghapus sesi pengguna dan membatalkan cookie autentikasi.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

- Mempersiapkan model di Django agar semuanya return JSON
- Membenarkan urls.py di Django
- Membuat model product_entry.dart di Flutter untuk memetakan data JSON dari API Django
- Menggunakan library http untuk mengirimkan dan menerima data dari url
- Mengimplementasikan fungsi di ProductService untuk mengelola permintaan HTTP
- Membuat halaman daftar product di Flutter dengan FutureBuilder
- Membuat halaman detail produk untuk menampilkan informasi lengkap per produk
- Mengimplementasikan login, register, dan logout dengan CookieRequest
- Menambahkan navigasi dengan navigator.
