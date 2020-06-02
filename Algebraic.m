function R = Algebraic(nume, d)
  
  in = fopen(nume,'rt');
  N = fscanf(in, '%d', 1);
  A = zeros(N, N);
  
  % Construim matricea de adiacenta (punem 1 unde exista link catre o pagina)
  for i = 1 : N
    lineIndex = fscanf(in, '%d', 1);
    linkNr = fscanf(in, '%d', 1);
    for j = 1 : linkNr
      columnIndex = fscanf(in,'%d', 1);
      A(lineIndex, columnIndex) = 1;
    endfor
  endfor
  
  % Nu luam in calcul linkurile de la pagini catre ele insasi
  for i = 1 : N
    A(i, i) = 0;
  endfor
  
  % Construim matricea diagonala K conform algoritmului
  K = zeros(N, N);
  for i = 1 : N
    K(i,i) = (sum(A'))(1, i);
  endfor
  
  % Calculam matricea M conform algoritmului
  M = (inv(K) * A)';
  
  % Folosim functia PR_Inv pentru a afla inversa
  % si o utilizam in formula din algoritm
  R = PR_Inv(eye(N) - d * M) * (1 - d) / N * ones(N, 1);
  fclose(in);
  
endfunction
