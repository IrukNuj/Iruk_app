class PostController < ApplicationController


  def index
    @posts = Post.all.order(created_at: :desc) #投稿日早い順にしてます。
    @users = User.all
  end

  def new
  end

  def create
  #  current_user.post.new
    @post = Post.new(content: params[:content],title: params[:title],username: current_user.username) #textareaのname → paramsに引っ張ってSAVE
    @post.save

    redirect_to("/post/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.title = params[:title]
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
    @comments = Comment.all
    @users = User.all
    @like_count = Like.where(post_id:params[:id]).count
  end

end
