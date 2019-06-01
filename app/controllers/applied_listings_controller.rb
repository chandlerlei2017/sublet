class AppliedListingsController < ListingsBaseController

  def apply
    applied_list.listings.append(current_listing)

    if applied_list.save
      flash[:notice] = "You have succesfully applied for this listing!"
    else
      flash[:notice] = "Application failed!"
    end

    redirect_to applied_listings_path
  end

  def unapply
    applied_list.listings = applied_list.listings.reject{ |listing| listing == current_listing }
    if applied_list.save
      flash[:notice] = "Listing was removed from save list!"
    else
      flash[:notice] = "Listing could not be removed from your save list!"
    end
    redirect_to applied_listings_path
  end

  private

  def applied_list
    current_user.applied_listing ||= AppliedListing.new
  end
end