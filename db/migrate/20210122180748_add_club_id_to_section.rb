class AddClubIdToSection < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :club_id, :integer
  end
end
