class Listing < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :saved_listings
end