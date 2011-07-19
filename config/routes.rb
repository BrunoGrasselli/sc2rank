Sc2rank::Application.routes.draw do
  namespace :admin do
    resources :players
  end
  match 'rank/update' => 'rank#update', :via => :put
  root :to => 'rank#index'
end
