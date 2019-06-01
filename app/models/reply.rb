class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user, primary_key: 'email', foreign_key: 'email'
end
