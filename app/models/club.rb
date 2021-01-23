class Club < ApplicationRecord
  validates :name, :address, presence: true
  has_many :sections, dependent: :destroy
  has_many :user_clubs
  has_many :users, through: :user_clubs
end
