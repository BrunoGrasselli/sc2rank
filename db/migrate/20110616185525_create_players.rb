class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :profile_path
      t.integer :initial_points

      t.timestamps
    end
  end
end
