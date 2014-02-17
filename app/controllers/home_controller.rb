class HomeController < ApplicationController


 def index
    @Latesttopics = Latesttopic.all
  end



end




