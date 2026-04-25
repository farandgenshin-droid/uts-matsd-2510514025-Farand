% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 5 — Konvergensi Customer Lifetime Value dan Kekontinuan Biaya 
%  Nama  : Muhammad Farand Danendra
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 24 April 2026 
% ===================================================== 

% Tampilkan timestamp eksekusi
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])

% --- Inisialisasi Parameter Berdasarkan NIM ---
N = 25;
a = floor(N/10);       % a = 2
b = mod(N,10);         % b = 5
K = a + b + 1;         % K = 8
theta0 = (a * 30) + (b * 5); % 85
alpha_lr = 0.001 * (b + 1);  % 0.006

% =====================================================
% Bagian 5.1(b): Verifikasi Limit Menggunakan syms
% =====================================================
syms x real;

% Definisi fungsi
f1 = (x^2 - K^2) / (x - K);
f2 = (sqrt(x + (K+1)^2) - (K+1)) / x;
f3 = ((a+2)*x^3 + b*x + 7) / (x^3 - x + K);

% Hitung limit via MATLAB
L1_matlab = limit(f1, x, K);
L2_matlab = limit(f2, x, 0);
L3_matlab = limit(f3, x, inf);

disp('--- Verifikasi Hasil Limit (MATLAB vs Manual) ---');
disp(['L1 MATLAB = ', char(L1_matlab), ' | Manual = 16']);
disp(['L2 MATLAB = ', char(L2_matlab), ' | Manual = 1/18']);
disp(['L3 MATLAB = ', char(L3_matlab), ' | Manual = 4']);
