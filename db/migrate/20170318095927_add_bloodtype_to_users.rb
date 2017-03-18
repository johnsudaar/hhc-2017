class AddBloodtypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :blood_type, foreign_key: true
  end
end
