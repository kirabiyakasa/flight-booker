class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email

      t.integer :booking_id
      t.index :booking_id
      t.integer :flight_id
      t.index :flight_id

      t.timestamps
    end
  end
end
