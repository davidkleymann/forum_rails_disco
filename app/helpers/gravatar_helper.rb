module GravatarHelper
  
  def user_gravatar(gravatar_id)
    image_tag("http://www.gravatar.com/avatar/#{gravatar_id}")
  end
  
end