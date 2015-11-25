class IdeasController < ApplicationController
  before_action :get_desk

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(permitted_params)
    @idea.desk_id = params[:desk_id]
    @idea.owner = current_user
    if @idea.save
      redirect_to(@idea.desk, notice: 'Idea was successfully added.')
    else
      render(:new)
    end
  end

  private

  def get_desk
    @desk = Desk.find params[:desk_id]
  end

  def permitted_params
    params.require(:idea).permit(:name, :description)
  end
end
