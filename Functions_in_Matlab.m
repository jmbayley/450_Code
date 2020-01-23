prompt = ("How many iterations would you like to run? ");
n = input(prompt);

for a = 1:n
    for b = a:n
        c = sqrt(a^2 + b^2);
        if c == round(c) && gcd(a,b) == 1;
            disp("Triplets are: ")
            disp([a,b,c])
        end
    end
end
