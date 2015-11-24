class DesksController < ApplicationController
  def index
    @desks = Desk.all
  end
end
