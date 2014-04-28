module GravatarHelper
  
  def user_gravatar(gravatar_id, width=50, height=50)
    image_tag("http://www.gravatar.com/avatar/#{gravatar_id}", width: width, height: height)
  end
  
end