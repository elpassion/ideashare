module IdeasHelper

  def like_for_object(idea, url)
    form_for(idea.likes.new, url: url) do |form|
      concat form.submit("Like")
    end
  end

  def like(idea)
    like_for_object(idea, desk_idea_likes_path(idea.desk, idea))
  end

  def unlike(idea, user)
    path = desk_idea_like_path(idea.desk, idea, idea.like_for_user(user))
    link_to "Unlike", path, method: :delete
  end
end

