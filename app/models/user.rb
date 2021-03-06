class User < ApplicationRecord
  # acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :comments
  has_many :bookmarks
end
