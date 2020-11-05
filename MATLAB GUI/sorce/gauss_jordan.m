function [A] = gauss_jordan (A)    
s=size(A);
a=min(s);
for ii=1 :a
   [t,r]=max(abs(A(ii:end,ii))); 
   t=A(r+ii-1,:);
   A(r+ii-1,:)=A(ii,:);
   A(ii,:)=t;

   A(ii,[1:ii-1 ii+1:end])= A(ii,[1:ii-1 ii+1:end])/A(ii,ii);
   A(ii,ii)=1;
   x=A(ii,[ii+1:end]);
   for jj=[1:ii-1 ii+1:a]
      A(jj,[ii+1:end])= A(jj,[ii+1:end])-A(jj,ii).*x;
   end 
   A([1:ii-1 ii+1:end],ii)=0; 
end