function [pl,ql,pr,qr] = bcon(xl,ul,xr,ur,t)

% these are the zero flux boundaries that I had to add
pl = [0;0];
ql = [1;1];

pr = [0;0];
qr = [1;1];

end