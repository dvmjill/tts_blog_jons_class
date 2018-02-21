class CommentsController < ApplicationController
  def new

    @comment = Comment.new
  end

  def create
    current_comment = comment.last
    post_id = params[:comment][:post_id]
    content = params[:comment][:content]
    comment = Comment.new(title: blog_title, body: blog_body, post_id: current_user.id)
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
