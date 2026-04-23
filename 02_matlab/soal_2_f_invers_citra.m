% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 2f — Visualisasi Citra Enkripsi
%  Nama  : <Muhammad Farand Danendra> 
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal:  23 April 2026
% ===================================================== 
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])


P = [120,  75, 200; 
    80,   4,  35; 
    55,  90, 170];


A = [3, 5, 2; 
    1, 4, 5; 
    5, 1, 5];

% Operasi Enkripsi
E = A * P;


figure('Name', 'Hasil Enkripsi Citra Logo (NIM: 2510514025)', 'Position', [100 100 800 400]);

% Subplot 1: Citra Piksel Asli
subplot(1, 2, 1);
% Menggunakan imshow(P, []) agar rentang warna disesuaikan otomatis dari nilai min-max
imshow(P, []); 
title('Blok Piksel Asli (P)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Kolom (j)');
ylabel('Baris (i)');
colorbar; % Menampilkan skala nilai piksel

% Subplot 2: Citra Piksel Terenkripsi
subplot(1, 2, 2);
% Menggunakan imshow(E, []) untuk memvisualisasikan piksel yang telah diacak
imshow(E, []);
title('Blok Terenkripsi (E)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Kolom (j)');
ylabel('Baris (i)');
colorbar; % Menampilkan skala nilai piksel yang telah membesar

% Judul utama untuk keseluruhan figure
sgtitle('Perbandingan Citra Sebelum dan Sesudah Transformasi Matriks (Enkripsi)', 'FontSize', 14);