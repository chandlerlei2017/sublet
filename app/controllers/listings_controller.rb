class ListingsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def show
    if current_listing.present?
      @listing = current_listing
      @address = current_listing.street + ', ' + current_listing.postal_code + ', ' + current_listing.province
    else
      flash[:notice] = "Listing could not be found"
      redirect_back fallback_location: user_root_path
    end
  end

  def create
    listing = current_user.listings.new()
    listing.assign_attributes(listing_params)
    byebug;
    if listing.save
      flash[:notice] = "Your listing was successfully created"
    else
      flash[:notice] = "Sorry! Your listing could not be created!"
    end
    redirect_to user_root_path
  end

  private

  def listing_params
    params.require(:listing).permit(
      :name,
      :street,
      :city,
      :postal_code,
      :country,
      :uw_dist,
      :laurier_dist,
      :ammenities,
      :description
    )
  end

  def current_listing
    @__current_listing = Listing.find_by(id: show_listing_params[:listing_id])
  end

  def show_listing_params
    params.permit(:listing_id)
  end
end