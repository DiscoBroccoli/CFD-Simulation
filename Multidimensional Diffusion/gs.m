function delta_x = gs(n)

p=1;
for i = 0:n
   if i == 0
       delta_x(p) = 0.1;  
   else
       delta_x(p) = 0.1/2^i;      
   end
   i = i + 1; p = p + 1;
end