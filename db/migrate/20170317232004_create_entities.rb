class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :street
      t.string :post_code

      t.timestamps
    end
  end
end
