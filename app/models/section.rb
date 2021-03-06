class Section < ApplicationRecord
  has_many :user_sections
  has_many :users, through: :user_sections
  validates :name, :salary, presence: true
  belongs_to :club
end
