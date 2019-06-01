class ListingsBaseController < ApplicationController
  before_action :authenticate_user!

  def current_listing
    @__current_listing ||= Listing.find_by(id: show_listing_params[:listing_id])
  end

  def show_listing_params
    params.permit(:listing_id)
  end
end
