class User < ApplicationRecord
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  with_options presence: true do
   validates :company_name
   validates :company_name_kana
   validates :postal_code
   validates :address
   validates :phone_number
   validates :email
   validates :encrypted_password
  end

end
