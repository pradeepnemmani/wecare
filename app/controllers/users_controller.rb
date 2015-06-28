class UsersController < ApplicationController
  

  def new
  	@title = "Sign up"
  	@user = User.new
  end

	def create
		@title = "Sign up"
		@user =User.new(params[:user])
		if @user.save
			redirect_to @user, :flash => {:success => "Welcome to the Wecare!"}
		else
			render 'new'
		end
	end

  def show
  	@user =User.find(params[:id])
  	@name = @user.name
  end


  def edit
  end
end
