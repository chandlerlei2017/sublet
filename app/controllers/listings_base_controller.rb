class ListingsBaseController < ApplicationController
  before_action :authenticate_user!

  def send_notification(user, type)
    notification = Notification.new(listing: current_listing, user: user, read: false, email: current_user.email, notif_type: type)
    notification.save
  end

  def current_listing
    @__current_listing ||= Listing.find_by(id: show_listing_params[:listing_id])
  end

  def show_listing_params
    params.permit(:listing_id)
  end
end
