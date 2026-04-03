using Random

function guess_number()
    println("Guess a number between 1 and 100:")
    guess = parse(Int, readline())
    return guess
end

while true
    number = rand(1:100)
    while true
        guess = guess_number()
        if guess < number
            println("higher")
        elseif guess > number
            println("lower")
        else
            println("correct")
            println("Wanna play again? (y/n)")
            answer = readline()
            if answer == "n"
                break
            end
        end
    end
    break
end
