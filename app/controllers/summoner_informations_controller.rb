class SummonerInformationsController < ApplicationController
  def show
    @summoner = SummonerInformation.find_by_summoner_id(params[:id])
    @league_entry = LeagueEntry.find_by_player_or_team_id(params[:id])
  end
end
