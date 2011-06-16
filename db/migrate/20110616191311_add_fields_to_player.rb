class AddFieldsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :wins, :integer
    add_column :players, :name, :string
    add_column :players, :avatar, :string
  end
end
