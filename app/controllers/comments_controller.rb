class CommentsController < ApplicationController
  def new
  end

  def create
  	args = Comment.new(params[:comment])
  	@micropost = Micropost.find(args.micropost_id)
  	@comment = {:user_id => current_user.id, :comment => args.comment}
  	 @comment = @micropost.comments.build(@comment)
  	 if @comment.save
  	 	redirect_to @micropost, :flash => { :success => " Comment successfully added!"}
  	 else
  	 	redirect_to @micropost,:flash => { :success => " Unable to add comment!"}
  	 end
  end
end
