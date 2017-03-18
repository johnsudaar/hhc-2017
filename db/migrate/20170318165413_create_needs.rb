class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|
      t.integer :blood_type_id
      t.integer :entity_id
      t.integer :percent

      t.timestamps
    end
  end
end
