class CommentsController < ApplicationController

	def create
		user = current_user
		comment = Comment.new(comment_params)
		comment.post_id = params[:post_id]
		comment.user_id = user.id
		if comment.save
			redirect_to "/posts/#{params[:post_id]}"
		else
			render 	"/posts/#{params[:post_id]}"
		end
	end


	def show
		@comment = Comment.find(params[:id])
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.user_id = current_user.id
		if @comment.update(comment_params)
			redirect_to "/"
		else 
			render "/comments/#{@comment.id}/edit"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to "/"
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id, :post_id)
	end
end
