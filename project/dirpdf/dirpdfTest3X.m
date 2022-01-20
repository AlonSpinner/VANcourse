N=10000;
n=3;
s=1;
a=0; b=1;
[x,v] = randfixedsum(n,N,s,a,b);
y = zeros(N,1);

fig=figure;
ax=axes(fig); grid(ax,'on');
xlabel('x1');
ylabel('x2');
zlabel('no-class');
ax.View = [55,42];

beta = [1 1 1;
        1 2 1;
        1 3 2;
        1 4 2;
        1 5 2];

for ii=1:size(beta,1)   
    for jj = 1:N
        y(jj)=dirpdf(x(:,jj)',beta(ii,:));
    end
    scatter3(x(1,:),x(2,:),x(3,:),5,y);
    title(ax,sprintf('beta = [%d %d %d]',beta(ii,:)));
    drawnow;
    pause(1);
end







%%




