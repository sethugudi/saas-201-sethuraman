require 'sinatra'

def get_todos 
    @@todos ||= [] 
end

def get_todo
  #get_todos()[@id - 1] originally it was like this, it was throwing error 
  get_todos()[@id.to_i - 1]  
end

def update_todo(title)
  get_todos()[@id.to_i - 1] = title
 # puts 'hello '+get_todos()[@id.to_i - 1]
 # puts 'total'+ get_todos().to_s
end
	
def add_todo(todo)
  get_todos().push(todo)
end

def delete_todo
  get_todos().slice!(@id.to_i - 1)
end

delete "/todos/:id" do
  @id = params[:id]
  delete_todo()
  redirect "/todos"
end
  
get "/todos" do
  @todos = get_todos()
  erb :todos
end		

post "/todos" do
  todo={:title=>params[:title],:date=>params[:date]}
  @tdate=params[:date]
  add_todo(todo)
  redirect "/todos"
end

get "/todos/:id" do	
  @id = params[:id]
  @todo = get_todo()		
  @@tdate=@todo[:date].to_s
  erb :todo
end

put "/todos/:id" do
  temp={:title=>params[:title],:date=>@@tdate}
  @id = params[:id] 
  update_todo(temp)
  redirect "/todos"
end