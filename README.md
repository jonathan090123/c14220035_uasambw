- MOOD JOURNAL APP
Aplikasi Flutter untuk mencatat suasana hati harian pengguna dengan fitur lengkap authentication dan cloud database.

- FITUR APLIKASI
1.Get Started Screen
  ~ Gunakan SharedPreferences untuk isFirstLaunch.
2.Auth (Supabase)
  ~ Sign Up & Sign In dengan validasi email/password.
  ~ Tampilkan pesan kesalahan jika gagal.
3.Session Persistence
  ~ Simpan session login dengan SharedPreferences dan Supabase.auth.currentSession.
4.Mood Journal
  ~ 9 emoji mood.
  ~ Catatan opsional.
  ~ Simpan mood ke Supabase (dengan user ID).
  ~ Tampilkan history (berdasarkan user).
  ~ Hapus mood.
  ~ Sign out user

- TEKNOLOGI YG DIGUNAKAN
  ~ supabase_flutter → auth + database
  ~ shared_preferences → session & get started
  ~ flutter/material → UI

- LANGKAH" DAN SETUP
  Untuk database saya setup supabase dan copy API dan URL supabase nya di main.dart 
  1. Install dependencies -> flutter pub get
  2. flutter run / Run dari VSCode (Chrome / Android Emulator)
 
== DUMMY ACCOUNT ==
email -> itelkucing090@gmail.com
password -> user123
===================
