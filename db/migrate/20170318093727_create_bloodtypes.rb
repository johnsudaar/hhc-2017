class CreateBloodtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :blood_types do |t|
      t.string :rhesus

      t.timestamps
    end
  end
end
