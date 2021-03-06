class ListingsController < ListingsBaseController
  def new; end

  def show
    if current_listing.present?
      @listing = current_listing
      @user = current_user

      @saved = @user.saved_listing&.listings&.include?(@listing)
      @applied = @user.applied_listing&.listings&.include?(@listing)

      @comments = @listing.comments.all
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
      :transport_mode,
      :ammenities,
      :description,
      :cost,
      :start_date,
      :end_date,
      :building_type,
      :utilities
    )
  end
end
