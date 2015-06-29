require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

	describe "GET #home" do

	    it "returns http success" do
	      get :home
	      expect(response).to have_http_status(:success)
	    end

	    it " should have the title 'Home' " do
	    	get :home
	    	response.body.should have_selector("title", :cotent => "Home")
	    end

	     it "should have a non-blank body" do
      		get  :home
      		response.body.should_not =~ /<body>\s*<\/body>/
   		 end

				   		
 		#it " should have a Signup link" do
   		 #	get:home
        #	response.should have_selector('a', :href => signup_path,
         #                                      :content => "Sign up now!")
   		 #end
	end
end