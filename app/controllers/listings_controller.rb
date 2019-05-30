class ListingsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def show
    if current_listing.present?
      @listing = current_listing
      @user = current_user
      @address = [@listing.street, @listing.city, @listing.province, @listing.postal_code].join(', ')
    else
      flash[:notice] = "Listing could not be found"
      redirect_back fallback_location: user_root_path
    end
  end

  def create
    listing = current_user.listings.new()
    listing.assign_attributes(listing_params)

    if listing.save
      flash[:notice] = "Your listing was successfully created"
    else
      flash[:notice] = "Sorry! Your listing could not be created!"
    end
    redirect_to user_root_path
  end

  def save
    saved_list.listings.append(current_listing)

    if saved_list.save
      flash[:notice] = "Listing was added to your saved list!"
    else
      flash[:notice] = "Listing could not be added to your save list!"
    end

    redirect_to user_root_path
  end

  def save_remove
    saved_list.listings = saved_list.listings.reject{ |listing| listing == current_listing }
    if saved_list.save
      flash[:notice] = "Listing was removed from save list!"
    else
      flash[:notice] = "Listing could not be removed from your save list!"
    end
    redirect_to user_root_path
  end

  def destroy
    if current_listing.nil? || current_listing.user != current_user
      flash[:notice] = "This listing could not be deleted"
    else
      current_listing.destroy
      flash[:notice] = "The listing was successfully deleted"
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
      :province,
      :country,
      :uw_dist,
      :laurier_dist,
      :ammenities,
      :description,
      :cost,
      :start_date,
      :end_date
    )
  end

  def current_listing
    @__current_listing ||= Listing.find_by(id: show_listing_params[:listing_id])
  end

  def show_listing_params
    params.permit(:listing_id)
  end

  def saved_list
    if current_user.saved_listing.present?
      current_user.saved_listing
    else
      current_user.saved_listing = saved_listing.new
    end
  end
end