class PostController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc) #投稿日早い順にしてます。
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content]) #textareaのname → paramsに引っ張ってSAVE
    @post.save

    redirect_to("/post/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/post/index")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    redirect_to("/post/index")
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id:params[:id])
  end

end
