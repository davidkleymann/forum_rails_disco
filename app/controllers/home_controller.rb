class HomeController < ApplicationController

 def index
   @Latesttopics = LatestTopic.all
 end

end
