function R = Iterative(nume, d, eps)

  in = fopen(nume, 'rt');
  N = fscanf(in, '%d', 1);
  A = zeros(N, N);
  
  % Construim matricea de adiacenta (punem 1 unde exista link catre o pagina)
  for i = 1 : N
    line_index = fscanf(in, '%d', 1);
    link_nr = fscanf(in, '%d', 1);
    for j = 1 : link_nr
      column_index = fscanf(in, '%d', 1);
      A(line_index, column_index) = 1;
    endfor
  endfor
  
  % Nu luam in calcul linkurile de la pagini catre ele insasi
  for i = 1 : N
    A(i, i) = 0;
  endfor
  
  % Construim matricea diagonala K conform algoritmului
  K = zeros(N, N);
  for i = 1 : N
    K(i, i) = (sum(A'))(1, i);
  endfor

  % Calculam matricea M conform algoritmului
  M = (inv(K) * A)';
  PR(1 : N, 1) = 1 / N;
  R = d * M * PR + ((1 - d) / N);
  
  % Repetam calculul pana cand eroarea este suficient de mica
  while(1)
    PR = R;
    R = d * M * PR + ((1 - d) / N);
    if norm(R - PR) < eps
      break;
    endif
  endwhile
  R = PR;
  fclose(in);
  
endfunction