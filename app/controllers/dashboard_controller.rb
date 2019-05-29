class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @all_listings = Listing.all
  end
end
