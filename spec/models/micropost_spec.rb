require 'rails_helper'

RSpec.describe Micropost, :type => :model do
 

	describe " describe Micropost creation" do
		before(:each) do
			@attr = {:name => "some micropost", :description => "about some micropost"}
			user = {:name => "pradeep", :email => "pradeepnemmani@gmail.com",:password => "123456", :password_confirmation => "123456"}
			@user = User.create!(user)
		end
		it "should create a new instance of micropost " do
			@user.microposts.create(@attr)
		end

		it " should respond to user" do
			Micropost.respond_to?(:user_id)
		end

		describe "User association " do
			before(:each) do
				@micropost = @user.microposts.create!(@attr)
			end
			it " should have a user attribute" do
				@micropost.should respond_to(:user)
			end

			it " should have correct/right associated user_id" do
				@micropost.user_id.should == @user.id
			end

			it " should have correct/right associated user" do
				@micropost.user.should == @user
			end
		end

		describe " validates  name" do

			it " should have a user id"  do
				Micropost.new(@attr).should_not be_valid
			end

			it " should requir non blanks name" do
				@user.microposts.build(@attr.merge(:name =>"")).should_not be_valid
			 end 

			 it " should reject the long name" do
			 	@user.microposts.build(@attr.merge(:name => 'a' * 51)).should_not be_valid
			end
		end
		 describe " validates description" do

		 	it " should requir non blanks description" do
				@user.microposts.build(@attr.merge(:description =>"")).should_not be_valid
			 end 

			 it " should reject the long description" do
			 	@user.microposts.build(@attr.merge(:description => 'a' * 151)).should_not be_valid
			end

		 end
	end


end
