class Api::V1::TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /api/v1/todos
  def index
    todos = Todo.all

    if todos.any?
      render json: {
        message: "Todos fetched successfully",
        data: todos
      }, status: :ok
    else
      render json: {
        message: "No todos found",
        data: []
      }, status: :ok
    end
  end

  # GET /api/v1/todos/:id
  def show
    render json: {
      message: "Todo fetched successfully",
      data: @todo
    }, status: :ok
  end

  # POST /api/v1/todos
  def create
    todo = Todo.new(todo_params)

    if todo.save
      render json: {
        message: "Todo created successfully",
        data: todo
      }, status: :created
    else
      render json: {
        message: "Todo creation failed",
        errors: todo.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/todos/:id
  def update
    if @todo.update(todo_params)
      render json: {
        message: "Todo updated successfully",
        data: @todo
      }, status: :ok
    else
      render json: {
        message: "Todo update failed",
        errors: @todo.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/todos/:id
  def destroy
    @todo.destroy

    render json: {
      message: "Todo deleted successfully"
    }, status: :ok
  end

  private

  def set_todo
    @todo = Todo.find_by(id: params[:id])

    return if @todo.present?

    render json: {
      message: "Todo not found",
      errors: ["Invalid todo ID"]
    }, status: :not_found
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :completed)
  end

  # get /api/v1/todos/find_user_todos
  def find_specific_user_todos
    @todo = Todo.find_by(user_id: params[:user_id])
    return if @todo.present?
    render json: {
      message: "Todo not found",
      errors: ["Invalid todo user_id"]
    }, status: :not_found
  end
end
