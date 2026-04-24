% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 4 — Segmentasi Pelanggan dan komposisi fungsi harga (Fasor)
%  Nama  : Muhammad Farand Danendra 
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 24 april 2026
% ===================================================== 


% Tampilkan timestamp
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)]);

% --- Subsoal E: Plot Bidang Argand ---
% Hitung 3 akar kubik dari w = 8 cis(85 derajat)
r_akar = 8^(1/3); % Modulus = 2
angles_deg = [(85)/3, (85+360)/3, (85+720)/3]; % Sudut dalam derajat
angles_rad = deg2rad(angles_deg); % Sudut dalam radian

% Bentuk kompleks akar
roots_c = r_akar * exp(1i * angles_rad);

% Setup figure
figure('Name', 'Bidang Argand Akar Kubik', 'Color', 'w');
hold on; grid on; axis equal;
title('Bidang Argand: 3 Akar Kubik membentuk Segitiga Sama Sisi');
xlabel('Sumbu Real (Re)'); 
ylabel('Sumbu Imajiner (Im)');

% Plot lingkaran jari-jari 2
theta_circle = linspace(0, 2*pi, 100);
plot(r_akar*cos(theta_circle), r_akar*sin(theta_circle), 'k--', 'LineWidth', 1, 'DisplayName', 'Lingkaran |w|=2');

% Gambar segitiga menghubungkan ke-3 akar (digambar di bawah titik)
triangle_points = [roots_c, roots_c(1)]; % Tutup loop
plot(real(triangle_points), imag(triangle_points), 'g-', 'LineWidth', 2, 'DisplayName', 'Segitiga Sama Sisi');

% Plot garis vektor (fasor), titik akar, dan Teks Angka
for k = 1:3
    % Garis dari pusat (0,0) ke titik akar
    plot([0, real(roots_c(k))], [0, imag(roots_c(k))], 'b-', 'LineWidth', 1.5, 'HandleVisibility', 'off');

    % Titik koordinat akar
    plot(real(roots_c(k)), imag(roots_c(k)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'HandleVisibility', 'off');

    % Tambahkan teks label nilai a + bi dan sudutnya agar sangat jelas
    label_teks = sprintf('  w_%d = %.2f %+.2fi (%.1f^\\circ)', k-1, real(roots_c(k)), imag(roots_c(k)), angles_deg(k));
    text(real(roots_c(k)), imag(roots_c(k)), label_teks, 'FontSize', 10, 'FontWeight', 'bold', 'Color', 'k');
end

% Tambahkan garis sumbu X dan Y tebal melewati titik (0,0)
xline(0, 'k-', 'LineWidth', 1, 'HandleVisibility', 'off'); 
yline(0, 'k-', 'LineWidth', 1, 'HandleVisibility', 'off');
plot(0, 0, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'k', 'HandleVisibility', 'off'); % Titik pusat

% Elemen dummy untuk legend agar rapi (tidak duplikat 3 kali)
plot(NaN, NaN, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Fasor Akar');
plot(NaN, NaN, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Titik Akar');

% Format limit aksis diperlebar sedikit agar teks tidak terpotong tepi layar
xlim([-3.5 3.5]); ylim([-3.5 3.5]);
legend('Location', 'southoutside', 'Orientation', 'horizontal');
hold off;