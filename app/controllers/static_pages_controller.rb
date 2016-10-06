class StaticPagesController < ApplicationController
  def home
  end

  def post_search
    render nothing: true
    @summoner = params[:search]
  end
end
