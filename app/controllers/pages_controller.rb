class PagesController < ApplicationController

	def home
		@title = "Home"
		@events = Event.all

	end

end