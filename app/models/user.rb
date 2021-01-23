class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :user_sections
  has_many :sections, through: :user_sections
  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  validates :role, inclusion: {in: %w(user admin master)}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  def admin?

    role == "admin"

  end

  def user?

    role == "user"

  end

  def master?

    role == "master"

  end
end
