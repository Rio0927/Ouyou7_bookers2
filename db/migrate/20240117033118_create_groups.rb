class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :introduction
      t.integer :owner_id
      t.integer :image_id
      t.timestamps
    end
  end
end
