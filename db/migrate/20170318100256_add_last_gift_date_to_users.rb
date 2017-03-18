class AddLastGiftDateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_gift_date, :date
  end
end
