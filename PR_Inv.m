function B = PR_Inv(A)

  [n n] = size(A); 
  Q = zeros(n,n);
  R = zeros(n,n);
  
  % Aflu Q R folosind Gram-Schmidt
  for j = 1:n
    for i = 1:j-1
      R(i, j) = Q(:, i)' * A(:, j);
    endfor
    s = zeros(n, 1);
    for i = 1:j-1
      s = s + R(i, j) * Q(:, i);
    endfor
    aux = A(:, j) - s;
    R(j, j) = norm(aux, 2);
    Q(:, j) = aux / R(j, j);
  endfor
  B = zeros(n, n);
  I = eye(n);
  
  for i = 1 : n
    
    % Rezolvam sistemul superior triangulat
    y(n) = (Q' * I(:, i))(n) / R(n, n);
    for k = (n - 1) : -1 : 1
      s = 0;
      for j = (k + 1) : n
        s = s + R(k, j) * y(j);
      endfor
      y(k) = ((Q' * I(:, i))(k) - s) / R(k, k);
    endfor
    B(:, i) = y;
  endfor
endfunction
