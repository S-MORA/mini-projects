require 'sinatra'
require './todo_class'
require 'mailgun'

current_todos = []
num = 1

get '/' do
   @todos = current_todos
    erb(:index)
end

post ('/create-todo') do
  todo_title = params[:title]
  todo_des = params[:descrip]
  new_todo = Todo.new(todo_title, todo_des, num)
  current_todos.push(new_todo)
  num += 1
  mg_client = Mailgun::Client.new (ENV["MAILGUN_API_KEY"])


  message_params =  { from: 'sharonmorato1@gmail.com',
                    to:   'inboxsharon@aol.com',
                    subject: "Today's Todos: #{todo_title}",
                    text:    todo_des
                  }
  mg_client.send_message ENV['MAILGUN_API_DOMAIN'], message_params
  redirect "/"
end

get ('/make-a-todo') do
  erb(:make_todo)
end

get ('/edit/:num') do
  @num = params[:num].to_i
  @todos = current_todos
  @result = @todos.detect{|instance| @num == instance.num}
  erb(:edit)
end

post ('/edit/post/:num') do
  @num = params[:num].to_i
  @todos = current_todos
  @result = @todos.detect{|instance| @num == instance.num}
  @result.type = params[:title]
  @result.des = params[:descrip]
  redirect '/'
end
