class MicropostsController < ApplicationController
	#before_filter :authenticate, :only => [:new,:create,:show]
	#before_filter :authorized_user, :only => [:new,:create,:show]
  def new
  	@title = "Micropost" 
  	@micropost = Micropost.new 
  end

	def create 
		@user = current_user
		@micropost= @user.microposts.build(params[:micropost])
		if @micropost.save
			redirect_to microposts_path, :flash => {:sucsess => "Topic added successfully!"}
		else
			render 'new'
		end
	end

  def show
  	@title = "Topics"	
  @micropost = Micropost.find(params[:id])
  end

  def index
  	@title = "Topics"	
  	@user = current_user
  	@microposts= @user.microposts
  end


def edit
	@title =" Edit Topic"
	@micropost =Micropost.find(params[:id])
end

def update
  @micropost = Micropost.find(params[:id])
  if @micropost.update_attributes(params[:micropost])
    redirect_to microposts_path, :flash => {:sucsess => "Topic edited successfully!"}
  else
    @title = "Edit Topic"
    render 'edit'
  end

end

def destroy
    Micropost.destroy(params[:id])
	 	redirect_to microposts_path
end

  private

  	def authorized_user
  		@micropost  = Micropost.find(params[:id])
  		redirect_to home_path unless current_user?(@micropost.user)
  	end
end
