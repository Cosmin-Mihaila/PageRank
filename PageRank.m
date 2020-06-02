function [R1 R2] = PageRank(nume, d, eps)
  
  in = fopen(nume, 'rt');
  N = fscanf(in, '%d', 1);
  
  % Sarim liniile din fisier pentru a citi val1 si val2
  fskipl(in, N + 1);
  val1 = fscanf(in, '%f', 1);
  val2 = fscanf(in, '%f', 1);
  
  % Creem numele fisierului de output
  out_file = strcat(nume, '.out'); 
  out = fopen(out_file, 'wt'); 
  fprintf(out, '%d\n\n', N);
  
  fclose(in);
  R1 = Iterative(nume, d, eps);
  fprintf(out, '%.6f\n', R1);
  fprintf(out, '\n');
  
  R2 = Algebraic(nume, d);
  fprintf(out, '%.6f\n', R2);
  fprintf(out, '\n');

  % Folosim sort pentru a sorta vectorul si a retine indicii anteriori
  [PR1, I] = sort(R2, 'descend');
  for i = 1 : N
    F = Apartenenta(PR1(i), val1, val2);
    fprintf(out, '%d %d %.6f\n', i, I(i), F);
  endfor
  fclose(out);
  
endfunction