class Comment < ApplicationRecord
  belongs_to :listing
  belongs_to :user, primary_key: 'email', foreign_key: 'email'

  has_many :replies, dependent: :destroy
end
