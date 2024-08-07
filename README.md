
# Expense Tracker

An app for tracking expenses
Built with Flutter, this app allows users to add, view, and categorize their expenses. It is also provides an intuitive user interface.

This mobile application built as part of the DOT Malang Internship Test.

## Try it Now!

Install ExpenseTracker on Android with this .apk file

[![APK](https://img.shields.io/badge/Expense%20Tracker.apk-download-green?style=for-the-badge&logo=android)](https://drive.google.com/file/d/12yY2VdFlIPqumAR5mBDNP3iJ-0H3qq43/view?usp=sharing)

## Jawaban Tes Pengetahuan
### 1. Sudah berapa lama anda mulai menggunakan Flutter?
Saya mulai menggunakan Flutter sejak tahun 2023. Pada saat itu, saya mendapatkan kesempatan untuk menerima beasiswa IDCamp 2023 dengan fokus pembelajaran Multi-Platform App Development hingga tingkat Expert. Selama waktu tersebut, saya telah mengerjakan beberapa aplikasi, mulai dari aplikasi sederhana hingga aplikasi yang cukup kompleks. Pengalaman ini membantu saya memahami berbagai fitur dan kemampuan Flutter untuk pengembangan aplikasi mobile. 

Salah satu aplikasi yang paling mengesankan bagi saya adalah MoneyTrack yang merupakan aplikasi Flutter pertama saya dengan fitur yang cukup kompleks, seperti pencatatan transaksi, pengingat tagihan, budgeting, dan laporan keuangan. Aplikasi ini diintegrasikan dengan database remote, Google Firebase.


### 2. Apa saja library Flutter yang sering atau biasa anda pakai? Jelaskan kegunaannya bagi anda.
- **provider**: Saya suka menggunakan library ini untuk state management, karena menurut saya simpel dan sederhana.

- **bloc**: Saya menggunakan library ini untuk state management yang lebih kompleks, karena menurut saya library ini dapat memenuhi kebutuhan state management yang rumit.

- **intl**: Digunakan untuk format tanggal, waktu, dan mata uang.

- **sqflite**: Digunakan untuk SQLite database di Flutter, agar penyimpanan data lokal lebih efisien.

- **shared_preferences**: Digunakan untuk menyimpan data berupa Key-Value Pair, contohnya menyimpan data preferensi pengguna, seperti tema, dll.

- **http**: Digunakan untuk melakukan request HTTP. Biasanya saya gunakan untuk berinteraksi dengan API.


### 3. Jelaskan penerapan clean code atau design pattern yang biasa anda gunakan dan manfaatnya untuk anda.
Saya masih belajar dalam menerapkan clean architecture dalam pengembangan aplikasi mobile. Hal ini saya lakukan agar dapat membangun aplikasi yang lebih mudah di rawat/maintain kedepannya. Cara penerapan dari clean architecture sendiri adalah dengan memisahkan kode menjadi beberapa layer/lapisan dengan tanggung jawab dari masing-masing layer yang berbeda. Prinsip utama dari clean architecture sendiri adalah memisahkan kode berdasarkan fungsi untuk meningkatkan modularitas, readability, dan memudahkan pemeliharaan.

Untuk design pattern yang saya gunakan dan masih saya pelajari adalah MVVM (Model-View-ViewModel). Model terdiri dari data/sumber data dan logika bisnis dari aplikasi. View merupakan komponen yang bertanggung jawab untuk menampilkan UI kepada pengguna dan di dalam View tidak boleh ada logika bisnis. ViewModel berfungsi sebagai penghubung antara View dengan Model, digunakan untuk mengambil data dari Model serta menampilkan data pada View (UI) dan mengelola state dari aplikasi.


### 4. Apakah tantangan terbesar yang pernah anda temui dalam mengerjakan aplikasi Flutter dan bagaimana anda menyelesaikannya dari sisi engineering? Misal dari sisi Android dan iOS.
Menurut saya, terdapat beberapa tantangan yang bervariasi dalam membuat aplikasi Flutter.
1. Memastikan aplikasi dapat berjalan dengan baik pada berbagai perangkat/ukuran layar.
- Cara pertama adalah dengan melakukan testing pada berbagai perangkat/emulator.
- Memanfaatkan MediaQuery untuk mengatur layout secara responsif.
2. Mengelola state management yang kompleks.
- Solusinya adalah dengan memanfaatkan library state management seperti Provider, Bloc, dll untuk dapat memanage state secara efisien.
- Menerapkan prinsip Separation of Concerns dengan memanfaatkan design pattern MVVM atau Clean Architecture untuk memisahkan logika bisnis dari UI.
3. Integrasi dengan sumber data.
- Ketika ingin menggunakan sumber data lokal, dapat memanfaatkan library seperti SQFlite atau SharedPreferences untuk data yang simpel.
- Ketika ingin menggunakan sumber data remote, dapat memanfaatkan library http untuk melakukan request HTTP.
4. Memastikan performa dan keamanan aplikasi
- Melakukan testing.
- Menggunakan sistem mekanisme autentikasi yang aman, seperti Firebase Authentication.


### 5. Jelaskan teknik-teknik apa saja yang dapat meningkatkan performance dan keamanan sebuah aplikasi Flutter.
- Memanfaatkan Asynchronous Programming.

Hal ini dapat dilakukan dengan memanfaatkan operasi sepert *Stream* atau *Future* untuk memastikan aplikasi tetap berjalan dengan lancar ketika ada background operation atau operasi yang cukup berat.

- Manajemen state yang baik dan efisien.

Hal ini dapat dilakukan dengan memanfaatkan state management dengan tepat dan baik, dapat menggunakan library seperti Provider atau Bloc untuk mengelola state dari aplikasi dengan baik dan efisien. Implementasi dari state management nya pun harus diperhatikan dengan baik.

- Penggunaan "Lazy" List.

Contohnya dengan menggunakan *ListView.builder* atau *GridView.builder* untuk menampilkan data secara dinamis.

- Melakukan Testing

Testing dilakukan guna memastikan bahwa aplikasi dapat berjalan dengan lancar dan aman. Terdapat beberapa jenis testing, seperti unit testing dan usability testing.

- Enkripsi Data.

Melakukan enkripsi pada data yang bersifat sensitif.

- Memastikan keamanan sumber data remote.

Selalu menggunakan sumber data HTTPS.

- Implementasi Autentikasi.

Terdapat tools yang dapat digunakan dengan mudah seperti Firebase untuk memastikan mekanisme autentikasi yang aman.
    
## 🔗 Profile
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://bit.ly/DzakyABWPortfolio)

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/dzakybewe/)


