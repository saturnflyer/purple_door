Rails.application.routes.draw do
  root to: 'landing_pages#home'
  devise_for :users
end
