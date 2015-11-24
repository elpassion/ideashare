class DesksController < ApplicationController
  def index
    @desks = Desk.page(params[:page]).per(2)
  end
end
