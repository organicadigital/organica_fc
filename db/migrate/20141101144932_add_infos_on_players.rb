class AddInfosOnPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.string :email_md5
    end

    reversible do |dir|
      dir.up do
        Player.find_each(&:save!) if defined? Player
      end
    end
  end
end
