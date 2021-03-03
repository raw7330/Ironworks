class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :users
  has_many :comments
  has_many :bookmarks
  attachment :image
end
