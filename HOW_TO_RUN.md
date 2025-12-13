# Cara Menjalankan Website E-Commerce Nike

Ini adalah proyek website e-commerce Nike berbasis PHP. Ikuti langkah-langkah berikut untuk menjalankannya di komputer lokal Anda.

## Prasyarat

Anda perlu menginstal web server lokal yang mendukung PHP dan MySQL. Pilih salah satu opsi berikut:

### Opsi 1: XAMPP (Direkomendasikan untuk Windows)
- Unduh dari: https://www.apachefriends.org/
- Instal XAMPP (termasuk Apache, MySQL, dan PHP)

### Opsi 2: WAMP
- Unduh dari: https://www.wampserver.com/

### Opsi 3: Laragon
- Unduh dari: https://laragon.org/

## Panduan Instalasi Langkah demi Langkah

### 0. Clone Repository (Dapatkan File Proyek)

Sebelum memulai, Anda memerlukan kode proyek di komputer lokal Anda.

**Opsi A: Menggunakan Git (Direkomendasikan)**
1. Buka terminal atau command prompt Anda.
2. Arahkan ke folder di mana Anda ingin menyimpan proyek.
3. Jalankan perintah ini:
   ```bash
   git clone https://github.com/Pras0106/project_UAS_PBP1.git
   ```

**Opsi B: Unduh sebagai ZIP**
1. Kunjungi repository: [https://github.com/Pras0106/project_UAS_PBP1](https://github.com/Pras0106/project_UAS_PBP1)
2. Klik tombol **Code** yang berwarna hijau.
3. Pilih **Download ZIP**.
4. Ekstrak file ZIP yang telah diunduh.

### 1. Instal XAMPP (atau server lokal pilihan Anda)
1. Unduh XAMPP dari tautan di atas
2. Jalankan installer
3. Instal ke lokasi default (biasanya `C:\xampp`)
4. Selama instalasi, pastikan **Apache** dan **MySQL** terpilih

### 2. Siapkan File Proyek

**Opsi A: Pindahkan proyek ke htdocs**
1. Salin seluruh folder `project_UAS_PBP1`
2. Tempelkan ke dalam `C:\xampp\htdocs\`
3. Proyek Anda sekarang seharusnya berada di: `C:\xampp\htdocs\project_UAS_PBP1`

**Opsi B: Biarkan di lokasi saat ini (memerlukan konfigurasi)**
- Anda dapat mengonfigurasi Apache untuk mengarah ke direktori Anda saat ini, tetapi Opsi A lebih sederhana untuk pemula

### 3. Jalankan Server
1. Buka **XAMPP Control Panel**
2. Klik **Start** di sebelah **Apache** (untuk web server)
3. Klik **Start** di sebelah **MySQL** (untuk database)
4. Keduanya harus menunjukkan status "Running" berwarna hijau

### 4. Siapkan Database

1. **Buka phpMyAdmin**
   - Buka browser Anda
   - Buka: `http://localhost/phpmyadmin`

2. **Buat Database**
   - Klik "New" di sidebar kiri
   - Nama database: `nike db` (dengan spasi, persis seperti yang ditunjukkan)
   - Penyortiran (Collation): `utf8mb4_general_ci`
   - Klik "Create"

3. **Impor Database**
   - Klik pada database `nike db` yang baru saja Anda buat
   - Klik tab "Import" di bagian atas
   - Klik "Choose File"
   - Arahkan ke: `C:\xampp\htdocs\project_UAS_PBP1\nike_db.sql`
   - Klik "Go" di bagian bawah
   - Tunggu hingga impor selesai (Anda akan melihat pesan sukses)

### 5. Akses Website

Buka browser Anda dan kunjungi salah satu URL berikut:

- **Dashboard Utama**: `http://localhost/project_UAS_PBP1/page/dashboard.html`
- **Semua Produk**: `http://localhost/project_UAS_PBP1/page/all_products.php`
- **Halaman Login**: `http://localhost/project_UAS_PBP1/page/login.html`
- **Pencarian Produk**: `http://localhost/project_UAS_PBP1/page/look_up.php`

## Halaman yang Tersedia

Proyek ini mencakup halaman-halaman berikut:

1. **dashboard.html** - Dashboard utama/beranda
2. **all_products.php** - Lihat semua produk Nike
3. **product_detail.php** - Lihat detail produk individu
4. **look_up.php** - Pencarian produk
5. **login.html** - Login pengguna
6. **men.html** - Produk pria
7. **women.html** - Produk wanita
8. **kids.html** - Produk anak-anak
9. **basketball.html** - Sepatu basket
10. **football.html** - Sepatu bola
11. **running.html** - Sepatu lari
12. **tennis.html** - Sepatu tenis
13. **training.html** - Sepatu latihan
14. **about.html** - Halaman tentang kami

## Konfigurasi Database

File-file PHP dikonfigurasi untuk terhubung ke database dengan pengaturan berikut:

```php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nike db";
```

Jika MySQL Anda memiliki konfigurasi yang berbeda, Anda perlu memperbarui nilai-nilai ini di:
- `page/all_products.php`
- `page/product_detail.php`
- `page/look_up.php`

## Pemecahan Masalah

### Masalah: Error "Connection failed"
**Solusi**: 
- Pastikan MySQL sedang berjalan di XAMPP Control Panel
- Periksa bahwa nama database persis `nike db` (dengan spasi)
- Verifikasi username MySQL adalah `root` tanpa password

### Masalah: Gambar tidak muncul
**Solusi**: 
- Pastikan semua file berada di lokasi yang benar
- Gambar harus berada di folder `image`
- Periksa bahwa path di database cocok dengan lokasi file yang sebenarnya

### Masalah: Halaman tidak ditemukan (404)
**Solusi**:
- Verifikasi Apache sedang berjalan di XAMPP
- Periksa bahwa proyek berada di `C:\xampp\htdocs\`
- Pastikan Anda menggunakan URL yang benar: `http://localhost/project_UAS_PBP1/page/...`

### Masalah: Halaman kosong atau kode PHP muncul
**Solusi**:
- Apache mungkin tidak berjalan - jalankan di XAMPP Control Panel
- PHP mungkin tidak dikonfigurasi - instal ulang XAMPP

## Struktur Proyek

```
project_UAS_PBP1/
├── page/               # Semua halaman HTML dan PHP
│   ├── dashboard.html
│   ├── all_products.php
│   ├── product_detail.php
│   ├── look_up.php
│   └── ... (halaman lainnya)
├── image/              # Gambar produk (112 gambar)
├── nike_db.sql         # File database
└── rancangan.txt       # Dokumen perencanaan proyek
```

## Informasi Database

Database mencakup:
- **7 Produk** (Nike Field General, V5 RNR, Killshot 2, Air Force 1, Zoom Vomero 5, Dunk Low SE, Dunk Low Next Nature)
- **26 Varian Produk** (warna dan gaya berbeda)
- **2 Lokasi Toko** (Grand Indonesia Jakarta, Aventura Florida)
- Beberapa tabel untuk pengguna, ulasan, favorit, tas belanja, checkout, dll.

## Langkah Selanjutnya

Setelah situs berjalan, Anda dapat:
1. Menjelajahi katalog produk
2. Melihat detail produk
3. Menguji fitur pencarian
4. Meninjau struktur database di phpMyAdmin
5. Menyesuaikan desain atau menambahkan fitur baru

## Butuh Bantuan?

Jika Anda menemui masalah:
1. Periksa bahwa Apache dan MySQL sedang berjalan (hijau di XAMPP)
2. Verifikasi database berhasil diimpor
3. Periksa konsol browser untuk error JavaScript (F12)
4. Periksa log error Apache di `C:\xampp\apache\logs\error.log`

---
