class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :image_url
      t.integer :bed_capacity
      t.integer :beds_available

      t.timestamps
    end
  end
end
