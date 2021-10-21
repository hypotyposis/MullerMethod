p0 = input("input p0:\n");  
p1 = input("input p1:\n");
p2 = input("input p2:\n");
tol = input("input tol:\n");     
Nmax = input("input Nmax:\n");

% p0, p1, p2, tol, Nmax

% step1
h1 = p1 - p0;
h2 = p2 - p1;
del1 = (f(p1) - f(p0)) / h1;
del2 = (f(p2) - f(p1)) / h2;
d = (del2 - del1) / (h2 + h1);

% step2
i = 1;
while(i <= Nmax)
    % step3
    b = del2 + h2 * d;
    D = ((b^2-4*f(p2)*d))^0.5;
    % step4
    if abs(b - D) < abs(b + D)
        E = b + D;
    else
        E = b - D;
    end
    % step5
    h = -2 * f(p2) / E;
    p = p2 + h;
    % step6
    if abs(h) < tol
        break;
    end
    % step7
    p0 = p1;
    p1 = p2;
    p2 = p;
    h1 = p1 - p0;
    h2 = p2 - p1;
    del1 = (f(p1) - f(p0)) / h1;
    del2 = (f(p2) - f(p1)) / h2;
    d = (del2 - del1) / (h2 + h1);
    i = i + 1;
end

if i < Nmax
    if isreal(p)
        fprintf("Method succeed, p:%f\n", p)
    else
        fprintf("Method succeed, p:%f + %fi\n", real(p), imag(p))
    end
else
    fprintf("Method failed after Max Num Iterations")
end

function result = f(x)
    result = x^3 - 2*x^2 - 5;
end
