Rails.application.routes.draw do
#root 'restaurants#index'
resources :restaurants, only:[:index, :show, :create, :new] do
resources :reviews, only:[:create, :new]
end
end



