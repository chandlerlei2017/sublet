class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_one :saved_listing, dependent: :destroy
  has_one :applied_listing, dependent: :destroy

  has_many :comments, primary_key: 'email', foreign_key: 'email'
  has_many :replies, primary_key: 'email', foreign_key: 'email'
end
