Rails.application.routes.draw do
  root 'home#index'
  post '/best_day_time', to: 'home#best_day_time'
end
