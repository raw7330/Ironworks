class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  attachment :image
  has_many :tags, dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  with_options presence: true do
    validates :genre_id
    validates :name
    validates :price
    validates :image
    validates :delivery_date
  end

end
