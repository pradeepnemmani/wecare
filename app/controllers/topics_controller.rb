class TopicsController < ApplicationController

  def index
  	@title = "Wecare Topics"
  	@microposts = Micropost.all
  end

end
