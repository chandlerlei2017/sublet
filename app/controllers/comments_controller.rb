class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(create_comment_params)

    if comment.save
      flash[:notice] = "Comment succesfully added!"
    else
      flash[:notice] = "Comment could not be added"
    end

    redirect_back fallback_location: listing_path(listing_id: create_comment_params[:listing_id])
  end

  def delete
    byebug
    comment = Comment.find_by(id: delete_comment_params["comment_id"])

    if comment.user != current_user
      flash[:notice] = "This comment could not be deleted"
    else
      comment.destroy
      flash[:notice] = "The comment was successfully deleted"
    end

    redirect_back fallback_location: listing_path(listing_id: delete_comment_params[:listing_id])
  end

  private

  def create_comment_params
    params.require(:comment).permit(
      :email,
      :body,
      :listing_id
    )
  end

  def delete_comment_params
    params.permit(:comment_id)
  end
end
