class LeagueEntry < ApplicationRecord
  validates_presence_of :name,
                        :tier,
                        :player_or_team_id,
                        :division,
                        :losses,
                        :wins

  # belongs_to :summoner_information

  def self.create_league_from_api(response)
    hash = ({
      name: response.first[1][0]["name"],
      tier: response.first[1][0]["tier"],
      queue: response.first[1][0]["queue"],
      player_or_team_id: response.first[1][0]["entries"][0]["playerOrTeamId"],
      player_or_team_name: response.first[1][0]["entries"][0]["playerOrTeamName"],
      division: response.first[1][0]["entries"][0]["division"],
      league_points: response.first[1][0]["entries"][0]["leaguePoints"],
      wins: response.first[1][0]["entries"][0]["wins"],
      losses: response.first[1][0]["entries"][0]["losses"],
      playstyle: response.first[1][0]["entries"][0]["playstyle"],
      isHotStreak: response.first[1][0]["entries"][0]["isHotStreak"],
      isVeteran: response.first[1][0]["entries"][0]["isVeteran"],
      isFreshBlood: response.first[1][0]["entries"][0]["isFreshBlood"],
      isInactive: response.first[1][0]["entries"][0]["isInactive"]
   })
   if miniseries = response.first[1][0]["entries"][0]["miniSeries"]
     hash.merge!(
       miniseries_target: miniseries["target"],
       miniseries_wins: miniseries["wins"],
       miniseries_loses: miniseries["losses"]
     )
   end
   find_or_initialize_by (hash)
  end

  def get_winrate
    ((wins * 100).to_f / (wins + losses).to_f).round(2)
  end

  def get_summoner_medal
    roman_nums = {"I" => 1, "II" => 2, "III" => 3, "IV" => 4, "V" => 5}
    ActionController::Base.helpers.image_tag("medals/#{tier.downcase}_#{roman_nums[division]}.png", class: "rank_medal")
  end
end
