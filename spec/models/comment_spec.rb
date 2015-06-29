require 'rails_helper'

RSpec.describe Comment, :type => :model do
 	before(:each) do
 		@user = User.create!(:name => "user",
 							 :email => "user@example.com",
 							 :password => "foobar",
 							 :password_confirmation => "foobar")
 		@mp = @user.microposts.create!(:name => "micropost",
 									   :description => "description")
 		@comment ={:comment =>"comment", :user_id => @user.id}
 	end

 	describe "on creation of 'comment' attribute validations" do

 		it " should create the comment " do
 			@mp.comments.create!(@comment)
 		end

 		it " should have user_id" do
 			@mp.comments.build(@comment.merge(:user_id => "")).should_not be_valid
 		end
 		it " should reject the user_id witj empty string" do
 			@mp.comments.build(@comment.merge(:user_id => "   ")).should_not be_valid
 		end

 		it " should have a comment" do
 			@mp.comments.build(@comment.merge(:comment => "")).should_not be_valid
 		end

 		it " should reject the long comment's " do
 			long_comment = 'a' *  21
 			@mp.comments.build(@comment.merge(:comment => long_comment)).should_not be_valid
 		
 		end

 		it " should reject the empty comment's " do
 			
 			@mp.comments.build(@comment.merge(:comment => "   ")).should_not be_valid
 		
 		end

 	end

 	describe " validating id's after comment created " do
 		before(:each) do
 			@comnt= @mp.comments.create!(@comment)
 		end

 		it " should have the same user_id" do
 			@comnt.user_id.should == @user.id
 		end
 		it " should have the same micropost_id  " do
 			@comnt.micropost_id.should == @mp.id
 		end
 		describe " should respond to" do 
 					
			it " user_id" do
				@comnt.should.respond_to?(:user_id)
			end
			it " micropost_id" do
				@comnt.should.respond_to?(:micropost_id)
			end
 		end
 	end
end
