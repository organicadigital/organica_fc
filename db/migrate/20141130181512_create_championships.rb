class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
