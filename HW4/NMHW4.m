g=@(c) 2*c./(4+0.8*c+c.^2+0.2*c.^3);
xl=0;
xr=5;
es=0.1;
%[x_gmin,fx_gmin,ea_gmin,iter_gmin]=goldmin(g,xl,xr,es,100);
%[x_gmax,fx_gmax,ea_gmax,iter_gmax]=goldmax(g,xl,xr,es,100);
%[x_Pmax,fx_Pmax,ea_Pmax,iter_Pmax]=parabolicmax(g,xl,xr,es,100);

[x,fx,ea,iter]=parabolicmax(g,xl,xr,es,100);