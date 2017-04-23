class PostsController < ApplicationController
http_basic_authenticate_with  name: "edu", password: "1234", except: [:index, :show]


  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @Post =Post.new
  end
  def create
    #render plain: params[:post].inspect
    @Post = Post.new(post_params)

    if(@Post.save)
      redirect_to @Post
    else
      render 'new'
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @Post = Post.find(params[:id])
    if(@Post.update(post_params))
      redirect_to @Post
    else
      render 'edit'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path

  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
