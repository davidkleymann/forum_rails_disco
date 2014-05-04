class HomeController < ApplicationController

 def index
   @latest_topics = LatestTopic.all
 end

end
