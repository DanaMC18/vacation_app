class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :state
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.date :start_on
      t.date :end_on
    end
  end
end
