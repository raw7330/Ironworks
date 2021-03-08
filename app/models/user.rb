class User < ApplicationRecord
  # acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
