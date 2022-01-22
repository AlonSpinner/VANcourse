N=10000;
n=3;
s=1;
a=0; b=1;
[x,v] = randfixedsum(n,N,s,a,b);
y = zeros(N,1);

fig=figure('color',[1,1,1]);
ax=axes(fig); grid(ax,'on'); hold(ax,'on');
xlabel(ax,'class1');
ylabel(ax,'class2');
zlabel(ax,'class3');
ax.View = [58.5000, 31.8000];

beta = [1 1 1;
        2 2 1;
        2 2 2;
        2 4 2;
        2 6 2
        1 10 2];

vidWriter = VideoWriter('dirpdf3XExample','Motion JPEG AVI');
vidWriter.FrameRate = 1;
open(vidWriter);
for ii=1:size(beta,1) 
    cla(ax);
    for jj = 1:N
        y(jj)=dirpdf(x(:,jj)',beta(ii,:));
    end
    scatter3(ax,x(1,:),x(2,:),x(3,:),5,y);
    
    [ymax,kk] = max(y);
    xstar = x(:,kk);
    if ii~=1
    scatter(ax,xstar(1),xstar(2),'filled');
    title(ax,['\beta_i',...
        sprintf('= [%d,%d,%d]\n',beta(ii,:)),...
        ' \pi_i ',...
        sprintf('= [%.2f,%.2f,%.2f]\n',xstar)]);
    else
        title(ax,['\beta_i',...
            sprintf('= [%d,%d,%d]\n',beta(ii,:))]);
    end
    
    drawnow;
    writeVideo(vidWriter,getframe(fig));
    pause(2);
end
close(vidWriter);


