function u0 = icon(x)

% this is my initial condition for the PDE system
if x < 0
    u0 = [1; 0];     
else
    u0 = [0.6; 0.4];   
end

end