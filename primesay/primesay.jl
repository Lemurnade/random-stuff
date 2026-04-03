println("This piece of code will output primes from 2 to the value YOU provide.")
print("Enter a number: ")
num = parse(BigInt, readline())

for i in 2:num
    is_prime = true
    for j in 2:i-1
        if i % j == 0
            is_prime = false
            break
        end
    end
    if is_prime
        println(i)
    end
end
