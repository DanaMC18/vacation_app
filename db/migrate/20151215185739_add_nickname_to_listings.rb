class AddNicknameToListings < ActiveRecord::Migration
  def change
    add_column :listings, :nickname, :string
  end
end
