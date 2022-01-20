N=1000;
x1=linspace(0,1,N);
x2 = 1-x1;


fig=figure;
ax=axes(fig);

beta = [75,25];
y = zeros(N,1);
for ii = 1:N
        y(ii)=dirpdf([x1(ii),x2(ii)],beta);
end

[ymax,ii] = max(y);
xstar = [x1(ii),x2(ii)];
plot3(x1,x2,y) 
hold on;
xlabel('x1');
ylabel('x2');
grid on;
scatter(xstar(1),xstar(2),'filled');
