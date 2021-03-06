%determination of Eigenvalues and Eigenvectors of matrix using Power Method

function [lambda1,B]=EigenValue(A,X)
B=A*X; 
lambda0=max(abs(B)); 
for p=1:size(B,1) 
    if(lambda0==(-1)*B(p))
       lambda0=(-1)*lambda0
    endif
end 
B=B/lambda0; 
lambda1=lambda0-1; 
for i=1:100
    if(abs(lambda1-lambda0)>0.01)
         B=A*B
         lambda1=max(abs(B)); 
         for p=1:size(B,1) 
            if(lambda1==(-1)*B(p))
               lambda1=(-1)*lambda1
           endif
         end
         B=B/lambda1; 
    endif 
end 
endfunction 

A=[1 6 1; 1 2 0; 0 0 3]; 
X=[1;1;1]; 
[a,B1]=EigenValue(A,X);
disp('EigenValue calculated (max)');
disp(a); 
disp('Eigen Vector') 
disp(B1);  
C=inv(A); 
[c,B2]=EigenValue(C,X); 
disp('EigenValue calculated (min)'); 
disp(c); 
disp('Eigen Vector'); 
disp(B2); 
% calculating the trace of the matrix
% which gives us the sum of the diagonal elemnts
tr=0;
for k=1:size(A,1)
    tr=tr+A(k,k) 
end 
%calculating the last eigenvalue 
d=tr-c-a; 
I=[1 0 0;0 1 0;0 0 1]; 
%D=A-d*I 
D=A-d*I 
%now, we know that D*X=0 
%we have to calculate x
%use Gauss seidel or Gauus Elimination 
