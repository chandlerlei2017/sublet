class ShowListingsController < ApplicationController
  before_action :authenticate_user!

  def my_listings
    @listings = current_user.listings.all
  end

  def all_listings
    @listings = Listing.all
  end

  def saved_listings
    current_user.saved_listing ||= SavedListing.new
    current_user.save

    @listings = current_user.saved_listing.listings.all
  end

  def applied_listings
    current_user.applied_listing ||= AppliedListing.new
    current_user.save

    @listings = current_user.applied_listing.listings.all
  end
end
