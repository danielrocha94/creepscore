Rails.application.routes.draw do
  root 'static_pages#home'
  get 'search' => 'static_pages#post_search'
  resources :summoner, :controller => 'summoner_informations'
end
