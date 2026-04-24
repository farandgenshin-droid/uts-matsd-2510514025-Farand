% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 4 — Segmentasi Pelanggan dan komposisi fungsi harga (Fasor)
%  Nama  : Muhammad Farand Danendra 
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 24 april 2026
% ===================================================== 


% Tampilkan timestamp
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])

% --- Deklarasi Parameter ---
N = 25; a = 2; b = 5; K = 8; theta0 = 85;

% --- Subsoal B: Verifikasi Operasi Manual ---
z1 = 4 + 6i;
z2 = 6 - 4i;

disp('--- Verifikasi Operasi Manual ---');
z_add = z1 + z2;
disp(['z1 + z2 = ', num2str(real(z_add)), ' + ', num2str(imag(z_add)), 'i']);

z_mul = z1 * z2;
disp(['z1 * z2 = ', num2str(real(z_mul)), ' + ', num2str(imag(z_mul)), 'i']);

z_div = z1 / z2;
disp(['z1 / z2 = ', num2str(real(z_div)), ' + ', num2str(imag(z_div)), 'i']);

z_diff_abs = abs(z1 - z2);
disp(['|z1 - z2| = ', num2str(z_diff_abs)]);

