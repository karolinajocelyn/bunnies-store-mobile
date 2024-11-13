# bunnies_store 🐰

## Tugas 8

1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

Kata kunci `const` digunakan untuk menginisiasi objek yang bersifat *immutable*. Keuntungannya adalah:
- Flutter dapat mengenali bahwa variabel dengan `const` tidak akan berubah selama siklus hidup aplikasinya sehingga proses mengembangkan aplikasinya menjadi lebih mudah.
- Objek `const` dievaluasi saat waktu kompilasi, bukan saat runtime sehingga mengurangi beban kerja saat aplikasi dijalankan.
- Lebih efisien dalam penggunaan memori.

Kita sebaiknya menggunakan const jika kita tahu bahwa variable tersebut tidak akan berubah sepanjangan siklus hidup aplikasi, seperti widget, icon, text, dan lainnya.

Sebaiknya, kita menghindari penggunaan `const`  jika merasa bahwa widget perlu berubah berdasarkan input pengguna atau data yang diperoleh saat runtime.

Sumber: https://www.dhiwise.com/post/why-flutter-prefer-const-with-constant-constructor

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Pada flutter, **row** menyusun widget anak secara horizontal dari kanan ke kiri, sedangkan **column** menyusun widget anak secara vertikal dari atas ke bawah. Mereka sama-sama memiliki properti utama `maxAxisAlignment` yang mengatur penempatan widget anak di sumbu utama (horizontal untuk row, vertikal untuk column), dan `crossAxisAlignment` yang mengatur penempatan widget anak di sepanjang sumbu sekunder (vertikal untuk row, dan horizontal untuk column).

Contoh implementasi untuk row adalah:
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
  ],
)

Contoh implementasi untuk column adalah:
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Judul'),
    Text('Subjudul'),
    ElevatedButton(onPressed: () {}, child: Text('Klik Saya')),
  ],
)

Sumber: https://www.geeksforgeeks.org/row-and-column-widgets-in-flutter-with-example/

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Untuk tugas ini, saya menggunakan `TexFormField` untuk keempat input, dari nama, artist, description, dan price, tetapi untuk price tipe inputnya diatur ke TextInputType.number agar hanya dapat menerima angka. Selain itu, masih banyak elemen input flutter lain seperti checkbox (men-checklist fitur boolean), radio (memilih satu dari multiple choices), switch (checkbox dengan tampilan lebih modern), datepicker (memilih tanggal), slider (memilih hal dalam rentang tertentu), dan lainnya.

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Untuk mengatur tema aplikasi flutter agar konsisten, saya menggunakan `ThemeData` pada widget `MaterialApp` di main.dart dimana saya mendefinisikan primary color dan secondary color sehingga warnanya konsisten untuk elemen UI lain dari aplikasinya.

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Saya menangani navigasi dengan menggunakan `Navigator` dan `MaterialPageRoute` yang bekerja sebagai stack untuk menangani perpindahan page dari aplikasi. Dengan Navigator.pushReplacement, saya menambahkan page baru ke stack dari navigation, lalu ketika menekan tombol "submit" pada add_item_form.dart, aplikasi akan kembali ke halaman sebelumnya. Saya juga memakai Navigator.push ketika membuka page add product dari halaman utama.
