class CreateLeagueEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :league_entries do |t|
      t.string :name
      t.string :tier
      t.string :queue
      t.integer :player_or_team_id
      t.string :player_or_team_name
      t.string :division
      t.integer :league_points
      t.integer :wins
      t.integer :losses
      t.string :playstyle
      t.boolean :isHotStreak
      t.boolean :isVeteran
      t.boolean :isFreshBlood
      t.boolean :isInactive
      t.integer :miniseries_target
      t.integer :miniseries_wins
      t.integer :miniseries_loses

      t.timestamps
    end
    add_index :league_entries, :player_or_team_id, unique: true
  end
end
