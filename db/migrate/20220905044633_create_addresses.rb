class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :cp
      t.string :street
      t.string :municipality
      t.string :state
      t.string :city
      t.string :country
      t.string :interior_number
      t.string :outdoor_number
      t.string :suburb

      t.timestamps
    end
  end
end
