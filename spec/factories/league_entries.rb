FactoryGirl.define do
  factory :league_entry do
    name "MyString"
    tier "MyString"
    queue "MyString"
    player_or_team_id 1
    player_or_team_name "MyString"
    division "MyString"
    league_points 1
    wins 1
    losses 1
    playstyle "MyString"
    isHotStreak false
    isVeteran false
    isFreshBlood false
    isInactive false
    miniseries_target 1
    miniseries_wins 1
    miniseries_loses 1
  end
end
