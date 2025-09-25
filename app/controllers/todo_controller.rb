class TodoController < ApplicationController
    def index
        @todos = Todo.all
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            redirect_to root_path
        else
            @todos = Todo.all
            render :index, status: :unprocessable_entity
        end
    end

    private
    def todo_params
        params.require(:todo).permit(:title, :completed)
    end
end
