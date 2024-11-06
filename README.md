# bunnies_store 🐰

## Tugas 7

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

**StatelessWidget** adalah widget yang tidak memiliki keadaan internal yang dapat berubah. Artinya, tampilan dari widget ini akan selalu sama selama masa hidupnya, karena tidak menyimpan atau mengelola data yang dapat berubah. Contoh dari StatelessWidget termasuk `Icon`, `IconButton`, dan `Text`. StatelessWidget biasanya digunakan untuk elemen UI yang tidak berubah setelah dibuat, seperti ikon atau teks statis.

Sebaliknya, **StatefulWidget** adalah widget yang memiliki keadaan internal yang dapat berubah. Widget ini dapat memperbarui tampilannya sebagai respons terhadap interaksi pengguna atau perubahan data. Beberapa contoh dari StatefulWidget adalah `Checkbox`, `Radio`, `Slider`, `InkWell`, `Form`, dan `TextField`. StatefulWidget cocok untuk elemen UI yang membutuhkan pembaruan tampilan sesuai dengan perubahan dalam keadaan atau data yang disimpan, misalnya sebuah form input atau slider yang bisa berubah nilainya.

Perbedaan utama antara keduanya terletak pada kemampuan untuk mengelola dan merespons perubahan keadaan internal. **StatelessWidget** tidak dapat berubah setelah diinisialisasi, sementara **StatefulWidget** dapat memperbarui dirinya sesuai dengan perubahan yang terjadi pada data atau interaksi pengguna. 

sumber = (https://docs.flutter.dev/ui/interactivity#:~:text=Stateful%20and%20stateless%20widgets,-%23&text=A%20widget%20is%20either%20stateful,are%20examples%20of%20stateless%20widgets.)

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

- **MaterialApp**: Ini adalah widget root dari aplikasi Flutter yang memberikan tema dasar dan routing. MaterialApp mengatur tema global aplikasi, seperti warna utama dan latar belakang, serta menentukan halaman utama yang akan ditampilkan saat aplikasi dijalankan.

- **Scaffold**: Scaffold menyediakan struktur dasar halaman di Flutter, termasuk AppBar di bagian atas dan area konten di dalam body. Pada proyek ini, Scaffold digunakan untuk menampilkan AppBar, body, dan komponen-komponen lain pada halaman utama aplikasi.

- **AppBar**: AppBar adalah bilah atas aplikasi yang menampilkan judul aplikasi, yaitu "Bunnies Store". Ini juga memberikan navigasi visual yang familiar bagi pengguna.

- **Column**: Widget ini digunakan untuk menyusun widget lain secara vertikal (dari atas ke bawah). Dalam proyek ini, Column menyusun beberapa elemen secara vertikal, seperti teks sambutan dan daftar tombol.

- **Padding**: Padding menambahkan ruang di sekitar widget. Dalam proyek ini, Padding digunakan untuk memberikan jarak antar widget, agar tampilan lebih rapi dan mudah dibaca.

- **Text**: Text digunakan untuk menampilkan teks statis. Dalam proyek ini, Text digunakan untuk menampilkan judul aplikasi, teks sambutan, dan nama setiap tombol (misalnya "View Product List", "Add Product", dan "Logout").

- **GridView.count**: `GridView.count` menampilkan widget dalam bentuk grid dengan jumlah kolom yang ditentukan. Di sini, GridView.count digunakan untuk menampilkan tombol dalam tata letak grid dengan tiga kolom.

- **InkWell**: InkWell adalah widget yang merespons sentuhan dengan efek tinta yang mengembang, memberikan umpan balik visual saat pengguna menyentuh area tertentu. Pada proyek ini, InkWell digunakan untuk membungkus tombol agar setiap tombol bereaksi saat ditekan, seperti memunculkan Snackbar.

- **Snackbar**: Snackbar adalah widget untuk menampilkan pesan singkat yang sementara di bagian bawah layar. Dalam proyek ini, `Snackbar` digunakan untuk memberi notifikasi kepada pengguna saat tombol ditekan, seperti “Kamu telah menekan tombol Lihat Daftar Produk”.

- **Card**: Card adalah widget dengan tampilan berbayang yang sering digunakan untuk menampilkan informasi dalam bentuk kotak. Dalam proyek ini, Card digunakan untuk menampilkan informasi tentang NPM, nama, dan kelas pengguna di bagian atas halaman.

- **Icon**: Icon digunakan untuk menampilkan ikon grafis di dalam aplikasi. Pada proyek ini, ikon seperti Icons.list, Icons.add, dan Icons.logout digunakan sebagai visual dari tombol untuk memudahkan pengguna memahami fungsinya.

- **Material**: Material adalah widget yang menyediakan efek material design seperti bayangan dan warna latar belakang. Di sini, Material digunakan untuk memberikan warna latar pada tombol-tombol utama, dengan masing-masing tombol memiliki warna pastel yang berbeda.

- **Center**: Center digunakan untuk menempatkan widget lain di tengah area yang tersedia. Dalam proyek ini, Center digunakan agar konten utama terlihat rapi dan berpusat di layar.

3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Dalam Flutter, fungsi setState digunakan untuk memberi tahu framework bahwa ada perubahan pada state internal sebuah widget yang memerlukan pembaruan tampilan. Ketika setState dipanggil, Flutter menandai widget tersebut sebagai "kotor" (dirty), yang berarti widget akan dibangun ulang pada frame berikutnya untuk mencerminkan perubahan state.

Namun, penting untuk tidak memanggil setState selama fase build. Fase build adalah saat di mana Flutter membangun dan mengonfigurasi widget untuk frame berikutnya. Memanggil setState selama fase ini dapat menyebabkan inkonsistensi dan kesalahan, karena widget sedang dalam proses dibangun. Kesalahan ini biasanya ditandai dengan pesan: "SetState or markNeedsBuild called during build."

Untuk menghindari masalah ini, pastikan setState hanya dipanggil di luar metode build atau dalam respons terhadap interaksi pengguna, seperti penekanan tombol atau hasil dari operasi asinkron. Dengan demikian, Anda memastikan bahwa pembaruan state terjadi pada waktu yang tepat tanpa mengganggu proses build Flutter.

sumber: (https://www.dhiwise.com/post/how-to-resolve-flutter-setstate-called-during-build-issue)

4. Jelaskan perbedaan antara `const` dengan `final`.

Perbedaan utama antara `const` dan `final` di Dart adalah pada waktu penentuan nilainya. `final` digunakan untuk variabel yang nilainya hanya ditetapkan sekali, tetapi penetapan ini bisa dilakukan saat aplikasi berjalan (runtime). Ini cocok untuk nilai yang mungkin tidak diketahui pada waktu kompilasi, seperti waktu saat ini dengan `DateTime.now()`.

Sebaliknya, `const` digunakan untuk nilai yang sepenuhnya konstan dan harus sudah diketahui pada waktu kompilasi. Artinya, nilai `const` tidak bisa bergantung pada data atau operasi yang hanya bisa diperoleh saat runtime. Nilai `const` benar-benar tetap dan tidak bisa diubah atau diinisialisasi ulang, membuatnya cocok untuk konstanta seperti angka tetap atau daftar warna yang sudah didefinisikan.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

- Pertama, saya membuat folder baru sebagai direktori utama dari projectnya.
- Saya melakukan `flutter create bunnies-store` untuk menginisiasi project yang baru.
- Saya menambahkan warna pada main.dart dan juga menambahkan file menu.dart yang mirip dengan tutorial tetapi dengan judul file dan juga tema warna yang berbeda.
- Saya melakukan `git init` dan `add-commit-push` agar project saya terlihat di github.