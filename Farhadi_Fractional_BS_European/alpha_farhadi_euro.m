
clear
N=200;M=200;
K=50; T=1; r=0.01; sigma=0.4;
S=zeros(N+1,1);
for i=1:N+1
    S(i)=100*(i-1)/N;% we set S [0,2K]
end
S=S';
U=G_Vector(N,K,S);

m = 9;
v = zeros(N+1,m);
for i = 1:m
    alpha = 0.57+0.01*i;
    v(:,i) = FracEu_Put_Be(alpha, N, M, K, T, r, sigma, S);
end

fid = 1;
pname = 'alpha_farhadi_euro.eps';
figure (fid)
hold on
%plot(S,U,'LineWidth',1);

plot(S,v(:,1:7),'LineWidth',1)
plot(S,v(:,8),'-.','LineWidth',1);
plot(S,v(:,9),'--','LineWidth',1);
% xlim([45 55])
% ylim([0 50])

legend('\alpha=0.1','\alpha=0.2','\alpha=0.3','\alpha=0.4',...
    '\alpha=0.5','\alpha=0.6','\alpha=0.7',...
    '\alpha=0.8','\alpha=0.9');
xlabel('Stock Price S');
ylabel('European Put Option Price V');
print('-f1', '-depsc2', pname);