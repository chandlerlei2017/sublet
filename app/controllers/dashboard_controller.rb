class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @all_listings = Listing.all
    @saved_listings = current_user.saved_listing || SavedListing.new
    @saved_listings.user = current_user
    @saved_listings.save
  end
end
