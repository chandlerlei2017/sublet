class ListingsController < ApplicationController
  before_action :authenticate_user!
  def new
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
end