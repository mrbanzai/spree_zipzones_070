class AddStateToZipcodes < ActiveRecord::Migration
  def change
    add_column :zipcodes, :state_id, :integer
    add_index :zipcodes, :state_id
  end
end
