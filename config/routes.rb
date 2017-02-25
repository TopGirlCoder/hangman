Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  resources :users do
   resources :games do
    resources :guesses
   end 
  end  
  resources :sessions
  resources :welcome
end
