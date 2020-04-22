function f = fSSR(a, x, y)
    yp = a(1) * x.^3./((a(2))+x.^3);
    f = sum((y - yp).^2);
end