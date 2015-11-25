class LikesController < ApplicationController
  def create
    idea = Idea.find(params[:idea_id])
    idea.likes << Like.new(user: current_user)
    redirect_to idea.desk
  end

  def destroy
    like = Like.destroy(params[:id])
    redirect_to like.likeable.desk
  end

end
