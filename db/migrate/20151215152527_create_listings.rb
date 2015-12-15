class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :image_url
      t.string :address
      t.string :neighborhood
      t.text :description
      t.integer :price_per_night
      t.references :user, index: true, foreign_key: true
    end
  end
end
