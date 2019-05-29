class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @count = current_user.listings.count
  end

end
