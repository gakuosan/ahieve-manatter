class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update]

http_basic_authenticate_with name: "user", password: "secret", except: [:index, :show]


  def index
    @posts = Post.all.order(created_at: :desc)
  end    
  
  def show
    @post= Post.find(params[:id])
  end

  def new
    if params[:back]
      @post=Post.new(post_params)
    else
      @post=Post.new
    end
  end
  
  def create
    Post.create(post_params)
    redirect_to "/posts/new"
  end

  def edit
    @post= Post.find(params[:id])
  end
  
  def update
    @post= Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path,notice:"アップデートしました"
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end
 
 
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  
  
  private
  
  # @post= Post.find(params[:id])これを切り出すためのメソッドを書く

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
