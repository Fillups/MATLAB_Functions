function [ Viv ] = GSFunc( i,Ybus,S,V,n )
%this function calculates one Gauss-Siedel iteration given a bus i, Ybus,
%power vector S, voltage vector V, and number of buses n

%initialize sum
sum = 0;
%solve for summation
for k = 1:n %for k = 1 to 3 busses
    if k == i % if k = i, skip the iteration
        continue
    end
    sum = sum + Ybus(i,k)*V(k);
end
%subtract the summation from the front of the Gauss-Siedel equation    
Viv = (1/Ybus(i,i))*((conj(S(i))/conj(V(i)))-sum);

end