class HomeController < ApplicationController


 def index
    @Latestopics = Latestopics.all
  end



end




