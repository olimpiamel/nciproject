class CommentsController < ApplicationController

  before_action :current_property


  def create
    @comment = @property.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment has been saved."
      redirect_to property_path(@property, @comment)
    else
      flash[:danger] = "The comment has not been saved. Try again later."
    end
  end

  def destroy
    @comment = @property.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Your comment was deleted"
    redirect_to property_path(@property)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def current_property
      @property = Property.find(params[:property_id])
    end
end
