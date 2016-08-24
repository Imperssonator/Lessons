function [hScat,hMarks,hax] = GoodScatter(X,Y,varargin)

% X: each row is one observation, number of points is number of columns

% Find unique X-values and group data accordingly, then find means and
% std's

[Xun, edges, labels] = unique(X);
means = zeros(length(Xun),1);
stds = zeros(length(Xun),1);
for i = 1:length(Xun)
    isamps = Y(labels==i);
    means(i) = mean(isamps);
    stds(i) = std(isamps);
end

% Create figure
f1=figure;
hax = gca;
hold(hax,'on')

% Create scatterplot
[regx, regy] = fitPlot(X,Y);
hfit = plot(hax,regx,regy,'-k');
hScat = scatter(hax,Xun,means); drawnow;
hfit.LineWidth = 0.75;
hfit.Color = [0.6, 0.6, 0.6];

hax.FontSize=20;
hax.Box = 'on';
hax.LineWidth = 1.5;
hax.PlotBoxAspectRatio = [1 1 1];

if numel(varargin)>0
    hax.XLabel.String = varargin{1};
    if numel(varargin)>1
        hax.YLabel.String = varargin{2};
    end
end

% Add error bars
[xb, yb, esym] = verrorbar(Xun,means,stds);
herr = plot(hax,xb,yb,esym);
herr.LineWidth = 0.75;
herr.Color = [0.4 0.4 0.4];

% Make Transparent Labels
hScat.SizeData = 100;
hMarks = hScat.MarkerHandle;
hMarks.EdgeColorData = uint8([100; 100; 100; 175]);
hMarks.FaceColorData = uint8([120; 120; 120; 150]);

end