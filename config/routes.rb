Rails.application.routes.draw do
  root 'static_pages#home'
  get 'search' => 'static_pages#post_search'
end
