class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :users
  has_many :comments
  has_many :bookmarks
  attachment :image
  with_options presence: true do
   validates :genre_id
   validates :name
   validates :price
   validates :image_id
   validates :delivery_date
  end

end
