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

% =====================================================
% Bagian 5.4(g): Visualisasi C(x) Kontinu
% =====================================================
% Menghitung p dan q secara analitik
p_val = 2*K;             % p = 16
q_val = K*(2 - a);       % q = 0

% Buat function handle untuk C(x) menggunakan logika piecewise
% Ditambahkan 'eps' agar tidak terdeteksi divide-by-zero pas di garis K
C_func = @(x) ((x.^2 - K^2)./(x - K + eps)).*(x < K) + ...
    p_val.*(x == K) + ...
    (a.*x + q_val).*(x > K);

% Siapkan figure untuk visualisasi
figure('Name','Fungsi Biaya Distribusi Piecewise','Color','w');
fplot(C_func, [0, 2*K], 'LineWidth', 2, 'Color', 'b');
hold on;

% Tambahkan garis vertikal tipis di x = K (titik sambungan)
xline(K, '--r', 'Titik Sambungan (x=K)', 'LineWidth', 1.5, ...
    'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
plot(K, p_val, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'y'); % Highlight titik p

% Anotasi Grafik
title(sprintf('Kekontinuan Fungsi Biaya C(x) [NIM Akhir: %d]', N));
xlabel('Jumlah Produksi (x)');
ylabel('Biaya Distribusi C(x)');
grid on;
legend('Kurva Fungsi C(x)', 'Batas Kontinuitas (x=K)', 'Titik Temu (K, p)');
hold off;