% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 3 — Segmentasi Pelanggan dan komposisi fungsi harga 
%  Nama  : <Muhammad Farand Danendra> 
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 2026-04-23 
% ===================================================== 

disp(['Tanggal & Waktu Eksekusi: ', datestr(now)]);

% --- Lanjutan Script MATLAB untuk 3(d) ---
disp('--- Verifikasi Soal 3.d ---')

% Mendefinisikan variabel simbolik
syms x

% Mendefinisikan fungsi awal f(x)
f = 8 * x + 7;

% 1. Mencari Invers menggunakan finverse
f_inv = finverse(f);
fprintf('Invers fungsi f^-1(x) adalah: %s\n', char(f_inv));

% 2. Mencari Volume Pembelian dengan target pendapatan 807
target_rev = 8 * 100 + 2 + 5; % Hasilnya 807

% Substitusi nilai target pendapatan ke dalam x pada fungsi invers
volume_x = subs(f_inv, x, target_rev);

% Menampilkan hasil
fprintf('Target Pendapatan (ribu Rp) : %d\n', target_rev);
fprintf('Volume Pembelian (unit)     : %s\n', char(volume_x));