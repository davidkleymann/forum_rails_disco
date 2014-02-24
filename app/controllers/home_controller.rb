class HomeController < ApplicationController


 def index
   @Lastposts = Lastpost.all
 end



end




