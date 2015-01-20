class CommentsController < ApplicationController
  # alternate create definition still works like create below
  # def create
  #   post = Post.find(params[:post_id])
  #   comment = post.comments.create(comment_params)
  #   redirect_to post_path(comment.post)
  # end
  def create
  @post = Post.find(params[:post_id])

  @comment = @post.comments.new(comment_params)

  if @comment.save
    redirect_to post_path(@post)
  else
    render 'posts/show'
  end
end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end




# Alternate Method to create and attach comments to specifc posts

  # def create
  #   @comment = Comment.new(params.require(:comment).permit(:body))
  #   @comment.post_id = params[:post_id]
  #   @comment.save     
  #   redirect_to post_path(@comment.post)
      
  # end