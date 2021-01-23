class Profile < ApplicationRecord
  validates :user_id, uniqueness: true
  validates :firstname, :lastname, :tell, :address, presence: true
  belongs_to :specs, :class_name => 'User', :foreign_key => 'user_id'
end
