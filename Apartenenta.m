function y = Apartenenta(x, val1, val2)
  
  % Calculam a si b din continuitate
  a = 1 / (val2 - val1);
  b = val1 / (val1 - val2);
  
  % Selectam intervalul
  if (x >= 0) && (x < val1)
    y = 0;
  elseif (x >= val1) && (x <= val2)
    y = a * x + b;
  elseif (x > val2) && (x <= 1)
    y = 1;
	endif
  
endfunction
