# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe User, :type => :model do

	 before(:each) do
	 	@attr = {:name => "Example", :email => "Example@gmail.com", :password => "foobar", :password_confirmation => "foobar"}
	 end
  
  it " should create new instance of user" do
  	User.create!(@attr)
  end

  it "should require a name" do
 no_name_user= User.new(@attr.merge(:name => ""))
 no_name_user.should_not be_valid
	end

	it  " should require a email" do
		no_email_user = User.new(@attr.merge(:email => ""))
		no_email_user.should_not be_valid
	end

	it " should reject the long name users "do
		long_name_user=User.new(@attr.merge(:name => 'a' * 51 ))
		long_name_user.should_not be_valid
	end

	it "should reject duplicate email addresses" do
			User.create!(@attr)
			user_with_duplicate_email = User.new(@attr)
			user_with_duplicate_email.should_not be_valid
	end

	it " should reject the emails  up to case" do
		upcased_email = "EXAMPLE@GMAIL.COM"
		User.create!(@attr)
		upcased_duplicate_emailed_user = User.new(@attr.merge(:email => upcased_email))
		upcased_duplicate_emailed_user.should_not be_valid
	end

	describe "Passwords" do
 # IMPORTANT POINT :- here password and password_confirmation are not allocated in users table in database
 # and User.respond_to(:password_confirmation) => false,, because in user table there is no password & password_confirmation in database
 # burt it responde when user objev is created
 
		before(:each) do
			@user =User.new(@attr)
		end

		it "should have a password attribute" do
			@user.should respond_to(:password)
		end
		it "should have a password_confirmation attribute" do
			@user.should respond_to(:password_confirmation)
		end
		
	end
	describe  " password validations" do
 
 	it " should require a password" do
 		User.new(@attr.merge(:password =>"", :password_confirmation => "")).should_not be_valid
 	end

 	it "should require a password matching function" do
 		User.new(@attr.merge(:password_confirmation => "")).should_not be_valid
 	end

 	it " should reject the  user with long password" do

 		long_password = 'a' * 51
 		User.new(@attr.merge(:password => long_password,:password_confirmation => long_password)).should_not be_valid
 	end

 	it " should reject the  user with short password" do

 		short_password = 'a' * 5
 		User.new(@attr.merge(:password => short_password,:password_confirmation => short_password)).should_not be_valid
 	end
	end
	describe " Password_ Encryption " do

		before(:each) do
			@user = User.create!(@attr)
		 end

		it" should have a encrypted_password attribute " do
			@user.should respond_to?(:encrypted_password)
		end

		it "should set the encrypted password_confirmation attribute" do
			@user.encrypted_password.should_not be_blank 
		end

		it " should respond to salt" do
			@user.should respond_to?(:salt)
		end
		
		#it "should have the same password" do
		#	@user.has_password?(@attr[:password]).should be_true
		#end
	end
	describe " user authentication" do

		before(:each) do
			@user = User.create!(@attr)
		 end

		it " should have authenticate method" do
			@user.should respond_to?(:authenticate)
		end

		it " should be authenticate for corrent details " do
			User.authenticate(@attr[:email],@attr[:password]).should_not be_nil
		end

		it " should be not authenticate for non corrent details " do
			User.authenticate(@attr[:email],"invalid@email.com").should be_nil
		end
	end

end
