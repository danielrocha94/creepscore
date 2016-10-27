class SummonerInformation < ApplicationRecord
  validates_presence_of :summoner_id,
                        :name,
                        :icon,
                        :level

#  has_many :league_entries

  def self.create_summoner_from_api(response)
    find_or_initialize_by ({
      summoner_id: response.first[1]["id"],
      name: response.first[1]["name"],
      icon: response.first[1]["profileIconId"],
      level: response.first[1]["summonerLevel"]
    })
 end

  def self.get_summoner_name(name)
    name.gsub(/\s+/, "%20")
  end

  def get_summoner_icon
    "http://ddragon.leagueoflegends.com/cdn/6.21.1/img/profileicon/#{icon}.png"
  end
end
