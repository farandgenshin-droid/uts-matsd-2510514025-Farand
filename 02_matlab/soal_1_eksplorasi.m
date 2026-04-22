% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 1 — Eksplorasi Awal dan Profil Data Transaksi
%  Nama  : Muhammad Farand Danendra
%  NIM   : 2510514025
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006
%  Tanggal: 22 April 2026
% =====================================================
% Tampilkan timestamp di Command Window
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])
% 1. Inisialisasi Data
D = [30, 40, 50, 53, 63, 73, 76];
% 2. Verifikasi Statistik (Subsoal b)
rata_rata = mean(D);
nilai_tengah = median(D);
nilai_modus = mode(D);
jangkauan = range(D);
% std(D, 1) digunakan untuk menghitung standar deviasi populasi (bukan sampel)
std_deviasi = std(D, 1);
disp('--- Hasil Verifikasi Statistik ---')
disp(['Mean             : ', num2str(rata_rata)]);
disp(['Median           : ', num2str(nilai_tengah)]);
disp(['Mode             : ', num2str(nilai_modus), ' (Note: Semua nilai unik)']);
disp(['Range            : ', num2str(jangkauan)]);
disp(['Std Dev Populasi : ', num2str(std_deviasi)]);
% 3. Visualisasi Diagram Batang (Subsoal c)
figure('Name', 'Analisis Penjualan Toko');
bar(D, 'FaceColor', '#4DBEEE');
hold on;
% Menambahkan garis rata-rata horizontal
yline(rata_rata, '--r', 'LineWidth', 2, 'DisplayName', 'Rata-rata Penjualan');
% Formatting Grafik
title('Diagram Penjualan per Toko - NIM: 2510514025', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Toko Ke-i', 'FontSize', 11);
ylabel('Penjualan (Juta Rupiah)', 'FontSize', 11);
xticks(1:7);
grid on;
legend('Penjualan Toko', 'Rata-rata (55 Juta)', 'Location', 'northwest');
hold off;
% Simpan file PNG
saveas(gcf, 'Grafik_Penjualan_2510514025.png');
disp('Grafik telah berhasil disimpan sebagai "Grafik_Penjualan_2510514025.png"');



