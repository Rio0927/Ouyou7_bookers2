class AddStarToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :star, :string
  end
end
