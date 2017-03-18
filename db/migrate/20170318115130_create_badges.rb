class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :icon
      t.integer :annual_threshold
      t.integer :global_threshold

      t.timestamps
    end
  end
end
