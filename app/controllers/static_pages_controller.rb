class StaticPagesController < ApplicationController
  def home
  end

  def post_search
    @summoner_name   = params[:search]
    @region     = params[:region]
    @api_key    = Rails.application.secrets.api_key

    initialize_summoner
  end

  def fetch_summoner_league
    league_url = "https://lan.api.pvp.net/api/lol/#{@region}/v2.5/league/by-summoner/#{@summoner.summoner_id}/entry?api_key=#{@api_key}"
    callback = parse_url(league_url)
    @league_entry = LeagueEntry.create_league_from_api(callback)
    @league_entry.save!
   end

  def initialize_summoner
    url_name = SummonerInformation.get_summoner_name(@summoner_name)
    summoner_url = "https://lan.api.pvp.net/api/lol/#{@region}/v1.4/summoner/by-name/#{url_name}?api_key=#{@api_key}"
    callback = parse_url(summoner_url)
    if !callback["status"]
      @summoner = SummonerInformation.create_summoner_from_api(callback)
      @summoner.save!
      fetch_summoner_league
      redirect_to summoner_url(@summoner.summoner_id)
    else
      flash[:alert] = "Summoner does not exist."
      redirect_to root_path and return
    end
  end

  def parse_url(link)
    url = URI.parse(link)
    callback = JSON.parse(Net::HTTP.get(url))
    return callback
  end

end
