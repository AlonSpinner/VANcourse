N=1000;
x1=linspace(0,1,N);
x2 = 1-x1;
x=[x1;x2];

fig=figure('color',[1,1,1]);
ax=axes(fig); grid(ax,'on');
xlabel('class1'); ylabel('class2'); zlabel('probability');
hold(ax,'on');
ax.View = [-39.2000   16.8000];

beta = [1 1;
        3 2
        3 3;
        4 4;
        5 5;
        6 6];
y = zeros(1,N);

vidWriter = VideoWriter('dirpdf2XExample','Motion JPEG AVI');
vidWriter.FrameRate = 1;
open(vidWriter);

for ii=1:size(beta,1)
    cla(ax);
    for jj = 1:N
        y(jj)=dirpdf(x(:,jj)',beta(ii,:));
    end
    plot3(ax,x(1,:),x(2,:),y);
    [ymax,kk] = max(y);
    xstar = x(:,kk);
    if ii~=1
    scatter(ax,xstar(1),xstar(2),'filled');
    title(ax,['\beta_i',...
        sprintf('= [%d,%d]\n',beta(ii,:)),...
        ' \pi_i ',...
        sprintf('= [%.2f,%.2f]\n',xstar)]);
    else
        title(ax,['\beta_i',...
            sprintf('= [%d,%d]\n',beta(ii,:))]);
    end
    plot(ax,[1,0],[0,1],'--k')

    drawnow;
    writeVideo(vidWriter,getframe(fig));
    pause(2);
end
close(vidWriter);