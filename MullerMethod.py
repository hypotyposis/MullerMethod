import math

p0, p1, p2, tol, Nmax = input().split()
p0 = float(p0)
p1 = float(p1)
p2 = float(p2)
tol = float(tol)
Nmax = int(Nmax)
print(p0, p1, p2, tol, Nmax)


def f(x):
    return x ** 3 - 2 * x ** 2 - 5


# step1
h1 = p1 - p0
h2 = p2 - p1
del1 = (f(p1) - f(p0)) / h1
del2 = (f(p2) - f(p1)) / h2
d = (del2 - del1) / (h2 + h1)

# step2
i = 1
while i <= Nmax:
    # step3
    b = del2 + h2 * d
    D = math.sqrt((b ** 2 - 4 * f(p2) * d))
    # step4
    if abs(b - D) < abs(b + D):
        E = b + D
    else:
        E = b - D
    # step5
    h = -2 * f(p2) / E
    p = p2 + h
    # step6
    if abs(h) < tol:
        break
    # step7
    p0 = p1
    p1 = p2
    p2 = p
    h1 = p1 - p0
    h2 = p2 - p1
    del1 = (f(p1) - f(p0)) / h1
    del2 = (f(p2) - f(p1)) / h2
    d = (del2 - del1) / (h2 + h1)
    i = i + 1

if i < Nmax:
    print(p)
else:
    print("Method failed after Max Num Iterations")
