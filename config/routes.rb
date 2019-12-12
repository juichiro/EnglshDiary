Rails.application.routes.draw do
  get 'word_books/index'
  get 'word_books/new'
  devise_for :users
resources :diaries
root to: 'diaries#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
post 'translation',to: 'diaries#show_translated_text'
end
