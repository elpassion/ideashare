class DesksController < ApplicationController
  def index
    @desks = Desk.page(params[:page]).per(10)
  end
end
