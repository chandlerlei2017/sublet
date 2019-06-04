class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @all_listings = (Listing.all - current_user.listings.all).sort_by { |listing| listing.created_at }.reverse[0,5]
    @saved_listings = current_user.saved_listing || SavedListing.new
    @saved_listings.user = current_user
    @saved_listings.save
  end
end
