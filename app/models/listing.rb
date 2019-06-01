class Listing < ApplicationRecord
  require 'httparty'

  include HTTParty

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :saved_listings
  has_and_belongs_to_many :applied_listings

  before_save :calc_commute

  def calc_commute
    self.country = "Canada"
    response = HTTParty.get(travel_time_url(origin, destination_uw, destination_laurier, commute_mode))
    self.uw_commute = response["rows"].first["elements"].first["duration"]["text"]
    self.laurier_commute = response["rows"].first["elements"].second["duration"]["text"]
  end

  def address
    [street, city, province, postal_code].join(', ')
  end

  def commute_mode
    I18n.t('commute_mode')[transport_mode]
  end

  private

  def travel_time_url(origin, destination_uw, destination_laurier, mode)
    "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination_uw}|#{destination_laurier}&mode=#{mode}&key=#{Rails.application.credentials.google_maps_api_key}"
  end

  def origin
    [street, city, province].join(',').tr(" ", "+")
  end

  def destination_uw
    "Davis+Centre+Library,200+Ring+Road,Waterloo+Ontario"
  end

  def destination_laurier
    "University+Of+Laurier"
  end
end
