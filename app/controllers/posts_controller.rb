class PostsController < ApplicationController
  def new
    @message = "Hello again, World!"
    @post = Post.new
  end

  def create
    blog_title = params[:post][:title]
    blog_body = params[:post][:body]
    post = Post.new(title: blog_title, body: blog_body, user_id: current_user.id)
    post.save

    redirect_to post_path post
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])

      updated_blog_title = params[:post][:title]
      updated_blog_body = params[:post][:body]

      @post.title = updated_blog_title
      @post.body = updated_blog_body
      @post.save

      redirect_to post_path @post
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path

  end

end
