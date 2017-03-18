class AddPermanentAndCoordToEntities < ActiveRecord::Migration[5.0]
  def change
    add_column :entities, :permanent, :boolean
    add_column :entities, :latitude, :decimal
    add_column :entities, :longitude, :decimal
  end
end
