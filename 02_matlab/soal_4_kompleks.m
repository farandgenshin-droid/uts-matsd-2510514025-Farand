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

% --- Subsoal E: Plot Bidang Argand ---
% Hitung 3 akar kubik
r = 8^(1/3); % Modulus = 2
angles_deg = [(85)/3, (85+360)/3, (85+720)/3];
angles_rad = deg2rad(angles_deg);

% Bentuk kompleks akar
roots_c = r * exp(1i * angles_rad);

% Setup figure
figure('Name', 'Bidang Argand Akar Kubik', 'Color', 'w');
hold on; grid on; axis equal;
title('Bidang Argand: 3 Akar Kubik membentuk Segitiga Sama Sisi');
xlabel('Real (Re)'); ylabel('Imajiner (Im)');

% Plot lingkaran jari-jari 2
theta_circle = linspace(0, 2*pi, 100);
plot(r*cos(theta_circle), r*sin(theta_circle), 'k--', 'LineWidth', 1);

% Plot garis vektor dari pusat ke titik akar (seperti compass)
for k = 1:3
    plot([0, real(roots_c(k))], [0, imag(roots_c(k))], 'b-', 'LineWidth', 1.5);
    plot(real(roots_c(k)), imag(roots_c(k)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
end

% Gambar segitiga menghubungkan ke-3 akar
triangle_points = [roots_c, roots_c(1)]; % Tutup loop
plot(real(triangle_points), imag(triangle_points), 'g-', 'LineWidth', 2);

% Format limit aksis
xlim([-3 3]); ylim([-3 3]);
legend('Lingkaran |w|=2', 'Fasor Akar', 'Titik Akar', 'Segitiga Sama Sisi', 'Location', 'best');
hold off;