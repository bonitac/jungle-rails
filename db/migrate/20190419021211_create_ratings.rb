class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :product
      t.belongs_to :user
      t.text :description
      t.integer :rating
      
      t.timestamps null: false
    end
  end
end
