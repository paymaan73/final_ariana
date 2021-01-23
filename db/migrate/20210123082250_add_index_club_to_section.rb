class AddIndexClubToSection < ActiveRecord::Migration[6.1]
  def change
    add_index :sections, :club_id
  end
end
