class DesksController < ApplicationController
  def index
    @desks = Desk.page(params[:page]).per(2)
  end

  def new
    @desk = Desk.new
  end

  def show
    @desk = Desk.find(params[:id])
  end

  def create
    @desk = Desk.new(permitted_params)
    @desk.owner = current_user
    if @desk.save
      redirect_to(@desk, notice: 'Desk was successfully added.')
    else
      render(:new)
    end
  end

  private

  def permitted_params
    params.require(:desk).permit(:name, :description, :start_at, :finish_at)
  end
end
