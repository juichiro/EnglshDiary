Rails.application.routes.draw do
  devise_for :users
resources :diaries
root to: 'diaries#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'translation',to: 'diaries#translate_new'
post 'translation',to: 'diaries#show_translated_text'
end
