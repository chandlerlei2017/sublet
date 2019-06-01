class SavedListingsController < ListingsBaseController
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

  private

  def saved_list
    if current_user.saved_listing.present?
      current_user.saved_listing
    else
      current_user.saved_listing = saved_listing.new
    end
  end
end
