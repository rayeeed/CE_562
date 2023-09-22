clear variables; close all; clc
rho=1000; nu=1e-6; g=9.81;
L=[150 300 500 150]; D=[40 30 20 10]./100; ks=.12/10^3;
Q= 7.00e-2;

%f = 0.25*((log10(ks/(3.7.*D)+5.74./(Re))).^-2)

%hl = 0.25*((log10(ks./(3.7.*D)+5.74./(Re))).^-2).*(L./D)*(v.^2)/(2*g);
D1 = [30 30 30 30]./100;
thlnew = calculateTotalHeadLoss(L,D1,nu,g,ks,Q);
thlold = calculateTotalHeadLoss(L,D,nu,g,ks,Q);
v = Q ./ (pi .* D.^2 / 4);
Re = (v .* D / nu).^0.9;
f = 0.25 * ((log10(ks ./ (3.7 .* D) + 5.74 ./ Re)).^-2);
hl = f .* (L ./ D) .* (v.^2) / (2 * g);
thl = sum(hl)
diff =  thlnew - thlold
function thl = calculateTotalHeadLoss(L, D,nu,g,ks,Q)
    
    v = Q ./ (pi .* D.^2 / 4);
    Re = (v .* D / nu).^0.9;
    f = 0.25 * ((log10(ks ./ (3.7 .* D) + 5.74 ./ Re)).^-2);
    hl = f .* (L ./ D) .* (v.^2) / (2 * g);
    thl = sum(hl);
end

