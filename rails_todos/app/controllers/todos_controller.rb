class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end
  def new
    @todo = Todo.new
  end
  def show
    @todo = Todo.find(params[:id])
  end
  def create
    Todo.create(todo_params) # creates within DB
    redirect_to todos_path
  end
  def edit
    @todo = Todo.find(params[:id])
  end
  def update
    todo = Todo.find(params[:id])
    todo.update(todo_params)
    redirect_to todos_path
  end
  def destroy
    Todo.destroy(params[:id])
    redirect_to todos_path
  end

  private ##strong parameters
  # returns {name: 'userinput', description: 'userinput'}
  def todo_params
    params.require(:todo).permit(:name, :description)
  end

end
