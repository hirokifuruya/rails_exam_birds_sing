class PostsController < ApplicationController
  before_action :set_content, only:[:edit, :show, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if params[:back]
        render :new
      else
        if @post.save
          redirect_to posts_path, notice: "保存完了！"
        else
          render :new
        end
      end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to blogs_path, notice: "編集完了！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path, notice: "削除完了！"
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_content
    @post = Post.find(params[:id])
  end
end