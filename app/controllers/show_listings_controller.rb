class ShowListingsController < ApplicationController
  before_action :authenticate_user!

  def my_listings
    @listings = filter(current_user.listings).all
    @title = "My Listings"
    render template: "show_listings/listings_all"
  end

  def all_listings
    @listings = filter(Listing.where.not(user: current_user)).all
    @title = "All Listings"
    render template: "show_listings/listings_all"
  end

  def saved_listings
    current_user.saved_listing ||= SavedListing.new
    current_user.save

    @listings = filter(current_user.saved_listing.listings).all
    @title = "Saved Listings"
    render template: "show_listings/listings_all"
  end

  def applied_listings
    current_user.applied_listing ||= AppliedListing.new
    current_user.save

    @listings = filter(current_user.applied_listing.listings).all
    @title = "Applied Listings"
    render template: "show_listings/listings_all"
  end

  private

  def search_params
    params.permit(
      :path,
      :address,
      :min_cost,
      :max_cost
    )
  end

  def filter(listings)
    return listings if search_params.empty?
    listings = listings.where('street LIKE ?', "%#{search_params[:address]}%") if  search_params[:address].present?

    listings.where('cost > ?', search_params[:min_cost]).where('cost < ?', search_params[:max_cost])
  end
end
