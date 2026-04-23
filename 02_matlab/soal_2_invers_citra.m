% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 2 — Enkripsi Citra Logo Toko dengan Invers Matriks 3x3
%  Nama  : Muhammad Farand Danendra
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 22 April 2026 
% =====================================================


% Tampilkan timestamp
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])
disp('=====================================================')

% --- 1. Definisi Parameter dan Matriks A ---
a = 2; b = 5;
A = [a+1, b, 2; 
    1, a+2, b; 
    b, 1, a+3];

disp('MATRIKS A:');
disp(A);

% --- 2. Perhitungan Minor dan Kofaktor (Nested Loop) ---
n = size(A,1);
Minor_A = zeros(n,n); % Pre-alokasi matriks minor
C_manual = zeros(n,n); % Pre-alokasi matriks kofaktor

for i = 1:n
    for j = 1:n
        % Ekstrak sub-matriks 2x2 dengan mengabaikan baris i dan kolom j
        row_idx = [1:i-1, i+1:n];
        col_idx = [1:j-1, j+1:n];
        sub_A = A(row_idx, col_idx);

        % Hitung determinan minor
        M_ij = sub_A(1,1)*sub_A(2,2) - sub_A(1,2)*sub_A(2,1);
        Minor_A(i,j) = M_ij;

        % Hitung kofaktor (terapkan pola tanda catur)
        C_manual(i,j) = ((-1)^(i+j)) * M_ij;
    end
end

disp('MATRIKS MINOR A:');
disp(Minor_A);

% --- 3. Hitung Determinan A ---
% (Menggunakan ekspansi kofaktor baris pertama)
det_A_manual = sum(A(1,:) .* C_manual(1,:));
fprintf('DETERMINAN A:\nDet(A) = %d\n\n', det_A_manual);

% --- 4. Hitung Adjoin A ---
% (Adjoin adalah transpose dari matriks kofaktor)
Adj_A_manual = C_manual';
disp('MATRIKS ADJOIN A [Adj(A) = C^T]:');
disp(Adj_A_manual);

% --- 5. Hitung Invers A ---
A_inv_manual = Adj_A_manual / det_A_manual;

disp('MATRIKS INVERS A (Bentuk Pecahan Eksak):');
% Fungsi rats() sangat berguna untuk menampilkan desimal menjadi bentuk pecahan murni
disp(rats(A_inv_manual)); 

disp('MATRIKS INVERS A (Bentuk Desimal):');
disp(A_inv_manual);

% --- 6. Verifikasi dengan Fungsi Bawaan MATLAB ---
disp('=====================================================')
disp('VERIFIKASI ERROR (MANUAL VS FUNGSI inv):')
A_inv_matlab = inv(A);
fro_error = norm(A_inv_manual - A_inv_matlab, 'fro');

fprintf('Norma Error Frobenius: %e\n', fro_error);

if fro_error < 1e-10
    disp('=> VERIFIKASI SUKSES: Hasil manual identik dengan fungsi inv(A) bawaan MATLAB.');
else
    disp('=> VERIFIKASI GAGAL: Ada kesalahan perhitungan.');
end