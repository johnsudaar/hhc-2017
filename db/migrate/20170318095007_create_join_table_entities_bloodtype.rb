class CreateJoinTableEntitiesBloodtype < ActiveRecord::Migration[5.0]
  def change
    create_join_table :entities, :bloodtypes do |t|
      # t.index [:entity_id, :bloodtype_id]
      # t.index [:bloodtype_id, :entity_id]
      t.integer :quantite
    end
  end
end
