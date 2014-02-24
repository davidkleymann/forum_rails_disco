class HomeController < ApplicationController


 def index
    @Latestopics = Latesttopic.all
  end



end




