class HomeController < ApplicationController


 def index
    @Latestposts = Post.all.order(time: :desc).limit(3)
  end



end




