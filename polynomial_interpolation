V = ones(5, 1);
t = ones(1, 5);
n = 5
x = [2 4 5 7 10];
y = [2 3 9 7 12];

for i = [1:n - 1]
    t = t .* x;
    V = [V t'];
    V
end

c = inv(V) * y'
plot(x, y, '.')

% polynomial interpolation %

z = [0:.1:5];
size(z)
n = 51
V = ones(n, 1);
t = ones(1, n);

for i = [1:4]
    t = t .* z;
    V = [V t'];
end

c = [94.8889, -92.3167, 29.8472, -3.7833, 0.1639];

y = V * c'

plot(z, y, '.');
