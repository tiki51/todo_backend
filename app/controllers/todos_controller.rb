TODO_STATUS = {
  INCOMPLETE: 'INCOMPLETE',
  IN_PROGRESS: 'IN_PROGRESS',
  COMPLETE: 'COMPLETE',
  CANCELLED: 'CANCELLED'
}

class TodosController < ApplicationController
  def index
    @todoItems = Todo.all 

    render json: @todoItems
  end

  def show
    @todoItem = Todo.find(params[:id])

    render json: @todoItem
  end

  def create
    @todoItem = Todo.create(
      title: params[:title],
      message: params[:message] || '',
      status: TODO_STATUS[:INCOMPLETE]
    )

    render json: @todoItem
  end

  def update
    @todoItem = Todo.find(params[:id])

    @todoItem.update(
      title: params[:title] || @todoItem[:title],
      message: params[:message] || @todoItem[:message],
      status: params[:status] || @todoItem[:status]
    )

    render json: @todoItem
  end

  def destroy
    @todoItem = Todo.find(params[:id])
    @todoItem.destroy

    render json: @todoItem
  end
end
