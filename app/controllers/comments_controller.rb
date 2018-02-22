class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    new_comment = @post.comments.new(comment_params)
    new_comment.user_id = current_user.id
    p new_comment
    new_comment.save
    redirect_to post_path @post

  end

  # def create
  #   current_comment = comment.last
  #   comment = Comment.new(comment_params)
  #   post.save
  #   redirect_to post_path post
  # end
  #
  # def index
  #   @posts = Post.all
  # end
  #
  def show
    @post = Post.find(params[:id])
  end
  #
  # def edit
  #   @post = Post.find(params[:id])
  # end
  #
  # def update
  #     @post = Post.find(params[:id])
  #
  #     updated_blog_title = params[:post][:title]
  #     updated_blog_body = params[:post][:body]
  #
  #     @post.title = updated_blog_title
  #     @post.body = updated_blog_body
  #     @post.save
  #
  #     redirect_to post_path @post
  # end
  #
  # def destroy
  #   Post.find(params[:id]).destroy
  #   redirect_to posts_path
  #
  # end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :content)

    end

end
