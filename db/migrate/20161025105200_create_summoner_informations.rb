class CreateSummonerInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :summoner_informations do |t|
      t.integer :summoner_id
      t.string :name
      t.integer :icon
      t.integer :level

      t.timestamps
    end
    add_index :summoner_informations, :summoner_id, unique: true
  end
end
