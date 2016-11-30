class PostsController < ApplicationController
 def index
 end

 def new
   @post = Post.new
 end

 def create
   @post = Post.new(post_params)
   if @post.save
     flash[:success] = "Post saved!"
    redirect_to @post
   else
    flash[:danger] = @post.errors.full_messages.to_sentence
    render :new
   end
 end

 def show
   @post = Post.find(params[:id])
 end

 private
  def post_params
    params.require(:post).permit(:body, :location)
  end

end
