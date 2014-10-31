class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.belongs_to :player, null: false
      t.integer :games, default: 0
      t.integer :points, default: 0
      t.integer :wins, default: 0
      t.integer :draws, default: 0
      t.integer :loses, default: 0
      t.integer :gp, default: 0
      t.integer :gc, default: 0

      t.timestamps
    end

    add_index :scores, :player_id, unique: true
  end
end
