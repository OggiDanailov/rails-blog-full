class PostsController < ApplicationController
	before_action :authenticate_user!
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		if(post.save)
			redirect_to "/posts"
		else
			render "/posts/new"
		end	
	end

	def show
		@comment = Comment.new
		@post = Post.find(params[:id])
		

	end	

	def edit 
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.user_id = current_user.id
		if @post.update(post_params)
			redirect_to "/"
		else 
			render "/posts/#{@post.id}/edit"
		end
	end


	def destroy 
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to "/"
	end






	private
	def post_params
		params.require(:post).permit(:title, :content, :user_id)
	end
end
