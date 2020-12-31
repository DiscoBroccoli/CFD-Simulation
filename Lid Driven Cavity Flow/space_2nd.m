function R = space_2nd(A,n,N)
R = zeros(N,N); d = 1/(N-1);
if n == 0
    for j=1:N
         if j == 1 %forward scheme 
               R(j,:) = (1/(2*d))*(-1*A(j+2,:)+4*A(j+1,:)-3*A(j,:));      
        elseif j == N %backward scheme
               R(j,:) = (1/(2*d))*(1*A(j-2,:)-4*A(j-1,:)+3*A(j,:));   
         else %central scheme 
               R(j,:) = (1/(2*d))*(A(j+1,:)-A(j-1,:));
        end
    end
else
    for i=1:N
        if i == 1 %forward scheme
            R(:,i) = (1/(2*d))*(-1*A(:,i+2)+4*A(:,i+1)-3*A(:,i));
        elseif i == N %backward scheme
            R(:,i) = (1/(2*d))*(1*A(:,i-2)-4*A(:,i-1)+3*A(:,i));
        else %central scheme     
            R(:,i) = (1/(2*d))*(A(:,i+1)-A(:,i-1));
        end
    end
end
end
    