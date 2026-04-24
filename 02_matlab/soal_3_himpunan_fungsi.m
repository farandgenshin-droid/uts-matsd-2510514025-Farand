% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 3 — Segmentasi Pelanggan dan komposisi fungsi harga 
%  Nama  : <Muhammad Farand Danendra> 
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 24 april 2026
% ===================================================== 

disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])

% Deklarasi Parameter
N = 25; 

% 1. Definisi Himpunan
U = N:(N+20);
A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];

% 2. Operasi Himpunan MATLAB sesuai sintaks yang diminta
A_union_B_union_C = union(union(A, B), C);
A_intersect_B_intersect_C = intersect(intersect(A, B), C);

C_prime = setdiff(U, C);
A_union_B = union(A, B);
AUB_intersect_Cprime = intersect(A_union_B, C_prime);

A_symdiff_B = setxor(A, B); % setxor adalah command symmetric difference

% 3. Output
disp('--- Verifikasi Soal 3.a ---')
disp(['A U B U C         : ', num2str(A_union_B_union_C)])
disp(['A ∩ B ∩ C         : ', num2str(A_intersect_B_intersect_C)])
disp(['(A U B) ∩ C''      : ', num2str(AUB_intersect_Cprime)])
disp(['A ⊕ B             : ', num2str(A_symdiff_B)])