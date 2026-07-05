#this is a todo program made in Julia
#=
instantiation of todo.txt
#touch("todo.txt")

THIS IS ITERATION 1, PERSISTENT STORAGE WILL BE ADDED LATER.
FOR NOW, IT RUNS IN MEMORY ONLY.
=#

#Tables instantiation
pending = String[]
completed = String[]
function add_task(task::String)
    push!(pending, task)
end

function mark_task(index)
    if index <= length(pending) && index>0 && typeof(index) == Int
        push!(completed,pending[index])
        deleteat!(pending, index)
    else
        println("Invalid index.")
        return
    end
end

function list_tasks_p()
    println("Pending tasks:")
    for (i, task) in enumerate(pending)
        println("$i. $task")
    end
end

function list_tasks_c()
    println("Completed tasks:")
    for (i, task) in enumerate(completed)
        println("$i. $task")
    end
end

function list_tasks()
    list_tasks_p()
    list_tasks_c()
end

function delete_task_c(index)
    if index <= length(completed) && index>0 && typeof(index) == Int
        deleteat!(completed, index)
    else
        println("Invalid index.")
        return
    end
end

function delete_task_p(index)
    if index <= length(pending) && index>0 && typeof(index) == Int
        deleteat!(pending, index)
    else
        println("Invalid index.")
        return
    end
end

function help()
    println("Available commands:")
    println("  add - add a new task")
    println("  mark <index> - mark a task as completed")
    println("  delp <index> - delete a pending task")
    println("  delc <index> - delete a completed task")
    println("  list - list all tasks")
    println("  listp - list pending tasks")
    println("  listc - list completed tasks")
    println("  help - show this help message")
    println("  exit - exit the program")
end

println("TASK APP v0.1")

while true
    print("command: ")
    input = readline()
    tokens = split(strip(input))
    if isempty(tokens)
        continue
    end
    cmd = tokens[1]
    args = tokens[2:end]
    if length(tokens)>2
        println("Only one argument max allowed.")
        continue
    end
    if cmd == "add"
        print("New task: ")
        newtask = readline()
        push!(pending, newtask)
    elseif cmd == "mark"
        if isempty(args)
            println("Please provide an index.")
            continue
        end
        index = parse(Int, args[1])
        if index > length(pending) || index<0 || typeof(index) != Int
            println("Invalid index.")
            continue
        end
        mark_task(index)
    elseif cmd == "delp"
        if isempty(args)
            println("Please provide an index.")
            continue
        end
        index = tryparse(Int, args[1])
        if index > length(pending) || index<0 || typeof(index) != Int
            println("Invalid index.")
            continue
        end
        delete_task_p(index)
    elseif cmd == "delc"
        if isempty(args)
            println("Please provide an index.")
            continue
        end
        index = tryparse(Int, args[1])
        if index > length(completed) || index<0 || typeof(index) != Int
            println("Invalid index.")
            continue
        end
        delete_task_c(index)
    elseif cmd == "help"
        help()
    elseif cmd == "list"
            list_tasks()
    elseif cmd == "listp"
        list_tasks_p()
    elseif cmd == "listc"
        list_tasks_c()
    elseif cmd == "exit"
        exit()
    else
        println("Invalid command. Type 'help' for a list of commands.")
    end
end
