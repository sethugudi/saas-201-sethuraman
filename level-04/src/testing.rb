require 'sinatra'


def get_todos
  @todos ||= []
end

def get_todo
  #get_todos()[@id - 1] originally it was like this, it was throwing error 
  get_todos()[@id.to_i - 1]  
end

def update_todo(title)
  get_todos()[@id.to_i - 1] = title
end
	
def add_todo(todo)
  get_todos().push(todo)
end

def delete_todo
  get_todos().slice!(@id.to_i - 1)
end

get_todos
puts 'hello'+@todos.to_s
add_todo(101)
get_todos
puts 'hello'+@todos.to_s
add_todo(102)
get_todos
puts 'hello'+@todos.to_s