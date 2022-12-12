class CreateAdmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :admissions do |t|
      t.string :condition
      t.datetime :date
      t.integer :patient_id
      t.integer :hospital_id

      t.timestamps
    end
  end
end
