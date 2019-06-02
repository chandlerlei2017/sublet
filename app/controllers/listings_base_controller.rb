class ListingsBaseController < ApplicationController
  before_action :authenticate_user!

  def send_notification(email, type)
    notification = Notification.new(listing: current_listing, user: current_listing.user, read: false, email: email, notif_type: type)
    notification.save
  end

  def current_listing
    @__current_listing ||= Listing.find_by(id: show_listing_params[:listing_id])
  end

  def show_listing_params
    params.permit(:listing_id)
  end
end
