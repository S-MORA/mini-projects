class TodosController < ApplicationController
  before_action :authenticate_user!
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
    @todo = Todo.create(todo_params)
    if @todo.valid?
      flash[:success] = "Your todo has been created"
      redirect_to todos_path
    else
      flash[:error] = 'Invalid'
      render :new
    end
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
    params.require(:todo).permit(:name, :description, :priority)
  end

end
