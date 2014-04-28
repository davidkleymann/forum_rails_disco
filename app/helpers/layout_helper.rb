module LayoutHelper
  def usertest

    if session[:user].nil?
      if params[:merk].nil? && params[:merk] != users_path
        merke = request.original_url
      else
        merke = params[:merk]
      end
      link_to 'Log in!', users_path(merk: merke)
    else
      (link_to 'Logout', logout_users_path, method: :post)
      
    end
  end
  def username
    user = User.find(session[:user])
    if user.present?
      "Angemeldet als #{user.benutzername}"
    end  
  end

  def userpage
    link_to 'Userpage', userpage_users_path
  end 

  def gravatar(user_id, width=20, height=20)
    require 'digest/md5'
    email_address = User.find(user_id).email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "http://www.gravatar.com/avatar/#{hash}"
    image_tag(image_src, width: width, height: height)
  end
end
