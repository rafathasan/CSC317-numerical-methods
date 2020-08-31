A = [1, 0, 0; 1, 1, 0; 1, 1, 1; 1, 1, 1];
[m n] = size(A);

Q = A(:, 1) / norm(A(:, 1));
Q

for i = 2:n
    t = A(:, i) - (A(:, i)' * Q(:, i - 1)) * Q(:, i - 1);
    Q = [Q t / norm(t)];
end

Q' * A

[O P] = qr(A)
