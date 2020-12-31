function R = RK44_space(F,G,N)
R = zeros(N, N, 4);
R(:,:,1) = space_2nd(F(:,:,1),1,N) + space_2nd(G(:,:,1),0,N);

R(:,:,2) = space_2nd(F(:,:,2),1,N) + space_2nd(G(:,:,2),0,N);

R(:,:,3) = space_2nd(F(:,:,3),1,N) + space_2nd(G(:,:,3),0,N);

R(:,:,4) = space_2nd(F(:,:,4),1,N) + space_2nd(G(:,:,4),0,N);
end