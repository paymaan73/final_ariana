class CreateUserSections < ActiveRecord::Migration[6.1]
  def change
    create_table :user_sections do |t|
      t.integer :user_id
      t.integer :section_id

      t.timestamps
    end
  end
end
