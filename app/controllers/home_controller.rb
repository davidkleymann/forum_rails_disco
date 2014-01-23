class HomeController < ApplicationController


 def var
    @Latesttopics = Latesttopics.limit(3).order(time: :desc)
  end



end




