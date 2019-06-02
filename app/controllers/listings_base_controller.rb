class ListingsBaseController < ApplicationController
  before_action :authenticate_user!

  def send_notification(type)
    notification = Notification.new(listing: current_listing, user: listing.user, read: false, type: type)
    notification.save
  end

  def current_listing
    @__current_listing ||= Listing.find_by(id: show_listing_params[:listing_id])
  end

  def show_listing_params
    params.permit(:listing_id)
  end
end
