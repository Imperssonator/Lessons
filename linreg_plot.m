function [hf, hax, hdat, hmarks] = linreg_plot(reg)
% 
x = reg.Data;
y = reg.y;
hf = figure; 
hax = gca;
hold(hax,'on')
hdat = plot(hax,x,y,'ob'); drawnow;
mfun = reg.modelFun;
% 
fun_range = [min(x)-range(x)/10, max(x)+range(x)/10];
fplot(hax,reg.modelFun,fun_range);

hax.Box='on';

hmarks = hdat.MarkerHandle;
hmarks.EdgeColorData = uint8([0; 80; 255; 175]);
hax.FontSize=16;

end