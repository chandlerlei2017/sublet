class ReplyController < ListingsBaseController
  before_action :authenticate_user!

  def create
    reply = Reply.new(create_reply_params)

    if reply.save
      comment = Comment.find_by(id: create_reply_params['comment_id'])
      send_notification(comment.user, 2)
      flash[:notice] = "Reply succesfully added!"
    else
      flash[:notice] = "Reply could not be added"
    end

    redirect_back fallback_location: listing_path(listing_id: create_reply_params[:listing_id])
  end

  def delete
    reply = Reply.find_by(id: delete_reply_params["reply_id"])

    if reply.user != current_user
      flash[:notice] = "This reply could not be deleted"
    else
      reply.destroy
      flash[:notice] = "The reply was successfully deleted"
    end

    redirect_back fallback_location: listing_path(listing_id: delete_reply_params[:listing_id])
  end

  private

  def create_reply_params
    params.require(:reply).permit(
      :email,
      :body,
      :comment_id
    )
  end

  def delete_reply_params
    params.permit(:reply_id)
  end
end
